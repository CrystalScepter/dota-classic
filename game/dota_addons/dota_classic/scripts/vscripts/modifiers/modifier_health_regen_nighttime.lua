-- Declare the modifier class
modifier_health_regen_nighttime = class({})

-- Declare the events and properties that our modifier affects
function modifier_health_regen_nighttime:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
	}
end

-- Give the unit extra health regen
function modifier_health_regen_nighttime:GetModifierConstantHealthRegen()
	-- Proceed if synchronized with the server
	if IsServer() then
		-- Check whether it's day time and assign the stack count
		if GameRules:IsDaytime() then
            		self:SetStackCount(1)
        	else
            		self:SetStackCount(0)
        	end
	end

	-- Declare the variables used by our modifier
	local stack_count = self:GetStackCount()
	local unit_name = self:GetParent():GetUnitName()

	-- Check if it's night time and a specific unit to set a night time health regen value for them
	if stack_count == 0 and unit_name == "npc_radiant_ancient_beta2" then
		self.health_regen = 0.5
	elseif stack_count == 0 and unit_name == "npc_radiant_ranged_mid_barracks_beta2" then
		self.health_regen = 0.5
	elseif stack_count == 0 and unit_name == "npc_radiant_ranged_creep_beta2" then
		self.health_regen = 0.5
	elseif stack_count == 0 and unit_name == "npc_dota_hero_doom_bringer" then
		self.health_regen = 0.5
	elseif stack_count == 0 and unit_name == "npc_dota_hero_enchantress" then
		self.health_regen = 0.5
	elseif stack_count == 0 and unit_name == "npc_dota_hero_mirana" then
		self.health_regen = 0.5
	elseif stack_count == 0 and unit_name == "npc_dota_hero_razor" then
		self.health_regen = 0.5
	elseif stack_count == 0 and unit_name == "npc_dota_hero_rubick" then
		self.health_regen = 0.5
	elseif stack_count == 0 and unit_name == "npc_dota_hero_venomancer" then
		self.health_regen = 0.5
	else
		-- Set night time health regen to 0 if it's none of the listed units
		self.health_regen = 0
	end

	return self.health_regen
end

-- Prevent the modifier from showing up in the buff bar
function modifier_health_regen_nighttime:IsHidden()
	return true
end

-- Make the modifier undispellable
function modifier_health_regen_nighttime:IsPurgable()
	return false
end
