
local ox_inventory = exports.ox_inventory
local doorInfo, doorBrokens = {}, {}
local GetCurrentResourceName = GetCurrentResourceName()
local currentVersion = GetResourceMetadata(GetCurrentResourceName, "version") 

AddEventHandler('onServerResourceStart', function(resourceName)
	if resourceName == 'ox_inventory' or resourceName == GetCurrentResourceName then
		MySQL.query('SELECT * FROM hu_motels_owned', {}, function(result)
		    if result then
		        for i = 1, #result do
		            local row = result[i]
		            ox_inventory:RegisterStash('motel-'..row.motelid..'-stash-'..row.owner, row.motelname..' Stash', 500, 1000000, row.owner)
					ox_inventory:RegisterStash('motel-'..row.motelid..'-bed-'..row.owner, row.motelname..' Bed stash', 100, 500000, row.owner)
		        end
		    end
		end)
		MySQL.query('SELECT * FROM hu_motels_tenants', {}, function(result)
		    if result then
		        for i = 1, #result do
		            local row = result[i]
			        ox_inventory:RegisterStash('motel-'..row.motelid..'-stash-'..row.identifier, row.motelname..' Stash', 500, 1000000, row.identifier)
					ox_inventory:RegisterStash('motel-'..row.motelid..'-bed-'..row.identifier, row.motelname..' Bed stash', 100, 500000, row.identifier)
		        end
		    end
		end)
		MySQL.query('SELECT * FROM hu_motels_coowners', {}, function(result)
		    if result then
		        for i = 1, #result do
		            local row = result[i]
			        ox_inventory:RegisterStash('motel-'..row.motelid..'-stash-'..row.identifier, row.motelname..' Stash', 500, 1000000, row.identifier)
					ox_inventory:RegisterStash('motel-'..row.motelid..'-bed-'..row.identifier, row.motelname..' Bed stash', 100, 500000, row.identifier)
		        end
		    end
		end)
	end
end)

if GetResourceState('ox_lib') == 'started' then
    lib.locale()
end

RegisterServerEvent('col_motels:updateState')
AddEventHandler('col_motels:updateState', function(doorID, state)
	local xPlayer = ESX.GetPlayerFromId(source)
	if type(doorID) ~= 'number' then
		print(('col_motels: %s didn\'t send a number!'):format(xPlayer.identifier))
		return
	end
	if type(state) ~= 'boolean' then
		print(('col_motels: %s attempted to update invalid state!'):format(xPlayer.identifier))
		return
	end
	if not Config.MotelDoors[doorID] then
		print(('col_motels: %s attempted to update invalid door!'):format(xPlayer.identifier))
		return
	end
	state = not state
	doorInfo[doorID] = state
	if state then
		CollectiveS.Notification(source, 1, locale('lock'))
	else
		CollectiveS.Notification(source, 1, locale('unlock'))
	end
	TriggerClientEvent('col_motels:setState', -1, doorID, state)
end)

RegisterServerEvent('col_motels:breakDoor')
AddEventHandler('col_motels:breakDoor', function(doorID, state)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	doorBrokens[doorID] = state
	doorInfo[doorID] = false
	TriggerClientEvent('col_motels:breakDoor', -1, doorID, state)
end)

ESX.RegisterServerCallback('col_motels:getDoorInfo', function(source, cb)
	cb(doorInfo)
end)

ESX.RegisterServerCallback('col_motels:getDoorStatus', function(source, cb)
	cb(doorBrokens)
end)

function GetCharacterName(identifier)
	local result = MySQL.single.await('SELECT firstname, lastname FROM users WHERE identifier = ?', {identifier})
	if result and result.firstname and result.lastname then
		if Config.OnlyFirstname then
			return result.firstname
		else
			return ('%s %s'):format(result.firstname, result.lastname)
		end
	else
		return GetPlayerName(source)
	end
end

