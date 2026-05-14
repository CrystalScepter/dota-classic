-- Declare the ability class
underlord_demonic_strength_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_underlord_demonic_strength_beta2", "abilities/heroes/underlord/underlord_demonic_strength_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function underlord_demonic_strength_beta2:GetIntrinsicModifierName()
	return "modifier_underlord_demonic_strength_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_underlord_demonic_strength_beta2 = class({})

-- Called when the modifier is created
function modifier_underlord_demonic_strength_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.strength_increase = self:GetAbility():GetSpecialValueFor("strength_increase")
end

-- Called when the modifier is refreshed
function modifier_underlord_demonic_strength_beta2:OnRefresh(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.strength_increase = self:GetAbility():GetSpecialValueFor("strength_increase")
end

-- Declare the events and properties that our modifier affects
function modifier_underlord_demonic_strength_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
        }
end

-- Increase the unit's strength
function modifier_underlord_demonic_strength_beta2:GetModifierBonusStats_Strength()
        return self.strength_increase
end

-- Prevent the modifier from showing up in the buff bar
function modifier_underlord_demonic_strength_beta2:IsHidden()
	return true
end
