-- Declare the item class
item_mithril_hammer_beta2 = class({})

-- Link the modifiers that are going to be used by our item
LinkLuaModifier("modifier_mithril_hammer_beta2", "abilities/items/offense/item_mithril_hammer_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function item_mithril_hammer_beta2:GetIntrinsicModifierName()
	return "modifier_mithril_hammer_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_mithril_hammer_beta2 = class({})

-- Called when the modifier is created
function modifier_mithril_hammer_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.bonus_damage = self:GetAbility():GetSpecialValueFor("bonus_damage")
end

-- Declare the events and properties that our modifier affects
function modifier_mithril_hammer_beta2:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
	}
end

-- Give the unit extra damage
function modifier_mithril_hammer_beta2:GetModifierPreAttack_BonusDamage()
	return self.bonus_damage
end

-- Allow the modifier to stack
function modifier_mithril_hammer_beta2:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevent the modifier from showing up in the buff bar
function modifier_mithril_hammer_beta2:IsHidden()
	return true
end
