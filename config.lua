Config = {}

--SERVER-SIDE EXPORT USED TO DISABLE THE ANTICHEAT FOR SET PLAYER FOR X SECONDS
--exports.deadeye_anticheat:Whitelistbyid(targetsource, seconds)

Config.Devmode = false --Allows you to restart the script while the server is running, don't use on live servers

--UNBANNINGS
--For example /acunban banid from client with permissions or server console
Config.Unban = {
    command = "acunban",
    admingroups = {
        ["admin"] = true,
        ["supp"] = true
    }
}

--CLEAR PEDS
--For example /clearpeds delaySeconds from client with permissions or server console
Config.ClearPeds = {
    command = "clearpeds",
    admingroups = {
        ["admin"] = true,
        ["supp"] = true
    }
}

--CLEAR VEHICLES
--For example /clearvehicles delaySeconds from client with permissions or server console
Config.ClearVehicles = {
    command = "clearvehicles",
    admingroups = {
        ["admin"] = true,
        ["supp"] = true
    }
}

--STEALTH MODE
--Hides the anticheat from connecting players: the priority queue and all deferral cards are disabled,
--ban checks still run silently while connecting and the client console stays quiet on activation
Config.Stealthmode =  {
    Enabled = false,
}

--PRIORITY QUEUE
--Adds a priority queue to the connecting process, useful for servers with a lot of players and monetization.
Config.Priorityqueue = { --players are let in one after another, priority moves them up in line
    Usepriorityqueue = true,
    Maxplayers = false, --false = use sv_maxclients, otherwise a number
    Joindelay = 5000, --Milliseconds between two players being let in (checked once per second)
    Maxconnecting = 3, --Max players that may be loading into the server at the same time
    Reservedslots = 0, --Slots that are kept free for players with at least Reservedpower
    Reservedpower = 20,
    Connectinggrace = 180, --Seconds a released player may take to load in before his slot is given away
    Reconnectgrace = 60, --Seconds a player keeps his queue position after losing connection while queued
    name = "Standard Priority",
    basepower = 0,
    Priorities = { --Higher power = further ahead in the queue
        {name = "Silver Priority" , roleid = "", power = 10},
        {name = "Gold Priority" , roleid = "", power = 20},
        {name = "Platinum Priority" , roleid = "", power = 30},
    },
}

---------------------------
---------------------------
--BASIC CONFIGURATION
---------------------------
---------------------------
---------
--MODULES
---------
Config.Modules = {
    Discordrolecheck = true,
    Antirapidfire = true,
    AntiAI = true,
    AntiInjection = true,
    NuiBlocker = true,
    AntiCrash = true,
    AntiDevmode = true,
    ForceReleaseChannel = false, --(ALPHA)
    AntiSpawnweapons = true,
    BlacklistWeapons = true,
    BlacklistAmmo = true,
    AntiPedhack = true,
    AntiInvincible = true,
    AntiExplosion = true,
    AntiFreecam = true, --(ALPHA)
    AntiInvisible = true,
    CommandDetection = true,
    AntiKillaura = true,
    AntiMasskill = true,
    EntityBlacklist = true,
    AntiEntityspam = true,
    AntiController = true,
    AntiInfiniteAmmo = true,
    AntiTeleport = true, --(ALPHA)
    AntiBiggerHitbox = true,
    AntiTriggerBot = true,
    AdvancedProtection = true, --RECOMMENDED
}

