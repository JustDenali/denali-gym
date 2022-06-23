local QBCore = exports['qb-core']:GetCoreObject()

-----new, completely new
RegisterServerEvent('denali-gym:giveMembership')
AddEventHandler('denali-gym:giveMembership', function()
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src) 
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['gym_membership'], "add") 
    Player.Functions.AddItem('gym_membership', 1) 
end)

RegisterServerEvent('denali-gym:removeMembership')
AddEventHandler('denali-gym:removeMembership', function()
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src) 
    TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['gym_membership'], "remove") 
    Player.Functions.AddItem('gym_membership', 1) 
end)

QBCore.Functions.CreateCallback('denali-gym:getMembership',function(source, cb)
    local src = source 
    local Player = QBCore.Functions.GetPlayer(src)
    local pass = Player.Functions.GetItemByName('gym_membership')
    if pass ~= nil then 
        cb(true)
    else 
        cb(false)
    end
end)

RegisterNetEvent('denali-gym:server:BillPlayer', function(playerId, price)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local OtherPlayer = QBCore.Functions.GetPlayer(playerId)
    if Player.PlayerData.job.name == "gym" then
        if OtherPlayer then
            OtherPlayer.Functions.RemoveMoney("bank", price, "paid-bills")
            TriggerEvent('qb-bossmenu:server:addAccountMoney', "gym", price)
            TriggerClientEvent('QBCore:Notify', OtherPlayer.PlayerData.source, "You received a bill of $" .. price)
        end
    end
end)
