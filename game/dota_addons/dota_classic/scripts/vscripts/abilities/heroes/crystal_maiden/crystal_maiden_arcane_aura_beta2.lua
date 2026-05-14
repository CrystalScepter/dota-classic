-- Declare the ability class
crystal_maiden_arcane_aura_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_crystal_maiden_arcane_aura_beta2", "abilities/heroes/crystal_maiden/crystal_maiden_arcane_aura_beta2.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_crystal_maiden_arcane_aura_buff_beta2", "abilities/heroes/crystal_maiden/crystal_maiden_arcane_aura_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function crystal_maiden_arcane_aura_beta2:GetIntrinsicModifierName()
	return "modifier_crystal_maiden_arcane_aura_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_crystal_maiden_arcane_aura_beta2 = class({})

-- Called when the modifier is created
function modifier_crystal_maiden_arcane_aura_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.radius = self:GetAbility():GetSpecialValueFor("radius")
end

-- Prevent the modifier from showing up in the buff bar
function modifier_crystal_maiden_arcane_aura_beta2:IsHidden()
	return true
end

-- Indicate that modifier is an aura
function modifier_crystal_maiden_arcane_aura_beta2:IsAura()
	return true
end

-- Return the name of the aura modifier
function modifier_crystal_maiden_arcane_aura_beta2:GetModifierAura()
	return "modifier_crystal_maiden_arcane_aura_buff_beta2"
end

-- Restrict the aura to only allied units
function modifier_crystal_maiden_arcane_aura_beta2:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

-- Allow the aura to affect only heroes and creeps
function modifier_crystal_maiden_arcane_aura_beta2:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP
end

-- Return the radius of the aura
function modifier_crystal_maiden_arcane_aura_beta2:GetAuraRadius()
	return self.radius
end

----------------------------------------------------------------------------------------------------
-- Buff Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_crystal_maiden_arcane_aura_buff_beta2 = class({})

-- Called when the modifier is created
function modifier_crystal_maiden_arcane_aura_buff_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.mana_regen_increase = self:GetAbility():GetSpecialValueFor("mana_regen_increase")
end

-- Declare the events and properties that our modifier affects
function modifier_crystal_maiden_arcane_aura_buff_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_MP_REGEN_AMPLIFY_PERCENTAGE,
        }
end

-- Increase the unit's mana regen
function modifier_crystal_maiden_arcane_aura_buff_beta2:GetModifierMPRegenAmplify_Percentage()
        return self.mana_regen_increase
end