---------
--PUNISHMENTS
---------
Config.Punishments = {
    Discordrolecheck = {
        Log = true,
        Kick = true,
        Ban = false,
    },
    AntiAI = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    AntiInjection = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    NuiBlocker = {
        Log = true,
        Kick = true,
        Ban = false,
    },
    AntiCrash = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    AntiDevmode = {
        Log = true,
        Kick = true,
        Ban = false,
    },
    ForceReleaseChannel = {
        Log = true,
        Kick = true,
        Ban = false,
    },
    AntiSpawnweapons = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    BlacklistWeapons = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    BlacklistAmmo = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    AntiPedhack = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    AntiInvincible = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    AntiExplosion = {
        Log = true,
        Kick = false,
        Ban = false,
    },
    AntiFreecam = {
        Log = true,
        Kick = false,
        Ban = false,
    },
    AntiInvisible = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    CommandDetection = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    AntiKillaura = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    AntiMasskill = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    EntityBlacklist = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    AntiEntityspam = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    AntiController = {
        Log = true,
        Kick = true,
        Ban = false,
    },
    AntiInfiniteAmmo = {
        Log = true,
        Kick = true,
        Ban = false,
    },
    AntiTeleport = {
        Log = true,
        Kick = false,
        Ban = false,
    },
    AntiBiggerHitbox = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    AntiTriggerBot = {
        Log = true,
        Kick = true,
        Ban = true,
    },
    AdvancedProtection = { --RECOMMENDED
        Log = true,
        Kick = true,
        Ban = true,
    },
    Clientloader = { --RECOMMENDED
        Log = true,
        Kick = true,
        Ban = true,
    },
}

---------------------------
---------------------------
--MODULE CONFIGURATION
---------------------------
---------------------------
---------
--Discord-Rolecheck
---------
Config.Discordrolecheck = {
    Webhooktext = "Code: AC22 | The player does not have the required discord role anymore!",
    Kicktext = "Code: AC22 | You don't have the required discord role anymore!",
    Bantext = "Code: AC22 | You don't have the required discord role anymore!",
    Whiteliststeamids = {
        --["steam:...."] = true,
    },
    Whitelistlicenses = {
        --["..."] = true,
    }
}

---------
--Anti-Rapidfire
---------
Config.Antirapidfire = {
    Weapons = { --the weapons that rapidfire will be blocked for
        GetHashKey("WEAPON_SNIPERRIFLE_CARCANO"),
        GetHashKey("WEAPON_SNIPERRIFLE_ROLLINGBLOCK"),
        GetHashKey("WEAPON_RIFLE_ELEPHANT"),
        GetHashKey("WEAPON_RIFLE_VARMINT"),
        GetHashKey("WEAPON_RIFLE_BOLTACTION"),
        GetHashKey("WEAPON_RIFLE_SPRINGFIELD"),
        GetHashKey("WEAPON_REPEATER_CARBINE"),
        GetHashKey("WEAPON_REPEATER_EVANS"),
        GetHashKey("WEAPON_REPEATER_HENRY"),
        GetHashKey("WEAPON_REPEATER_WINCHESTER"),
        GetHashKey("WEAPON_BOW"),
        GetHashKey("WEAPON_BOW_IMPROVED"),

    },
    Blocktime = 750, --The time further shots are blocked after trying to rapidfire
}

