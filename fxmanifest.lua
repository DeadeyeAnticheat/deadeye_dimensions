fx_version 'cerulean'
rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'
game 'rdr3'

author 'PharellJay - Deadeye'
description 'Deadeye Dimensions - https://discord.gg/DU5eb5vJ4q'

lua54 'yes'

shared_scripts {
    'config.lua',
}

server_scripts {
    'server.lua',
}

client_scripts {
    '@PolyZone/client.lua',
    'client.lua',
}