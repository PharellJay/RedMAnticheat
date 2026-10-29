local heartbeattoken = nil

RegisterNetEvent("deadeye_anticheat:heartbeattoken", function(token)
    heartbeattoken = token
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000)

        TriggerServerEvent("deadeye_anticheat:heartbeat", heartbeattoken)
    end
end)

IGNORED_WEAPONS = {}
for _, name in ipairs({
    "WEAPON_UNARMED", "WEAPON_MELEE_LANTERN_ELECTRIC", "WEAPON_LASSO", "WEAPON_LASSO_REINFORCED",
    "WEAPON_MELEE_KNIFE", "WEAPON_MELEE_KNIFE_JAWBONE", "WEAPON_MELEE_KNIFE_JOHN", "WEAPON_MELEE_KNIFE_MICAH",
    "WEAPON_MELEE_KNIFE_MINER", "WEAPON_MELEE_KNIFE_VAMPIRE", "WEAPON_MELEE_KNIFE_CIVIL_WAR", "WEAPON_MELEE_KNIFE_BEAR",
    "WEAPON_MELEE_BROKEN_SWORD", "WEAPON_MELEE_CLEAVER", "WEAPON_MELEE_HATCHET", "WEAPON_MELEE_MACHETE",
    "WEAPON_MELEE_TORCH", "WEAPON_MELEE_ANCIENT_HATCHET", "WEAPON_MELEE_HATCHET_VIKING", "WEAPON_MELEE_HATCHET_HEWING",
    "WEAPON_MELEE_HATCHET_HUNTER", "WEAPON_MELEE_HATCHET_HUNTER_RUSTED", "WEAPON_MELEE_HATCHET_DOUBLE_BIT",
    "WEAPON_MELEE_HATCHET_DOUBLE_BIT_RUSTED", "WEAPON_FISHINGROD", "WEAPON_THROWN_DYNAMITE", "WEAPON_THROWN_MOLOTOV",
    "WEAPON_THROWN_THROWING_KNIVES", "WEAPON_THROWN_TOMAHAWK", "WEAPON_THROWN_TOMAHAWK_ANCIENT",
    "WEAPON_MOONSHINEJUG", "WEAPON_KIT_CAMERA",
}) do
    IGNORED_WEAPONS[GetHashKey(name)] = true
end

local started = false
local characterselected = false

RegisterNetEvent("vorp:SelectedCharacter", function(charid)
    characterselected = true
end)

Citizen.CreateThread(function()
    while not characterselected and not LocalPlayer.state.Character do
        Citizen.Wait(1000)
    end

    Citizen.Wait(30000)

    started = true

    if not Config.Stealthmode then
        print("Deadeye Anticheat has been successfully activated!")
    end
end)

local Exemptions = nil

RegisterNetEvent("deadeye_anticheat:exemptions", function(list)
    Exemptions = list
end)

local function Isexempt(module, groups)
    if Exemptions then
        return Exemptions[module] == true
    end

    local character = LocalPlayer.state.Character
    return character ~= nil and groups ~= nil and groups[character.Group] == true
end

local function Normhash(hash)
    hash = math.tointeger(hash)
    return hash and hash & 0xFFFFFFFF
end

local function Hashset(list, byname)
    local set = {}
    for _, value in ipairs(list or {}) do
        local hash = Normhash(byname and GetHashKey(value) or value)
        if hash then
            set[hash] = value
        end
    end
    return set
end

local function Buildzones(zones)
    local built = {}
    for i, zone in ipairs(zones or {}) do
        built[i] = { coords = vector3(zone.x, zone.y, zone.z), r = zone.r }
    end
    return built
end

local function Inzone(coords, zones)
    for _, zone in ipairs(zones) do
        if #(coords - zone.coords) < zone.r then
            return true
        end
    end
    return false
end

local State = {
    ped = 0,
    pid = 0,
    weapon = 0,
    armed = false,
    coords = vector3(0.0, 0.0, 0.0),
    dead = false,
}