ESX.RegisterServerCallback('col_motels:hasKeys', function(source, cb, motelID) -- Check if the player has a keys
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.query('SELECT * FROM hu_motels_owned WHERE motelid = ? AND owner = ?', {motelID, xPlayer.identifier}, function(owner_result)
		MySQL.query('SELECT * FROM hu_motels_coowners WHERE motelid = ? AND identifier = ?', {motelID, xPlayer.identifier}, function(coowner_result)
			MySQL.query('SELECT * FROM hu_motels_tenants WHERE motelid = ? AND identifier = ?', {motelID, xPlayer.identifier}, function(tenant_result)
				if json.encode(owner_result) ~= '[]' or json.encode(coowner_result) ~= '[]' or json.encode(tenant_result) ~= '[]' then
					cb(true)
				else
					cb(false)
				end
			end)
		end)
	end)
end)

ESX.RegisterServerCallback('col_motels:getMotelInfo', function(source, cb, motelID) -- Get Motel Status
	MySQL.single('SELECT * FROM hu_motels_owned WHERE motelid = ?', {motelID}, function(row)
		if row then
			cb(true, row.owner, row.renting, row.renting_price)
		else
			cb(false, nil, nil, nil)
		end
	end)
end)

ESX.RegisterServerCallback("col_motels:getMotelTenants", function(source, cb, motelID) -- Get Motel Tenants
	MySQL.query('SELECT * FROM hu_motels_tenants WHERE motelid = ?', {motelID}, function(result)
		if json.encode(result) ~= '[]' then
			local tenants = {}
			for i = 1, #result, 1 do
				table.insert(tenants,{
					tenantsName = GetCharacterName(result[i].identifier), 
					id = result[i].id, 
					identifier = result[i].identifier 
				})
			end
			cb(tenants)
		else
			cb(false)
		end
	end)
end)

RegisterServerEvent('col_motels:evictMotelTenant')
AddEventHandler('col_motels:evictMotelTenant', function(motelID, tableID, tenantIdent) -- Evict Motel Tenants
	MySQL.query('SELECT * FROM hu_motels_tenants WHERE motelid = ? AND id = ? AND identifier = ?', {motelID, tableID, tenantIdent}, function(result)
		if json.encode(result) ~= '[]' then
			MySQL.update('DELETE from hu_motels_tenants WHERE motelid = ? AND id = ? AND identifier = ?', {motelID, tableID, tenantIdent}, function(affectedRows)
				if affectedRows then
					ox_inventory:ClearInventory('motel-'..motelID..'-stash-'..tenantIdent)
					ox_inventory:ClearInventory('motel-'..motelID..'-bed-'..tenantIdent)
					if Config.Debug then
						print(affectedRows)
					end
				end
			end)
		end
	end)
end)

ESX.RegisterServerCallback("col_motels:getPendingTenants", function(source, cb, motelID) -- Get Pending Tenants
	local tenants = {}
	MySQL.query('SELECT * FROM hu_motels_pending WHERE motelid = ?', {motelID}, function(result)
		if json.encode(result) ~= '[]' then
			for i = 1, #result do
				local row = result[i]
				table.insert(tenants, { 
					tenantsName = GetCharacterName(row.identifier), 
					id = row.id, 
					identifier = row.identifier, 
					renting_price = row.renting_price 
				})
			end
			cb(tenants)
		else
			cb(false)
		end
	end)
end)

