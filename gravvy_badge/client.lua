local isAuthorized = false

RegisterCommand("badge", function(source, args)
    TriggerServerEvent("gravvy_badge:server:checkJob")
end)

RegisterNetEvent("gravvy_badge:client:isAuthorized")
AddEventHandler("gravvy_badge:client:isAuthorized", function()
    isAuthorized = true
    TriggerEvent("gravvy_badge:client:animation")
    TriggerEvent("gravvy_badge:client:badgenui")
end)

RegisterNetEvent("gravvy_badge:client:animation")
AddEventHandler("gravvy_badge:client:animation", function()
    Citizen.CreateThread(function()
        local ped = PlayerPedId()
        TaskStartScenarioInPlace(ped, GetHashKey("WORLD_HUMAN_BADASS"), -1, true, false, false, false)
        Wait(3000)
        ClearPedTasks(ped)
    end)
end)

RegisterNetEvent("gravvy_badge:client:badgenui")
AddEventHandler("gravvy_badge:client:badgenui", function()
    local players = GetPlayers()
    local playerlist = {}
    for k, v in pairs(players) do
        table.insert(playerlist, GetPlayerServerId(v))
    end

    TriggerServerEvent("gravvy_badge:server:badgenui", playerlist)
end)

RegisterNetEvent("gravvy_badge:client:showbadge")
AddEventHandler("gravvy_badge:client:showbadge", function()
    SendNUIMessage({
        action = "open",
    })
    Citizen.Wait(3000)
    SendNUIMessage({
        action = "close"
    })
end)

function GetPlayers()
    local players = {}
    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end
    return players
end