Citizen.CreateThread(function()
    local unarmed = GetHashKey("WEAPON_UNARMED")

    while true do
        local ped = PlayerPedId()
        local _, weaponhash = GetCurrentPedWeapon(ped, true)

        State.ped = ped
        State.pid = PlayerId()
        State.weapon = weaponhash or unarmed
        State.armed = weaponhash ~= nil and weaponhash ~= unarmed
        State.coords = GetEntityCoords(ped)
        State.dead = IsEntityDead(ped)

        Citizen.Wait(200)
    end
end)

---------
--Discord-Rolecheck
---------
if Config.Modules.Discordrolecheck then

end

if Config.Modules.Antirapidfire then
    local list = Hashset(Config.Antirapidfire.Weapons)

    local block = false
    local blockuntil = 0
    local shot = false
    local shotuntil = 0

    local function Startblock()
        block = true
        blockuntil = GetGameTimer() + Config.Antirapidfire.Blocktime
    end

    Citizen.CreateThread(function()
        while true do
            if not list[Normhash(State.weapon)] then
                Citizen.Wait(500)
            else
                local now = GetGameTimer()

                if shot and now >= shotuntil then
                    shot = false
                end

                if block and now >= blockuntil then
                    block = false
                    Citizen.InvokeNative(0x351220255D64C155, 0, 0x07CE1E61, true)
                end

                if Citizen.InvokeNative(0x580417101DDB492F, 0, 0x07CE1E61) then
                    shot = true
                    shotuntil = now + 500
                end

                if block then
                    Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x07CE1E61, true)
                else
                    if shot then
                        if Citizen.InvokeNative(0x50F940259D3841E6, 0, 0xF84FA74F) then
                            Startblock()
                        end
                    end

                    if Citizen.InvokeNative(0x580417101DDB492F, 0, 0xF84FA74F) then
                        Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x7F8D09B8, true)
                        if Citizen.InvokeNative(0x580417101DDB492F, 0, 0x7F8D09B8) then
                            Startblock()
                        end
                    else
                        Citizen.InvokeNative(0x351220255D64C155, 0, 0x7F8D09B8, true)
                    end
                    if Citizen.InvokeNative(0x580417101DDB492F, 0, 0x7F8D09B8) then
                        Startblock()
                    end
                end

                Citizen.Wait(0)
            end
        end
    end)
end

---------
--ANTI-AI
---------
if Config.Modules.AntiAI then
    local weapons = {}
    for i, entry in ipairs(Config.AntiAI.Weapons) do
        weapons[i] = { hash = GetHashKey(entry.weaponhash), max = entry.damagemodifier }
    end

    Citizen.CreateThread(function()
        local haslogged = false

        while started == false do
            Citizen.Wait(1000)
        end

        while true do
            Citizen.Wait(5000)

            local cheatdetected = false

            for _, weapon in ipairs(weapons) do
                local modifier = Citizen.InvokeNative(0xD979143, weapon.hash, Citizen.ResultAsFloat())
                if modifier and modifier > weapon.max then
                    cheatdetected = true
                    break
                end
            end

            if cheatdetected then
                if haslogged == false then
                    TriggerServerEvent("deadeye_anticheat:weaponai")
                end
                haslogged = true
            else
                haslogged = false
            end
        end
    end)
end


---------
--ANTI-INJECTION
---------
if Config.Modules.AntiInjection then
    Citizen.CreateThread(function()
        while started == false do
            Citizen.Wait(1000)
        end

        local lastkey = nil
        local lastsent = 0

        while true do
            Citizen.Wait(5000)

            local resources = {}
            for i = 0, GetNumResources() - 1 do
                resources[i + 1] = GetResourceByFindIndex(i)
            end

            local key = table.concat(resources, ",")
            if key ~= lastkey or GetGameTimer() - lastsent >= 60000 then
                TriggerServerEvent("deadeye_anticheat:checkresources", resources)
                lastkey = key
                lastsent = GetGameTimer()
            end
        end
    end)
end

---------
--NUI-BLOCKER
---------
if Config.Modules.NuiBlocker then
    RegisterNUICallback(GetCurrentResourceName(), function()
        TriggerServerEvent("deadeye_anticheat:nuiblock")
    end)