RegisterServerEvent('col_motels:acceptPendingTenant')
AddEventHandler('col_motels:acceptPendingTenant', function(motelID, tableID, tenantIdent, motelRentPrice) -- Delete Pending Tenants
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.query('SELECT * FROM hu_motels_tenants WHERE motelid = ? AND id = ? AND identifier = ?', {motelID, tableID, tenantIdent}, function(result)
		if #result >= Config.MaxTenantSlot then
			CollectiveS.Notification(_source, 3, locale('no_tenant_slot', Config.MaxTenantSlot))
		else
			MySQL.update('DELETE from hu_motels_pending WHERE motelid = ? AND id = ? AND identifier = ?', {motelID, tableID, tenantIdent}, function(affectedRows)
				if affectedRows then
					if Config.Debug then
						print(affectedRows)
					end
				end
			end)
			MySQL.insert('INSERT INTO hu_motels_tenants (identifier, motelid, renting_price) VALUES (?, ?, ?)', {tenantIdent, motelID, motelRentPrice}, function(id)
				if Config.Debug then
					print(id)
				end
				ox_inventory:RegisterStash('motel-'..motelID..'-stash-'..tenantIdent, motelName..' Stash', 500, 1000000, tenantIdent)
				ox_inventory:RegisterStash('motel-'..motelID..'-bed-'..tenantIdent, motelName..' Bed stash', 100, 500000, tenantIdent)
			end)
			CollectiveS.Notification(_source, 1, locale('accept_tenant', GetCharacterName(tenantIdent)))
			xPlayer.addAccountMoney('bank', Config.InitialRentPrice, 'Motel Rent')
			local xTenant = ESX.GetPlayerFromIdentifier(tenantIdent)
			if xTenant then
				xTenant.removeAccountMoney('bank', Config.InitialRentPrice, 'Motel Rent')
				CollectiveS.Notification(xTenant.source, 1, locale('initial_price', Config.InitialRentPrice))
			else
				print('[^3MOTELS^0] ^0[^11^0]: Player: '..GetCharacterName(tenantIdent)..' PAID '..Config.InitialRentPrice)
				MySQL.scalar('SELECT accounts FROM users WHERE identifier = @identifier', {
					['@identifier'] = tenantIdent
				}, function(accounts)
					if accounts then
						local playerAccounts = json.decode(accounts)
						if playerAccounts and playerAccounts.bank then
							if playerAccounts.bank >= Config.InitialRentPrice then
								playerAccounts.bank = playerAccounts.bank - Config.InitialRentPrice
								MySQL.query('UPDATE users SET accounts = @accounts WHERE identifier = @identifier', {
									['@identifier'] = tenantIdent,
									['@accounts'] = json.encode(playerAccounts)
								})
							end
						end
					end
				end)
			end
		end
	end)
end)

RegisterServerEvent('col_motels:deletePendingTenant')
AddEventHandler('col_motels:deletePendingTenant', function(motelID, tableID, tenantIdent)
	MySQL.update('DELETE from hu_motels_pending WHERE motelid = ? AND id = ? AND identifier = ?', {motelID, tableID, tenantIdent}, function(affectedRows)
		if affectedRows then
			if Config.Debug then
				print(affectedRows)
			end
		end
	end)
end)

RegisterServerEvent('col_motels:buyMotel')
AddEventHandler('col_motels:buyMotel', function(motelID, motelName, motelPrice) -- Buy Motel
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local moneyCount = ox_inventory:Search(_source, 'count', 'money')
	if moneyCount >= motelPrice then
		MySQL.query('SELECT * FROM hu_motels_owned WHERE owner = ?', {xPlayer.identifier}, function(owner_result)
			if #owner_result < Config.MaxOwnedUnit then
				CollectiveS.Notification(_source, 1, locale('buy_unit', motelName, ESX.Math.GroupDigits(motelPrice)))
				ox_inventory:RemoveItem(_source, 'money', motelPrice)
				ox_inventory:RegisterStash('motel-'..motelID..'-stash-'..xPlayer.identifier, motelName..' Stash', 500, 1000000, xPlayer.identifier)
				ox_inventory:RegisterStash('motel-'..motelID..'-bed-'..xPlayer.identifier, motelName..' Bed stash', 100, 500000, xPlayer.identifier)
				MySQL.insert('INSERT INTO hu_motels_owned (owner, motelid, motelname) VALUES (?, ?, ?)', {xPlayer.identifier, motelID, motelName}, function(id)
					if Config.Debug then
						print(id)
					end
				end)
			else
				CollectiveS.Notification(_source, 3, locale('unit_limit', Config.MaxOwnedUnit))
			end
		end)
	else
		CollectiveS.Notification(_source, 3, locale('no_cash'))
	end
end)

