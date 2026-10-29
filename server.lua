DeferralCards = {
    Card = {},
    CardElement = {},
    Container = {},
    Action = {},
    Input = {}
}

exports('DeferralCards', function()
    return DeferralCards
end)

--------------------------------------------------[[ Cards ]]--------------------------------------------------

function DeferralCards.Card.Create(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'AdaptiveCard'
    pOptions.version = pOptions.version or '1.4'
    pOptions.body = pOptions.body or {}
    pOptions['$schema'] = 'http://adaptivecards.io/schemas/adaptive-card.json'
    return json.encode(pOptions)
end

--[[
    DeferralCards.Card:Create({
        body = {
            DeferralCards.CardElement:Image({
                url = '',
                size = 'small',
                horizontalAlignment = 'center'
            }),
            DeferralCards.CardElement:TextBlock({
                text = 'Text',
                weight = 'Light',
                horizontalAlignment = 'center'
            }),
        }
    })
]]

--------------------------------------------------[[ Card Elements ]]--------------------------------------------------

function DeferralCards.CardElement.TextBlock(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'TextBlock'
    pOptions.text = pOptions.text or 'Text'
    return pOptions
end

--[[
    DeferralCards.CardElement:TextBlock({
        size = 'small',
        weight = 'Light',
        text = 'Some text',
        wrap = true
    })
]]

function DeferralCards.CardElement.Image(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Image'
    pOptions.url = pOptions.url or 'https://via.placeholder.com/100x100?text=Temp+Image'
    return pOptions
end

--[[
    DeferralCards.CardElement:Image({
        url = 'https://via.placeholder.com/100x100?text=Temp+Image'
    })
]]

function DeferralCards.CardElement.Media(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Media'
    pOptions.sources = pOptions.sources or {}
    return pOptions
end

--[[
    DeferralCards.CardElement:Media({
        poster = 'https://adaptivecards.io/content/poster-video.png',
        sources = {}
    })
]]

function DeferralCards.CardElement.MediaSource(self, pOptions)
    if not pOptions then return end
    pOptions.mimeType = pOptions.mimeType or 'video/mp4'
    pOptions.url = pOptions.url or ''
    return pOptions
end

--[[
    DeferralCards.CardElement:MediaSource({
        mimeType = 'video/mp4',
        url = ''
    })
]]

function DeferralCards.CardElement.RichTextBlockItem(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'TextRun'
    pOptions.text = pOptions.text or 'Text'
    return pOptions
end

--[[
    DeferralCards.CardElement:RichTextBlockItem({
        text = 'Item 1',
        size = 'small',
        color = 'good',
        isSubtle = true,
        weight = 'small',
        highlight = true,
        italic = false,
        strikethrough = false,
        fontType = 'monospace'
    })
]]

function DeferralCards.CardElement.RichTextBlock(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'RichTextBlock'
    pOptions.inline = pOptions.inline or {}
    return pOptions
end

--[[
    DeferralCards.CardElement:RichTextBlock({
        horizontalAlignment = 'center',
        inline = {
            DeferralCards.CardElement:RichTextBlockItem({
                text = 'Item 1',
                size = 'small',
                color = 'good',
                isSubtle = true,
                weight = 'small',
                highlight = true
            }),
            DeferralCards.CardElement:RichTextBlockItem({
                text = 'Item 2',
                size = 'medium',
                color = 'good',
                isSubtle = false,
                weight = 'large',
                highlight = false
            })
        }
    })
]]

function DeferralCards.CardElement.TextRun(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'TextRun'
    pOptions.text = pOptions.text or 'Text'
    return pOptions
end

--[[
    DeferralCards.CardElement:TextRun({
        text = 'Text',
        color = 'good',
        fontType = 'monospace',
        highlight = false,
        isSubtle = false,
        italic = false,
        size = 'small',
        strikethrough = false,
        underline = false,
        weight = 'medium'
    })
]]

--------------------------------------------------[[ Containers ]]--------------------------------------------------

function DeferralCards.Container.Create(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Container'
    pOptions.items = pOptions.items or {}
    return pOptions
end

--[[
    DeferralCards.Container:Create({
        items = {}
    })
]]

function DeferralCards.Container.ActionSet(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'ActionSet'
    pOptions.actions = pOptions.actions or {}
    return pOptions
end

--[[
    DeferralCards.Container:ActionSet({
        actions = {},
    })
]]

function DeferralCards.Container.ColumnSet(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'ColumnSet'
    pOptions.columns = pOptions.columns or {}
    return pOptions
end

--[[
    DeferralCards.Container:ColumnSet({
        columns = {}
    })
]]

function DeferralCards.Container.Column(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Column'
    pOptions.items = pOptions.items or {}
    return pOptions
end

--[[
    DeferralCards.Container:Column({
        items = {},
        width = 'auto'
    })
]]

function DeferralCards.Container.Fact(self, pOptions)
    if not pOptions then return end
    pOptions.title = pOptions.title or 'Title'
    pOptions.value = pOptions.value or 'Value'
    return pOptions
end

--[[
    DeferralCards.Container:Fact({
        title = 'Title',
        value = 'Value'
    })
]]

function DeferralCards.Container.FactSet(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'FactSet'
    pOptions.facts = pOptions.facts or {}
    return pOptions
end

--[[
    DeferralCards.Container:FactSet({
        facts = {
            DeferralCards.Container:Fact({
                title = 'Title 1',
                value = 'Value 1'
            }),
            DeferralCards.Container:Fact({
                title = 'Title 2',
                value = 'Value 2'
            })
        }
    })
]]

function DeferralCards.Container.ImageSetItem(self, pOptions)
    if not pOptions then return end
    pOptions.type = pOptions.type or 'Image'
    pOptions.url = pOptions.url or 'https://adaptivecards.io/content/cats/1.png'
    return pOptions
end

--[[
    DeferralCards.Container:ImageSetItem({
        type = 'Image',
        url = 'https://adaptivecards.io/content/cats/1.png'
    })
]]

function DeferralCards.Container.ImageSet(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'ImageSet'
    pOptions.images = pOptions.images or {}
    return pOptions
end

--[[
    DeferralCards.Container:ImageSet({
        images = {
            DeferralCards.Container:ImageSetItem({
                type = 'Image',
                url = 'https://adaptivecards.io/content/cats/1.png'
            }),
            DeferralCards.Container:ImageSetItem({
                type = 'Image',
                url = 'https://adaptivecards.io/content/cats/2.png'
            })
        }
    })
]]

--------------------------------------------------[[ Actions ]]--------------------------------------------------

function DeferralCards.Action.OpenUrl(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.OpenUrl'
    pOptions.url = pOptions.url or 'https://www.google.co.uk/'
    return pOptions
end

--[[
    DeferralCards.Action:OpenUrl({
        title = 'Title',
        url = 'https://www.google.co.uk/'
    })
]]

function DeferralCards.Action.Submit(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.Submit'
    return pOptions
end

--[[
    DeferralCards.Action:Submit({
        title = 'Title',
        data = {
            x = 10
        }
    })
]]

function DeferralCards.Action.ShowCard(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.ShowCard'
    return pOptions
end

--[[
    DeferralCards.Action:ShowCard({
        title = 'Title',
        card = {}
    })
]]

function DeferralCards.Action.TargetElement(self, pOptions)
    if not pOptions then return end
    pOptions.elementId = pOptions.elementId or 'target_element'
    return pOptions
end

--[[
    DeferralCards.Action:TargetElement({
        elementId = 'element_1',
        isVisible = true
    })
]]

function DeferralCards.Action.ToggleVisibility(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.ToggleVisibility'
    pOptions.targetElements = pOptions.targetElements or {}
    return pOptions
end

--[[
    DeferralCards.Action:ToggleVisibility({
        title = 'Title',
        targetElements = {
            Deferralcards.Action:TargetElement({
                elementId = 'element_1',
                isVisible = true
            }),
            Deferralcards.Action:TargetElement({
                elementId = 'element_2',
                isVisible = true
            })
        }
    })
]]

function DeferralCards.Action.Execute(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Action.Execute'
    return pOptions
end

--[[
    DeferralCards.Action:Execute({
        title = 'Title',
        verb = 'Verb',
        data = {
            x = 10
        }
    })
]]

--------------------------------------------------[[ Inputs ]]--------------------------------------------------

function DeferralCards.Input.Text(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Text'
    pOptions.id = pOptions.id or 'input_text'
    return pOptions
end

--[[
    DeferralCards.Input:Text({
        id = 'input_text',
        text = 'Text',
        title = 'Title',
        placeholder = 'Placeholder'
    })
]]

function DeferralCards.Input.Number(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Number'
    pOptions.id = pOptions.id or 'input_number'
    return pOptions
end

--[[
    DeferralCards.Input:Number({
        id = 'input_number',
        placeholder = 'Placeholder',
        min = 1,
        max = 10,
        value = 5
    })
]]

function DeferralCards.Input.Date(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Date'
    pOptions.id = pOptions.id or 'input_date'
    return pOptions
end

--[[
    DeferralCards.Input:Date({
        id = 'input_date',
        placeholder = 'Placeholder',
        value = '2021-08-13'
    })
]]

function DeferralCards.Input.Time(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Time'
    pOptions.id = pOptions.id or 'input_time'
    return pOptions
end

--[[
    DeferralCards.Input:Time({
        id = 'input_time',
        placeholder = 'Placeholder',
        min = '00:00',
        max = '23:59',
        value = '19:00'
    })
]]

function DeferralCards.Input.Toggle(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.Toggle'
    pOptions.title = pOptions.title or 'Title'
    pOptions.id = pOptions.id or 'input_toggle'
    return pOptions
end

--[[
    DeferralCards.Input:Toggle({
        id = 'input_toggle',
        title = 'Title',
        value = 'true',
        valueOn = 'true',
        valueOff = 'false'
    })
]]

function DeferralCards.Input.Choice(self, pOptions)
    if not pOptions then return end
    pOptions.title = pOptions.title or 'Title'
    pOptions.value = pOptions.value or 'Value'
    return pOptions
end

--[[
    DeferralCards.Input:Choice({
        title = 'Title',
        value = 'Value'
    })
]]

function DeferralCards.Input.ChoiceSet(self, pOptions)
    if not pOptions then return end
    pOptions.type = 'Input.ChoiceSet'
    pOptions.choices = pOptions.choices or {}
    pOptions.id = pOptions.id or 'choice_set'
    return pOptions
end

--[[
    DeferralCards.Input:ChoiceSet({
        placeholder = 'Text',
        choices = {
            DeferralCards.Input:Choice({
                title = 'Title 1',
                value = 'Value 1'
            }),
            DeferralCards.Input:Choice({
                title = 'Title 2',
                value = 'Value 2'
            })
        }
    })
]]

local Banner = [[^6---------------------------------------------------------------------------------

  ██████╗ ███████╗ █████╗ ██████╗ ███████╗██╗   ██╗███████╗
  ██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝╚██╗ ██╔╝██╔════╝
  ██║  ██║█████╗  ███████║██║  ██║█████╗   ╚████╔╝ █████╗
  ██║  ██║██╔══╝  ██╔══██║██║  ██║██╔══╝    ╚██╔╝  ██╔══╝
  ██████╔╝███████╗██║  ██║██████╔╝███████╗   ██║   ███████╗
  ╚═════╝ ╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝   ╚═╝   ╚══════╝

        █████╗ ███╗   ██╗████████╗██╗ ██████╗██╗  ██╗███████╗ █████╗ ████████╗
       ██╔══██╗████╗  ██║╚══██╔══╝██║██╔════╝██║  ██║██╔════╝██╔══██╗╚══██╔══╝
       ███████║██╔██╗ ██║   ██║   ██║██║     ███████║█████╗  ███████║   ██║
       ██╔══██║██║╚██╗██║   ██║   ██║██║     ██╔══██║██╔══╝  ██╔══██║   ██║
       ██║  ██║██║ ╚████║   ██║   ██║╚██████╗██║  ██║███████╗██║  ██║   ██║
       ╚═╝  ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝   ╚═╝

--------------- Deadeye Anticheat | https://github.com/PharellJay ---------------^7]]

print("Activating Deadeye Anticheat")
print("Deadeye Anticheat has been successfully activated!")
print(Banner)

local Core

Citizen.CreateThread(function()
    while GetResourceState("vorp_core") ~= "started" do
        Citizen.Wait(500)
    end

    Core = exports.vorp_core:GetCore()
end)

function GetGroup(src)
    src = tonumber(src)
    if not src or src <= 0 or not Core then return nil end

    local user = Core.getUser(src)
    if not user then return nil end

    local character = user.getUsedCharacter
    if not character then return nil end

    return character.group
end

function IsGroupAllowed(src, groups)
    if not groups then return false end

    local group = GetGroup(src)
    return group ~= nil and groups[group] == true
end

function Normhash(hash)
    hash = math.tointeger(hash)
    return hash and hash & 0xFFFFFFFF
end

function Buildzones(zones)
    local built = {}
    for i, zone in ipairs(zones or {}) do
        built[i] = { coords = vector3(zone.x, zone.y, zone.z), r = zone.r }
    end
    return built
end

function Inzone(coords, zones)
    for _, zone in ipairs(zones) do
        if #(coords - zone.coords) < zone.r then
            return true
        end
    end
    return false
end

function GetIdentifiers(src)
    local ids = {
        license = GetPlayerIdentifierByType(src, "license") or "",
        steam = GetPlayerIdentifierByType(src, "steam") or "",
        discord = "",
        ip = GetPlayerEndpoint(src) or "",
        tokens = {},
    }

    local did = GetPlayerIdentifierByType(src, "discord")
    if did then
        ids.discord = string.sub(did, 9)
    end

    for i = 0, GetNumPlayerTokens(src) - 1 do
        local token = GetPlayerToken(src, i)
        if token then
            ids.tokens[#ids.tokens + 1] = token
        end
    end

    return ids
end

function FindBan(ids, cb)
    local where, params, sql = {}, {}, {}

    for _, column in ipairs({ "license", "steam", "discord", "ip" }) do
        if ids[column] and ids[column] ~= "" then
            where[#where + 1] = column .. " = ?"
            params[#params + 1] = ids[column]
        end
    end

    if #where > 0 then
        sql[#sql + 1] = "SELECT id, banreason FROM deadeye_anticheat WHERE " .. table.concat(where, " OR ")
    end

    if #ids.tokens > 0 then
        sql[#sql + 1] =
            "SELECT b.id, b.banreason FROM deadeye_anticheat_tokens t JOIN deadeye_anticheat b ON b.id = t.ban_id WHERE t.token IN (" ..
            string.rep("?", #ids.tokens, ", ") .. ")"
        for _, token in ipairs(ids.tokens) do
            params[#params + 1] = token
        end
    end

    if #sql == 0 then
        cb(nil)
        return
    end

    exports.oxmysql:query(table.concat(sql, " UNION ") .. " LIMIT 1", params, function(result)
        cb(result and result[1] or nil)
    end)
end

function Banmessage(ban)
    return "You are permanently banned from this server | Ban Reason: " ..
        tostring(ban.banreason) .. " | Ban-ID: " .. tostring(ban.id)
end

function Banplayer(target, reason)
    local playerId = tonumber(target)
    if not playerId or not GetPlayerName(playerId) then return end

    local ids = GetIdentifiers(playerId)
    local playername = GetPlayerName(playerId)

    reason = tostring(reason or "N/A")

    exports.oxmysql:insert(
        'INSERT INTO deadeye_anticheat (license, steam, discord, ip, tokens, banreason) VALUES (?, ?, ?, ?, ?, ?)',
        { ids.license, ids.steam, ids.discord, ids.ip, json.encode(ids.tokens), reason },
        function(insertId)
            if insertId then
                if #ids.tokens > 0 then
                    local values, params = {}, {}
                    for _, token in ipairs(ids.tokens) do
                        values[#values + 1] = "(?, ?)"
                        params[#params + 1] = insertId
                        params[#params + 1] = token
                    end

                    exports.oxmysql:insert(
                        'INSERT INTO deadeye_anticheat_tokens (ban_id, token) VALUES ' .. table.concat(values, ", "),
                        params)
                end

                print("The player " .. playername .. " (" .. ids.steam .. ") was successfully banned")
                Logtodiscord(SConfig.BanUnban.Webhooklink,
                    SConfig.BanUnban.Ban .. " | Reason: " .. reason .. "\nBan-ID: " .. insertId,
                    playername, ids.steam, ids.discord)
            else
                print("^1[deadeye_anticheat]^7 Failed to store ban for " .. playername)
            end
        end
    )
end

Citizen.CreateThread(function()
    while GetResourceState("oxmysql") ~= "started" do
        Citizen.Wait(500)
    end

    exports.oxmysql:scalar('SELECT COUNT(*) FROM deadeye_anticheat_tokens', {}, function(count)
        if tonumber(count) and tonumber(count) > 0 then return end

        exports.oxmysql:query('SELECT id, tokens FROM deadeye_anticheat WHERE tokens IS NOT NULL', {}, function(rows)
            for _, row in ipairs(rows or {}) do
                local ok, tokens = pcall(json.decode, row.tokens)
                if ok and type(tokens) == "table" then
                    for _, token in ipairs(tokens) do
                        exports.oxmysql:insert('INSERT INTO deadeye_anticheat_tokens (ban_id, token) VALUES (?, ?)',
                            { row.id, tostring(token) })
                    end
                end
            end
        end)
    end)
end)

local Heartbeat = {}
local HEARTBEAT_TIMEOUT = 60
local JOIN_GRACE = 120

local function Sendheartbeattoken(src, entry)
    entry.token = tostring(math.random(100000000, 999999999)) .. tostring(os.time())
    TriggerClientEvent("deadeye_anticheat:heartbeattoken", src, entry.token)
end

AddEventHandler("playerJoining", function()
    Heartbeat[source] = { last = os.time() + JOIN_GRACE, token = nil, misses = 0 }
end)

RegisterNetEvent("deadeye_anticheat:heartbeat")
AddEventHandler("deadeye_anticheat:heartbeat", function(token)
    local src = source
    local entry = Heartbeat[src]

    if not entry then
        entry = { last = os.time(), token = nil, misses = 0 }
        Heartbeat[src] = entry
    end

    if entry.token and token ~= entry.token then
        entry.misses = entry.misses + 1
        if entry.misses >= 3 then
            DropPlayer(src, "[deadeye_anticheat] Heartbeat Mismatch")
            Heartbeat[src] = nil
            return
        end
    else
        entry.misses = 0
        entry.last = os.time()
    end

    Sendheartbeattoken(src, entry)
end)

AddEventHandler("playerDropped", function()
    Heartbeat[source] = nil
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)

        local now = os.time()

        for playerId, entry in pairs(Heartbeat) do
            if (now - entry.last) > HEARTBEAT_TIMEOUT then
                DropPlayer(playerId, "[deadeye_anticheat] Heartbeat Timeout")
                Heartbeat[playerId] = nil
            end
        end
    end
end)

local function Iscommandpermitted(src, groups)
    return src == 0 or IsGroupAllowed(src, groups)
end

RegisterCommand(Config.Unban.command, function(source, args)
    local src = source
    local banid = args[1]

    local ispermitted = Iscommandpermitted(src, Config.Unban.admingroups)

    if not ispermitted then
        return
    end

    if not banid then
        print("No Ban-ID specified!")
        return
    end

    exports.oxmysql:execute(
        'SELECT id FROM deadeye_anticheat WHERE id = ?',
        { banid },
        function(result)
            if not result or #result == 0 then
                print("Player with Ban-ID " .. banid .. " is not banned!")
                return
            end

            -- Ban existiert -> löschen
            exports.oxmysql:execute(
                'DELETE FROM deadeye_anticheat WHERE id = ?',
                { banid },
                function()
                    Logtodiscord(
                        SConfig.BanUnban.Webhooklink,
                        SConfig.BanUnban.Unban .. "\nBan-ID: " .. banid,
                        "/",
                        "/",
                        "/"
                    )

                    print("Player with Ban-ID " .. banid .. " successfully unbanned!")
                end
            )
        end
    )
end, false)

RegisterCommand(Config.ClearPeds.command, function(source, args)
    local src = source
    local delay = tonumber(args[1]) or 0

    local ispermitted = Iscommandpermitted(src, Config.ClearPeds.admingroups)

    if ispermitted then
        print("All Peds are going to be deleted in " .. delay .. " Seconds!")

        SetTimeout(delay * 1000, function()
            local count = 0

            for _, ped in ipairs(GetAllPeds()) do
                if DoesEntityExist(ped) and not IsPedAPlayer(ped) then
                    DeleteEntity(ped)
                    count = count + 1
                end
            end

            print("Successfully deleted " .. count .. " Peds!")
        end)
    end
end, false)

RegisterCommand(Config.ClearVehicles.command, function(source, args)
    local src = source
    local delay = tonumber(args[1]) or 0

    local ispermitted = Iscommandpermitted(src, Config.ClearVehicles.admingroups)

    if ispermitted then
        print("All Vehicles are going to be deleted in " .. delay .. " Seconds!")

        SetTimeout(delay * 1000, function()
            local count = 0

            for _, vehicle in ipairs(GetAllVehicles()) do
                if DoesEntityExist(vehicle) then
                    DeleteEntity(vehicle)
                    count = count + 1
                end
            end

            print("Successfully deleted " .. count .. " Vehicles!")
        end)
    end
end, false)

local whitelistedplayers = {}

function Whitelistbyid(target, seconds)
    target = tonumber(target)
    if not target then return end
    table.insert(whitelistedplayers, { src = target, time = tonumber(seconds) or 0 })
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)

        for i = #whitelistedplayers, 1, -1 do
            local player = whitelistedplayers[i]
            if player.time > 0 then
                player.time = player.time - 1
            else
                table.remove(whitelistedplayers, i)
            end
        end
    end
end)

function Isplayerwhitelisted(target)
    target = tonumber(target)
    for _, player in ipairs(whitelistedplayers) do
        if player.src == target then
            return true
        end
    end

    return false
end

Queue = {
    list = {},
    connecting = {},
    seq = 0,
    lastRelease = 0,
}

local function Safecall(fn, ...)
    local ok, err = pcall(fn, ...)
    if not ok then
        print("^1[deadeye_anticheat] Queue error: " .. tostring(err) .. "^0")
    end
end

local function Formattime(seconds)
    return ("%02d:%02d"):format(math.floor(seconds / 60), seconds % 60)
end

function Queue.GetMaxPlayers()
    return Config.Priorityqueue.Maxplayers or GetConvarInt('sv_maxclients', 32)
end

local Rolecache = {}
local ROLE_CACHE_TIME = 600

function Getmemberroles(guildid, bottoken, discordId, cb)
    local key = guildid .. ":" .. discordId
    local cached = Rolecache[key]
    if cached and cached.expires > os.time() then
        cb(cached.status, cached.roles)
        return true
    end

    PerformHttpRequest("https://discord.com/api/v10/guilds/" .. guildid .. "/members/" .. discordId,
        function(status, response)
            local roles = nil
            if status == 200 then
                local memberData = json.decode(response or "")
                roles = memberData and memberData.roles or nil
            end

            if status == 200 or status == 404 then
                Rolecache[key] = { status = status, roles = roles, expires = os.time() + ROLE_CACHE_TIME }
            end

            cb(status, roles)
        end, 'GET', '', { ["Authorization"] = "Bot " .. bottoken })

    return false
end

function Prunerolecache()
    local now = os.time()
    for key, cached in pairs(Rolecache) do
        if cached.expires <= now then
            Rolecache[key] = nil
        end
    end
end

function Queue.GetPriority(discordId, cb)
    local base = Config.Priorityqueue

    if not discordId or discordId == "" or discordId == "No discord found"
        or SConfig.Priorityqueue.Guildid == "" or SConfig.Priorityqueue.DiscordBottoken == "" then
        cb(base.basepower, base.name)
        return
    end

    Getmemberroles(SConfig.Priorityqueue.Guildid, SConfig.Priorityqueue.DiscordBottoken, discordId,
        function(status, roles)
            local power, prioname = base.basepower, base.name

            if status == 200 and roles then
                for _, role in ipairs(roles) do
                    for _, prio in ipairs(base.Priorities) do
                        if prio.roleid ~= "" and role == prio.roleid and prio.power > power then
                            power = prio.power
                            prioname = prio.name
                        end
                    end
                end
            end

            cb(power, prioname)
        end)
end

function Queue.Find(ident)
    for i, entry in ipairs(Queue.list) do
        if entry.ident == ident then
            return i, entry
        end
    end
end

function Queue.Insert(entry)
    local pos = #Queue.list + 1
    for i, other in ipairs(Queue.list) do
        if entry.power > other.power or (entry.power == other.power and entry.seq < other.seq) then
            pos = i
            break
        end
    end
    table.insert(Queue.list, pos, entry)
end

function Queue.Add(src, ident, name, discordId, deferrals)
    deferrals.update('🔍 Checking queue priority...')

    Queue.GetPriority(discordId, function(power, prioname)
        local index, existing = Queue.Find(ident)

        if existing then
            if existing.src ~= src and not existing.disconnectedAt then
                Safecall(existing.deferrals.done, "You connected again from another client.")
            end
            existing.src = src
            existing.name = name
            existing.deferrals = deferrals
            existing.disconnectedAt = nil

            if existing.power ~= power then
                table.remove(Queue.list, index)
                existing.power = power
                existing.prioname = prioname
                Queue.Insert(existing)
            end
            return
        end

        Queue.seq = Queue.seq + 1
        Queue.Insert({
            src = src,
            ident = ident,
            name = name,
            power = power,
            prioname = prioname,
            seq = Queue.seq,
            joinedAt = os.time(),
            deferrals = deferrals,
            disconnectedAt = nil,
        })
    end)
end

function Queue.CountConnecting()
    local count = 0
    for _ in pairs(Queue.connecting) do
        count = count + 1
    end
    return count
end

function Queue.FreeSlots(power)
    local free = Queue.GetMaxPlayers() - #GetPlayers() - Queue.CountConnecting()
    if power < Config.Priorityqueue.Reservedpower then
        free = free - Config.Priorityqueue.Reservedslots
    end

    return free
end

function Queue.OnJoining(ident)
    if ident then
        Queue.connecting[ident] = nil
    end
end

function Queue.BuildCard(entry, position, total)
    return DeferralCards.Card:Create({
        body = {
            DeferralCards.Container:Create({
                items = {
                    DeferralCards.CardElement:Image({
                        url = SConfig.Priorityqueue.Serverlogo,
                        size = 'large',
                        horizontalAlignment = 'center'
                    }),
                    DeferralCards.CardElement:TextBlock({
                        text = SConfig.Priorityqueue.Welcometext,
                        weight = 'Light',
                        size = 'Small',
                        horizontalAlignment = 'center'
                    }),
                    DeferralCards.CardElement:TextBlock({
                        text = ('Welcome, %s'):format(entry.name),
                        weight = 'Light',
                        size = 'ExtraLarge',
                        horizontalAlignment = 'center'
                    }),
                    DeferralCards.CardElement:TextBlock({
                        text = ('⏳ In queue | Position %d / %d'):format(position, total),
                        size = 'Large',
                        weight = 'Bolder',
                        horizontalAlignment = 'center'
                    }),
                    DeferralCards.CardElement:TextBlock({
                        text = ('%s | Waiting %s'):format(entry.prioname, Formattime(os.time() - entry.joinedAt)),
                        size = 'Medium',
                        weight = 'Light',
                        horizontalAlignment = 'center'
                    }),
                },
                isVisible = true
            })
        }
    })
end

local Usequeue = Config.Priorityqueue.Usepriorityqueue and not Config.Stealthmode.Enabled

if Usequeue then
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)

            local now = os.time()

            for ident, expiry in pairs(Queue.connecting) do
                if now > expiry then
                    Queue.connecting[ident] = nil
                end
            end

            for i = #Queue.list, 1, -1 do
                local entry = Queue.list[i]
                if not entry.disconnectedAt and not GetPlayerName(entry.src) then
                    entry.disconnectedAt = now
                end
                if entry.disconnectedAt and now - entry.disconnectedAt > Config.Priorityqueue.Reconnectgrace then
                    table.remove(Queue.list, i)
                end
            end

            if GetGameTimer() - Queue.lastRelease >= Config.Priorityqueue.Joindelay
                and Queue.CountConnecting() < Config.Priorityqueue.Maxconnecting then
                for i, entry in ipairs(Queue.list) do
                    if not entry.disconnectedAt then
                        if Queue.FreeSlots(entry.power) > 0 then
                            table.remove(Queue.list, i)
                            Queue.connecting[entry.ident] = now + Config.Priorityqueue.Connectinggrace
                            Queue.lastRelease = GetGameTimer()
                            Safecall(entry.deferrals.done)
                        end
                        break
                    end
                end
            end

            local waiting = {}
            for _, entry in ipairs(Queue.list) do
                if not entry.disconnectedAt then
                    table.insert(waiting, entry)
                end
            end

            for position, entry in ipairs(waiting) do
                Safecall(entry.deferrals.presentCard, Queue.BuildCard(entry, position, #waiting),
                    function(pData, pRawData) end)
            end
        end
    end)
end

local function Connectcard(name, text)
    return DeferralCards.Card:Create({
        body = {
            DeferralCards.Container:Create({
                items = {
                    DeferralCards.CardElement:Image({
                        url = SConfig.Priorityqueue.Serverlogo,
                        size = 'large',
                        horizontalAlignment = 'center'
                    }),
                    DeferralCards.CardElement:TextBlock({
                        text = "This Server is protected by Deadeye Anticheat",
                        weight = 'Light',
                        size = 'Small',
                        horizontalAlignment = 'center'
                    }),
                    DeferralCards.CardElement:TextBlock({
                        text = ('Welcome, %s'):format(name),
                        weight = 'Light',
                        size = 'ExtraLarge',
                        horizontalAlignment = 'center'
                    }),
                    DeferralCards.CardElement:TextBlock({
                        size = 'Large',
                        weight = 'Bolder',
                        text = text,
                        horizontalAlignment = 'center'
                    }),
                },
                isVisible = true
            })
        }
    })
end

AddEventHandler('playerConnecting', function(name, setKickReason, deferrals)
    local playerId = source

    deferrals.defer()
    Citizen.Wait(0)

    if not Config.Stealthmode.Enabled then
        deferrals.presentCard(Connectcard(name, "🔍 Checking account..."), function(pData, pRawData) end)
    end

    local cname = string.gsub(name, "%s+", "")
    if string.find(cname, "<") or string.find(cname, ">") then
        deferrals.done("❗ Possible XSS Injection detected, please remove any unusual symbols from your RedM Username!")
        return
    end

    local ids = GetIdentifiers(playerId)

    local p = promise.new()
    local resolved = false
    local function Finish(value)
        if resolved then return end
        resolved = true
        p:resolve(value)
    end

    FindBan(ids, function(ban) Finish(ban or false) end)
    SetTimeout(10000, function() Finish("timeout") end)

    local ban = Citizen.Await(p)

    if ban == "timeout" then
        deferrals.done("❗ The ban check could not be completed, please try again in a moment.")
        return
    end

    if ban then
        deferrals.done("❗ " .. Banmessage(ban))
        return
    end

    if Usequeue then
        Queue.Add(playerId,
            ids.license ~= "" and ids.license or ("temp:" .. playerId),
            name,
            ids.discord ~= "" and ids.discord or "No discord found",
            deferrals)
    else
        deferrals.done()
    end
end)

AddEventHandler("playerJoining", function()
    local playerId = source
    local ids = GetIdentifiers(playerId)

    Queue.OnJoining(ids.license)

    FindBan(ids, function(ban)
        if ban then
            DropPlayer(playerId, "[deadeye_anticheat] " .. Banmessage(ban))
        end
    end)
end)

function Logtodiscord(link, text, playername, steamid, discordid)
    local text2 = "**PLAYER-INFORMATIONS:**\nRedM-Name: " ..
        playername .. "\nSteam-ID: " .. steamid .. "\nDiscord-ID: " .. "<@" .. discordid .. ">"
    local fulltext = text .. "\n\n" .. text2

    local _colour = tonumber("a020f0")

    local _content = json.encode({
        ["embeds"] = { {
            ["title"] = "Deadeye Anticheat",
            ["description"] = fulltext,
            ["color"] = _colour,
            ["footer"] = { ["text"] = "" },
        } },
        ["username"] = "Deadeye Anticheat",
        ["avatar_url"] = "https://u.cubeupload.com/PharellJay/logotransparent.png",
    })

    PerformHttpRequest(link, function(Error, Content, Head) end, 'POST', _content,
        { ['Content-Type'] = 'application/json' })
end

-- Modules whose Config/SConfig table name differs from their Config.Punishments key
local ConfigKeys = {
    BlacklistWeapons = "Blacklistweapons",
    BlacklistAmmo = "Blacklistammo",
    EntityBlacklist = "Entityblacklist",
}

local Punished = {}
local LogCooldown = {}
local LOG_COOLDOWN = 30

function Punish(src, module, extraText, kickExtraText)
    src = tonumber(src)
    if not src then return false end

    if Punished[src] then
        return true
    end

    if Isplayerwhitelisted(src) then
        print("Further actions for player " ..
            src .. " prevented, because he was whitelisted by another script!")
        return false
    end

    local configKey = ConfigKeys[module] or module
    local settings = Config[configKey]

    local groups = settings.Whitelistgroups or settings.Pedmenugroups
    if groups and IsGroupAllowed(src, groups) then
        return false
    end

    local punishments = Config.Punishments[module]
    local remove = punishments.Ban or punishments.Kick

    if remove then
        Punished[src] = true
    else
        local now = os.time()
        LogCooldown[src] = LogCooldown[src] or {}
        if LogCooldown[src][module] and now - LogCooldown[src][module] < LOG_COOLDOWN then
            return true
        end
        LogCooldown[src][module] = now
    end

    local playername = GetPlayerName(src) or "Unknown"

    local steamid = GetPlayerIdentifierByType(src, "steam") or "No Steam found"

    local did = GetPlayerIdentifierByType(src, "discord")
    local discordid = did and string.sub(did, 9) or "No discord found"

    if punishments.Ban then
        Banplayer(src, settings.Bantext)
    end
    if punishments.Log then
        Logtodiscord(SConfig[configKey].Webhooklink, settings.Webhooktext .. (extraText or ""), playername,
            steamid, discordid)
    end
    if remove then
        DropPlayer(src, "[deadeye_anticheat] " .. settings.Kicktext .. (kickExtraText or ""))
    end

    return true
end

AddEventHandler("playerDropped", function()
    local src = source
    Punished[src] = nil
    LogCooldown[src] = nil
end)

local ExemptModules = {
    AntiSpawnweapons = Config.AntiSpawnweapons.Whitelistgroups,
    BlacklistWeapons = Config.Blacklistweapons.Whitelistgroups,
    BlacklistAmmo = Config.Blacklistammo.Whitelistgroups,
    AntiPedhack = Config.AntiPedhack.Pedmenugroups,
    AntiInvincible = Config.AntiInvincible.Whitelistgroups,
    AntiFreecam = Config.AntiFreecam.Whitelistgroups,
    AntiInvisible = Config.AntiInvisible.Whitelistgroups,
    AntiMasskill = Config.AntiMasskill.Whitelistgroups,
    AntiController = Config.AntiController.Whitelistgroups,
    AntiTeleport = Config.AntiTeleport.Whitelistgroups,
}

Characterselected = {}

function Sendexemptions(src)
    local group = GetGroup(src)
    local exemptions = {}
    for module, groups in pairs(ExemptModules) do
        exemptions[module] = group ~= nil and groups[group] == true
    end
    TriggerClientEvent("deadeye_anticheat:exemptions", src, exemptions)
end

AddEventHandler("vorp:SelectedCharacter", function(source, character)
    Characterselected[source] = os.time()
    Sendexemptions(source)
end)

AddEventHandler("playerDropped", function()
    Characterselected[source] = nil
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(60000)

        for _, player in ipairs(GetPlayers()) do
            local src = tonumber(player)
            if GetGroup(src) then
                Characterselected[src] = Characterselected[src] or os.time()
                Sendexemptions(src)
            end
        end
    end
end)

local function Ischeckable(src)
    local selected = Characterselected[src]
    return selected ~= nil and os.time() - selected >= 30
end

---------
--Discord-Rolecheck
---------
if Config.Modules.Discordrolecheck == true then
    function Hasdiscordrole(discordId, cb)
        if not discordId then
            cb(false)
            return true
        end

        return Getmemberroles(SConfig.Discordrolecheck.Guildid, SConfig.Discordrolecheck.DiscordBottoken, discordId,
            function(status, roles)
                if status == 200 then
                    if not roles then
                        cb(nil)
                        return
                    end
                    for _, role in ipairs(roles) do
                        if role == SConfig.Discordrolecheck.Roleid then
                            cb(true)
                            return
                        end
                    end
                    cb(false)
                elseif status == 404 then
                    cb(false)
                else
                    print("^3[deadeye_anticheat]^7 Discord role check failed (HTTP " ..
                        tostring(status) .. "), skipping.")
                    cb(nil)
                end
            end)
    end

    if SConfig.Discordrolecheck.DiscordBottoken == "" or SConfig.Discordrolecheck.Guildid == "" or SConfig.Discordrolecheck.Roleid == "" then
        print(
            "^1[deadeye_anticheat]^7 Discordrolecheck is enabled but bot token / guild id / role id is missing in config_secure.lua. Module disabled.")
    else
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(300000)

                Prunerolecache()

                for _, player in ipairs(GetPlayers()) do
                    local id1 = GetPlayerIdentifierByType(player, 'steam')
                    local id2 = GetPlayerIdentifierByType(player, 'license')

                    if not (Config.Discordrolecheck.Whiteliststeamids[id1] or Config.Discordrolecheck.Whitelistlicenses[id2]) then
                        local getDC = GetPlayerIdentifierByType(player, "discord")
                        local discordId = getDC and string.sub(getDC, 9) or nil

                        local fromcache = Hasdiscordrole(discordId, function(hasRole)
                            if hasRole == false then
                                Punish(player, "Discordrolecheck")
                            end
                        end)

                        if not fromcache then
                            Citizen.Wait(1000)
                        end
                    end
                end
            end
        end)
    end
end

---------
--ANTI-AI
---------
if Config.Modules.AntiAI then
    RegisterNetEvent("deadeye_anticheat:weaponai")
    AddEventHandler("deadeye_anticheat:weaponai", function()
        Punish(source, "AntiAI")
    end)
end

---------
--ANTI-INJECTION
---------
if Config.Modules.AntiInjection then
    local Recentlystopped = {}

    AddEventHandler("onResourceStop", function(resourceName)
        Recentlystopped[resourceName] = os.time()
    end)

    local function Isknownresource(name)
        local state = GetResourceState(name)
        if state == "started" or state == "starting" or name == "_cfx_internal" then
            return true
        end
        return Recentlystopped[name] ~= nil and os.time() - Recentlystopped[name] < 30
    end

    RegisterNetEvent("deadeye_anticheat:checkresources", function(cresources)
        local src = source
        if type(cresources) ~= "table" then return end

        for _, cr in ipairs(cresources) do
            if not Isknownresource(tostring(cr)) then
                Punish(src, "AntiInjection", " | Resource: " .. tostring(cr))
                return
            end
        end
    end)
end

---------
--NUI-BLOCKER
---------
if Config.Modules.NuiBlocker then
    RegisterNetEvent("deadeye_anticheat:nuiblock")
    AddEventHandler("deadeye_anticheat:nuiblock", function()
        Punish(source, "NuiBlocker")
    end)
end

---------
--ANTI-CRASH
---------
if Config.Modules.AntiCrash then
    local Weapons = {
        [GetHashKey("WEAPON_WOLF") & 0xFFFFFFFF] = "WEAPON_WOLF",
        [GetHashKey("WEAPON_WOLF_MEDIUM") & 0xFFFFFFFF] = "WEAPON_WOLF_MEDIUM",
        [GetHashKey("WEAPON_WOLF_SMALL") & 0xFFFFFFFF] = "WEAPON_WOLF_SMALL",
        [GetHashKey("WEAPON_MUSKRAT") & 0xFFFFFFFF] = "WEAPON_MUSKRAT",
        [GetHashKey("WEAPON_PANTHER") & 0xFFFFFFFF] = "WEAPON_PANTHER",
        [GetHashKey("WEAPON_RACCOON") & 0xFFFFFFFF] = "WEAPON_RACCOON",
        [GetHashKey("WEAPON_SNAKE") & 0xFFFFFFFF] = "WEAPON_SNAKE",
        [GetHashKey("WEAPON_ALLIGATOR") & 0xFFFFFFFF] = "WEAPON_ALLIGATOR",
        [GetHashKey("WEAPON_ANIMAL") & 0xFFFFFFFF] = "WEAPON_ANIMAL",
        [GetHashKey("WEAPON_BADGER") & 0xFFFFFFFF] = "WEAPON_BADGER",
        [GetHashKey("WEAPON_BEAR") & 0xFFFFFFFF] = "WEAPON_BEAR",
        [GetHashKey("WEAPON_BEAVER") & 0xFFFFFFFF] = "WEAPON_BEAVER",
        [GetHashKey("WEAPON_COUGAR") & 0xFFFFFFFF] = "WEAPON_COUGAR",
        [GetHashKey("WEAPON_COYOTE") & 0xFFFFFFFF] = "WEAPON_COYOTE",
        [GetHashKey("WEAPON_DEER") & 0xFFFFFFFF] = "WEAPON_DEER",
        [GetHashKey("WEAPON_FOX") & 0xFFFFFFFF] = "WEAPON_FOX",
        [GetHashKey("WEAPON_HORSE") & 0xFFFFFFFF] = "WEAPON_HORSE",
        [GetHashKey("WEAPON_BOW") & 0xFFFFFFFF] = "WEAPON_BOW",
        [GetHashKey("WEAPON_BOW_CHARLES") & 0xFFFFFFFF] = "WEAPON_BOW_CHARLES",
        [GetHashKey("WEAPON_BOW_IMPROVED") & 0xFFFFFFFF] = "WEAPON_BOW_IMPROVED",
        [GetHashKey("WEAPON_LASSO") & 0xFFFFFFFF] = "WEAPON_LASSO",
        [GetHashKey("WEAPON_LASSO_REINFORCED") & 0xFFFFFFFF] = "WEAPON_LASSO_REINFORCED",
        [GetHashKey("WEAPON_MELEE_ANCIENT_HATCHET") & 0xFFFFFFFF] = "WEAPON_MELEE_ANCIENT_HATCHET",
        [GetHashKey("WEAPON_MELEE_BROKEN_SWORD") & 0xFFFFFFFF] = "WEAPON_MELEE_BROKEN_SWORD",
        [GetHashKey("WEAPON_MELEE_CLEAVER") & 0xFFFFFFFF] = "WEAPON_MELEE_CLEAVER",
        [GetHashKey("WEAPON_MELEE_DAVY_LANTERN") & 0xFFFFFFFF] = "WEAPON_MELEE_DAVY_LANTERN",
        [GetHashKey("WEAPON_MELEE_HAMMER") & 0xFFFFFFFF] = "WEAPON_MELEE_HAMMER",
        [GetHashKey("WEAPON_MELEE_HATCHET") & 0xFFFFFFFF] = "WEAPON_MELEE_HATCHET",
        [GetHashKey("WEAPON_MELEE_HATCHET_DOUBLE_BIT") & 0xFFFFFFFF] = "WEAPON_MELEE_HATCHET_DOUBLE_BIT",
        [GetHashKey("WEAPON_MELEE_HATCHET_DOUBLE_BIT_RUSTED") & 0xFFFFFFFF] =
        "WEAPON_MELEE_HATCHET_DOUBLE_BIT_RUSTED",
        [GetHashKey("WEAPON_MELEE_HATCHET_HEWING") & 0xFFFFFFFF] = "WEAPON_MELEE_HATCHET_HEWING",
        [GetHashKey("WEAPON_MELEE_HATCHET_HUNTER") & 0xFFFFFFFF] = "WEAPON_MELEE_HATCHET_HUNTER",
        [GetHashKey("WEAPON_MELEE_HATCHET_HUNTER_RUSTED") & 0xFFFFFFFF] = "WEAPON_MELEE_HATCHET_HUNTER_RUSTED",
        [GetHashKey("WEAPON_MELEE_HATCHET_MELEEONLY") & 0xFFFFFFFF] = "WEAPON_MELEE_HATCHET_MELEEONLY",
        [GetHashKey("WEAPON_MELEE_HATCHET_VIKING") & 0xFFFFFFFF] = "WEAPON_MELEE_HATCHET_VIKING",
        [GetHashKey("WEAPON_MELEE_KNIFE") & 0xFFFFFFFF] = "WEAPON_MELEE_KNIFE",
        [GetHashKey("WEAPON_MELEE_KNIFE_BEAR") & 0xFFFFFFFF] = "WEAPON_MELEE_KNIFE_BEAR",
        [GetHashKey("WEAPON_MELEE_KNIFE_CIVIL_WAR") & 0xFFFFFFFF] = "WEAPON_MELEE_KNIFE_CIVIL_WAR",
        [GetHashKey("WEAPON_MELEE_KNIFE_JAWBONE") & 0xFFFFFFFF] = "WEAPON_MELEE_KNIFE_JAWBONE",
        [GetHashKey("WEAPON_MELEE_KNIFE_MINER") & 0xFFFFFFFF] = "WEAPON_MELEE_KNIFE_MINER",
        [GetHashKey("WEAPON_MELEE_KNIFE_TRADER") & 0xFFFFFFFF] = "WEAPON_MELEE_KNIFE_TRADER",
        [GetHashKey("WEAPON_MELEE_KNIFE_VAMPIRE") & 0xFFFFFFFF] = "WEAPON_MELEE_KNIFE_VAMPIRE",
        [GetHashKey("WEAPON_MELEE_LANTERN") & 0xFFFFFFFF] = "WEAPON_MELEE_LANTERN",
        [GetHashKey("WEAPON_MELEE_LANTERN_ELECTRIC") & 0xFFFFFFFF] = "WEAPON_MELEE_LANTERN_ELECTRIC",
        [GetHashKey("WEAPON_MELEE_MACHETE") & 0xFFFFFFFF] = "WEAPON_MELEE_MACHETE",
        [GetHashKey("WEAPON_MELEE_MACHETE_COLLECTOR") & 0xFFFFFFFF] = "WEAPON_MELEE_MACHETE_COLLECTOR",
        [GetHashKey("WEAPON_MELEE_TORCH") & 0xFFFFFFFF] = "WEAPON_MELEE_TORCH",
        [GetHashKey("WEAPON_MELEE_TORCH_CROWD") & 0xFFFFFFFF] = "WEAPON_MELEE_TORCH_CROWD",
        [GetHashKey("WEAPON_MOONSHINEJUG") & 0xFFFFFFFF] = "WEAPON_MOONSHINEJUG",
        [GetHashKey("WEAPON_MOONSHINEJUG_MP") & 0xFFFFFFFF] = "WEAPON_MOONSHINEJUG_MP",
        [GetHashKey("WEAPON_PISTOL_M1899") & 0xFFFFFFFF] = "WEAPON_PISTOL_M1899",
        [GetHashKey("WEAPON_PISTOL_MAUSER") & 0xFFFFFFFF] = "WEAPON_PISTOL_MAUSER",
        [GetHashKey("WEAPON_PISTOL_MAUSER_DRUNK") & 0xFFFFFFFF] = "WEAPON_PISTOL_MAUSER_DRUNK",
        [GetHashKey("WEAPON_PISTOL_SEMIAUTO") & 0xFFFFFFFF] = "WEAPON_PISTOL_SEMIAUTO",
        [GetHashKey("WEAPON_PISTOL_VOLCANIC") & 0xFFFFFFFF] = "WEAPON_PISTOL_VOLCANIC",
        [GetHashKey("WEAPON_POISON") & 0xFFFFFFFF] = "WEAPON_POISON",
        [GetHashKey("WEAPON_REPEATER_CARBINE") & 0xFFFFFFFF] = "WEAPON_REPEATER_CARBINE",
        [GetHashKey("WEAPON_REPEATER_EVANS") & 0xFFFFFFFF] = "WEAPON_REPEATER_EVANS",
        [GetHashKey("WEAPON_REPEATER_HENRY") & 0xFFFFFFFF] = "WEAPON_REPEATER_HENRY",
        [GetHashKey("WEAPON_REPEATER_WINCHESTER") & 0xFFFFFFFF] = "WEAPON_REPEATER_WINCHESTER",
        [GetHashKey("WEAPON_REVOLVER_CATTLEMAN") & 0xFFFFFFFF] = "WEAPON_REVOLVER_CATTLEMAN",
        [GetHashKey("WEAPON_REVOLVER_CATTLEMAN_DUALWIELD") & 0xFFFFFFFF] = "WEAPON_REVOLVER_CATTLEMAN_DUALWIELD",
        [GetHashKey("WEAPON_REVOLVER_CATTLEMAN_MEXICAN") & 0xFFFFFFFF] = "WEAPON_REVOLVER_CATTLEMAN_MEXICAN",
        [GetHashKey("WEAPON_REVOLVER_CATTLEMAN_PIG") & 0xFFFFFFFF] = "WEAPON_REVOLVER_CATTLEMAN_PIG",
        [GetHashKey("WEAPON_REVOLVER_DOUBLEACTION") & 0xFFFFFFFF] = "WEAPON_REVOLVER_DOUBLEACTION",
        [GetHashKey("WEAPON_REVOLVER_DOUBLEACTION_DUALWIELD") & 0xFFFFFFFF] =
        "WEAPON_REVOLVER_DOUBLEACTION_DUALWIELD",
        [GetHashKey("WEAPON_REVOLVER_DOUBLEACTION_EXOTIC") & 0xFFFFFFFF] = "WEAPON_REVOLVER_DOUBLEACTION_EXOTIC",
        [GetHashKey("WEAPON_REVOLVER_DOUBLEACTION_GAMBLER") & 0xFFFFFFFF] =
        "WEAPON_REVOLVER_DOUBLEACTION_GAMBLER",
        [GetHashKey("WEAPON_REVOLVER_LEMAT") & 0xFFFFFFFF] = "WEAPON_REVOLVER_LEMAT",
        [GetHashKey("WEAPON_REVOLVER_NAVY") & 0xFFFFFFFF] = "WEAPON_REVOLVER_NAVY",
        [GetHashKey("WEAPON_REVOLVER_NAVY_CROSSOVER") & 0xFFFFFFFF] = "WEAPON_REVOLVER_NAVY_CROSSOVER",
        [GetHashKey("WEAPON_REVOLVER_SCHOFIELD") & 0xFFFFFFFF] = "WEAPON_REVOLVER_SCHOFIELD",
        [GetHashKey("WEAPON_REVOLVER_SCHOFIELD_DUALWIELD") & 0xFFFFFFFF] = "WEAPON_REVOLVER_SCHOFIELD_DUALWIELD",
        [GetHashKey("WEAPON_REVOLVER_SCHOFIELD_GOLDEN") & 0xFFFFFFFF] = "WEAPON_REVOLVER_SCHOFIELD_GOLDEN",
        [GetHashKey("WEAPON_RIFLE_BOLTACTION") & 0xFFFFFFFF] = "WEAPON_RIFLE_BOLTACTION",
        [GetHashKey("WEAPON_RIFLE_BOLTACTION_BILL") & 0xFFFFFFFF] = "WEAPON_RIFLE_BOLTACTION_BILL",
        [GetHashKey("WEAPON_RIFLE_SPRINGFIELD") & 0xFFFFFFFF] = "WEAPON_RIFLE_SPRINGFIELD",
        [GetHashKey("WEAPON_RIFLE_VARMINT") & 0xFFFFFFFF] = "WEAPON_RIFLE_VARMINT",
        [GetHashKey("WEAPON_RIFLE_ELEPHANT") & 0xFFFFFFFF] = "WEAPON_RIFLE_ELEPHANT",
        [GetHashKey("WEAPON_SHOTGUN_DOUBLEBARREL") & 0xFFFFFFFF] = "WEAPON_SHOTGUN_DOUBLEBARREL",
        [GetHashKey("WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC") & 0xFFFFFFFF] = "WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC",
        [GetHashKey("WEAPON_SHOTGUN_DOUBLEBARREL_UNCLE") & 0xFFFFFFFF] = "WEAPON_SHOTGUN_DOUBLEBARREL_UNCLE",
        [GetHashKey("WEAPON_SHOTGUN_PUMP") & 0xFFFFFFFF] = "WEAPON_SHOTGUN_PUMP",
        [GetHashKey("WEAPON_SHOTGUN_REPEATING") & 0xFFFFFFFF] = "WEAPON_SHOTGUN_REPEATING",
        [GetHashKey("WEAPON_SHOTGUN_SAWEDOFF") & 0xFFFFFFFF] = "WEAPON_SHOTGUN_SAWEDOFF",
        [GetHashKey("WEAPON_SHOTGUN_SEMIAUTO") & 0xFFFFFFFF] = "WEAPON_SHOTGUN_SEMIAUTO",
        [GetHashKey("WEAPON_SNIPERRIFLE_CARCANO") & 0xFFFFFFFF] = "WEAPON_SNIPERRIFLE_CARCANO",
        [GetHashKey("WEAPON_SNIPERRIFLE_ROLLINGBLOCK") & 0xFFFFFFFF] = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",
        [GetHashKey("WEAPON_SNIPERRIFLE_ROLLINGBLOCK_EXOTIC") & 0xFFFFFFFF] =
        "WEAPON_SNIPERRIFLE_ROLLINGBLOCK_EXOTIC",
        [GetHashKey("WEAPON_THROWN_BOLAS") & 0xFFFFFFFF] = "WEAPON_THROWN_BOLAS",
        [GetHashKey("WEAPON_THROWN_DYNAMITE") & 0xFFFFFFFF] = "WEAPON_THROWN_DYNAMITE",
        [GetHashKey("WEAPON_THROWN_MOLOTOV") & 0xFFFFFFFF] = "WEAPON_THROWN_MOLOTOV",
        [GetHashKey("WEAPON_THROWN_POISONBOTTLE") & 0xFFFFFFFF] = "WEAPON_THROWN_POISONBOTTLE",
        [GetHashKey("WEAPON_THROWN_THROWING_KNIVES") & 0xFFFFFFFF] = "WEAPON_THROWN_THROWING_KNIVES",
        [GetHashKey("WEAPON_THROWN_TOMAHAWK") & 0xFFFFFFFF] = "WEAPON_THROWN_TOMAHAWK",
        [GetHashKey("WEAPON_THROWN_TOMAHAWK_ANCIENT") & 0xFFFFFFFF] = "WEAPON_THROWN_TOMAHAWK_ANCIENT",
        [GetHashKey("WEAPON_THROWN_TOMAHAWK_MELEEONLY") & 0xFFFFFFFF] = "WEAPON_THROWN_TOMAHAWK_MELEEONLY",
        [GetHashKey("WEAPON_TURRET_CANNON") & 0xFFFFFFFF] = "WEAPON_TURRET_CANNON",
        [GetHashKey("WEAPON_TURRET_GATLING") & 0xFFFFFFFF] = "WEAPON_TURRET_GATLING",
        [GetHashKey("WEAPON_TURRET_MAXIM") & 0xFFFFFFFF] = "WEAPON_TURRET_MAXIM",
        [GetHashKey("WEAPON_TURRET_REVOLVING_CANNON") & 0xFFFFFFFF] = "WEAPON_TURRET_REVOLVING_CANNON",
        [GetHashKey("WEAPON_UNARMED") & 0xFFFFFFFF] = "WEAPON_UNARMED",
        [GetHashKey("WEAPON_RAMMED_BY_CAR") & 0xFFFFFFFF] = "WEAPON_RAMMED_BY_CAR",
        [GetHashKey("WEAPON_DROWNING") & 0xFFFFFFFF] = "WEAPON_DROWNING",
        [GetHashKey("WEAPON_DROWNING_IN_VEHICLE") & 0xFFFFFFFF] = "WEAPON_DROWNING_IN_VEHICLE",
        [GetHashKey("WEAPON_EXPLOSION") & 0xFFFFFFFF] = "WEAPON_EXPLOSION",
        [GetHashKey("WEAPON_FIRE") & 0xFFFFFFFF] = "WEAPON_FIRE",
        [GetHashKey("WEAPON_MACHINERY") & 0xFFFFFFFF] = "WEAPON_MACHINERY",
        [GetHashKey("WEAPON_RUN_OVER_BY_CAR") & 0xFFFFFFFF] = "WEAPON_RUN_OVER_BY_CAR",
        [GetHashKey("WEAPON_FALL") & 0xFFFFFFFF] = "WEAPON_FALL",
    }
    AddEventHandler("weaponDamageEvent", function(sender, data)
        if data.weaponType == 2416459067 then
            if not Punish(source, "AntiCrash") then return end
            CancelEvent()
        end
        if not Weapons[data.weaponType] then
            if not Punish(source, "AntiCrash") then return end
            CancelEvent()
        end
    end)
end

if Config.Modules.AntiCrash or Config.Modules.EntityBlacklist or Config.Modules.AntiEntityspam then
    local function Modelset(list)
        local set = {}
        for _, model in ipairs(list or {}) do
            set[Normhash(GetHashKey(model))] = true
        end
        return set
    end

    local Crashmodel = 1764217446

    local Blacklisted = {
        { kind = "Ped", set = Modelset(Config.Entityblacklist.Peds) },
        { kind = "Vehicle", set = Modelset(Config.Entityblacklist.Vehicles) },
        { kind = "Object", set = Modelset(Config.Entityblacklist.Objects) },
    }

    local Spamlimits = {}
    for _, list in ipairs({ Config.AntiEntityspam.Peds, Config.AntiEntityspam.Vehicles, Config.AntiEntityspam.Objects }) do
        for _, entry in ipairs(list or {}) do
            Spamlimits[Normhash(GetHashKey(entry.model))] = entry.limit
        end
    end

    local entityCount = 0
    local lastReset = os.time()
    local createdentities = {}

    AddEventHandler("entityCreating", function(entity)
        local model = GetEntityModel(entity)
        local hash = Normhash(model)

        if Config.Modules.AntiCrash then
            local src = NetworkGetEntityOwner(entity)
            if hash == Crashmodel and src and src > 0 then
                if Punish(src, "AntiCrash") then
                    CancelEvent()
                end
            end

            local now = os.time()
            if now ~= lastReset then
                entityCount = 0
                lastReset = now
            end

            entityCount = entityCount + 1

            if entityCount > 50 then
                CancelEvent()
            end
        end

        local owner = nil

        if Config.Modules.EntityBlacklist then
            for _, list in ipairs(Blacklisted) do
                if list.set[hash] then
                    owner = owner or NetworkGetFirstEntityOwner(entity)
                    if owner and owner > 0 and not IsGroupAllowed(owner, Config.Entityblacklist.Whitelistgroups) then
                        CancelEvent()
                        Punish(owner, "EntityBlacklist", " | " .. list.kind .. ": " .. model)
                    end
                end
            end
        end

        if Config.Modules.AntiEntityspam then
            local limit = Spamlimits[hash]
            if limit then
                owner = owner or NetworkGetFirstEntityOwner(entity) or -1

                createdentities[owner] = (createdentities[owner] or 0) + 1

                if createdentities[owner] >= limit and owner > 0 then
                    if not IsGroupAllowed(owner, Config.AntiEntityspam.Whitelistgroups) then
                        CancelEvent()
                        Punish(owner, "AntiEntityspam", " | Entity: " .. model)
                    end
                end

                SetTimeout(Config.AntiEntityspam.Intervall, function()
                    if createdentities[owner] and createdentities[owner] > 0 then
                        createdentities[owner] = createdentities[owner] - 1
                    end
                end)
            end
        end
    end)

    AddEventHandler("playerDropped", function()
        createdentities[source] = nil
    end)
end

---------
--Anti-Devmode
---------
if Config.Modules.AntiDevmode then
    RegisterNetEvent("deadeye_anticheat:antidevmode")
    AddEventHandler("deadeye_anticheat:antidevmode", function()
        Punish(source, "AntiDevmode")
    end)
end

---------
--Force Release Channel
---------
if Config.Modules.ForceReleaseChannel then
    RegisterNetEvent("deadeye_anticheat:forcereleasechannel")
    AddEventHandler("deadeye_anticheat:forcereleasechannel", function(version)
        local versionText = " | Version: " .. tostring(version)
        Punish(source, "ForceReleaseChannel", versionText, versionText)
    end)
end

---------
--Anti-Spawnweapons
---------
if Config.Modules.AntiSpawnweapons then
    local weaponflags = {}

    RegisterNetEvent("deadeye_anticheat:checkweapons")
    AddEventHandler("deadeye_anticheat:checkweapons", function(weaponwheel)
        local src = source
        local wanted = Normhash(weaponwheel)
        if not wanted then return end

        local weapons = exports.vorp_inventory:getUserInventoryWeapons(src) or {}

        for _, weapon in ipairs(weapons) do
            if Normhash(GetHashKey(tostring(weapon.name))) == wanted then
                weaponflags[src] = nil
                TriggerClientEvent("deadeye_anticheat:weaponok", src, weaponwheel)
                return
            end
        end

        if Isplayerwhitelisted(src) then
            print("Further actions for player " ..
                src .. " prevented, because he was whitelisted by another script!")
            return
        end

        local now = os.time()
        local flags = weaponflags[src]
        if not flags or now - flags.first > 20 then
            flags = { count = 0, first = now }
            weaponflags[src] = flags
        end

        flags.count = flags.count + 1

        if flags.count > 4 then
            TriggerClientEvent("deadeye_anticheat:hasloggedweapon", src)
            Punish(src, "AntiSpawnweapons", " | Weaponhash: " .. tostring(weaponwheel))
        end
    end)

    AddEventHandler("playerDropped", function()
        weaponflags[source] = nil
    end)
end

---------
--Blacklist-Weapons
---------
if Config.Modules.BlacklistWeapons then
    RegisterNetEvent("deadeye_anticheat:blacklistweapons")
    AddEventHandler("deadeye_anticheat:blacklistweapons", function(weapon)
        Punish(source, "BlacklistWeapons", " | Weapon: " .. tostring(weapon))
    end)
end

---------
--BlacklistAmmo
---------
if Config.Modules.BlacklistAmmo then
    RegisterNetEvent("deadeye_anticheat:blacklistammo")
    AddEventHandler("deadeye_anticheat:blacklistammo", function(ammo)
        Punish(source, "BlacklistAmmo", " | Ammo: " .. tostring(ammo))
    end)
end

---------
--Anti-Pedhack
---------
if Config.Modules.AntiPedhack then
    RegisterNetEvent("deadeye_anticheat:pedhack")
    AddEventHandler("deadeye_anticheat:pedhack", function(ped)
        Punish(source, "AntiPedhack", " | Model: " .. tostring(ped))
    end)
end

---------
--Anti-Invincible
---------
if Config.Modules.AntiInvincible then
    RegisterNetEvent("deadeye_anticheat:invincible")
    AddEventHandler("deadeye_anticheat:invincible", function()
        Punish(source, "AntiInvincible")
    end)
end

---------
--Anti-Explosion
---------
if Config.Modules.AntiExplosion then
    AddEventHandler('explosionEvent', function(sender, data)
        local src = sender

        if IsGroupAllowed(src, Config.AntiExplosion.Whitelistgroups) then return end

        local explosiontype = tonumber(data.explosionType)
        local x = data.posX or 0
        local y = data.posY or 0
        local z = data.posZ or 0

        local extraText = " | Explosion-Type: " ..
            tostring(explosiontype) .. " | X: " .. x .. " | Y: " .. y .. " | Z: " .. z

        local flagged = (Config.AntiExplosion.Invisbleandsilent and (data.isInvisible or not data.isAudible))
            or not Config.AntiExplosion.Allowedexplosions[explosiontype]
            or (data.damageScale or 0) >= Config.AntiExplosion.Maxdamage

        if flagged then
            if not Punish(src, "AntiExplosion", extraText) then return end
            CancelEvent()
        end
    end)
end

---------
--Anti-Freecam
---------
if Config.Modules.AntiFreecam then
    RegisterNetEvent("deadeye_anticheat:freecam")
    AddEventHandler("deadeye_anticheat:freecam", function(p, x)
        Punish(source, "AntiFreecam",
            " | Player-Coordinates: " ..
            p.x ..
            ", " ..
            p.y .. ", " .. p.z .. " | Camera-Coordinates: " .. x.x .. ", " .. x.y .. ", " .. x.z)
    end)
end

---------
--Anti-Invisible
---------
if Config.Modules.AntiInvisible then
    RegisterNetEvent("deadeye_anticheat:invisible")
    AddEventHandler("deadeye_anticheat:invisible", function()
        Punish(source, "AntiInvisible")
    end)

    local zones = Buildzones(Config.AntiInvisible.Whitelistzones)
    local Invisiblesince = {}

    AddEventHandler("playerDropped", function()
        Invisiblesince[source] = nil
    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)

            local now = os.time()

            for _, player in ipairs(GetPlayers()) do
                local src = tonumber(player)
                local ped = GetPlayerPed(src)

                if Ischeckable(src) and ped and ped ~= 0 and DoesEntityExist(ped) and not IsEntityVisible(ped) then
                    if not Inzone(GetEntityCoords(ped), zones) then
                        Invisiblesince[src] = Invisiblesince[src] or now
                        if now - Invisiblesince[src] >= 10 then
                            Punish(src, "AntiInvisible", " | Server-side")
                        end
                    end
                else
                    Invisiblesince[src] = nil
                end
            end
        end
    end)
end

---------
--Command-Detection
---------
if Config.Modules.CommandDetection then
    RegisterNetEvent("deadeye_anticheat:command")
    AddEventHandler("deadeye_anticheat:command", function(res, cmd)
        Punish(source, "CommandDetection",
            "\nResource: " .. tostring(res) .. "\nBlacklisted Command: " .. tostring(cmd))
    end)
end

---------
--Anti-Killaura
---------
if Config.Modules.AntiKillaura then
    AddEventHandler("weaponDamageEvent", function(sender, data)
        if data.silenced == true and data.weaponType == 539292904 then
            if not IsGroupAllowed(sender, Config.AntiKillaura.Whitelistgroups) then
                Punish(sender, "AntiKillaura")
            end
        end
    end)
end

---------
--Anti-Masskill
---------
if Config.Modules.AntiMasskill then
    RegisterNetEvent("deadeye_anticheat:masskill")
    AddEventHandler("deadeye_anticheat:masskill", function()
        Punish(source, "AntiMasskill")
    end)
end

---------
--Anti-Controller
---------
if Config.Modules.AntiController then
    RegisterNetEvent("deadeye_anticheat:controllerdetected")
    AddEventHandler("deadeye_anticheat:controllerdetected", function()
        Punish(source, "AntiController")
    end)
end

---------
--Anti-InfiniteAmmo
---------
if Config.Modules.AntiInfiniteAmmo then
    RegisterNetEvent("deadeye_anticheat:infiniteammo")
    AddEventHandler("deadeye_anticheat:infiniteammo", function()
        Punish(source, "AntiInfiniteAmmo")
    end)
end

---------
--AntiTeleport (ALPHA)
---------
if Config.Modules.AntiTeleport then
    AddEventHandler('txsv:logger:menuEvent', function(source, action, allowed, data)
        if not allowed then return end

        local src = source
        if not IsGroupAllowed(src, Config.AntiTeleport.Whitelistgroups) then return end

        if action == 'teleportWaypoint' or action == 'teleportCoords' then
            Whitelistbyid(src, 15)
        elseif action == 'teleportPlayer' then
            Whitelistbyid(src, 15)
            Whitelistbyid(type(data) == "table" and data.target or nil, 15)
        elseif action == 'summonPlayer' then
            Whitelistbyid(src, 15)
            Whitelistbyid(data, 15)
        end
    end)

    RegisterNetEvent("deadeye_anticheat:antiteleport")
    AddEventHandler("deadeye_anticheat:antiteleport", function(firstCoord, lastCoord, distance)
        Punish(source, "AntiTeleport",
            " | Starting Coordinates: " ..
            tostring(firstCoord) ..
            " | Destination: " .. tostring(lastCoord) .. " | Distance: " .. tostring(distance))
    end)

    local zones = Buildzones(Config.AntiTeleport.Whitelistzones)
    local Lastpositions = {}
    local Respawngrace = {}

    AddEventHandler("playerDropped", function()
        Lastpositions[source] = nil
        Respawngrace[source] = nil
    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)

            local now = os.time()

            for _, player in ipairs(GetPlayers()) do
                local src = tonumber(player)
                local ped = GetPlayerPed(src)

                if not Ischeckable(src) or Isplayerwhitelisted(src) or not ped or ped == 0 or not DoesEntityExist(ped) then
                    Lastpositions[src] = nil
                elseif GetEntityHealth(ped) <= 0 then
                    Lastpositions[src] = nil
                    Respawngrace[src] = now + 30
                elseif Respawngrace[src] and now < Respawngrace[src] then
                    Lastpositions[src] = nil
                else
                    local coords = GetEntityCoords(ped)
                    local last = Lastpositions[src]

                    if last then
                        local dx = coords.x - last.x
                        local dy = coords.y - last.y
                        local distance2D = math.sqrt(dx * dx + dy * dy)

                        if distance2D >= Config.AntiTeleport.TeleportDistance
                            and not Inzone(last, zones) and not Inzone(coords, zones) then
                            Punish(src, "AntiTeleport",
                                " | Server-side | Starting Coordinates: " .. tostring(last) ..
                                " | Destination: " .. tostring(coords) .. " | Distance: " .. tostring(distance2D))
                        end
                    end

                    Lastpositions[src] = coords
                end
            end
        end
    end)
end

---------
--Anti-BiggerHitbox
---------
if Config.Modules.AntiBiggerHitbox then
    RegisterNetEvent("deadeye_anticheat:antibiggerhitbox")
    AddEventHandler("deadeye_anticheat:antibiggerhitbox", function()
        Punish(source, "AntiBiggerHitbox")
    end)
end

---------
--Anti-TriggerBot
---------
if Config.Modules.AntiTriggerBot then
    RegisterNetEvent("deadeye_anticheat:antitriggerbot")
    AddEventHandler("deadeye_anticheat:antitriggerbot", function(time)
        Punish(source, "AntiTriggerBot", " | Reaction Time: " .. tostring(time) .. "ms")
    end)
end

---------
--AdvancedProtection
---------
if Config.Modules.AdvancedProtection then
    local AdvancedHeartbeat = {}

    AddEventHandler("playerDropped", function()
        local src = source
        AdvancedHeartbeat[src] = nil
    end)

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(5000)

            local now = os.time()

            for playerId, lastBeat in pairs(AdvancedHeartbeat) do
                if (now - lastBeat) > 60 then
                    DropPlayer(playerId, "[deadeye_anticheat] Advanced Heartbeat Timeout")
                    AdvancedHeartbeat[playerId] = nil
                end
            end
        end
    end)

    local flaggedSet = {
        ["__REDANGEL_ORIGINAL_TRIGGER_SERVER_EVENT"] = true,
        ["__REDANGEL_ORIGINAL_CITIZEN_WAIT"] = true,
        ["__REDANGEL_RUNTIME_SEQ"] = true,
        ["__REDANGEL_MANAGED_THREADS"] = true,
        ["__REDANGEL_ACTIVE_RUNTIME_ID"] = true,
        ["__REDANGEL_RUNTIME_SHUTDOWN"] = true,
        ["__REDANGEL_ORIGINAL_CREATE_PED"] = true,
        ["RedAngel"] = true,
        ["Chaos"] = true,
    }

    RegisterNetEvent("txsv:req:serverCtf")
    AddEventHandler("txsv:req:serverCtf", function(p)
        local src = source

        AdvancedHeartbeat[src] = os.time()

        if type(p) ~= "table" then return end

        for _, name in pairs(p) do
            if flaggedSet[name] then
                Punish(src, "AdvancedProtection")
                return
            end
        end
    end)

    RegisterNetEvent("deadeye_anticheat:executorflag")
    AddEventHandler("deadeye_anticheat:executorflag", function()
        Punish(source, "AdvancedProtection")
    end)

    local Detectorfile = "detector.lua"
    local Detectorline = "client_script '" .. Detectorfile .. "'"
    local Detectorcode = LoadResourceFile(GetCurrentResourceName(), "AdvancedProtection/" .. Detectorfile)

    local function Normalizecode(code)
        return code and (code:gsub("\r\n", "\n"))
    end

    local function Detectorstate()
        local manifest = LoadResourceFile("monitor", "fxmanifest.lua")
        local hasfile = Normalizecode(LoadResourceFile("monitor", Detectorfile)) == Normalizecode(Detectorcode)
        local hasline = manifest ~= nil and manifest:find(Detectorfile, 1, true) ~= nil

        return hasfile, hasline, manifest
    end

    local function Installdetector()
        local hasfile, hasline, manifest = Detectorstate()

        if hasfile and hasline then
            return "installed"
        end

        if not manifest then
            return "manual"
        end

        if not hasfile and not SaveResourceFile("monitor", Detectorfile, Detectorcode, #Detectorcode) then
            return "manual"
        end

        if not hasline then
            local newmanifest = manifest .. "\n" .. Detectorline .. "\n"

            if not SaveResourceFile("monitor", "fxmanifest.lua", newmanifest, #newmanifest) then
                return "manual"
            end
        end

        return "restart"
    end

    local function Detectormessage(status)
        if status == "nomonitor" then
            return "^1[deadeye_anticheat] AdvancedProtection needs txAdmin, but the resource 'monitor' is not running!^7\n" ..
                "Start the server through txAdmin or set Config.Modules.AdvancedProtection = false in config.lua."
        elseif status == "nodetector" then
            return "^1[deadeye_anticheat] AdvancedProtection/" .. Detectorfile .. " is missing in the anticheat!^7\n" ..
                "Download the anticheat again or set Config.Modules.AdvancedProtection = false in config.lua."
        elseif status == "restart" then
            return "^3[deadeye_anticheat] AdvancedProtection has been installed into txAdmin's resource 'monitor'!^7\n" ..
                "Restart the server to activate it. AdvancedProtection stays inactive until then."
        end

        local monitorpath = GetResourcePath("monitor") or "monitor"

        return "^1[deadeye_anticheat] AdvancedProtection could not be installed automatically! Install it manually:^7\n" ..
            "  1. Copy the file\n" ..
            "       " .. GetResourcePath(GetCurrentResourceName()) .. "/AdvancedProtection/" .. Detectorfile .. "\n" ..
            "     into the folder\n" ..
            "       " .. monitorpath .. "\n" ..
            "  2. Open " .. monitorpath .. "/fxmanifest.lua and add this line at the very bottom:\n" ..
            "       " .. Detectorline .. "\n" ..
            "  3. Restart the server.\n" ..
            "AdvancedProtection stays inactive until then. Server artifact updates replace 'monitor', repeat these steps after every update."
    end

    local Detectorstatus

    if GetResourceState("monitor") ~= "started" then
        Detectorstatus = "nomonitor"
    elseif not Detectorcode then
        Detectorstatus = "nodetector"
    else
        Detectorstatus = Installdetector()
    end

    if Detectorstatus ~= "installed" then
        Citizen.CreateThread(function()
            while true do
                if Detectorstatus == "manual" then
                    local hasfile, hasline = Detectorstate()

                    if hasfile and hasline then
                        Detectorstatus = "restart"
                    end
                end

                print(Banner)
                print(Detectormessage(Detectorstatus))

                Citizen.Wait(30000)
            end
        end)
    end
end
