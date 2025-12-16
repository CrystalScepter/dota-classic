-- Import game mode class
require("gamemode")

-- Precache resources
function Precache(context)
        PrecacheResource("model", "models/creeps/lane_creeps/creep_radiant_ranged/crystal_radiant_ranged.vmdl", context)
        PrecacheResource("particle", "particles/base_attacks/ti9_radiant_ranged.vpcf", context)
end

-- Called when the custom game starts
function Activate()
        -- Initialize the game mode
        GameMode():InitGameMode()
end