---------
--ANTI-AI
---------
Config.AntiAI = {
    Webhooktext = "Code: AC01 | Damage-Multiplier detected!",
    Kicktext = "Code: AC01",
    Bantext = "Code: AC01",
    Weapons = { --This does not modidy your weapon damage. If you have another script that does so, you have to put the modified values in here!
        {
            weaponhash = "WEAPON_REVOLVER_DOUBLEACTION",
            damagemodifier = 1.0,
        },
        {
            weaponhash = "WEAPON_REVOLVER_CATTLEMAN",
            damagemodifier = 1.9,
        },
        {
            weaponhash = "WEAPON_REVOLVER_LEMAT",
            damagemodifier = 2.05,
        },
        {
            weaponhash = "WEAPON_REVOLVER_SCHOFIELD",
            damagemodifier = 2.2,
        },
        {
            weaponhash = "WEAPON_REVOLVER_NAVY",
            damagemodifier = 2.35,
        },
        {
            weaponhash = "WEAPON_REVOLVER_NAVY_CROSSOVER",
            damagemodifier = 2.6,
        },
        {
            weaponhash = "WEAPON_PISTOL_MAUSER",
            damagemodifier = 1.7,
        },
        {
            weaponhash = "WEAPON_PISTOL_SEMIAUTO",
            damagemodifier = 2.05,
        },
        {
            weaponhash = "WEAPON_PISTOL_M1899",
            damagemodifier = 2.35,
        },
        {
            weaponhash = "WEAPON_PISTOL_VOLCANIC",
            damagemodifier = 2.7,
        },
        {
            weaponhash = "WEAPON_SHOTGUN_DOUBLEBARREL",
            damagemodifier = 1.2,
        },
        {
            weaponhash = "WEAPON_SHOTGUN_REPEATING",
            damagemodifier = 1.1,
        },
        {
            weaponhash = "WEAPON_SHOTGUN_SEMIAUTO",
            damagemodifier = 1.2,
        },
        {
            weaponhash = "WEAPON_SHOTGUN_PUMP",
            damagemodifier = 1.3,
        },
        {
            weaponhash = "WEAPON_SHOTGUN_SAWEDOFF",
            damagemodifier = 1.4,
        },
        {
            weaponhash = "WEAPON_REPEATER_CARBINE",
            damagemodifier = 1.55,
        },
        {
            weaponhash = "WEAPON_REPEATER_EVANS",
            damagemodifier = 2.25,
        },
        {
            weaponhash = "WEAPON_REPEATER_HENRY",
            damagemodifier = 2.4,
        },
        {
            weaponhash = "WEAPON_REPEATER_WINCHESTER",
            damagemodifier = 2.65,
        },
        {
            weaponhash = "WEAPON_RIFLE_VARMINT",
            damagemodifier = 3.95,
        },
        {
            weaponhash = "WEAPON_RIFLE_BOLTACTION",
            damagemodifier = 3.95,
        },
        {
            weaponhash = "WEAPON_RIFLE_SPRINGFIELD",
            damagemodifier = 4.65,
        },
        {
            weaponhash = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",
            damagemodifier = 4.65,
        },
        {
            weaponhash = "WEAPON_RIFLE_ELEPHANT",
            damagemodifier = 13.25,
        },
    },
}

---------
--ANTI-INJECTION
---------
Config.AntiInjection = {
    Webhooktext = "Code: AC02 | Injection detected!",
    Kicktext = "Code: AC02",
    Bantext = "Code: AC02",
}

---------
--NUI-BLOCKER
---------
Config.NuiBlocker = {
    Webhooktext = "Code: AC03 | Nui-Devtools!",
    Kicktext = "Code: AC03",
    Bantext = "Code: AC03",
}

---------
--ANTI-CRASH
---------
Config.AntiCrash = {
    Webhooktext = "Code: AC05 | The player tried to create crashes!",
    Kicktext = "Code: AC05",
    Bantext = "Code: AC05",
}

---------
--Anti-Devmode
---------
Config.AntiDevmode = {
    Webhooktext = "Code: AC06 | The player is using developer mode!",
    Kicktext = "Code: AC06 | Developer mode detected!",
    Bantext = "Code: AC06",
}

---------
--Force Release Channel (ALPHA)
---------
Config.ForceReleaseChannel = {
    Webhooktext = "Code: AC07 | The player tried to play on another version than release!",
    Kicktext = "Code: AC07 | Your game version has to be set to RELEASE! If this is a mistake please reach out to your server's staff!",
    Bantext = "Code: AC07",
    Releaseversion = "1.0.0.17940" --Sadly you have to change this manually, because there is no api to call, back then it was useful, nowadays I would just turn this feature off.
}

