local IsRateLimit = false
LocalPlayer.state:set('isInMotelEntrance', false, false)
LocalPlayer.state:set('isInMotelStash', false, false)
LocalPlayer.state:set('isInMotelBedStash', false, false)
LocalPlayer.state:set('isInMotelCloset', false, false)

if GetResourceState('ox_lib') == 'started' then
    lib.locale()
end

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
    ESX.TriggerServerCallback('col_motels:getDoorInfo', function(doorInfo)
        for doorID,state in pairs(doorInfo) do
            Config.MotelDoors[doorID].locked = state
        end
    end)   
    ESX.TriggerServerCallback('col_motels:getDoorStatus', function(doorInfo)
        for doorID,state in pairs(doorInfo) do
            Config.MotelDoors[doorID].destroyed = state
        end
    end)    
    CreateBlips()
    LoadMotelsSystem()
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

AddEventHandler('onResourceStart', function(name)
    if name == GetCurrentResourceName() then
        ESX.TriggerServerCallback('col_motels:getDoorInfo', function(doorInfo)
            for doorID,state in pairs(doorInfo) do
                Config.MotelDoors[doorID].locked = state
            end
        end)   
        ESX.TriggerServerCallback('col_motels:getDoorStatus', function(doorInfo)
            for doorID,state in pairs(doorInfo) do
                Config.MotelDoors[doorID].destroyed = state
            end
        end)    
        CreateBlips()
        LoadMotelsSystem()
    end
end)

function LoadMotelsSystem()
    print('^2Motel System Loaded!^0')
    for k, v in pairs(Config.Motels) do
        local EntranceData = lib.zones.box({coords = v.menu_pos, size = vec3(1, 1, 1), rotation = 252.5, debug = Config.Debug, inside = insideZone, onEnter = onEnter, onExit = onExit, method = 'entrance', unit_name = v.unit_name, unit_price = v.unit_price, menu_pos = v.menu_pos, unit_stash = v.unit_stash, unit_closet = v.unit_closet, menu_text = v.menu_text, unit_bedstash = v.unit_bedstash, motel_name = k})
        local StashData = lib.zones.box({coords = v.unit_stash, size = vec3(1, 1, 1), rotation = 252.5, debug = Config.Debug, inside = insideZone, onEnter = onEnter, onExit = onExit, method = 'stash', unit_name = v.unit_name, unit_price = v.unit_price, menu_pos = v.menu_pos, unit_stash = v.unit_stash, unit_closet = v.unit_closet, menu_text = '[E] Stash', unit_bedstash = v.unit_bedstash, motel_name = k})
        local BedStashData = lib.zones.box({coords = v.unit_bedstash, size = vec3(1, 1, 1), rotation = 252.5, debug = Config.Debug, inside = insideZone, onEnter = onEnter, onExit = onExit, method = 'bed_stash', unit_name = v.unit_name, unit_price = v.unit_price, menu_pos = v.menu_pos, unit_stash = v.unit_stash, unit_closet = v.unit_closet, menu_text = '[E] Bed Stash', unit_bedstash = v.unit_bedstash, motel_name = k})
        local ClosetData = lib.zones.box({coords = v.unit_closet, size = vec3(1, 1, 1), rotation = 252.5, debug = Config.Debug, inside = insideZone, onEnter = onEnter, onExit = onExit, method = 'closet', unit_name = v.unit_name, unit_price = v.unit_price, menu_pos = v.menu_pos, unit_stash = v.unit_stash, unit_closet = v.unit_closet, menu_text = '[E] Closet', unit_bedstash = v.unit_bedstash, motel_name = k})
    end
end


local closeDoors = {}
Citizen.CreateThread(function()
    while true do
        for k, v in pairs(Config.MotelDoors) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local dist = #(playerCoords - v.objCoords)
            if dist <= 100.0 then
                closeDoors[k] = Config.MotelDoors[k]
            else
                if closeDoors[k] ~= nil then
                    closeDoors[k] = nil
                end
            end
        end
        Citizen.Wait(1000)
    end
end)
Citizen.CreateThread(function()
    while true do
        for _,doorID in pairs(closeDoors) do
            if doorID.doors then
                for k,v in ipairs(doorID.doors) do
                    if not v.object or not DoesEntityExist(v.object) then
						local curmodel = v.objName
						if type(curmodel) ~= "number" then
							curmodel = GetHashKey(curmodel)
						end
                        v.object = GetClosestObjectOfType(v.objCoords, 1.0, curmodel, false, false, false)
                    end
                end
            else
                if not doorID.object or not DoesEntityExist(doorID.object) then
					local newModel = doorID.objName
					if type(newModel) ~= "number" then
						newModel = GetHashKey(newModel)
					end
                    doorID.object = GetClosestObjectOfType(doorID.objCoords, 1.0, newModel, false, false, false)
                end
            end
        end
        Citizen.Wait(1000)
    end
end)

