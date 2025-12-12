-- Declare the item class
item_talisman_of_evasion_beta2 = class({})

-- Link the modifiers that are going to be used by our item
LinkLuaModifier("modifier_talisman_of_evasion_beta2", "abilities/items/defense/item_talisman_of_evasion_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function item_talisman_of_evasion_beta2:GetIntrinsicModifierName()
	return "modifier_talisman_of_evasion_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_talisman_of_evasion_beta2 = class({})

-- Called when the modifier is created
function modifier_talisman_of_evasion_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.bonus_armor = self:GetAbility():GetSpecialValueFor("bonus_armor")
	self.bonus_evasion = self:GetAbility():GetSpecialValueFor("bonus_evasion")
end

-- Declare the events and properties that our modifier affects
function modifier_talisman_of_evasion_beta2:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
		MODIFIER_PROPERTY_EVASION_CONSTANT,
	}
end

-- Give the unit extra armor
function modifier_talisman_of_evasion_beta2:GetModifierPhysicalArmorBonus()
	return self.bonus_armor
end

-- Give the unit extra evasion
function modifier_talisman_of_evasion_beta2:GetModifierEvasion_Constant()
	return self.bonus_evasion
end

-- Allow the modifier to stack
function modifier_talisman_of_evasion_beta2:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevent the modifier from showing up in the buff bar
function modifier_talisman_of_evasion_beta2:IsHidden()
	return true
end
