ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterNetEvent('Nlocation:Louer')
AddEventHandler('Nlocation:Louer', function(Vehicule, Price)
    local _src = source 
    local xPlayer = ESX.GetPlayerFromId(_src)
    if tonumber(xPlayer.getMoney()) >= tonumber(Price) then 
        xPlayer.removeMoney(Price)

        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Location', 'Véhicule', 'Votre véhicule arrive d\'ici peu !', 'CHAR_CASTRO', 1)
        Citizen.Wait(1500)
        
        TriggerClientEvent('Nlocation:spawnCar', _src, Vehicule)
        Citizen.Wait(1500)
		TriggerClientEvent('esx:showAdvancedNotification', _src, 'Location', 'Payement', "Vous avez payer ~r~"..Price.." ~s~pour ~r~une location ~s~!", 'CHAR_BANK_MAZE', 1)

    else 
        Citizen.Wait(500)
        TriggerClientEvent('esx:showAdvancedNotification', _src, 'Location', 'Payement', "Vous n'avez pas suffisament d'argent dans votre portefeuille ~s~!", 'CHAR_BANK_MAZE', 1)
    end
end)



CreateThread(function()
    if GetCurrentResourceName() ~= "Nlocation" then
        os.exit()
    end
end)

