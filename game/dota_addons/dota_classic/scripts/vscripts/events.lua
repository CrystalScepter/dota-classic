-- Called when a unit spawns
function GameMode:OnNPCSpawned(keys)
        -- Retrieve the spawned unit
        local unit = EntIndexToHScript(keys.entindex)

        -- Check whether a hero spawned for the first time
        if unit:IsRealHero() and not unit.first_spawned then
                unit.first_spawned = true
                GameMode:OnHeroInGame(unit)
        end
end

-- Called by heroes when they spawn for the first time
function GameMode:OnHeroInGame(hero)
        -- Add the following modifiers to the hero
        hero:AddNewModifier(hero, nil, "modifier_magic_resist", nil)
        hero:AddNewModifier(hero, nil, "modifier_health_regen", nil)
        hero:AddNewModifier(hero, nil, "modifier_hull_radius", nil)
end