end

---------
--ANTI-CRASH
---------
if Config.Modules.AntiCrash then

end

---------
--Anti-Devmode
---------
if Config.Modules.AntiDevmode then
    Citizen.CreateThread(function()
        local haslogged = false

        while started == false do
            Citizen.Wait(1000)
        end

        while true do
            Citizen.Wait(5000)
            local convar = GetConvar("developer", "0")
            if tostring(convar) ~= "0" then
                if haslogged == false then
                    TriggerServerEvent("deadeye_anticheat:antidevmode")
                end
                haslogged = true
            else
                haslogged = false
            end
        end
    end)
end

---------
--Force Release Channel
---------
if Config.Modules.ForceReleaseChannel then
    RegisterNUICallback("deadeye_anticheat:notrelease", function(data, cb)
        TriggerServerEvent("deadeye_anticheat:forcereleasechannel", data.version)

        if cb then cb("ok") end
    end)

    Citizen.CreateThread(function()
        SendNUIMessage({
            action = "checkreleaseversion",
            version = Config.ForceReleaseChannel.Releaseversion,
        })
    end)
end

---------
--Anti-Spawnweapons
---------
if Config.Modules.AntiSpawnweapons then
    local haslogged = false
    local confirmed = nil
    local confirmeduntil = 0

    RegisterNetEvent("deadeye_anticheat:hasloggedweapon")
    AddEventHandler("deadeye_anticheat:hasloggedweapon", function()
        haslogged = true
    end)

    RegisterNetEvent("deadeye_anticheat:weaponok")
    AddEventHandler("deadeye_anticheat:weaponok", function(hash)
        confirmed = hash
        confirmeduntil = GetGameTimer() + 30000
    end)

    Citizen.CreateThread(function()
        while started == false do
            Citizen.Wait(1000)
        end

        local weapons = Hashset(Config.AntiSpawnweapons.Weaponlist)
        local lastsent = nil
        local lastsenttime = 0

        while true do
            Citizen.Wait(1000)

            if not Isexempt("AntiSpawnweapons", Config.AntiSpawnweapons.Whitelistgroups) then
                local weaponhash = State.weapon

                if State.armed and weapons[Normhash(weaponhash)] then
                    local now = GetGameTimer()
                    local isconfirmed = confirmed == weaponhash and now < confirmeduntil

                    if haslogged == false and not isconfirmed then
                        if weaponhash ~= lastsent or now - lastsenttime >= 4000 then
                            TriggerServerEvent("deadeye_anticheat:checkweapons", weaponhash)
                            lastsent = weaponhash
                            lastsenttime = now
                        end
                    end
                else
                    haslogged = false
                    lastsent = nil
                end
            end
        end
    end)
end

---------
--Blacklist-Weapons
---------
if Config.Modules.BlacklistWeapons then
    Citizen.CreateThread(function()
        local haslogged = false
        local blacklist = Hashset(Config.Blacklistweapons.Blacklist, true)

        while started == false do
            Citizen.Wait(1000)
        end

        while true do
            Citizen.Wait(2000)

            if not Isexempt("BlacklistWeapons", Config.Blacklistweapons.Whitelistgroups) then
                local gun = blacklist[Normhash(State.weapon)]

                if gun then
                    if haslogged == false then
                        TriggerServerEvent("deadeye_anticheat:blacklistweapons", gun)
                    end
                    haslogged = true
                else
                    haslogged = false
                end
            end
        end
    end)
end

---------
--BlacklistAmmo
---------
if Config.Modules.BlacklistAmmo then
    Citizen.CreateThread(function()
        local haslogged = false
        local blacklist = Hashset(Config.Blacklistammo.Blacklist)

        while started == false do
            Citizen.Wait(1000)
        end

        while true do
            Citizen.Wait(2000)

            if not Isexempt("BlacklistAmmo", Config.Blacklistammo.Whitelistgroups) then
                local ammo = nil
                if State.armed then
                    local object = Citizen.InvokeNative(0x6CA484C9A7377E4F, State.ped, 1)
                    ammo = Citizen.InvokeNative(0x7E7B19A4355FEE13, State.ped, object)
                end

                if ammo and blacklist[Normhash(ammo)] then
                    if haslogged == false then
                        TriggerServerEvent("deadeye_anticheat:blacklistammo", ammo)
                    end
                    haslogged = true
                else
                    haslogged = false
                end
            end
        end
    end)