RegisterServerEvent('col_motels:sellMotel')
AddEventHandler('col_motels:sellMotel', function(motelID, motelPrice) -- Sell Motel
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	ox_inventory:AddItem(_source, 'money', motelPrice)
	CollectiveS.Notification(_source, 1, locale('sell_unit', ESX.Math.GroupDigits(motelPrice)))
	MySQL.query('SELECT * FROM hu_motels_coowners WHERE motelid = ?', {motelID}, function(result)
		if result then
			for i = 1, #result do
				local row = result[i]
				ox_inventory:ClearInventory('motel-'..motelID..'-stash-'..row.identifier)
				ox_inventory:ClearInventory('motel-'..motelID..'-bed-'..row.identifier)
		    end
		end
	end)
	MySQL.query('SELECT * FROM hu_motels_tenants WHERE motelid = ?', {motelID}, function(result)
		if result then
			for i = 1, #result do
				local row = result[i]
				ox_inventory:ClearInventory('motel-'..motelID..'-stash-'..row.identifier)
				ox_inventory:ClearInventory('motel-'..motelID..'-bed-'..row.identifier)
		    end
		end
	end)	 
	ox_inventory:ClearInventory('motel-'..motelID..'-stash-'..xPlayer.identifier)
	ox_inventory:ClearInventory('motel-'..motelID..'-bed-'..xPlayer.identifier)
	local queries = {
		{query = 'DELETE FROM hu_motels_owned WHERE motelid = ?', values = {motelID}},
		{query = 'DELETE FROM hu_motels_tenants WHERE motelid = ?', values = {motelID}},
		{query = 'DELETE FROM hu_motels_coowners WHERE motelid = ?', values = {motelID}}
	}
	MySQL.transaction(queries, function(success)
		if Config.Debug then
			print('Deleting Motel Name: '..motelID..' Deleted? = ', success)
			print('Total of Queries '..#queries..' Update')
		end
	end)
end)

RegisterServerEvent('col_motels:rentMotel')
AddEventHandler('col_motels:rentMotel', function(motelID, motelRentPrice, unit_name) -- Rent Motel
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.query('SELECT * FROM hu_motels_tenants WHERE motelid = ?', {motelID}, function(result)
		if #result >= Config.MaxTenantSlot then
			CollectiveS.Notification(xPlayer.source, 3, locale('tenant_limit', Config.MaxTenantSlot))
		else
			MySQL.insert('INSERT INTO hu_motels_tenants (identifier, motelid, motelname, renting_price) VALUES (?, ?, ?, ?)', {xPlayer.identifier, motelID, unit_name, motelRentPrice}, function(id)
				if Config.Debug then
					print(id)
				end
			end)
			CollectiveS.Notification(_source, 1, locale('pay_initial_rent', ESX.Math.GroupDigits(Config.InitialRentPrice)))
			xPlayer.removeAccountMoney('bank', Config.InitialRentPrice, 'Motel Rent')
			ox_inventory:RegisterStash('motel-'..motelID..'-stash-'..xPlayer.identifier, unit_name..' Stash', 500, 1000000, xPlayer.identifier)
			ox_inventory:RegisterStash('motel-'..motelID..'-bed-'..xPlayer.identifier, unit_name..' Bed stash', 100, 500000, xPlayer.identifier)
			MySQL.scalar('SELECT owner FROM hu_motels_owned WHERE motelid = ?', {motelID}, function(owner)
				local xOwner = ESX.GetPlayerFromIdentifier(owner)
				if xOwner then
					xOwner.addAccountMoney('bank', Config.InitialRentPrice, 'Motel Payment')
					CollectiveS.Notification(xOwner.source, 1, locale('received_initial_rent', ESX.Math.GroupDigits(Config.InitialRentPrice)))
				else
					MySQL.scalar('SELECT accounts FROM users WHERE identifier = @identifier', {
						['@identifier'] = owner
					}, function(accounts)
						if accounts then
							local playerAccounts = json.decode(accounts)
							if playerAccounts and playerAccounts.bank then
								if playerAccounts.bank >= Config.InitialRentPrice then
									playerAccounts.bank = playerAccounts.bank + Config.InitialRentPrice
	
									MySQL.query('UPDATE users SET accounts = @accounts WHERE identifier = @identifier', {
										['@identifier'] = owner,
										['@accounts'] = json.encode(playerAccounts)
									})
								end
							end
						end
					end)
					print('^0[^4CORE^0] [^3MOTELS^0] ^0[^12^0]: IDENTIFIER: '.. owner ..' ADD '..Config.InitialRentPrice)
				end
			end)
		end
	end)
end)


RegisterServerEvent('col_motels:cancelRentMotel')
AddEventHandler('col_motels:cancelRentMotel', function(motelID) -- Cancel Rent
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	MySQL.single('SELECT * FROM hu_motels_tenants WHERE motelid = ? AND identifier = ?', {motelID, xPlayer.identifier}, function(row)
		MySQL.single('SELECT * FROM hu_motels_coowners WHERE motelid = ? AND identifier = ?', {motelID, xPlayer.identifier}, function(row2)
			if json.encode(row) ~= '[]' then
				CollectiveS.Notification(_source, 3, locale('cancel_renting'))
				if row.identifier == xPlayer.identifier then
					ox_inventory:ClearInventory('motel-'..motelID..'-stash-'..xPlayer.identifier)
					ox_inventory:ClearInventory('motel-'..motelID..'-bed-'..xPlayer.identifier)
				end
				MySQL.update('DELETE from hu_motels_tenants WHERE motelid = ? AND identifier = ?', {motelID, xPlayer.identifier}, function(affectedRows)
					if affectedRows then
						if Config.Debug then
							print(affectedRows)
						end
					end
				end)
			elseif json.encode(row2) ~= '[]' then
				CollectiveS.Notification(_source, 3, locale('remove_co_unit'))
				if row2.identifier == xPlayer.identifier then
					ox_inventory:ClearInventory('motel-'..motelID..'-stash-'..xPlayer.identifier)
					ox_inventory:ClearInventory('motel-'..motelID..'-bed-'..xPlayer.identifier)
				end
				MySQL.update('DELETE from hu_motels_coowners WHERE motelid = ? AND identifier = ?', {motelID, xPlayer.identifier}, function(affectedRows)
					if affectedRows then
						if Config.Debug then
							print(affectedRows)
						end
					end
				end)
			end
		end)
	end)
end)

RegisterServerEvent('col_motels:giveMotelKey')
AddEventHandler('col_motels:giveMotelKey', function(motelID, coownerID, unit_name) -- Give Co-Owner Key
	local coownerSource = tonumber(coownerID)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xTarget = ESX.GetPlayerFromId(coownerSource)
	if xPlayer == nil then return end
	if xTarget == nil then return end
	MySQL.query('SELECT * FROM hu_motels_coowners WHERE motelid = ?', {motelID}, function(result)
		if #result >= Config.MaxCoOwnerKey then
			CollectiveS.Notification(_source, 3, locale('give_key_limit'))
		else
			CollectiveS.Notification(coownerSource, 1, locale('received_key', xPlayer.name))
			CollectiveS.Notification(_source, 1, locale('give_key', xTarget.name))
			ox_inventory:RegisterStash('motel-'..motelID..'-stash-'..xTarget.identifier, unit_name..' Stash', 500, 1000000, xTarget.identifier)
			ox_inventory:RegisterStash('motel-'..motelID..'-bed-'..xTarget.identifier, unit_name..' Bed stash', 100, 500000, xTarget.identifier)
			MySQL.insert('INSERT INTO hu_motels_coowners (identifier, motelid) VALUES (?, ?)', {xTarget.identifier, motelID}, function(id)
				if Config.Debug then
					print(id)
				end
			end)
		end
	end)
end)

RegisterServerEvent('col_motels:setMotelRent')
AddEventHandler('col_motels:setMotelRent', function(motelID, rentStatus, motelRentPrice) -- Open for rent
	local _source = source
	if rentStatus > 0 then
		CollectiveS.Notification(_source, 1, locale('open_unit_for_rent'))
	else
		CollectiveS.Notification(_source, 3, locale('close_unit_for_rent'))
	end
	MySQL.update('UPDATE hu_motels_owned SET renting = ?, renting_price = ? WHERE motelid = ?', {rentStatus, motelRentPrice, motelID}, function(affectedRows)
		if affectedRows then
			if Config.Debug then
				print(affectedRows)
			end
		end
	end)
end)

RegisterServerEvent('col_motels:setMotelRentPrice')
AddEventHandler('col_motels:setMotelRentPrice', function(motelID, motelRentPrice) -- Set Renting Price
	local _source = source
	CollectiveS.Notification(_source, 1, locale('set_motel_rent_price', ESX.Math.GroupDigits(motelRentPrice)))
	MySQL.update('UPDATE hu_motels_owned SET renting_price = ? WHERE motelid = ?', {motelRentPrice, motelID}, function(affectedRows)
		if affectedRows then
			if Config.Debug then
				print(affectedRows)
			end
		end
	end)
end)

RegisterServerEvent('col_motels:changeMotelKey')
AddEventHandler('col_motels:changeMotelKey', function(motelID, changeMotelKeyPrice) -- Change Motel Key (Will evict all the co-owners)
	local _source = source
	local moneyCount = ox_inventory:Search(_source, 'count', 'money')
	if moneyCount >= changeMotelKeyPrice then
		ox_inventory:RemoveItem(_source, 'money', changeMotelKeyPrice)
		CollectiveS.Notification(_source, 1, locale('change_key', ESX.Math.GroupDigits(changeMotelKeyPrice)))
		MySQL.query('SELECT * FROM hu_motels_coowners WHERE motelid = ?', {motelID}, function(result)
		    if result then
		        for i = 1, #result do
		            local row = result[i]
		            ox_inventory:ClearInventory('motel-'..motelID..'-stash-'..row.identifier)
					ox_inventory:ClearInventory('motel-'..motelID..'-bed-'..row.identifier)
		        end
		    end
		end)
		MySQL.update('DELETE from hu_motels_coowners WHERE motelid = ?', {motelID}, function(affectedRows)
			if affectedRows then
				if Config.Debug then
					print(affectedRows)
				end
			end
		end)
	else
		CollectiveS.Notification(_source, 3, locale('no_cash'))
	end
end)

ESX.RegisterServerCallback('col_motels:getPlayerDressing', function(source, cb)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local count  = store.count('dressing')
		local labels = {}

		for i=1, count, 1 do
			local entry = store.get('dressing', i)
			table.insert(labels, entry.label)
		end

		cb(labels)
	end)
end)