---------
--Anti-Spawnweapons
---------
Config.AntiSpawnweapons = {
    Webhooktext = "Code: AC08 | The player spawned a weapon that he did not have in his inventory!",
    Kicktext = "Code: AC08",
    Bantext = "Code: AC08",
    Weaponlist = {
        --[[GetHashKey("WEAPON_LASSO"),
        GetHashKey("WEAPON_LASSO_REINFORCED"),
        GetHashKey("WEAPON_MELEE_KNIFE_RUSTIC"),
        GetHashKey("WEAPON_MELEE_KNIFE_HORROR"),
        GetHashKey("WEAPON_MELEE_KNIFE_CIVIL_WAR"),
        GetHashKey("WEAPON_MELEE_KNIFE_JAWBONE"),
        GetHashKey("WEAPON_MELEE_KNIFE_MINER"),
        GetHashKey("WEAPON_MELEE_KNIFE_VAMPIRE"),
        GetHashKey("WEAPON_MELEE_CLEAVER"),
        GetHashKey("WEAPON_MELEE_HATCHET"),
        GetHashKey("WEAPON_MELEE_HATCHET_DOUBLE_BIT"),
        GetHashKey("WEAPON_MELEE_HATCHET_HEWING"),
        GetHashKey("WEAPON_MELEE_HATCHET_HUNTER"),
        GetHashKey("WEAPON_MELEE_HATCHET_VIKING"),
        GetHashKey("WEAPON_THROWN_TOMAHAWK"),
        GetHashKey("WEAPON_THROWN_TOMAHAWK_ANCIENT"),
        GetHashKey("WEAPON_THROWN_THROWING_KNIVES"),
        GetHashKey("WEAPON_MELEE_MACHETE"),]]
        GetHashKey("WEAPON_BOW"),
        GetHashKey("WEAPON_REVOLVER_CATTLEMAN_MEXICAN"),
        GetHashKey("WEAPON_SNIPERRIFLE_CARCANO"),
        GetHashKey("WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC"),
        --[[GetHashKey("WEAPON_KIT_CAMERA"),
        GetHashKey("WEAPON_KIT_BINOCULARS_IMPROVED"),
        GetHashKey("WEAPON_MELEE_KNIFE_TRADER"),
        GetHashKey("WEAPON_KIT_BINOCULARS"),
        GetHashKey("WEAPON_KIT_CAMERA_ADVANCED"),
        GetHashKey("WEAPON_MELEE_LANTERN"),
        GetHashKey("WEAPON_MELEE_DAVY_LANTERN"),
        GetHashKey("WEAPON_MELEE_LANTERN_HALLOWEEN"),]]
        GetHashKey("WEAPON_BOW_IMPROVED"),
        --[[GetHashKey("WEAPON_MELEE_MACHETE_COLLECTOR"),
        GetHashKey("WEAPON_MELEE_LANTERN_ELECTRIC"),
        GetHashKey("WEAPON_MELEE_TORCH"),
        GetHashKey("WEAPON_MACHETE_HORROR"),
        GetHashKey("WEAPON_MELEE_HAMMER"),]]
        GetHashKey("WEAPON_REVOLVER_DOUBLEACTION_GAMBLER"),
        GetHashKey("WEAPON_REVOLVER_DOUBLEACTION"),
        GetHashKey("WEAPON_REVOLVER_CATTLEMAN"),
        GetHashKey("WEAPON_REVOLVER_SCHOFIELD"),
        GetHashKey("WEAPON_REVOLVER_NAVY"),
        GetHashKey("WEAPON_REVOLVER_NAVY_CROSSOVER"),
        GetHashKey("WEAPON_PISTOL_MAUSER"),
        GetHashKey("WEAPON_PISTOL_SEMIAUTO"),
        GetHashKey("WEAPON_PISTOL_M1899"),
        GetHashKey("WEAPON_PISTOL_VOLCANIC"),
        GetHashKey("WEAPON_REPEATER_CARBINE"),
        GetHashKey("WEAPON_REPEATER_EVANS"),
        GetHashKey("WEAPON_REPEATER_HENRY"),
        GetHashKey("WEAPON_REPEATER_WINCHESTER"),
        GetHashKey("WEAPON_SHOTGUN_DOUBLEBARREL"),
        GetHashKey("WEAPON_SHOTGUN_REPEATING"),
        GetHashKey("WEAPON_SHOTGUN_SEMIAUTO"),
        GetHashKey("WEAPON_SHOTGUN_PUMP"),
        GetHashKey("WEAPON_SHOTGUN_SAWEDOFF"),
        GetHashKey("WEAPON_RIFLE_VARMINT"),
        GetHashKey("WEAPON_RIFLE_BOLTACTION"),
        GetHashKey("WEAPON_SNIPERRIFLE_ROLLINGBLOCK"),
        GetHashKey("WEAPON_RIFLE_ELEPHANT"),
        0x6DFE44AB,
        0xD853C801,
        0xCE3C31A4,
        0xBE8D2666,
        0x791BBD2C,
        0xB4774D3D,
        0xFA4B2D47,
        0xD44A5A04,
        0x2C8DBB17,
        0xA6FE9435,
        0x1EAA7376,
        0xFD9B510B,
        0xCACE760E,
        0x514B39A1,
        0x39B815A2,
        0xFA66468E,
        0xC9622757,
        0xBE76397C,
        0x1D7D0737,
        0x8FAE73BB,
        0x2F3ECD37,
        0xC9095426,
        0x21556EC2,
        0x9DD839AE,
        0x2300C65,
        0xD427AD,
        0xE9245D38,
        0x49F6BE32,
        0x8384D5FE,
        0x7BD9C820,
        0xAF5EEF08,
        0x3EECE288,
        0x64514239,
        0x99496406,
        0x8BA6AF0A,
        0x46E97B10,
        0x23C706CD,
        0xE195D259,
        0xF5E4207F,
        0x247E783,
        0x4AAE5FFA,
    },
    Whitelistgroups = {
        ["admin"] = true,
        ["supp"] = true,
    },
}