RegisterCommand(Config.DoorOption.FixDoorCommand, function()
    if ESX.PlayerData.job and ESX.PlayerData.job.name == Config.DoorOption.job then
        FixMotelDoor()
    else
        CollectiveC.Notification(3, locale('no_perms'))   
    end
end)

function FixMotelDoor()
    local playerCoords = GetEntityCoords(PlayerPedId())     
    local closestTimer = 999999
    for k,doorID in pairs(closeDoors) do
        local distance
        if doorID.doors then
            distance = #(playerCoords - doorID.doors[1].objCoords)
        else
            distance = #(playerCoords - doorID.objCoords)       
        end
        if distance < 1.0 and doorID.destroyed then
            local success = true
            lib.requestAnimDict('mini@repair', 100)
            TaskPlayAnim(PlayerPedId(), "mini@repair", "fixing_a_player", 8.0, -8, -1, 49, 0, 0, 0, 0)        
            for i = 1, 5, 1 do
                local finished = exports['col_skillbar']:taskBar(5000, math.random(3, 5))
                if finished <= 0 then
                    CollectiveC.Notification(3, locale('failed'))   
                    ClearPedTasks(PlayerPedId())
                    success = false
                    break
                end  
            end
            ClearPedTasks(PlayerPedId())    
            if success then     
                TriggerServerEvent('col_motels:breakDoor', k, false)
            end         
        end
    end
end

exports('FixMotelDoor', FixMotelDoor)

local lastDoorAccess = {}
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerCoords = GetEntityCoords(PlayerPedId())     
        local closestTimer = 999999
        for k,doorID in pairs(closeDoors) do
            local distance
            if doorID.doors then
                distance = #(playerCoords - doorID.doors[1].objCoords)
            else
                distance = #(playerCoords - doorID.objCoords)
            end
            local maxDistance = 2
            if doorID.distance then
                maxDistance = doorID.distance
            end
            if distance < closestTimer then
                closestTimer = math.floor(distance)
            end            
            if distance < 2 then
                closestTimer = 0
                if doorID.doors then
                    for _,v in ipairs(doorID.doors) do
                        FreezeEntityPosition(v.object, doorID.locked)
                        if doorID.locked and v.objYaw and GetEntityRotation(v.object).z ~= v.objYaw then
                            SetEntityRotation(v.object, 0.0, 0.0, v.objYaw, 2, true)
                        end
                    end
                else
                    FreezeEntityPosition(doorID.object, doorID.locked)
                    if doorID.locked and doorID.objYaw and GetEntityRotation(doorID.object).z ~= doorID.objYaw then
                        SetEntityRotation(doorID.object, 0.0, 0.0, doorID.objYaw, 2, true)
                    end
                end
            end
            if distance < maxDistance then
                if IsControlJustReleased(0, 38) and not IsRateLimit then
					if not doorID.destroyed then
                        IsRateLimit = true
						ESX.TriggerServerCallback('col_motels:hasKeys', function(hasKey)
							if hasKey then
								if not IsPedInAnyVehicle(PlayerPedId(), true) then
                                    ClearPedSecondaryTask(PlayerPedId())
                                    lib.requestAnimDict('anim@heists@keycard@', 100)
                                    TaskPlayAnim(PlayerPedId(), "anim@heists@keycard@", "exit", 5.0, 1.0, -1, 16, 0, 0, 0, 0 )
                                    Citizen.Wait(850)
                                    ClearPedTasks(PlayerPedId())
                                end
								if lastDoorAccess[doorID] == nil then
									lastDoorAccess[doorID] = 0
                                end
								if (GetGameTimer() - lastDoorAccess[doorID] ) < 1000 and not doorID.destroyed then
                                    local luck = math.random(100)
									if luck < 15 then
                                        TriggerServerEvent('col_motels:breakDoor', k, true)
                                        CollectiveC.Notification(3, locale('destroy_door'))   
									end
                                end
								lastDoorAccess[doorID] = GetGameTimer()
								ClearAreaOfPeds(doorID.objCoords.x, doorID.objCoords.y, doorID.objCoords.z, 100.0, 1)
                                TriggerServerEvent('col_motels:updateState', k, doorID.locked)
							elseif not hasKey and not doorID.locked then
                                CollectiveC.Notification(2, locale('already_open'))   
							else
                                CollectiveC.Notification(3, locale('no_keys'))   
							end
						end, doorID.motel_id)
                        Citizen.Wait(500)
                        IsRateLimit = false
					else
                        CollectiveC.Notification(3, locale('door_broken'))   
					end
                end         
            end
        end
    end
