
data = {}
TriggerEvent("redemrp_inventory:getData",function(call)
    data = call
end)

RegisterServerEvent("RegisterUsableItem:badge")
AddEventHandler("RegisterUsableItem:badge", function(source)
	local _source = tonumber(source)
    TriggerClientEvent("gravvy_badge:client:badgenui", _source)
end)

RegisterServerEvent("gravvy_badge:server:badgenui")
AddEventHandler("gravvy_badge:server:badgenui", function(playerlist)
    local _source = tonumber(source)
    TriggerEvent("redemrp:getPlayerFromId", _source, function(user)
        local ItemData = data.getItem(_source, "badge")
        if ItemData.ItemAmount >= 1 then
            for k, v in pairs(playerlist) do
                TriggerClientEvent("gravvy_badge:client:showbadge", _source)
            end
        end
    end)
end)

RegisterServerEvent("gravvy_badge:server:showBadge")
AddEventHandler("gravvy_badge:server:showBadge", function()
    local _source = tonumber(source)
    TriggerEvent("redemrp:getPlayerFromId", _source, function(user)
        local ItemData = data.getItem(_source, "badge")
        if ItemData.ItemAmount >= 1 then
            TriggerClientEvent("gravvy_badge:client:animation", _source)
            TriggerClientEvent("gravvy_badge:client:badgenui", _source)
        end
    end)
end)

RegisterServerEvent("gravvy_badge:server:checkJob")
AddEventHandler("gravvy_badge:server:checkJob", function()
    local _source = tonumber(source)
    TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
        local ItemData = data.getItem(_source, "badge")
        if ItemData.ItemAmount >= 1 then
            local _job = tostring(user.getJob())
            if _job == "police" then
                TriggerClientEvent("gravvy_badge:client:isAuthorized", _source)
            end
        end
    end)
end)