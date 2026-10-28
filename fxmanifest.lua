fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'PharellJay'
description 'https://github.com/PharellJay'
version '1.4.9'

lua54 'yes'

shared_scripts {
    'config.lua',
    'clientloader.lua',
}

server_scripts {
    'config_secure.lua',
    'server.lua',
}

server_exports {
    'Whitelistbyid',
}

-- client.lua is intentionally NOT listed here. It is delivered to players at
-- runtime by the built-in clientloader (clientloader.lua), so it never ends up
-- in the client download manifest / file cache and cannot be dumped client-side.

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/js/*.js',
}

escrow_ignore {
    'config_secure.lua',
    'config.lua',
    'AdvancedProtection/detector.lua'
}