end)

RegisterNetEvent('col_motels:setState')
AddEventHandler('col_motels:setState', function(doorID, state)
    Config.MotelDoors[doorID].locked = state
end)

RegisterNetEvent('col_motels:breakDoor')
AddEventHandler('col_motels:breakDoor', function(doorID, state)
    Config.MotelDoors[doorID].destroyed = state
    Config.MotelDoors[doorID].locked = false
end)

function onEnter(self)
    lib.showTextUI(self.menu_text)
    if self.method == 'entrance' then
        LocalPlayer.state.isInMotelEntrance = true
        RegisterCommand('motel_entrance', function()
            if LocalPlayer.state.isInMotelEntrance then
                ESX.TriggerServerCallback('col_motels:hasKeys', function(hasKey)
                    OpenMotelMenu(self.motel_name, self.unit_name, self.unit_price, hasKey)
                end, self.motel_name) 
            end
        end)
    elseif self.method == 'stash' then
        LocalPlayer.state.isInMotelStash = true
        RegisterCommand('motel_stash', function()
            if LocalPlayer.state.isInMotelStash then
                ESX.TriggerServerCallback('col_motels:hasKeys', function(hasKey)
                    if hasKey then
                        OpenPropertyInventoryMenu(self.motel_name, ESX.PlayerData.identifier, self.unit_name)
                    else
                        CollectiveC.Notification(3, locale('no_keys'))
                    end
                end, self.motel_name)  
            end
        end)
    elseif self.method == 'bed_stash' then
        LocalPlayer.state.isInMotelBedStash = true
        RegisterCommand('motel_bed_stash', function()
            if LocalPlayer.state.isInMotelBedStash then
                ESX.TriggerServerCallback('col_motels:hasKeys', function(hasKey)
                    if hasKey then
                        OpenPropertyInventoryMenuBed(self.motel_name, ESX.PlayerData.identifier, self.unit_name)
                    else
                        CollectiveC.Notification(3, locale('no_keys_door'))
                    end
                end, self.motel_name)
            end
        end)
    elseif self.method == 'closet' then
        LocalPlayer.state.isInMotelCloset = true
        RegisterCommand('motel_closet', function()
            if LocalPlayer.state.isInMotelCloset then
                ESX.TriggerServerCallback('col_motels:hasKeys', function(hasKey)
                    if hasKey then
                        PlayerDressings()
                    else
                        CollectiveC.Notification(3, locale('no_keys'))
                    end
                end, self.motel_name)
            end
        end)
    end
end

function onExit(self)
    lib.hideTextUI()
    if self.method == 'entrance' then
        LocalPlayer.state.isInMotelEntrance = false
    elseif self.method == 'stash' then
        LocalPlayer.state.isInMotelStash = false
    elseif self.method == 'bed_stash' then
        LocalPlayer.state.isInMotelBedStash = false
    elseif self.method == 'closet' then
        LocalPlayer.state.isInMotelCloset = false
    end
end

RegisterKeyMapping('motel_entrance', 'Motel Entrance', 'keyboard', 'H')
RegisterKeyMapping('motel_stash', 'Motel Stash', 'keyboard', 'E')
RegisterKeyMapping('motel_bed_stash', 'Motel Bed Stash', 'keyboard', 'E')
RegisterKeyMapping('motel_closet', 'Motel Closet', 'keyboard', 'E')