ESX.RegisterServerCallback('col_motels:getPlayerOutfit', function(source, cb, num)
	local xPlayer  = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local outfit = store.get('dressing', num)
		cb(outfit.skin)
	end)
end)

RegisterServerEvent('col_motels:removeOutfit')
AddEventHandler('col_motels:removeOutfit', function(label)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing') or {}

		table.remove(dressing, label)
		store.set('dressing', dressing)
	end)
end)

function GetUnitOwner(motelID)
	local result = MySQL.prepare.await('SELECT * FROM hu_motels_owned WHERE motelid = ?', {motelID})
	if json.encode(result) ~= '[]' then
		return result
	else
		return nil
	end
end

function PayMotelRent(d, h, m)
	MySQL.query('SELECT * FROM hu_motels_tenants', {}, function(result)
		if result then
			for i = 1, #result do
				local row = result[i]
				local unitData = GetUnitOwner(row.motelid)
				local xPlayer = ESX.GetPlayerFromIdentifier(row.identifier)
				local xOwner = ESX.GetPlayerFromIdentifier(unitData.owner)
				if xPlayer then
					xPlayer.removeAccountMoney('bank', unitData.renting_price, 'Motel Rent')
					CollectiveS.Notification(xPlayer.source, 1, locale('paid_unit_rent', unitData.renting_price, unitData.motelname))
					if xOwner then
						xOwner.addAccountMoney('bank', unitData.renting_price, 'Motel Payment')
						CollectiveS.Notification(xOwner.source, 1, locale('received_unit_payment', unitData.renting_price, unitData.motelname))
					else	
						MySQL.scalar('SELECT accounts FROM users WHERE identifier = @identifier', {
							['@identifier'] = unitData.owner
						}, function(accounts)
							if accounts then
								local playerAccounts = json.decode(accounts)
								if playerAccounts and playerAccounts.bank then
									if playerAccounts.bank >= unitData.renting_price then
										playerAccounts.bank = playerAccounts.bank + unitData.renting_price
										MySQL.query('UPDATE users SET accounts = @accounts WHERE identifier = @identifier', {
											['@identifier'] = unitData.owner,
											['@accounts'] = json.encode(playerAccounts)
										})
									end
								end
							end
						end)
						print('^0[^4CORE^0] [^3MOTELS^0] ^0[^13^0]: IDENTIFIER: '..unitData.owner..' ADD ', unitData.renting_price)
					end
				else
					print('^0[^4CORE^0] [^3MOTELS^0] ^0[^14^0]: IDENTIFIER: '..row.identifier..' PAID ', unitData.renting_price)
					MySQL.scalar('SELECT accounts FROM users WHERE identifier = @identifier', {
						['@identifier'] = row.identifier
					}, function(accounts)
						if accounts then
							local playerAccounts = json.decode(accounts)
							if playerAccounts and playerAccounts.bank then
								if playerAccounts.bank >= unitData.renting_price then
									playerAccounts.bank = playerAccounts.bank - unitData.renting_price
									MySQL.query('UPDATE users SET accounts = @accounts WHERE identifier = @identifier', {
										['@identifier'] = row.identifier,
										['@accounts'] = json.encode(playerAccounts)
									})
								end
							end
						end
					end)
					if xOwner then
						xOwner.addAccountMoney('bank', unitData.renting_price, 'Motel Payment')
						CollectiveS.Notification(xOwner.source, 1, locale('received_unit_payment', unitData.renting_price, unitData.motelname))
					else
						MySQL.scalar('SELECT accounts FROM users WHERE identifier = @identifier', {
							['@identifier'] = unitData.owner
						}, function(accounts)
							if accounts then
								local playerAccounts = json.decode(accounts)
								if playerAccounts and playerAccounts.bank then
									if playerAccounts.bank >= unitData.renting_price then
										playerAccounts.bank = playerAccounts.bank + unitData.renting_price
										MySQL.query('UPDATE users SET accounts = @accounts WHERE identifier = @identifier', {
											['@identifier'] = unitData.owner,
											['@accounts'] = json.encode(playerAccounts)
										})
									end
								end
							end
						end)
						print('^0[^4CORE^0] [^3MOTELS^0] ^0[^15^0]: IDENTIFIER: '..unitData.owner..' ADD ', unitData.renting_price)
					end
				end
			end
		end
	end)