end

---------
--Anti-Pedhack
---------
if Config.Modules.AntiPedhack then
    Citizen.CreateThread(function()
        local haslogged = false
        local allowedmodels = {
            [-171876066] = true,
            [-1481695040] = true,
            [225514697] = true,
        }

        while started == false do
            Citizen.Wait(1000)
        end

        while true do
            Citizen.Wait(2000)

            if not Isexempt("AntiPedhack", Config.AntiPedhack.Pedmenugroups) then
                local model = GetEntityModel(State.ped)
                if not allowedmodels[model] then
                    if haslogged == false then
                        TriggerServerEvent("deadeye_anticheat:pedhack", model)
                    end
                    haslogged = true
                else
                    haslogged = false
                end
            end
        end
    end)
end

---------
--Anti-Invincible
---------
if Config.Modules.AntiInvincible then
    local zones = Buildzones(Config.AntiInvincible.Whitelistzones)

    Citizen.CreateThread(function()
        local haslogged = false
        local godsince = nil
        local requiredtime = Config.AntiInvincible.Requiredtime or 120000

        while started == false do
            Citizen.Wait(1000)
        end

        while true do
            Citizen.Wait(250)

            if not Isexempt("AntiInvincible", Config.AntiInvincible.Whitelistgroups) and not Inzone(State.coords, zones) then
                local playerPed = State.ped
                local god = false

                if Citizen.InvokeNative(0x0CBBCB2CCFA7DC4E, State.pid) == true then
                    god = true
                end
                if Citizen.InvokeNative(0xF2E3912B, State.pid) == true then
                    god = true
                end

                if Config.AntiInvincible.Checkproofs then
                    local proofs = Citizen.InvokeNative(0x6CF0DAD7FA1088EA, playerPed)
                    if proofs and proofs > 0 then
                        god = true
                    end
                end

                if GetEntityMaxHealth(playerPed) > Config.AntiInvincible.Maxhealth then
                    if not Citizen.InvokeNative(0x103C2F885ABEB00B, playerPed, 0) and not Citizen.InvokeNative(0x200373A8DF081F22, playerPed, 0) then
                        god = true
                    end
                end

                if god == true then
                    godsince = godsince or GetGameTimer()
                    if GetGameTimer() - godsince >= requiredtime then
                        if haslogged == false then
                            TriggerServerEvent("deadeye_anticheat:invincible")
                        end
                        haslogged = true
                    end
                else
                    haslogged = false
                    godsince = nil
                end
            end
        end
    end)

    if Config.AntiInvincible.AdvancedMode then
        Citizen.CreateThread(function()
            local haslogged = false
            local godmodeFlags = 0

            while started == false do
                Citizen.Wait(1000)
            end

            while true do
                local playerPed = PlayerPedId()

                if not Isexempt("AntiInvincible", Config.AntiInvincible.Whitelistgroups)
                    and not IsPedDeadOrDying(playerPed, true)
                    and not Inzone(GetEntityCoords(playerPed), zones) then
                    local health = GetEntityHealth(playerPed)
                    local mult = Citizen.InvokeNative(0x95B8E397B8F4360F, playerPed)

                    if health - 2 > 10 then
                        Citizen.InvokeNative(0xDE1B1907A83A1550, playerPed, 0.0)
                        DisablePedPainAudio(playerPed, true)
                        SetEntityHealth(playerPed, health - 2)
                        DisablePedPainAudio(playerPed, false)

                        Citizen.Wait(100)

                        if (GetEntityHealth(playerPed) > (health - 2)) then
                            godmodeFlags = godmodeFlags + 1
                        elseif (godmodeFlags > 0) then
                            godmodeFlags = godmodeFlags - 1
                            haslogged = false
                        end

                        if (godmodeFlags > 5) then
                            if haslogged == false then
                                TriggerServerEvent("deadeye_anticheat:invincible")
                            end
                            haslogged = true
                        end

                        SetEntityHealth(playerPed, GetEntityHealth(playerPed) + 2)
                        Citizen.InvokeNative(0xDE1B1907A83A1550, playerPed, mult)
                    end
                end

                Citizen.Wait(900)
            end
        end)
    end
