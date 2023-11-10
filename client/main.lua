lib.locale()

------------------------
----------START---------
------------------------
Citizen.CreateThread(function ()
    if Config.blip == true then
        blipp = CreateBlip(Config.blipc.x, Config.blipc.y, Config.blipc.z, Config.blipSprite, 46, Config.blipName)
    end
    SpawnNPC1()
end)

------------------------
-------BLIP CREATE------
------------------------

function CreateBlip(x, y, z, sprite, color, name)
    local blip = AddBlipForCoord(x, y, z)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, color)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(name)
    EndTextCommandSetBlipName(blip)
    SetBlipDisplay(blip, 6)
    return blip
end


------------------------
-------SPAWN-NPC--------
------------------------

function SpawnNPC1()
    local peds = {
        { type=4, model=Config.npc}
    }

    for k, v in pairs(peds) do
        local hash = GetHashKey(v.model)
        RequestModel(hash)

        while not HasModelLoaded(hash) do
            Citizen.Wait(1)
        end

        --- SPAWN NPC---
        startNPC = CreatePed(v.type, hash, Config.blipc.x, Config.blipc.y, Config.blipc.z -1, Config.bliph, true, true)

        SetEntityInvincible(startNPC, true)
        SetEntityAsMissionEntity(startNPC, true)
        SetBlockingOfNonTemporaryEvents(startNPC, true)
        FreezeEntityPosition(startNPC, true)
    end
end

RegisterNetEvent('moneywash_start', function (arg)
    lib.registerContext({
        id = 'moneywash_start',
        title = locale('title'),
        options = {
            {
                title = locale('title'),
                description = locale('description'),
                icon = 'dollar',
                event = 'money'
            },
        
        }
    })
    lib.showContext('moneywash_start')
end)

AddEventHandler('money', function ()

    lib.progressCircle({
        duration = 5000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = true
    })
    
    washMoney()
end)

function washMoney()
    TriggerServerEvent('t_washMoney:done')
end

AddEventHandler('error')
RegisterNetEvent('error', function ()
    lib.notify({
        title = locale('error'),
        type = 'error'
    })
end)

exports.ox_target:addBoxZone({
    coords = vector3(-18.6638, 218.9942, 106.7442),
    size = vec3(2, 2, 2),
    rotation = 45,
    debug = drawZones,
    options = {
        {
            name = 'moneywash_start',
            event = 'moneywash_start',
            icon = 'fa-solid fa-cube',
            label = 'Wash money!',
        }
    }
})
