---@diagnostic disable: undefined-global
fx_version 'cerulean'
game 'gta5'

author 'tomaskoYT'
description 'Moneywash job by tomaskoYT'
version '1.0'
lua54 'yes'


dependencies {
	'ox_lib'
}
client_scripts {
    'client/main.lua',
    'config.lua'
}

server_scripts {
    'server/main.lua',
    'config.lua'
}

files {
    'locales/*.json'
}

shared_scripts{
    '@es_extended/imports.lua',
    '@ox_lib/init.lua',
    'locales/*.lua'
    
}