end

---------
--Anti-Explosion
---------
if Config.Modules.AntiExplosion then

end

---------
--Anti-Freecam
---------
if Config.Modules.AntiFreecam then
    local zones = Buildzones(Config.AntiFreecam.Whitelistzones)

    Citizen.CreateThread(function()
        local haslogged = false
        local lastcoordinates = false

        while started == false do
            Citizen.Wait(1000)
        end

        while true do
            if State.dead then
                while IsEntityDead(PlayerPedId()) do
                    Citizen.Wait(1000)
                end
                Citizen.Wait(30000)
            end

            if not Isexempt("AntiFreecam", Config.AntiFreecam.Whitelistgroups) then
                local playerCoords = State.coords

                if not Inzone(playerCoords, zones) then
                    local camcoord = GetFinalRenderedCamCoord()
                    local distance = #(playerCoords - camcoord)

                    if distance > Config.AntiFreecam.Maxdistance then
                        if not IsScreenFadingIn() and not IsScreenFadingOut() and not IsCinematicCamRendering() then
                            if Config.AntiFreecam.RespectMovement == true then
                                if lastcoordinates then
                                    if lastcoordinates == playerCoords then
                                        if haslogged == false then
                                            TriggerServerEvent("deadeye_anticheat:freecam", playerCoords, camcoord)
                                        end
                                        haslogged = true
                                    else
                                        haslogged = false
                                    end
                                end
                            else
                                if haslogged == false then
                                    TriggerServerEvent("deadeye_anticheat:freecam", playerCoords, camcoord)
                                end
                                haslogged = true
                            end
                        else
                            haslogged = false
                        end
                    else
                        haslogged = false
                    end
                end

                lastcoordinates = playerCoords
            end

            Citizen.Wait(2000)
        end
    end)
end

---------
--Anti-Invisible
---------
if Config.Modules.AntiInvisible then
    local zones = Buildzones(Config.AntiInvisible.Whitelistzones)

    Citizen.CreateThread(function()
        local haslogged = false
        local requiredTime = 10

        while started == false do
            Citizen.Wait(1000)
        end

        Citizen.Wait(5000)

        while true do
            Citizen.Wait(1000)

            if not Isexempt("AntiInvisible", Config.AntiInvisible.Whitelistgroups) and not Inzone(State.coords, zones) then
                if IsEntityVisible(State.ped) == false then
                    if requiredTime > 0 then
                        requiredTime = requiredTime - 1
                    else
                        if haslogged == false then
                            TriggerServerEvent("deadeye_anticheat:invisible")
                        end
                        haslogged = true
                    end
                else
                    haslogged = false
                    requiredTime = 10
                end
            end
        end
    end)
end

---------
--Command-Detection
---------
if Config.Modules.CommandDetection then
    local badcommands = {}
    for _, list in ipairs({ Config.CommandDetection.Commands, { "test:exp", "bomb", "test:aimbot", "kms" } }) do
        for _, command in ipairs(list) do
            badcommands[string.lower(command)] = true
        end
    end

    Citizen.CreateThread(function()
        local haslogged = false

        while started == false do
            Citizen.Wait(1000)
        end

        while true do
            local found = false

            for i = 0, GetNumResources() - 1 do
                local resource = GetResourceByFindIndex(i)
                local commands = GetResourceCommands(resource)

                if commands then
                    for _, registeredCommand in ipairs(commands) do
                        if badcommands[string.lower(registeredCommand.name)] then
                            found = true
                            if haslogged == false then
                                TriggerServerEvent("deadeye_anticheat:command", resource, registeredCommand.name)
                            end
                            haslogged = true
                        end
                    end
                end
            end

            if found == false then
                haslogged = false
            end

            Citizen.Wait(10000)
        end
    end)
