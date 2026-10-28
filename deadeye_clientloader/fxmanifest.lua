game "rdr3"
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
fx_version "cerulean"

author 'PharellJay - Deadeye'

lua54 "yes"

shared_scripts {
    "config/resources.lua",
    "config/config.lua",
    "shared/clientloader.lua"
}

server_scripts {
    "server/server.lua",
}

escrow_ignore {
    "config/resources.lua",
    "config/config.lua",
}