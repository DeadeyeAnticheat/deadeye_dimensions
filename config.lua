Config = {}

Config.Modules = {
    Interiors = true, --Set this to true if you want to use Interiors for changing instances
    PolyZone = true, --Set this to true if you want to use PolyZones for changing instances
    Playercount = true, --Set this to true if you only want to activate the instancing at a given player count
    Notify = true, --Set this to true if you want to notify the player when he's changing instaces
}

Config.Interiors = {
    --If you set this to true, only whitelisted interiors will change the players instance. If you set it to false all interiors will change the players instance except for blacklisted ones
    Whitelistmode = false,
    List = {
        [12290] = true,
        --[...] = true
    }
}
--You can use the command /getInteriorId to get the current interiorId

Config.PolyZone = {
    {
        name = "Saint Denis Clothing Store",
        instance = 10,
        centercoord = {x = 2554.69, y = -1166.71, z = 53.78, r = 40.0},
        coords = {
            zone = {
                vector2(2557.98, -1173.09),
                vector2(2547.19, -1173.33),
                vector2(2547.36, -1170.02),
                vector2(2557.67, -1170.02),
            },
            minZ = 0.0,
            maxZ = 73.0,
        },  
    },
}

Config.Playercount = {
    Playercount = -30, --At this playercount the instancing will be activated
    Distance = 400.0 --You don't really have to touch this
}

Config.Notifications = {
    Change = "You entered another instance!",
    Default = "You entered the default instance!"
}

local Core
if Config.Modules.Notify then
    Core = exports.vorp_core:GetCore()
end

function Notify(text, duration)
    if Config.Modules.Notify then
        Core.NotifyTip(text, duration) 
    end
end

--Here you can trigger events from client side in order to delete player horses or wagons before entering an instance for example
--It is fired a slight moment before changing instances
function InstanceChange(instance)
    if instance == 0 then --Player enters the default instance

    else --Player enters another instance

    end
end