---------
--Blacklist-Weapons
---------
Config.Blacklistweapons = {
    Webhooktext = "Code: AC09 | The player used a blackisted weapon!",
    Kicktext = "Code: AC09",
    Bantext = "Code: AC09",
    Blacklist = {
        --[["WEAPON_THROWN_DYNAMITE",
        "WEAPON_THROWN_MOLOTOV",
        "WEAPON_MOONSHINEJUG",
        "WEAPON_MOONSHINEJUG_MP",
        "WEAPON_THROWN_POISONBOTTLE",
        "WEAPON_KIT_METAL_DETECTOR",
        "WEAPON_THROWN_BOLAS",
        "WEAPON_THROWN_BOLAS_HAWKMOTH",
        "WEAPON_THROWN_BOLAS_IRONSPIKED",
        "WEAPON_THROWN_BOLAS_INTERTWINED",]]
    },
    Whitelistgroups = {
        ["admin"] = true,
        ["supp"] = true,
    },
}

---------
--BlacklistAmmo
---------
Config.Blacklistammo = {
    Webhooktext = "Code: AC10 | The player used blacklisted ammo!",
    Kicktext = "Code: AC10",
    Bantext = "Code: AC10",
    Blacklist = { --https://github.com/femga/rdr3_discoveries/blob/master/weapons/ammo_types.lua
        --78180283, --AMMO_REVOLVER_EXPRESS_EXPLOSIVE
        --1185302722, --AMMO_PISTOL_EXPRESS_EXPLOSIVE
        ---1668585578, --AMMO_REPEATER_EXPRESS_EXPLOSIVE
        --1838310467, --AMMO_RIFLE_EXPRESS_EXPLOSIVE
        ---1077205471, --AMMO_SHOTGUN_BUCKSHOT_INCENDIARY
        --588559146, --AMMO_SHOTGUN_SLUG_EXPLOSIVE
    },
    Whitelistgroups = {
        ["admin"] = true,
        ["supp"] = true,
    },
}