function OpenMotelMenu(k, unit_name, unit_price, has_unit_key)
    ESX.TriggerServerCallback('col_motels:getMotelInfo', function(isOwned, unitOwner, isForRent, rentPrice)
        if isOwned and unitOwner == ESX.PlayerData.identifier then
            local SendMenu = {
                {
                    title = 'Give Key',
                    description = 'Give a player key',
                    event = 'col_motels:Actions',
                    args = {
                        action = 'give_key',
                        motel_data = k
                    }
                },
                {
                    title = 'Doorlock Option',
                    description = 'Change Door Lock - $' .. ESX.Math.GroupDigits(Config.ChangeDoorLockPrice),
                    event = 'col_motels:Actions',
                    args = {
                        action = 'change_key',
                        motel_data = k
                    }
                },
                {
                    title = 'Rent Options',
                    description = 'Open Rent Option',
                    event = 'col_motels:Actions',
                    args = {
                        action = 'rent_options',
                        motel_data = k,
                        isForRent = isForRent,
                        rentPrice = rentPrice
                    }
                },
                {
                    title = 'Sell - $' .. ESX.Math.GroupDigits(unit_price),
                    description = 'Are you sure?',
                    event = 'col_motels:Actions',
                    args = {
                        action = 'sell_motel',
                        motel_data = k,
                        unit_name = unit_name,
                        unit_price = unit_price
                    }
                }
            }
            lib.registerContext({
                id = 'motel_owned_actions',
                title = unit_name,
                options = SendMenu
            })
            lib.showContext('motel_owned_actions')
        end
        if not isOwned then
            lib.registerContext({
                id = 'motel_buy_actions',
                title = unit_name,
                options = {
                    {
                        title = 'Buy Unit - $' .. ESX.Math.GroupDigits(unit_price),
                        description = 'Buy this unit',
                        event = 'col_motels:Actions',
                        args = {
                            action = 'buy_motel',
                            motel_data = k,
                            unit_name = unit_name,
                            unit_price = unit_price
                        }
                    }
                }
            })
            lib.showContext('motel_buy_actions')
        end
        if isOwned and unitOwner ~= ESX.PlayerData.identifier then
            if isForRent == 1 and not has_unit_key then
                lib.registerContext({
                    id = 'motel_rent_actions',
                    title = unit_name,
                    options = {
                        {
                            title = 'Rent | Initial Payment - $' .. ESX.Math.GroupDigits(Config.InitialRentPrice) .. ' | Monthly - $' .. ESX.Math.GroupDigits(rentPrice),
                            description = 'Rent Details',
                            event = 'col_motels:Actions',
                            args = {
                                action = 'rent_unit',
                                motel_data = k,
                                rentPrice = rentPrice,
                                unit_name = unit_name
                            }
                        }
                    }
                })
                lib.showContext('motel_rent_actions')
            end
            if isForRent == 1 and has_unit_key then
                lib.registerContext({
                    id = 'motel_cancel_actions',
                    title = unit_name,
                    options = {
                        {
                            title = 'Cancel Renting',
                            description = 'Hakdog',
                            event = 'col_motels:Actions',
                            args = {
                                action = 'cancel_rent',
                                motel_data = k
                            }
                        }
                    }
                })
                lib.showContext('motel_cancel_actions')
            end
        end
        
    end, k) 
end

