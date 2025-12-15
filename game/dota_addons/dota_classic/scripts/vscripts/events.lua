-- Called when the game state has changed
function GameMode:OnGameRulesStateChange(keys)
        -- Catch the current game state
        local new_state = GameRules:State_Get()

        -- Called when the game is in progress
        if new_state == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
                -- Remove the stock ancient modifiers
                Entities:FindByName(nil, "radiant_ancient"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_ancient"):RemoveModifierByName("modifier_tower_truesight_aura")

                -- Add the night time health regen modifier to radiant's structures
                Entities:FindByName(nil, "radiant_ancient"):AddNewModifier(Entities:FindByName(nil, "radiant_ancient"), nil, "modifier_health_regen_nighttime", nil)
                Entities:FindByName(nil, "radiant_ranged_mid_barracks"):AddNewModifier(Entities:FindByName(nil, "radiant_ranged_mid_barracks"), nil, "modifier_health_regen_nighttime", nil)

                -- Remove the stock fountain modifiers
                Entities:FindByName(nil, "radiant_fountain_1"):RemoveModifierByName("modifier_fountain_aura")
                Entities:FindByName(nil, "radiant_fountain_1"):RemoveModifierByName("modifier_fountain_passive")
                Entities:FindByName(nil, "radiant_fountain_1"):RemoveModifierByName("modifier_fountain_truesight_aura")
                Entities:FindByName(nil, "radiant_fountain_2"):RemoveModifierByName("modifier_fountain_aura")
                Entities:FindByName(nil, "radiant_fountain_2"):RemoveModifierByName("modifier_fountain_passive")
                Entities:FindByName(nil, "radiant_fountain_2"):RemoveModifierByName("modifier_fountain_truesight_aura")
                Entities:FindByName(nil, "dire_fountain_1"):RemoveModifierByName("modifier_fountain_aura")
                Entities:FindByName(nil, "dire_fountain_1"):RemoveModifierByName("modifier_fountain_passive")
                Entities:FindByName(nil, "dire_fountain_1"):RemoveModifierByName("modifier_fountain_truesight_aura")
                Entities:FindByName(nil, "dire_fountain_2"):RemoveModifierByName("modifier_fountain_aura")
                Entities:FindByName(nil, "dire_fountain_2"):RemoveModifierByName("modifier_fountain_passive")
                Entities:FindByName(nil, "dire_fountain_2"):RemoveModifierByName("modifier_fountain_truesight_aura")
        end
end

-- Called when a unit spawns
function GameMode:OnNPCSpawned(keys)
        -- Retrieve the spawned unit
        local unit = EntIndexToHScript(keys.entindex)

        -- Check whether the unit is a creep
        if unit:IsCreep() then
                -- Add the following modifiers to the creep
                unit:AddNewModifier(unit, nil, "modifier_health_regen_nighttime", nil)
                unit:AddNewModifier(unit, nil, "modifier_hull_radius", nil)
        end

        -- Check whether a hero spawned for the first time
        if unit:IsRealHero() and not unit.first_spawned then
                unit.first_spawned = true
                GameMode:OnHeroInGame(unit)
        end
end

-- Called by heroes when they spawn for the first time
function GameMode:OnHeroInGame(hero)
        -- Add the following modifiers to the hero
        hero:AddNewModifier(hero, nil, "modifier_health_regen", nil)
        hero:AddNewModifier(hero, nil, "modifier_health_regen_nighttime", nil)
        hero:AddNewModifier(hero, nil, "modifier_hull_radius", nil)
        hero:AddNewModifier(hero, nil, "modifier_magic_resist", nil)
end
