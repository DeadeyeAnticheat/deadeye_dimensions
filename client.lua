if GetResourceState("deadeye_dimensions") == "started" then
    local isInDimension = 0

    local playercount = 0

    local isInInterior = false
    local isInPolyzone = false

    if Config.Modules.Interiors then
        Citizen.CreateThread(function()
            while LocalPlayer.state.IsInSession == false do
                Citizen.Wait(1000)
            end

            while true do
                if isInPolyzone == false then
                    if playercount >= Config.Playercount.Playercount or isInDimension ~= 0 or Config.Modules.Playercount == false then
                        local playerPed = PlayerPedId()
                        local interior = GetInteriorFromEntity(playerPed)
                        if interior ~= 0 then
                            if isInDimension == 0 then
                                if Config.Interiors.Whitelistmode then
                                    if Config.Interiors.List[interior] then
                                        isInInterior = true
                                        InstanceChange(tonumber(interior))
                                        local relatedEntities, leadhorse = OwnedEntities(playerPed)
                                        TriggerServerEvent("deadeye_dimensions:changedimension", tonumber(interior),
                                            relatedEntities, leadhorse)
                                        Citizen.Wait(200)
                                    end
                                else
                                    if not Config.Interiors.List[interior] then
                                        isInInterior = true
                                        InstanceChange(tonumber(interior))
                                        local relatedEntities, leadhorse = OwnedEntities(playerPed)
                                        TriggerServerEvent("deadeye_dimensions:changedimension", tonumber(interior),
                                            relatedEntities, leadhorse)
                                        Citizen.Wait(200)
                                    end
                                end
                            end
                        else
                            if isInDimension ~= 0 then
                                isInInterior = false
                                InstanceChange(0)
                                local relatedEntities, leadhorse = OwnedEntities(playerPed)
                                TriggerServerEvent("deadeye_dimensions:changedimension", 0, relatedEntities, leadhorse)
                                Citizen.Wait(200)
                            end
                        end
                    end
                end

                Citizen.Wait(200)
            end
        end)

        RegisterCommand("getInteriorId", function()
            print(GetInteriorFromEntity(PlayerPedId()))
        end, false)
    end

    if Config.Modules.PolyZone then
        Citizen.CreateThread(function()
            while LocalPlayer.state.IsInSession == false do
                Citizen.Wait(1000)
            end

            local PolyZones = {}

            for _, zone in ipairs(Config.PolyZone) do
                PolyZones[_] = PolyZone:Create(zone.coords.zone, {
                    name = zone.name,
                    minZ = zone.coords.minZ,
                    maxZ = zone.coords.maxZ,
                    debugGrid = false,
                    gridDivisions = 30,
                })

                PolyZones[_]:onPointInOut(PolyZone.getPlayerPosition, function(isPointInside, point)
                    if isInInterior == false then
                        if playercount >= Config.Playercount.Playercount or isInDimension ~= 0 or Config.Modules.Playercount == false then
                            local playerPed = PlayerPedId()
                            if isPointInside then
                                if isInDimension == 0 then
                                    isInPolyzone = true
                                    InstanceChange(tonumber(zone.instance))
                                    local relatedEntities, leadhorse = OwnedEntities(playerPed)
                                    TriggerServerEvent("deadeye_dimensions:changedimension", tonumber(zone.instance),
                                        relatedEntities, leadhorse)
                                end
                            else
                                if isInDimension ~= 0 then
                                    isInPolyzone = false
                                    InstanceChange(0)
                                    local relatedEntities, leadhorse = OwnedEntities(playerPed)
                                    TriggerServerEvent("deadeye_dimensions:changedimension", 0, relatedEntities,
                                        leadhorse)
                                end
                            end
                        end
                    end
                end)
            end
        end)
    end

    if Config.Modules.Playercount then
        Citizen.CreateThread(function()
            while LocalPlayer.state.IsInSession == false do
                Citizen.Wait(1000)
            end

            while true do
                local c = 0
                local playerPed = PlayerPedId()
                local coords = GetEntityCoords(playerPed)

                for _, player in ipairs(GetActivePlayers()) do
                    local targetCoords = GetEntityCoords(GetPlayerPed(player))
                    local coordDistance = #(coords - targetCoords)
                    if coordDistance < Config.Playercount.Distance then
                        c = c + 1
                    end
                end

                playercount = c

                Citizen.Wait(5000)
            end
        end)
    end

    RegisterNetEvent("deadeye_dimensions:confirmdimension")
    AddEventHandler("deadeye_dimensions:confirmdimension", function(dimension, leadhorse)
        isInDimension = tonumber(dimension)
        if dimension ~= 0 then
            Notify(Config.Notifications.Change, 2000)
        else
            Notify(Config.Notifications.Default, 2000)
        end
        Citizen.Wait(50)
        if leadhorse then
            local horse = NetworkGetEntityFromNetworkId(leadhorse)
            if DoesEntityExist(horse) then
                TaskLeadHorse(PlayerPedId(), horse)
            end
        end
    end)

    local entities = {}
    local ledNetId = nil
    function AddEntity(entity)
        local netId = NetworkGetNetworkIdFromEntity(entity)
        if netId and netId ~= 0 then
            entities[#entities + 1] = netId
            return netId
        end
        return nil
    end

    function ValidEntity(entity)
        return entity ~= 0 and DoesEntityExist(entity) and NetworkGetEntityOwner(entity) == PlayerId() and
            NetworkGetEntityIsNetworked(entity)
    end

    function OwnedEntities(ped)
        entities = {}
        ledNetId = nil

        AddEntity(ped)

        local mount = GetMount(ped)
        if ValidEntity(mount) then
            AddEntity(mount)
        end

        if IsPedLeadingHorse(ped) then
            local ledMount = GetLastLedMount(ped)
            if ValidEntity(ledMount) then
                ledNetId = AddEntity(ledMount)
                TaskStopLeadingHorse(ped)
            end
        end

        local vehicle = GetVehiclePedIsIn(ped, false)
        if ValidEntity(vehicle) then
            AddEntity(vehicle)
        end

        local objects = GetGamePool("CObject")
        for i = 1, #objects do
            local object = objects[i]
            if ValidEntity(object) then
                local entityAttached = IsEntityAttachedToEntity(object, ped)
                if entityAttached then
                    AddEntity(object)
                end
            end
        end

        return entities, ledNetId
    end
end