AddEventHandler('col_motels:Actions', function(data)
    local action = data.action
    if action == 'buy_motel' then
        ConfirmMotelBuy(data.motel_data, data.unit_name, data.unit_price)      
    elseif action == 'sell_motel' then
        ConfirmMotelSell(data.motel_data, data.unit_name, data.unit_price)
    elseif action == 'give_key' then
        GiveMotelKey(data.motel_data)
    elseif action == 'change_key' then
        ConfirmChangeMotelKey(data.motel_data, Config.ChangeDoorLockPrice)   
    elseif action == 'rent_options' then
        OpenMotelRentMenu(data.motel_data, data.isForRent, data.rentPrice)     
    elseif action == 'rent_unit' then
        ConfirmRentUnit(data.motel_data, data.rentPrice, data.unit_name)   
    elseif action == 'cancel_rent' then
        ConfirmCancelRentUnit(data.motel_data)    
    elseif action == 'motel_pending_tenants_option' then
        if data.tenantsIdentifier == data.tenantsIdentifier then
            PendingTenantMenu(data.motel_data, data.rowid, data.tenantsIdentifier, data.tenantsName, data.rentPrice)
        end          
    elseif action == 'delete_tenant_request' then
        TriggerServerEvent('col_motels:deletePendingTenant', data.motel_data, data.rowid, data.tenantId)
        CollectiveC.Notification(2, locale('delete_pending_tenant', data.tenantName))  
    elseif action == 'accept_motel_tenant' then
        TriggerServerEvent('col_motels:acceptPendingTenant', data.motel_data, data.rowid, data.tenantId, data.rentPrice)
    elseif action == 'start_rent' then
        TriggerServerEvent('col_motels:setMotelRent', data.motel_data, 1, Config.DefaultRentPrice)
    elseif action == 'stop_rent' then
        TriggerServerEvent('col_motels:setMotelRent', data.motel_data, 0, 0)
    elseif action == 'motel_tenants' then
        OpenMotelTenants(data.motel_data)
    elseif action == 'pending_tenants' then
        OpenPendingTenants(data.motel_data)
    elseif action == 'set_price' then
        SetMotelRentPrice(data.motel_data)
    elseif action == 'tenant_list' then
        if data.tenantsIdentifier == data.tenantsIdentifier then
            OpenTenantsMenu(data.motel_data, data.rowid, data.tenantsIdentifier, data.tenantsName)
        end
    elseif action == 'player_dressing' then 
        ESX.TriggerServerCallback('col_motels:getPlayerDressing', function(dressing)
            if #dressing > 0 then
				local SendMenu = {}
				for i=1, #dressing, 1 do
					table.insert(SendMenu, {
						title = 'Label: '..dressing[i],
						description = 'Clothe: #' ..i,
						event = 'col_motels:Actions',
						args = {
							action = 'load_outfit',
							label = dressing[i], 
							value = i
						}
					})
				end
				lib.registerContext({
					id = 'motel_player_dressing',
					title = 'Change Clothes - Wardrobe',
					options = SendMenu
				})
				lib.showContext('motel_player_dressing')
			else
                CollectiveC.Notification(3, locale('no_clothes'))  
			end
        end)
    elseif action == 'remove_cloth' then
        ESX.TriggerServerCallback('col_motels:getPlayerDressing', function(dressing)
            if #dressing > 0 then
				local SendMenu = {}
				for i=1, #dressing, 1 do
					table.insert(SendMenu, {
						title = 'Label: '..dressing[i],
						description = 'Clothe: #' ..i,
						event = 'col_motels:Actions',
						args = {
							action = 'motel_remove_cloth',
							label = dressing[i], 
							value = i
						}
					})
				end
				lib.registerContext({
					id = 'motel_remove_cloth',
					title = 'Delete Outfit - Wardrobe',
					options = SendMenu
				})
				lib.showContext('motel_remove_cloth')
			else
                CollectiveC.Notification(3, locale('no_clothes'))  
			end
        end)
    elseif action == 'load_outfit' then
        TriggerEvent('skinchanger:getSkin', function(skin)
            ESX.TriggerServerCallback('col_motels:getPlayerOutfit', function(clothes)
                TriggerEvent('skinchanger:loadClothes', skin, clothes)
                TriggerEvent('esx_skin:setLastSkin', skin)
                TriggerEvent('skinchanger:getSkin', function(skin)
                    TriggerServerEvent('esx_skin:save', skin)
                end)
                CollectiveC.Notification(1, locale('dressing'))   
            end, data.value)  
        end)
    elseif action == 'motel_remove_cloth' then
        TriggerServerEvent('col_motels:removeOutfit', data.value)
        CollectiveC.Notification(1, locale('remove_clothes'))   
    end
end)

function OpenMotelRentMenu(k, isForRent, rentPrice)
    if isForRent == 0 then
        lib.registerContext({
            id = 'motels_set_unit_for_rent',
            title = 'Rent Options',
            options = {
                {
                    title = 'Enable Unit Rent',
                    description = 'Set this unit for rent',
                    event = 'col_motels:Actions',
                    args = {
                        action = 'start_rent',
                        motel_data = k
                    }
                }
            },
        })
        lib.showContext('motels_set_unit_for_rent')
    end    
    if isForRent == 1 then
        lib.registerContext({
            id = 'motel_rent_option',
            title = 'Rent Options',
            options = {
                {
                    title = 'Disable Unit Rent ',
                    description = 'Cancel this unit for rent',
                    event = 'col_motels:Actions',
                    args = {
                        action = 'stop_rent',
                        motel_data = k
                    }
                },
                {
                    title = 'Tenants',
                    description = 'Tenants List',
                    event = 'col_motels:Actions',
                    args = {
                        action = 'motel_tenants',
                        motel_data = k
                    }
                },
                {
                    title = 'Pending List',
                    description = 'Pending Tenant List',
                    event = 'col_motels:Actions',
                    args = {
                        action = 'pending_tenants',
                        motel_data = k
                    }
                },
                {
                    title = 'Set rent price',
                    description = 'Rent Price - $' .. ESX.Math.GroupDigits(rentPrice),
                    event = 'col_motels:Actions',
                    args = {
                        action = 'set_price',
                        motel_data = k
                    }
                }
            },
        })
        lib.showContext('motel_rent_option')
    end
