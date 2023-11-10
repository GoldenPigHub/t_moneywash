lib.locale()

RegisterServerEvent("t_washMoney:done")
AddEventHandler('t_washMoney:done', function ()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)
    local item = Config.item
    local money = xPlayer.getInventoryItem(item) 
    

    if money.count >= Config.amount then
        xPlayer.removeInventoryItem(Config.item, money.count)
        xPlayer.addMoney(money.count * Config.tax)
    else
        TriggerClientEvent('error', src)
    end
end)