-- Declare the item class
item_tranquil_boots_beta2 = class({})

-- Link the modifiers that are going to be used by our item
LinkLuaModifier("modifier_tranquil_boots_beta2", "abilities/items/miscellaneous/item_tranquil_boots_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function item_tranquil_boots_beta2:GetIntrinsicModifierName()
	return "modifier_tranquil_boots_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_tranquil_boots_beta2 = class({})

-- Called when the modifier is created
function modifier_tranquil_boots_beta2:OnCreated(kv)
	-- Retrieve the ability values that are going to be used by our modifier
	self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
	self.bonus_movement_speed = self:GetAbility():GetSpecialValueFor("bonus_movement_speed")
end

-- Declare the events and properties that our modifier affects
function modifier_tranquil_boots_beta2:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_PROPERTY_MOVESPEED_BONUS_CONSTANT,
	}
end

-- Give the unit extra armor
function modifier_tranquil_boots_beta2:GetModifierPhysicalArmorBonus()
	return self.bonus_armor
end

-- Give the unit extra movement speed
function modifier_tranquil_boots_beta2:GetModifierMoveSpeedBonus_Constant()
	return self.bonus_movement_speed
end

-- Allow the modifier to stack
function modifier_tranquil_boots_beta2:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevent the modifier from showing up in the buff bar
function modifier_tranquil_boots_beta2:IsHidden()
	return true
end
