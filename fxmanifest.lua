--[[ FX Information ]]--
fx_version 'cerulean'
games {'gta5'}
lua54 'yes'
version '0.0.2'

--[[ Resource Information ]]--
description  'Motels System compatible with ox_inventory'

--[[ Manifest ]]--
dependencies {
	'/server:5181',
	'/onesync',
	'ox_lib',
    'es_extended',
    'oxmysql'
}

files {
    'locales/*.json'
}

shared_scripts {
	'@ox_lib/init.lua',
    '@es_extended/imports.lua'
}

server_scripts {
	'@oxmysql/lib/MySQL.lua',
    'config.lua',
    'shared/sv_notify.lua',
    'server/main.lua'
}

client_scripts {
    'config.lua',
    'shared/cl_notify.lua',
    'client/main.lua'
}


escrow_ignore {
    'config.lua',
    'shared/*.lua',
    'readme.md',
    'locales/*.json'
}
