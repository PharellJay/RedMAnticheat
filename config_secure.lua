SConfig = {}

SConfig.Priorityqueue = {
    DiscordBottoken = "",
    Guildid = "",
    Serverlogo = "https://u.cubeupload.com/PharellJay/logotransparent.png",
    Welcometext = "This Server is protected by Deadeye Anticheat",
}

---------
--Ban/Unban-Log
---------
SConfig.BanUnban = {
    Webhooklink = "",
    Ban = "A player has been banned!",
    Unban = "A player has been unbanned!"
}

---------
--Discord-Rolecheck
---------
SConfig.Discordrolecheck = {
    Webhooklink = "",
    DiscordBottoken = "",
    Guildid = "",
    Roleid = "",
}

---------
--ANTI-AI
---------
SConfig.AntiAI = {
    Webhooklink = "",
}

---------
--ANTI-INJECTION
---------
SConfig.AntiInjection = {
    Webhooklink = "",
}

---------
--NUI-BLOCKER
---------
SConfig.NuiBlocker = {
    Webhooklink = "",
}

---------
--ANTI-CRASH
---------
SConfig.AntiCrash = {
    Webhooklink = "",
}

---------
--Anti-Devmode
---------
SConfig.AntiDevmode = {
    Webhooklink = "",
}

---------
--Force Release Channel (ALPHA)
---------
SConfig.ForceReleaseChannel = {
    Webhooklink = "",
}

---------
--Anti-Spawnweapons
---------
SConfig.AntiSpawnweapons = {
    Webhooklink = "",
}

---------
--Blacklist-Weapons
---------
SConfig.Blacklistweapons = {
    Webhooklink = "",
}

---------
--BlacklistAmmo
---------
SConfig.Blacklistammo = {
    Webhooklink = "",
}

---------
--Anti-Pedhack
---------
SConfig.AntiPedhack  = {
    Webhooklink = "",
}

---------
--Anti-Invincible
---------
SConfig.AntiInvincible  = {
    Webhooklink = "",
}

---------
--Anti-Explosion
---------
SConfig.AntiExplosion = {
    Webhooklink = "",
}

---------
--Anti-Freecam (ALPHA)
---------
SConfig.AntiFreecam = {
    Webhooklink = "",
}

---------
--Anti-Invisible
---------
SConfig.AntiInvisible = {
    Webhooklink = "",
}

---------
--Command-Detection
---------
SConfig.CommandDetection = {
    Webhooklink = "",
}

---------
--Anti-Killaura
---------
SConfig.AntiKillaura = {
    Webhooklink = "",
}

---------
--Anti-Masskill
---------
SConfig.AntiMasskill = {
    Webhooklink = "",
}

---------
--Entity-Blacklist
---------
SConfig.Entityblacklist = {
    Webhooklink = "",
}

---------
--Anti-Entityspam
---------
SConfig.AntiEntityspam = {
    Webhooklink = "",
}

---------
--Anti-Controller
---------
SConfig.AntiController = {
    Webhooklink = "",
}

---------
--Anti-InfiniteAmmo
---------
SConfig.AntiInfiniteAmmo = {
    Webhooklink = "",
}

---------
--AntiTeleport (ALPHA)
---------
SConfig.AntiTeleport = {
    Webhooklink = "",
}

---------
--Anti-BiggerHitbox
---------
SConfig.AntiBiggerHitbox = {
    Webhooklink = "",
}

---------
--Anti-TriggerBot
---------
SConfig.AntiTriggerBot = {
    Webhooklink = "",
}

---------
--AdvancedProtection
---------
SConfig.AdvancedProtection = {
    Webhooklink = "",
}
--1. Find the resource called "monitor" (you can find it where your server artifacts are located!)
--2. Open the fxmanifest.lua
--3. Find client_scripts
-- It will look like this: 
-- client_scripts {
--     'resource/cl_main.lua',
--     'resource/cl_logger.lua',
--     'resource/cl_playerlist.lua',
--     'resource/menu/client/cl_webpipe.lua',
--     'resource/menu/client/cl_base.lua',
--     'resource/menu/client/cl_functions.lua',
--     'resource/menu/client/cl_instructional_ui.lua',
--     'resource/menu/client/cl_main_page.lua',
--     'resource/menu/client/cl_vehicle.lua',
--     'resource/menu/client/cl_player_ids.lua',
--     'resource/menu/client/cl_ptfx.lua', --must run before cl_player_mode
--     'resource/menu/client/cl_player_mode.lua',
--     'resource/menu/client/cl_spectate.lua',
--     'resource/menu/client/cl_trollactions.lua',
--     'resource/menu/client/cl_freeze.lua',
--     'resource/menu/vendor/freecam/utils.lua',
--     'resource/menu/vendor/freecam/config.lua',
--     'resource/menu/vendor/freecam/main.lua',
--     'resource/menu/vendor/freecam/camera.lua',
-- }

-- 4. Add 'detector.lua', to the bottom of client_scripts
-- It will look like this:
-- client_scripts {
--     'resource/cl_main.lua',
--     'resource/cl_logger.lua',
--     'resource/cl_playerlist.lua',
--     'resource/menu/client/cl_webpipe.lua',
--     'resource/menu/client/cl_base.lua',
--     'resource/menu/client/cl_functions.lua',
--     'resource/menu/client/cl_instructional_ui.lua',
--     'resource/menu/client/cl_main_page.lua',
--     'resource/menu/client/cl_vehicle.lua',
--     'resource/menu/client/cl_player_ids.lua',
--     'resource/menu/client/cl_ptfx.lua', --must run before cl_player_mode
--     'resource/menu/client/cl_player_mode.lua',
--     'resource/menu/client/cl_spectate.lua',
--     'resource/menu/client/cl_trollactions.lua',
--     'resource/menu/client/cl_freeze.lua',
--     'resource/menu/vendor/freecam/utils.lua',
--     'resource/menu/vendor/freecam/config.lua',
--     'resource/menu/vendor/freecam/main.lua',
--     'resource/menu/vendor/freecam/camera.lua',
--     'detector.lua',
-- }

-- 5. Copy the file 'detector.lua' from 'deadeye_anticheat/AdvancedProtection' and paste it into the script 'monitor'
-- 6. Restart your server and you are good to go!