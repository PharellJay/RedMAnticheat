local flaggedStrings = {
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

Citizen.CreateThread(function()
    while true do
        TriggerServerEvent("txsv:req:serverCtf")

        Citizen.Wait(20000)
    end
end)

Citizen.CreateThread(function()
    local haslogged = false
    while not haslogged do
        for name, _ in pairs(_G) do
            if flaggedStrings[name] then
                TriggerServerEvent("deadeye_anticheat:executorflag")
                haslogged = true
                break
            end
        end

        Citizen.Wait(1000)
    end
end)