end

function OpenPendingTenants(k)
    ESX.TriggerServerCallback('col_motels:getPendingTenants', function(tenants)
        if tenants then
            local SendMenu = {}
            for i=1, #tenants, 1 do
                local theData = tenants[i]
                table.insert(SendMenu, {
                    title = theData.tenantsName,
                    description = 'Pending Tenants Option',
                    event = 'col_motels:Actions',
                    args = {
                        action = 'motel_pending_tenants_option',
                        motel_data = k,
                        rowid = theData.id,
                        tenantsIdentifier = theData.identifier,
                        tenantsName = theData.tenantsName,
                        rentPrice = theData.renting_price
                    }
                })
            end
            lib.registerContext({
                id = 'motel_pending_tenants_option',
                title = 'Pending Tenants',
                options = SendMenu
            })
            lib.showContext('motel_pending_tenants_option')
        else
            CollectiveC.Notification(3, locale('no_peding_tenants'))
        end
    end, k)
end

function PendingTenantMenu(k, rowid, tenantId, tenantName, rentPrice)
    lib.registerContext({
        id = 'pending_tenant_menu',
        title = tenantName,
        options = {
            {
                title = 'Accept',
                description = 'Accept this tenant',
                event = 'col_motels:Actions',
                args = {
                    action = 'accept_motel_tenant',
                    motel_data = k,
                    rowid = rowid,
                    tenantId = tenantId,
                    rentPrice = rentPrice
                }
            },
            {
                title = 'Delete',
                description = 'Remove tenant request',
                event = 'col_motels:Actions',
                args = {
                    action = 'delete_tenant_request',
                    motel_data = k, 
                    rowid = rowid, 
                    tenantName = tenantName,
                    tenantId = tenantId
                }
            }
        },
    })
    lib.showContext('pending_tenant_menu')
end


function OpenMotelTenants(k)
    ESX.TriggerServerCallback('col_motels:getMotelTenants', function(tenants)
        local SendMenu = {}
        if tenants then
            for i = 1, #tenants, 1 do
                local theData = tenants[i]
                table.insert(SendMenu, {
                    title = theData.tenantsName,
                    description = 'Evict this tenant',
                    event = 'col_motels:Actions',
                    args = {
                        action = 'tenant_list',
                        motel_data = k,
                        rowid = theData.id,
                        tenantsIdentifier = theData.identifier,
                        tenantsName = theData.tenantsName,
                    }
                })
            end
            lib.registerContext({
                id = 'tenant_list',
                title = 'Unit Tenants',
                options = SendMenu
            })
            lib.showContext('tenant_list')
        else
            CollectiveC.Notification(3, locale('no_tenants'))  
        end
    end, k)
end

function OpenTenantsMenu(k, rowid, tenantId, tenantName)
    local alert = lib.alertDialog({
        header = 'Evict Tenant ❌',
        content = 'Are you sure you want to evict this tenant?',
        centered = true,
        cancel = true
    })
    if alert == 'confirm' then
        TriggerServerEvent('col_motels:evictMotelTenant', k, rowid, tenantId)
        CollectiveC.Notification(1, locale('evict_tenant', tenantName))   
    end 
end

function ConfirmMotelBuy(k, unit_name, unit_price)
    local alert = lib.alertDialog({
        header = '💵 Buy '..unit_name,
        content = 'Do you want to buy ' .. unit_name .. ' for $' .. ESX.Math.GroupDigits(unit_price) .. '?',
        centered = true,
        cancel = true
    })
    if alert == 'confirm' then
        TriggerServerEvent('col_motels:buyMotel', k, unit_name, unit_price)
    end 
end

