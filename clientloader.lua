-- deadeye_anticheat: built-in clientloader
--
-- The anticheat's client Lua is delivered to each player at runtime instead of
-- being shipped as a normal client_script, so it never lands in the client file
-- cache / download manifest and cannot be dumped from the client side. The
-- loading itself is intentionally non-configurable (always on, fixed file list).
-- Only the response to a forged/repeated payload request is configurable, via
-- the Clientloader module (Config.Punishments.Clientloader, Config.Clientloader
-- and SConfig.Clientloader), handled through the shared Punish() pipeline just
-- like every other module.

local resource = GetCurrentResourceName()

-- Client files served through the clientloader. Hardcoded on purpose.
local ProtectedFiles = {
    "client.lua",
}

local b = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

local function enc(data)
    return ((data:gsub(".", function(x)
        local r, b = "", x:byte()
        for i = 8, 1, -1 do r = r .. (b % 2 ^ i - b % 2 ^ (i - 1) > 0 and "1" or "0") end
        return r;
    end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(x)
        if (#x < 6) then return "" end
        local c = 0
        for i = 1, 6 do c = c + (x:sub(i, i) == "1" and 2 ^ (6 - i) or 0) end
        return b:sub(c + 1, c + 1)
    end) .. ({ "", "==", "=" })[#data % 3 + 1])
end

local function dec(data)
    data = string.gsub(data, "[^" .. b .. "=]", "")
    return (data:gsub(".", function(x)
        if (x == "=") then return "" end
        local r, f = "", (b:find(x) - 1)
        for i = 6, 1, -1 do r = r .. (f % 2 ^ i - f % 2 ^ (i - 1) > 0 and "1" or "0") end
        return r;
    end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(x)
        if (#x ~= 8) then return "" end
        local c = 0
        for i = 1, 8 do c = c + (x:sub(i, i) == "1" and 2 ^ (8 - i) or 0) end
        return string.char(c)
    end))
end

-- Obfuscated, dedicated event names (do not collide with deadeye_anticheat:*).
-- Both sides derive the same strings from the resource name.
local RequestEvent = enc("clientloader_req_" .. resource)
local ResponseEvent = enc("clientloader_res_" .. resource)

if IsDuplicityVersion() then
    ----------------------------------------------------------------------------
    -- SERVER: read the protected files once, hand them out on request.
    ----------------------------------------------------------------------------
    local payload = {}

    for _, file in ipairs(ProtectedFiles) do
        local code = LoadResourceFile(resource, file)

        if code then
            payload[#payload + 1] = { file = file, code = enc(code) }
        else
            print(string.format("[deadeye_anticheat] clientloader: could not read '%s'.", file))
        end
    end

    local delivered = {}

    RegisterNetEvent(RequestEvent, function()
        local src = source

        if not delivered[src] then
            delivered[src] = true

            TriggerClientEvent(ResponseEvent, src, payload)
        else
            -- Devmode restarts re-trigger the request legitimately; never
            -- self-punish while developing.
            if Config and Config.Devmode then
                TriggerClientEvent(ResponseEvent, src, payload)
                return
            end

            -- An already-served client asking again is treated as a dump/replay
            -- attempt and runs through the normal punishment pipeline.
            if Punish then
                Punish(src, "Clientloader")
            else
                DropPlayer(src, "[deadeye_anticheat] Code: AC28")
            end
        end
    end)

    AddEventHandler("playerDropped", function()
        delivered[source] = nil
    end)
else
    ----------------------------------------------------------------------------
    -- CLIENT: request the files once the session is up, then run them.
    ----------------------------------------------------------------------------
    Citizen.CreateThread(function()
        while not NetworkIsSessionStarted() do
            Citizen.Wait(0)
        end

        Citizen.Wait(0)

        TriggerServerEvent(RequestEvent)
    end)

    RegisterNetEvent(ResponseEvent, function(payload)
        local loaded, failed = 0, 0

        for _, entry in ipairs(payload) do
            local chunk, loaderr = load(dec(entry.code), "@" .. entry.file)

            if chunk then
                local ok, runerr = pcall(chunk)

                if ok then
                    loaded = loaded + 1
                else
                    failed = failed + 1
                    print(string.format("[deadeye_anticheat] clientloader: error running '%s': %s", entry.file,
                        tostring(runerr)))
                end
            else
                failed = failed + 1
                print(string.format("[deadeye_anticheat] clientloader: error loading '%s': %s", entry.file,
                    tostring(loaderr)))
            end
        end

        if loaded > 0 and not (Config and Config.Stealthmode and Config.Stealthmode.Enabled) then
            print(string.format("[deadeye_anticheat] clientloader: loaded %d/%d client file(s).", loaded, loaded + failed))
        end
    end)
end
