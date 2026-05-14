-- Declare the ability class
dragon_knight_dragon_blood_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_dragon_knight_dragon_blood_beta2", "abilities/heroes/dragon_knight/dragon_knight_dragon_blood_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function dragon_knight_dragon_blood_beta2:GetIntrinsicModifierName()
	return "modifier_dragon_knight_dragon_blood_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_dragon_knight_dragon_blood_beta2 = class({})

-- Called when the modifier is created
function modifier_dragon_knight_dragon_blood_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.health_regen_increase = self:GetAbility():GetSpecialValueFor("health_regen_increase")
end

-- Called when the modifier is refreshed
function modifier_dragon_knight_dragon_blood_beta2:OnRefresh(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.health_regen_increase = self:GetAbility():GetSpecialValueFor("health_regen_increase")
end

-- Declare the events and properties that our modifier affects
function modifier_dragon_knight_dragon_blood_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_HP_REGEN_MULTIPLIER_PRE_AMPLIFICATION,
        }
end

-- Increase the unit's health regen
function modifier_dragon_knight_dragon_blood_beta2:GetModifierHPRegenMultiplierPreAmplification()
        return self.health_regen_increase
end

-- Prevent the modifier from showing up in the buff bar
function modifier_dragon_knight_dragon_blood_beta2:IsHidden()
	return true
end
