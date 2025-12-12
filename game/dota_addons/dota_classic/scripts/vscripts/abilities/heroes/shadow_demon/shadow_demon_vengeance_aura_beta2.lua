-- Declare the ability class
shadow_demon_vengeance_aura_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_shadow_demon_vengeance_aura_beta2", "abilities/heroes/shadow_demon/shadow_demon_vengeance_aura_beta2.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_shadow_demon_vengeance_aura_buff_beta2", "abilities/heroes/shadow_demon/shadow_demon_vengeance_aura_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function shadow_demon_vengeance_aura_beta2:GetIntrinsicModifierName()
	return "modifier_shadow_demon_vengeance_aura_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_shadow_demon_vengeance_aura_beta2 = class({})

-- Called when the modifier is created
function modifier_shadow_demon_vengeance_aura_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.radius = self:GetAbility():GetSpecialValueFor("radius")
end

-- Prevent the modifier from showing up in the buff bar
function modifier_shadow_demon_vengeance_aura_beta2:IsHidden()
	return true
end

-- Indicate that modifier is an aura
function modifier_shadow_demon_vengeance_aura_beta2:IsAura()
	return true
end

-- Return the name of the aura modifier
function modifier_shadow_demon_vengeance_aura_beta2:GetModifierAura()
	return "modifier_shadow_demon_vengeance_aura_buff_beta2"
end

-- Restrict the aura to only allied units
function modifier_shadow_demon_vengeance_aura_beta2:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

-- Allow the aura to affect only heroes and creeps
function modifier_shadow_demon_vengeance_aura_beta2:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP
end

-- Return the radius of the aura
function modifier_shadow_demon_vengeance_aura_beta2:GetAuraRadius()
	return self.radius
end

----------------------------------------------------------------------------------------------------
-- Buff Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_shadow_demon_vengeance_aura_buff_beta2 = class({})

-- Called when the modifier is created
function modifier_shadow_demon_vengeance_aura_buff_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.damage_increase = self:GetAbility():GetSpecialValueFor("damage_increase")
end

-- Declare the events and properties that our modifier affects
function modifier_shadow_demon_vengeance_aura_buff_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
        }
end

-- Increase the unit's damage
function modifier_shadow_demon_vengeance_aura_buff_beta2:GetModifierBaseDamageOutgoing_Percentage()
        return self.damage_increase
end