---------
--Anti-Pedhack
---------
Config.AntiPedhack  = {
    Webhooktext = "Code: AC11 | The player changed his ped!",
    Kicktext = "Code: AC11",
    Bantext = "Code: AC11",
    Pedmenugroups = {
        ["admin"] = true,
        ["supp"] = true,
    },
}

---------
--Anti-Invincible
---------
Config.AntiInvincible  = {
    Webhooktext = "Code: AC12 | The player made himself invincible!",
    Kicktext = "Code: AC12",
    Bantext = "Code: AC12",
    Checkproofs = true, --If true, it will check for entity proofs like bulletproof or fireproof
    AdvancedMode = false, --Detects modern approaches to GodMode Cheats, can have false positives though. Use at your own risk
    Maxhealth = 600, --The Max Health on your server (Normally 600)
    Requiredtime = 120000, --ms
    Whitelistzones = { --If you have safezones for example
        --{x = 3288.41, y = -1316.78, z = 42.77, r = 110}
    },
    Whitelistgroups = {
        ["admin"] = true,
        ["supp"] = true,
    },
}

---------
--Anti-Explosion
---------
Config.AntiExplosion = {
    Webhooktext = "Code: AC13 | The player created an exlposion!",
    Kicktext = "Code: AC13",
    Bantext = "Code: AC13",
    Invisbleandsilent = true, --If true, invisble and silent explosions will always be detected!
    Maxdamage = 150.0, --If the damage of the explosion exceeds this value it will also trigger!
    Allowedexplosions = { --Find the explosion types here: https://www.rdr2mods.com/nativedb/index/fire/add_explosion/
        --[25] = true, 
    },
    Whitelistgroups = {
        ["admin"] = true,
        ["supp"] = true,
    }
}

---------
--Anti-Freecam (ALPHA)
---------
Config.AntiFreecam = {
    Webhooktext = "Code: AC14 | The player used freecam!",
    Kicktext = "Code: AC14",
    Bantext = "Code: AC14",
    RespectMovement = true, --Set this to true, if you encounter many false positives
    Maxdistance = 150.0, --The maximum distance a camera is allowed to be away from the player
    Whitelistzones = { --If you have stables, which create cameras for example
        --{x = 3288.41, y = -1316.78, z = 42.77, r = 10.0}
    },
    Whitelistgroups = {
        ["admin"] = true,
        ["supp"] = true,
        ["streamer"] = true,
    }
}

---------
--Anti-Invisible
---------
Config.AntiInvisible = {
    Webhooktext = "Code: AC15 | The player made himself invisible!",
    Kicktext = "Code: AC15",
    Bantext = "Code: AC15",
    Whitelistzones = { --If you have scripts that make the player invisible add the coords here.
        --{x = 3288.41, y = -1316.78, z = 42.77, r = 10.0}
    },
    Whitelistgroups = {
        ["admin"] = true,
        ["supp"] = true,
    }
}

---------
--Command-Detection
---------
Config.CommandDetection = {
    Webhooktext = "Code: AC16 | There were blacklisted commands found in a script!",
    Kicktext = "Code: AC16",
    Bantext = "Code: AC16",
    Commands = { --If those commands are registered in the certain client, the event will be triggered
        
    },
}

---------
--Anti-Killaura
---------
Config.AntiKillaura = {
    Webhooktext = "Code: AC17 | The player used killaura!",
    Kicktext = "Code: AC17",
    Bantext = "Code: AC17",
    Whitelistgroups = {
        ["admin"] = true,
        ["supp"] = true,
    },
}

---------
--Anti-Masskill
---------
Config.AntiMasskill = {
    Webhooktext = "Code: AC18 | The player caused mass kills!",
    Kicktext = "Code: AC18",
    Bantext = "Code: AC18",
    Intervall = 500, --If the amount defined in Kills is reached in the time of Intervall the Event is triggered!
    Kills = 3,
    Whitelistgroups = {
        ["admin"] = true,
        ["supp"] = true,
    },
}

