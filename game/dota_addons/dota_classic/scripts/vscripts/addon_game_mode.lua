-- Import game mode class
require("gamemode")

-- Precache resources
function Precache(context)
        PrecacheResource("model", "models/creeps/lane_creeps/creep_2021_radiant/creep_2021_radiant_ranged.vmdl", context)
end

-- Called when the custom game starts
function Activate()
        -- Initialize the game mode
        GameMode():InitGameMode()
end