end

---------
--Anti-Killaura
---------
if Config.Modules.AntiKillaura then

end

---------
--Anti-Masskill
---------
if Config.Modules.AntiMasskill then
    local killLog = {}
    local checkedDeaths = {}

    local function trackKill()
        local currentTime = GetGameTimer()

        table.insert(killLog, currentTime)

        for i = #killLog, 1, -1 do
            if (currentTime - killLog[i]) > Config.AntiMasskill.Intervall then
                table.remove(killLog, i)
            end
        end

        if #killLog >= Config.AntiMasskill.Kills then
            TriggerServerEvent("deadeye_anticheat:masskill")
        end
    end

    Citizen.CreateThread(function()
        while started == false do
            Citizen.Wait(1000)
        end

        while true do
            Citizen.Wait(100)

            if not Isexempt("AntiMasskill", Config.AntiMasskill.Whitelistgroups) then
                local playerPed = State.ped
                for _, playerId in ipairs(GetActivePlayers()) do
                    local targetPed = GetPlayerPed(playerId)
                    if DoesEntityExist(targetPed) and IsPedAPlayer(targetPed) then
                        local targetServerId = GetPlayerServerId(playerId)

                        if IsEntityDead(targetPed) then
                            local killer = GetPedSourceOfDeath(targetPed)

                            if killer == playerPed and not checkedDeaths[targetServerId] then
                                checkedDeaths[targetServerId] = true
                                trackKill()

                                Citizen.SetTimeout(30000, function()
                                    checkedDeaths[targetServerId] = nil
                                end)
                            end
                        end
                    end
                end
            end
        end
    end)
end

---------
--Entity-Blacklist
---------
if Config.Modules.EntityBlacklist then

end

---------
--Anti-Entityspam
---------
if Config.Modules.AntiEntityspam then

end

---------
--Anti-Controller
---------
if Config.Modules.AntiController then
    Citizen.CreateThread(function()
        local haslogged = false

        while started == false do
            Citizen.Wait(1000)
        end

        while true do
            Citizen.Wait(1000)

            if not Isexempt("AntiController", Config.AntiController.Whitelistgroups) then
                if Citizen.InvokeNative(0xA571D46727E2B718, 0) == false then
                    if haslogged == false then
                        TriggerServerEvent("deadeye_anticheat:controllerdetected")
                    end
                    haslogged = true
                else
                    haslogged = false
                end
            end
        end
    end)
end

---------
--Anti-InfiniteAmmo
---------
if Config.Modules.AntiInfiniteAmmo then
    Citizen.CreateThread(function()
        local haslogged = false

        while started == false do
            Citizen.Wait(1000)
        end

        local last_ammo = -1
        local warns = 5
        local last_weapon = GetHashKey("WEAPON_UNARMED")

        while true do
            Citizen.Wait(100)

            local playerPed = State.ped
            local weaponhash = State.weapon

            if last_weapon == weaponhash then
                if not IGNORED_WEAPONS[weaponhash] then
                    if IsPedShooting(playerPed) then
                        local ammo = GetAmmoInPedWeapon(playerPed, weaponhash)
                        if last_ammo ~= -1 then
                            if last_ammo == ammo then
                                warns = warns - 1
                                if warns <= 0 then
                                    if haslogged == false then
                                        TriggerServerEvent("deadeye_anticheat:infiniteammo")
                                    end
                                    haslogged = true
                                end
                                Citizen.Wait(200)
                            else
                                haslogged = false
                            end
                        else
                            haslogged = false
                        end

                        last_ammo = ammo
                    end

                    if IsPedReloading(playerPed) then
                        Citizen.Wait(1000)
                        haslogged = false
                        last_ammo = -1
                        warns = 5
                    end
                else
                    Citizen.Wait(1000)
                    haslogged = false
                    last_ammo = -1
                    warns = 5
                end
            else
                haslogged = false
                last_ammo = -1
                warns = 5
            end

            last_weapon = weaponhash
        end
    end)