---------
--Entity-Blacklist
---------
Config.Entityblacklist = {
    Webhooktext = "Code: AC19 | The player spawned a blacklisted entity!",
    Kicktext = "Code: AC19",
    Bantext = "Code: AC19",
    Peds = {
        --A_C_Alligator_01
    },
    Vehicles = {

    },
    Objects = {

    },
    Whitelistgroups = {
        ["admin"] = true,
        ["supp"] = true,
    },
}

---------
--Anti-Entityspam
---------
Config.AntiEntityspam = {
    Webhooktext = "Code: AC20 | The player spawned too many entities!",
    Kicktext = "Code: AC20",
    Bantext = "Code: AC20",
    Peds = {
        --[[
        {
            model = "A_C_Alligator_01",
            limit = 5, --If a player creates the defined amount of entities in the set intervall the Event is triggered!
        }
        ]]
    },
    Vehicles = {
        
    },
    Objects = {
        
    },
    Intervall = 2000,
    Whitelistgroups = {
        ["admin"] = true,
        ["supp"] = true,
    },
}

---------
--Anti-Controller
---------
Config.AntiController = {
    Webhooktext = "Code: AC21 | The player used a controller!",
    Kicktext = "Code: AC21",
    Bantext = "Code: AC21",
    Whitelistgroups = {
        ["admin"] = true,
        ["supp"] = true,
    },
}

---------
--Anti-InfiniteAmmo
---------
Config.AntiInfiniteAmmo = {
    Webhooktext = "Code: AC23 | The player used infinte ammo / no reload!",
    Kicktext = "Code: AC23",
    Bantext = "Code: AC23",
}

---------
--AntiTeleport (ALPHA)
---------
Config.AntiTeleport = {
    Webhooktext = "Code: AC24 | The player teleported without permission / from outside of a whitelisted position!",
    Kicktext = "Code: AC24",
    Bantext = "Code: AC24",
    TeleportDistance = 300.0, --Be careful, when touching this!!!
    Whitelistgroups = {
        ["admin"] = true,
    },
    Whitelistzones = { --If you have a guarma teleport for example you put the startpoint in here
        --{x = 3288.41, y = -1316.78, z = 42.77, r = 5.0}
    },
}

---------
--Anti-BiggerHitbox
---------
Config.AntiBiggerHitbox = {
    Webhooktext = "Code: AC25 | The player used bigger Hitbox!",
    Kicktext = "Code: AC25",
    Bantext = "Code: AC25",
}

---------
--Anti-TriggerBot
---------
Config.AntiTriggerBot = {
    Webhooktext = "Code: AC26 | The player used a trigger bot!",
    Kicktext = "Code: AC26",
    Bantext = "Code: AC26",
    ReactionThreshhold = 30, --ms NEVER go over 100, 80 would be a soft value, 50 a medium on and 30 is almost a guaranteed value!
    Maxflags = 3, --The number of times the Threshhold ras to be reached in order to be flagged as a cheater. This is to prevent false positives!
    FlagDecay = 30000, -- ms after which one flag is forgotten again
}

---------
--AdvancedProtection
---------
Config.AdvancedProtection = { --RECOMMENDED
    Webhooktext = "Code: AC27 | The player tried to use a detected cheat menu!",
    Kicktext = "Code: AC27",
    Bantext = "Code: AC27",
}
--AdvancedProtection installs itself into txAdmin's resource 'monitor' on server start, restart the server once afterwards.
--If it can't be installed automatically, the server console prints the manual installation steps every 30 seconds.

---------
--Clientloader
---------
Config.Clientloader = {
    Webhooktext = "Code: AC28 | The player tried to re-request protected client files (possible dump attempt)!",
    Kicktext = "Code: AC28",
    Bantext = "Code: AC28",
}