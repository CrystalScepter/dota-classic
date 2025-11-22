-- Declare the item class
item_gauntlets_beta2 = class({})

-- Link the modifiers that are going to be used by our item
LinkLuaModifier("modifier_gauntlets_beta2", "abilities/items/attribute/item_gauntlets_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function item_gauntlets_beta2:GetIntrinsicModifierName()
	return "modifier_gauntlets_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_gauntlets_beta2 = class({})

-- Called when the modifier is created
function modifier_gauntlets_beta2:OnCreated(kv)
	-- Retrieve the ability values that are going to be used by our modifier
	self.bonus_strength = self:GetAbility():GetSpecialValueFor("bonus_strength")
end

-- Declare the events and properties that our modifier affects
function modifier_gauntlets_beta2:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_STATS_STRENGTH_BONUS,
	}
end

-- Give the unit extra strength
function modifier_gauntlets_beta2:GetModifierBonusStats_Strength()
	return self.bonus_strength
end

-- Allow the modifier to stack
function modifier_gauntlets_beta2:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevent the modifier from showing up in the buff bar
function modifier_gauntlets_beta2:IsHidden()
	return true
end
