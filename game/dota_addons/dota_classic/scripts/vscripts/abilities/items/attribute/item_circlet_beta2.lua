-- Declare the item class
item_circlet_beta2 = class({})

-- Link the modifiers that are going to be used by our item
LinkLuaModifier("modifier_circlet_beta2", "abilities/items/attribute/item_circlet_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function item_circlet_beta2:GetIntrinsicModifierName()
	return "modifier_circlet_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_circlet_beta2 = class({})

-- Called when the modifier is created
function modifier_circlet_beta2:OnCreated(kv)
	-- Retrieve the ability values that are going to be used by our modifier
	self.bonus_all_attributes = self:GetAbility():GetSpecialValueFor("bonus_all_attributes")
end

-- Declare the events and properties that our modifier affects
function modifier_circlet_beta2:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
		MODIFIER_PROPERTY_STATS_AGILITY_BONUS,
		MODIFIER_PROPERTY_STATS_INTELLECT_BONUS,
	}
end

-- Give the unit extra strength
function modifier_circlet_beta2:GetModifierBonusStats_Strength()
	return self.bonus_all_attributes
end

-- Give the unit extra agility
function modifier_circlet_beta2:GetModifierBonusStats_Agility()
	return self.bonus_all_attributes
end

-- Give the unit extra intelligence
function modifier_circlet_beta2:GetModifierBonusStats_Intellect()
	return self.bonus_all_attributes
end

-- Allow the modifier to stack
function modifier_circlet_beta2:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevent the modifier from showing up in the buff bar
function modifier_circlet_beta2:IsHidden()
	return true
end
