game 'gta5'
version '1.0'
fx_version 'adamant'
description 'Nlocation By NoxZi-Dev#0001'


client_scripts {
    'config.lua',
	'client/client.lua'
}

server_scripts {
    'config.lua',
    'server/server.lua'
}

ui_page('html/index.html')

files{
    'html/img/*.png',
    'html/*.css',
    'html/*.html',
    'html/*.js',
}