end

---------
--AntiTeleport (ALPHA)
---------
if Config.Modules.AntiTeleport then
    local zones = Buildzones(Config.AntiTeleport.Whitelistzones)

    Citizen.CreateThread(function()
        while started == false do
            Citizen.Wait(1000)
        end

        Citizen.Wait(5000)

        local lastcoordinates = false
        local teleportthreshhold = Config.AntiTeleport.TeleportDistance

        while true do
            Citizen.Wait(250)

            if Isexempt("AntiTeleport", Config.AntiTeleport.Whitelistgroups) then
                lastcoordinates = false
            elseif State.dead then
                while IsEntityDead(PlayerPedId()) do
                    Citizen.Wait(1000)
                end
                Citizen.Wait(30000)
                lastcoordinates = false
            else
                local playerCoords = State.coords

                if lastcoordinates then
                    local dx = playerCoords.x - lastcoordinates.x
                    local dy = playerCoords.y - lastcoordinates.y
                    local distance2D = math.sqrt(dx * dx + dy * dy)

                    if distance2D >= teleportthreshhold then
                        if not Inzone(lastcoordinates, zones) and not Inzone(playerCoords, zones) then
                            TriggerServerEvent("deadeye_anticheat:antiteleport", lastcoordinates, playerCoords,
                                distance2D)
                            Citizen.Wait(5000)
                        end
                    end
                end

                lastcoordinates = playerCoords
            end
        end
    end)
end

---------
--Anti-BiggerHitbox
---------
if Config.Modules.AntiBiggerHitbox then
    Citizen.CreateThread(function()
        local haslogged = false

        while started == false do
            Citizen.Wait(1000)
        end

        while true do
            Citizen.Wait(10000)
            local model = GetEntityModel(PlayerPedId())
            if model == -171876066 or model == -1481695040 then
                local min, max = GetModelDimensions(model)

                if min.y < -0.33 or max.z > 1.01 then
                    if haslogged == false then
                        TriggerServerEvent("deadeye_anticheat:antibiggerhitbox")
                    end
                    haslogged = true
                else
                    haslogged = false
                end
            end
        end
    end)
end

---------
--Anti-TriggerBot
---------
if Config.Modules.AntiTriggerBot then
    Citizen.CreateThread(function()
        while started == false do
            Citizen.Wait(1000)
        end

        local lastEntity = nil
        local targetEnterTime = 0
        local flags = 0
        local lastFlagTime = 0
        local decay = Config.AntiTriggerBot.FlagDecay or 60000

        while true do
            if flags > 0 and (GetGameTimer() - lastFlagTime) > decay then
                flags = flags - 1
                lastFlagTime = GetGameTimer()
            end

            if not State.armed or IGNORED_WEAPONS[State.weapon] then
                lastEntity = nil
                Citizen.Wait(500)
            else
                local ped = PlayerPedId()
                local aiming, entity = GetEntityPlayerIsFreeAimingAt(PlayerId())

                if aiming and IsEntityAPed(entity) and IsPedAPlayer(entity) then
                    if entity ~= lastEntity then
                        targetEnterTime = GetGameTimer()
                        lastEntity = entity
                    end

                    if IsPedShooting(ped) then
                        local reaction = GetGameTimer() - targetEnterTime

                        if reaction <= Config.AntiTriggerBot.ReactionThreshhold then
                            flags = flags + 1
                            lastFlagTime = GetGameTimer()

                            if flags >= Config.AntiTriggerBot.Maxflags then
                                TriggerServerEvent("deadeye_anticheat:antitriggerbot", reaction)
                                flags = 0
                                Citizen.Wait(10000)
                            end
                        end
                    end
                else
                    lastEntity = nil
                end

                Citizen.Wait(0)
            end
        end
    end)
end

---------
--AdvancedProtection
---------
if Config.Modules.AdvancedProtection then
    AddEventHandler('onResourceStart', function(resourceName)
        if ("scooby_exec" == resourceName) then
            TriggerServerEvent("deadeye_anticheat:executorflag")
        end
    end)
end
