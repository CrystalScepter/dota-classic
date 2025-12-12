-- Declare the item class
item_sobi_mask_beta2 = class({})

-- Link the modifiers that are going to be used by our item
LinkLuaModifier("modifier_sobi_mask_beta2", "abilities/items/miscellaneous/item_sobi_mask_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function item_sobi_mask_beta2:GetIntrinsicModifierName()
	return "modifier_sobi_mask_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_sobi_mask_beta2 = class({})

-- Called when the modifier is created
function modifier_sobi_mask_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.bonus_mana_regen = self:GetAbility():GetSpecialValueFor("bonus_mana_regen")
end

-- Declare the events and properties that our modifier affects
function modifier_sobi_mask_beta2:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MP_REGEN_AMPLIFY_PERCENTAGE,
	}
end

-- Give the unit extra mana regen
function modifier_sobi_mask_beta2:GetModifierMPRegenAmplify_Percentage()
	return self.bonus_mana_regen
end

-- Allow the modifier to stack
function modifier_sobi_mask_beta2:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevent the modifier from showing up in the buff bar
function modifier_sobi_mask_beta2:IsHidden()
	return true
end
