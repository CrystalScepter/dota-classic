-- Declare the item class
tower_blight_aura_beta2 = class({})

-- Link the modifiers that are going to be used by our item
LinkLuaModifier("modifier_tower_blight_aura_beta2", "abilities/buildings/tower_blight_aura_beta2", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_tower_blight_aura_regen_beta2", "abilities/buildings/tower_blight_aura_beta2", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function tower_blight_aura_beta2:GetIntrinsicModifierName()
	return "modifier_tower_blight_aura_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_tower_blight_aura_beta2 = class({})

-- Called when the modifier is created
function modifier_tower_blight_aura_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.radius = self:GetAbility():GetSpecialValueFor("radius")
end

-- Indicate that the item has an aura
function modifier_tower_blight_aura_beta2:IsAura()
	return true
end

-- Return the name of the aura modifier
function modifier_tower_blight_aura_beta2:GetModifierAura()
	return "modifier_tower_blight_aura_regen_beta2"
end

-- Reveal only enemy units
function modifier_tower_blight_aura_beta2:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

-- Allow the aura to reveal only heroes, creeps and summons
function modifier_tower_blight_aura_beta2:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP
end

-- Return the radius of the aura
function modifier_tower_blight_aura_beta2:GetAuraRadius()
	return self.radius
end

-- Prevent the modifier from showing up in the buff bar
function modifier_tower_blight_aura_beta2:IsHidden()
	return true
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_tower_blight_aura_regen_beta2 = class({})

-- Called when the modifier is created
function modifier_tower_blight_aura_regen_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.health_regen = self:GetAbility():GetSpecialValueFor("health_regen")
	self.lesser_regen = self:GetAbility():GetSpecialValueFor("health_regen") / 2
end

-- Declare the events and properties that our modifier affects
function modifier_tower_blight_aura_regen_beta2:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
	}
end

-- Give the unit extra health regen
function modifier_tower_blight_aura_regen_beta2:GetModifierConstantHealthRegen()
	-- Declare the variables used by our modifier
	local unit_name = self:GetParent():GetUnitName()

	-- Check if it's a specific unit
	if unit_name == "npc_dire_melee_creep_beta2" then
		self.actual_health_regen = self.health_regen
	elseif unit_name == "npc_dire_ranged_creep_beta2" then
		self.actual_health_regen = self.health_regen
	elseif unit_name == "npc_dota_hero_lycan" then
		self.actual_health_regen = self.health_regen
	elseif unit_name == "npc_dota_hero_necrolyte" then
		self.actual_health_regen = self.lesser_regen
	elseif unit_name == "npc_dota_hero_templar_assassin" then
		self.actual_health_regen = self.lesser_regen
	elseif unit_name == "npc_dota_hero_life_stealer" then
		self.actual_health_regen = self.lesser_regen
	else
		-- Set the health regen to 0 if it's none of the listed units
		self.actual_health_regen = 0
	end
	
	return self.actual_health_regen
end

-- Prevent the modifier from showing up in the buff bar
function modifier_tower_blight_aura_regen_beta2:IsHidden()
	return true
end