function ConfirmMotelSell(k, unit_name, unit_price)
    local alert = lib.alertDialog({
        header = '💵 Sell '..unit_name,
        content = 'Are you sure you want to sell ' .. unit_name .. ' for $' .. ESX.Math.GroupDigits(unit_price) .. '?',
        centered = true,
        cancel = true
    })
    if alert == 'confirm' then
        TriggerServerEvent('col_motels:sellMotel', k, unit_price)            
    end
end

function ConfirmRentUnit(k, rentPrice, unit_name)
    local alert = lib.alertDialog({
        header = 'Hello 👋',
        content = 'Are you sure you want to rent this unit for $' .. ESX.Math.GroupDigits(rentPrice) .. '?',
        centered = true,
        cancel = true
    })
    if alert == 'confirm' then
        TriggerServerEvent('col_motels:rentMotel', k, rentPrice, unit_name)     
    end 
end

function ConfirmCancelRentUnit(k)
    local alert = lib.alertDialog({
        header = 'Hello 👋',
        content = 'Are you sure you want to cancel renting this unit?',
        centered = true,
        cancel = true
    })
    if alert == 'confirm' then
        TriggerServerEvent('col_motels:cancelRentMotel', k)
    end 
end

function GiveMotelKey(k)
    local input = lib.inputDialog('Co-Owner Player ID', {'ID:'})
    if input then
        local co_owner_id = tonumber(input[1])
        if input[1] == nil or input[1] == "" or type(co_owner_id) ~= 'number' or co_owner_id == nil or co_owner_id == "" or co_owner_id <= 0 then
            CollectiveC.Notification(3, locale('invalid_input'))      
        else
            TriggerServerEvent('col_motels:giveMotelKey', k, co_owner_id)                
        end
    end  
end

function SetMotelRentPrice(k)
    local input = lib.inputDialog('Renting Price', {'Amount (Min = '..Config.MinRentPrice..', Max = '..Config.MaxRentPrice..')'})
    if input then
        local rentPrice = tonumber(input[1])
        local minPrice = Config.MinRentPrice
        local maxPrice = Config.MaxRentPrice
        if input[1] == nil or input[1] == "" or type(rentPrice) ~= 'number' or rentPrice == nil or rentPrice == "" then
            CollectiveC.Notification(3, locale('invalid_input'))      
        else
            if rentPrice >= minPrice and rentPrice <= maxPrice then
                TriggerServerEvent('col_motels:setMotelRentPrice', k, co_owner_id) 
            else
                CollectiveC.Notification(3, locale('motel_set_price', ESX.Math.GroupDigits(minPrice), ESX.Math.GroupDigits(maxPrice)))      
            end
        end
    end  
end

function ConfirmChangeMotelKey(k, changelock_price)     
    local alert = lib.alertDialog({
        header = 'Hello 👋',
        content = 'Do you want to change your door locks for $' .. ESX.Math.GroupDigits(Config.ChangeDoorLockPrice) .. '?',
        centered = true,
        cancel = true
    })
    if alert == 'confirm' then
        TriggerServerEvent('col_motels:changeMotelKey', k, changelock_price)
    end 
end

function OpenPropertyInventoryMenu(motelid, unitOwner, unit_name)
    exports.ox_inventory:openInventory('stash', 'motel-'..motelid..'-stash-'..unitOwner)
end

function OpenPropertyInventoryMenuBed(motelid, unitOwner, unit_name)
    exports.ox_inventory:openInventory('stash', 'motel-'..motelid..'-bed-'..unitOwner)
end

function PlayerDressings()
    lib.registerContext({
        id = 'motels_wardrobe',
        title = 'Wardrobe',
        options = {
            {
                title = 'Saved Clothes',
                description = 'Outfits',
                event = 'col_motels:Actions',
                args = {
                    action = 'player_dressing'
                }
            },
            {
                title = 'Remove Clothes',
                description = 'Wardrobe Action',
                event = 'col_motels:Actions',
                args = {
                    action = 'remove_cloth'
                }
            }
        },
    })
    lib.showContext('motels_wardrobe')
end

function CreateBlips()
    for k,v in pairs(Config.MotelBlips) do
        local blip = AddBlipForCoord(tonumber(v.mapBlip.x), tonumber(v.mapBlip.y), tonumber(v.mapBlip.z))
        SetBlipSprite(blip, v.mapBlip.sprite)
        SetBlipDisplay(blip, 4)
        SetBlipScale(blip, v.mapBlip.size)
        SetBlipColour(blip, v.mapBlip.color)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(v.name)
        EndTextCommandSetBlipName(blip)
    end
end