end

PayMotelRent()

TriggerEvent('cron:runAt', 3, 30, PayMotelRent)

Citizen.CreateThread(function()
    print("^0[^4HU-Motel^0]: ^2Current Version:^0 "..currentVersion)
    checkUpdates()
end)

function checkUpdates()
	PerformHttpRequest("https://raw.githubusercontent.com/DevZiee/hakdog_clothes/main/col_motels-version", function(statusCode, theData, headers)
		if statusCode ~= 200 then 
			print("^0[^4HU-Motel^0]: Error while checking for updates. Retrying in 5 seconds.")
			Citizen.Wait(5 * 1000)
			checkUpdates()
			return 
		end
		if currentVersion == theData then 
			print('^0[^4HU-Motel^0]: ^2You are using the latest version of Collective Motel System.^0')
			print('^0[^4HU-Motel^0]: ^2This resource/script is developed and maintained by Collective^0')
			print('^0[^4HU-Motel^0]: ^3Hakdog Utilities & Anorak Discord: ^2https://discord.io/HakdogUtilities^0')
		else 
			print('^0[^4HU-Motel^0]: ^1You are using an outdated version of Collective Motel System.')
			print('^0[^4HU-Motel^0]: ^2This resource/script is developed and maintained by Collective^0')
			print('^0[^4HU-Motel^0]: ^3Hakdog Utilities & Anorak Discord: ^2https://discord.io/HakdogUtilities^0')
			print('^0[^4HU-Motel^0]: ^2The latest version is: ^3'..theData..'^0.')
			print('^0[^4HU-Motel^0]: ^3Please download the new update at https://keymaster.fivem.net^0')
		end
	end) 
end	