-- Called when the game state has changed
function GameMode:OnGameRulesStateChange(keys)
        -- Catch the current game state
        local new_state = GameRules:State_Get()

        -- Called when the game is in progress
        if new_state == DOTA_GAMERULES_STATE_GAME_IN_PROGRESS then
                -- Remove the stock ancient modifiers
                Entities:FindByName(nil, "radiant_ancient"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_ancient"):RemoveModifierByName("modifier_tower_truesight_aura")

                -- Remove the stock tower modifiers
                Entities:FindByName(nil, "radiant_tower_top_1"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_top_2"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_top_3"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_top_4"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_mid_1"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_mid_2"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_mid_3"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_mid_4"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_bot_1"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_bot_2"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_bot_3"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_bot_4"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_base_1"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_base_2"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_base_3"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_base_4"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_top_1"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_top_2"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_top_3"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_top_4"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_mid_1"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_mid_2"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_mid_3"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_mid_4"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_bot_1"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_bot_2"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_bot_3"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_bot_4"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_base_1"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_base_2"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_base_3"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "dire_tower_base_4"):RemoveModifierByName("modifier_tower_truesight_aura")
                Entities:FindByName(nil, "radiant_tower_top_1"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_top_2"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_top_3"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_top_4"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_mid_1"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_mid_2"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_mid_3"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_mid_4"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_bot_1"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_bot_2"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_bot_3"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_bot_4"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_base_1"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_base_2"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_base_3"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "radiant_tower_base_4"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_top_1"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_top_2"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_top_3"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_top_4"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_mid_1"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_mid_2"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_mid_3"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_mid_4"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_bot_1"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_bot_2"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_bot_3"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_bot_4"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_base_1"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_base_2"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_base_3"):RemoveModifierByName("modifier_tower_aura")
                Entities:FindByName(nil, "dire_tower_base_4"):RemoveModifierByName("modifier_tower_aura")

                -- Add the night time health regen modifier to radiant's structures
                Entities:FindByName(nil, "radiant_ancient"):AddNewModifier(Entities:FindByName(nil, "radiant_ancient"), nil, "modifier_health_regen_nighttime", nil)
                Entities:FindByName(nil, "radiant_melee_top_barracks"):AddNewModifier(Entities:FindByName(nil, "radiant_ranged_mid_barracks"), nil, "modifier_health_regen_nighttime", nil)
                Entities:FindByName(nil, "radiant_melee_mid_barracks"):AddNewModifier(Entities:FindByName(nil, "radiant_ranged_mid_barracks"), nil, "modifier_health_regen_nighttime", nil)
                Entities:FindByName(nil, "radiant_melee_bot_barracks"):AddNewModifier(Entities:FindByName(nil, "radiant_ranged_mid_barracks"), nil, "modifier_health_regen_nighttime", nil)
                Entities:FindByName(nil, "radiant_ranged_top_barracks"):AddNewModifier(Entities:FindByName(nil, "radiant_ranged_mid_barracks"), nil, "modifier_health_regen_nighttime", nil)
                Entities:FindByName(nil, "radiant_ranged_mid_barracks"):AddNewModifier(Entities:FindByName(nil, "radiant_ranged_mid_barracks"), nil, "modifier_health_regen_nighttime", nil)
                Entities:FindByName(nil, "radiant_ranged_bot_barracks"):AddNewModifier(Entities:FindByName(nil, "radiant_ranged_mid_barracks"), nil, "modifier_health_regen_nighttime", nil)

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

                -- Remove the stock filler building modifiers
                Entities:FindByName(nil, "radiant_filler_1"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "radiant_filler_2"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "radiant_filler_3"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "radiant_filler_4"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "radiant_filler_5"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "radiant_filler_6"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "radiant_filler_7"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "radiant_filler_8"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "radiant_filler_9"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "radiant_filler_10"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "radiant_filler_11"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "radiant_filler_12"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "radiant_filler_13"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "radiant_filler_14"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_1"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_2"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_3"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_4"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_5"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_6"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_7"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_8"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_9"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_10"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_11"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_12"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_13"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_14"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_15"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_16"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_17"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_18"):RemoveModifierByName("modifier_invulnerable")
                Entities:FindByName(nil, "dire_filler_19"):RemoveModifierByName("modifier_invulnerable")
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

-- Called when a unit dies
function GameMode:OnEntityKilled(keys)
	-- Retrieve the unit that was killed
	local killed_unit = EntIndexToHScript(keys.entindex_killed)

	-- Proceed if the killed unit is a hero
	if killed_unit:IsRealHero() then
		-- Return if the unit is reincarnating
		if killed_unit:IsReincarnating() then
			return
		end

                -- Pull a random slot and grab its respective item
                local item_slot = RandomInt(0, 5)
                local item_to_drop = killed_unit:GetItemInSlot(item_slot)

                -- Check if there's an item to drop
                if item_to_drop then
                        -- Drop the item
                        killed_unit:DropItemAtPositionImmediate(item_to_drop, killed_unit:GetAbsOrigin())
                end

		-- Retrieve the level of the killed hero
		local hero_level = killed_unit:GetLevel()

		-- Set the level multiplier for the respawn timer
		local level_multiplier = 10

		-- Calculate the respawn timer
		local respawn_time = hero_level * level_multiplier

		-- Set the respawn timer for the hero
		killed_unit:SetTimeUntilRespawn(respawn_time)
	end
end
