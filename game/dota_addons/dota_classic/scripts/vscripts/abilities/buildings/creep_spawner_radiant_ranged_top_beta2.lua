-- Declare the ability class
creep_spawner_radiant_ranged_top_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_creep_spawner_radiant_ranged_top_beta2", "abilities/buildings/creep_spawner_radiant_ranged_top_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function creep_spawner_radiant_ranged_top_beta2:GetIntrinsicModifierName()
	return "modifier_creep_spawner_radiant_ranged_top_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_creep_spawner_radiant_ranged_top_beta2 = class({})

-- Called when the modifier is created
function modifier_creep_spawner_radiant_ranged_top_beta2:OnCreated(keys)
	-- Proceed if synchronized with the server
        if IsServer() then
		-- Retrieve the ability values that are going to be used by our modifier
		self.spawn_rate = self:GetAbility():GetSpecialValueFor("spawn_rate")
		self.creep_count = self:GetAbility():GetSpecialValueFor("creep_count")

		-- Start the thinking function
                self:StartIntervalThink(self.spawn_rate)
	end
end

-- Called when the modifier ticks
function modifier_creep_spawner_radiant_ranged_top_beta2:OnIntervalThink()
	-- Retrieve the values that are going to be used when the modifier thinks
	local spawner_name = "lane_top_spawner_goodguys"
	local destination_name = "lane_top_pathcorner_goodguys_1"
	local destination_name_2 = "lane_mid_pathcorner_goodguys_1"
	local unit_to_spawn = "npc_radiant_ranged_creep_beta2"
	local number_of_units = self.creep_count
	local team = DOTA_TEAM_GOODGUYS
	local point = Entities:FindByName(nil, spawner_name):GetAbsOrigin()
	local waypoint = Entities:FindByName(nil, destination_name):GetAbsOrigin()
	local waypoint_2 = Entities:FindByName(nil, destination_name_2):GetAbsOrigin()

	-- Loops through all units to be spawned
	for i = 1, number_of_units do
		-- Spawn the unit
		local unit = CreateUnitByName(unit_to_spawn, point, true, nil, nil, team)

		-- Defines the order to be given
		local order = {
			UnitIndex = unit:GetEntityIndex(),
        		OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
       			Position = waypoint,
        		Queue = true
		}

		-- Defines the order to be given
		local order_2 = {
			UnitIndex = unit:GetEntityIndex(),
        		OrderType = DOTA_UNIT_ORDER_ATTACK_MOVE,
       			Position = waypoint_2,
        		Queue = true
		}

		-- Execute the order from the table
		ExecuteOrderFromTable(order)
		ExecuteOrderFromTable(order_2)
	end
end

-- Prevent the modifier from showing up in the buff bar
function modifier_creep_spawner_radiant_ranged_top_beta2:IsHidden()
	return true
end

-- Make the modifier undispellable
function modifier_creep_spawner_radiant_ranged_top_beta2:IsPurgable()
        return false
end
