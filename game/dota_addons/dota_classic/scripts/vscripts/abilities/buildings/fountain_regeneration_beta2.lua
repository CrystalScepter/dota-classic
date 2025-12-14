-- Declare the ability class
fountain_regeneration_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_fountain_regeneration_beta2", "abilities/buildings/fountain_regeneration_beta2.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_fountain_regeneration_buff_beta2", "abilities/buildings/fountain_regeneration_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function fountain_regeneration_beta2:GetIntrinsicModifierName()
	return "modifier_fountain_regeneration_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_fountain_regeneration_beta2 = class({})

-- Called when the modifier is created
function modifier_fountain_regeneration_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.radius = self:GetAbility():GetSpecialValueFor("radius")
end

-- Prevent the modifier from showing up in the buff bar
function modifier_fountain_regeneration_beta2:IsHidden()
	return true
end

-- Indicate that modifier is an aura
function modifier_fountain_regeneration_beta2:IsAura()
	return true
end

-- Return the name of the aura modifier
function modifier_fountain_regeneration_beta2:GetModifierAura()
	return "modifier_fountain_regeneration_buff_beta2"
end

-- Restrict the aura to both teams
function modifier_fountain_regeneration_beta2:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_BOTH
end

-- Allow the aura to affect only heroes and creeps
function modifier_fountain_regeneration_beta2:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP
end

-- Return the radius of the aura
function modifier_fountain_regeneration_beta2:GetAuraRadius()
	return self.radius
end

----------------------------------------------------------------------------------------------------
-- Buff Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_fountain_regeneration_buff_beta2 = class({})

-- Called when the modifier is created
function modifier_fountain_regeneration_buff_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.health_regen = self:GetAbility():GetSpecialValueFor("health_regen")
	self.mana_regen = self:GetAbility():GetSpecialValueFor("mana_regen")
end

-- Declare the events and properties that our modifier affects
function modifier_fountain_regeneration_buff_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_HEALTH_REGEN_PERCENTAGE,
		MODIFIER_PROPERTY_MANA_REGEN_TOTAL_PERCENTAGE,
        }
end

-- Restore the unit's health
function modifier_fountain_regeneration_buff_beta2:GetModifierHealthRegenPercentage()
        return self.health_regen
end

-- Restore the unit's mana
function modifier_fountain_regeneration_buff_beta2:GetModifierTotalPercentageManaRegen()
        return self.mana_regen
end
