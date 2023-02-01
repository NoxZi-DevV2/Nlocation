ESX = nil
open = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


Citizen.CreateThread(function()
    while true do
        local interval = 500
        local pedplayer = PlayerPedId()
        local distance = GetDistanceBetweenCoords(GetEntityCoords(pedplayer), Config.Position, true)
        if distance <= 1.5 then
            marker = DrawMarker(2, Config.Position.x, Config.Position.y, Config.Position.z, 0.0, 0.0, 0.0, 0.0, 0.0, 360.0, 0.6, 0.6, 0.6, 51, 182, 253, 100)
            interval = 0
        end
        if distance <= 1.2 then
            if IsControlJustPressed(1, 51) then
              Nlocation()
            end 
        end
        Wait(interval)
    end 
end)

function Nlocation()
        SetNuiFocus(true, true)
        SendNUIMessage({
            action = 'show',
        })
        open = true
end

function CloseNlocation()
    SetNuiFocus(false, false)
    SendNUIMessage({
        action = 'hide',
    })
    open = false
end

RegisterNUICallback('closeMenu', function(data, cb)
    SetNuiFocus(false, false)
    CloseNlocation()
    open = false 
end)

RegisterNUICallback('ShowLouerCar1', function( Vehicule, Price)
    CloseNlocation()
    local Vehicule = "panto"
    local Price = 90
    TriggerServerEvent('Nlocation:Louer', Vehicule, Price)
    
end)

RegisterNUICallback('ShowLouerCar2', function( Vehicule, Price)
    local Vehicule = "blista"
    local Price = 110
    CloseNlocation()
    TriggerServerEvent('Nlocation:Louer',  Vehicule, Price)
    
end)

RegisterNUICallback('ShowLouerCar3', function( Vehicule, Price)
    local Vehicule = "faggio"
    local Price = 50
    CloseNlocation()
    TriggerServerEvent('Nlocation:Louer',  Vehicule, Price)
    
end)

RegisterNUICallback('ShowLouerCar4', function( Vehicule, Price)
    local Vehicule = "bmx"
    local Price = 20
    CloseNlocation()
    TriggerServerEvent('Nlocation:Louer',  Vehicule, Price)
    
end)


RegisterNetEvent('Nlocation:spawnCar')
AddEventHandler('Nlocation:spawnCar', function(Vehicule)
    local playerped = PlayerPedId()
    RequestModel(GetHashKey(Vehicule))
    while not HasModelLoaded(GetHashKey(Vehicule)) do Citizen.Wait(10) end 
    local Vehicule = CreateVehicle(GetHashKey(Vehicule), -491.84, -668.81, 32.15, 270.46, true, false)
    SetVehicleNumberPlateText(Vehicule, "Location")
    SetEntityAsMissionEntity(Vehicule, true, true)

    Citizen.SetTimeout(Config.DeleteTime, function()
        TaskLeaveAnyVehicle(GetPlayerPed(-1), true, false)
        Wait(1000)
        ESX.Game.DeleteVehicle(vehicle)
    end)
end)


Citizen.CreateThread(function()
    local locblips = Config.Blips
    SetBlipSprite(locblips , 268)
    SetBlipColour(locblips , 57)
    SetBlipScale(locblips , 0.7)
    SetBlipAsShortRange(locblips , true)
    BeginTextCommandSetBlipName('STRING')
    AddTextComponentString("~b~Location")
    EndTextCommandSetBlipName(locblips )
end)


Citizen.CreateThread(function()
    local hash = GetHashKey("cs_bankman")
    local pedpos = Config.Peds

    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end

    ped = CreatePed("PED_TYPE_CIVMALE", "cs_bankman", pedpos.x, pedpos.y, pedpos.z, 180.51, false, true) --Emplacement du PEDS
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
end)




