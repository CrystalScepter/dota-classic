-- Declare the item class
item_gloves_of_haste_beta2 = class({})

-- Link the modifiers that are going to be used by our item
LinkLuaModifier("modifier_gloves_of_haste_beta2", "abilities/items/miscellaneous/item_gloves_of_haste_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function item_gloves_of_haste_beta2:GetIntrinsicModifierName()
	return "modifier_gloves_of_haste_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_gloves_of_haste_beta2 = class({})

-- Called when the modifier is created
function modifier_gloves_of_haste_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.bonus_attack_speed = self:GetAbility():GetSpecialValueFor("bonus_attack_speed")
end

-- Declare the events and properties that our modifier affects
function modifier_gloves_of_haste_beta2:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
	}
end

-- Give the unit extra attack speed
function modifier_gloves_of_haste_beta2:GetModifierAttackSpeedBonus_Constant()
	return self.bonus_attack_speed
end

-- Allow the modifier to stack
function modifier_gloves_of_haste_beta2:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevent the modifier from showing up in the buff bar
function modifier_gloves_of_haste_beta2:IsHidden()
	return true
end
