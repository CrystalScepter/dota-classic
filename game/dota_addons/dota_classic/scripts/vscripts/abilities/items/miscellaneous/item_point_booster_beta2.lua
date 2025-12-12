-- Declare the item class
item_point_booster_beta2 = class({})

-- Link the modifiers that are going to be used by our item
LinkLuaModifier("modifier_point_booster_beta2", "abilities/items/miscellaneous/item_point_booster_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function item_point_booster_beta2:GetIntrinsicModifierName()
	return "modifier_point_booster_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_point_booster_beta2 = class({})

-- Called when the modifier is created
function modifier_point_booster_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.bonus_health = self:GetAbility():GetSpecialValueFor("bonus_health")
	self.bonus_mana = self:GetAbility():GetSpecialValueFor("bonus_mana")
end

-- Declare the events and properties that our modifier affects
function modifier_point_booster_beta2:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_HEALTH_BONUS,
		MODIFIER_PROPERTY_MANA_BONUS,
	}
end

-- Give the unit extra health
function modifier_point_booster_beta2:GetModifierHealthBonus()
	return self.bonus_health
end

-- Give the unit extra mana
function modifier_point_booster_beta2:GetModifierManaBonus()
	return self.bonus_mana
end

-- Allow the modifier to stack
function modifier_point_booster_beta2:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevent the modifier from showing up in the buff bar
function modifier_point_booster_beta2:IsHidden()
	return true
end
