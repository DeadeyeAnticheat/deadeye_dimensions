if GetCurrentResourceName() ~= "deadeye_dimensions" then
    print("You are not permitted to rename the script. Change the name to 'deadeye_dimensions' again!")
else
   RegisterNetEvent("deadeye_dimensions:changedimension")
   AddEventHandler("deadeye_dimensions:changedimension", function (dimension, entityList, leadhorse )
        local src = source

        if (GetPlayerRoutingBucket(src) == 0 and dimension ~= 0) or (dimension == 0) then
            TriggerClientEvent("deadeye_dimensions:confirmdimension", src, dimension, leadhorse)
            SetPlayerRoutingBucket(src, dimension)

            if type(entityList) == "table" then
                for _, netId in pairs(entityList) do
                    local entity = NetworkGetEntityFromNetworkId(netId)
                    if entity and DoesEntityExist(entity) then
                        SetEntityRoutingBucket(entity, dimension)
                    end
                end
            end
        end
   end)
end