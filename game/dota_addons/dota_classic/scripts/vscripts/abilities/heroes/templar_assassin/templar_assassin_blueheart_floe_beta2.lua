-- Declare the ability class
templar_assassin_blueheart_floe_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_templar_assassin_blueheart_floe_beta2", "abilities/heroes/templar_assassin/templar_assassin_blueheart_floe_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function templar_assassin_blueheart_floe_beta2:GetIntrinsicModifierName()
	return "modifier_templar_assassin_blueheart_floe_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_templar_assassin_blueheart_floe_beta2 = class({})

-- Called when the modifier is created
function modifier_templar_assassin_blueheart_floe_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.mana_regen_increase = self:GetAbility():GetSpecialValueFor("mana_regen_increase")
end

-- Called when the modifier is refreshed
function modifier_templar_assassin_blueheart_floe_beta2:OnRefresh(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.mana_regen_increase = self:GetAbility():GetSpecialValueFor("mana_regen_increase")
end

-- Declare the events and properties that our modifier affects
function modifier_templar_assassin_blueheart_floe_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_MP_REGEN_AMPLIFY_PERCENTAGE,
        }
end

-- Increase the unit's mana regen
function modifier_templar_assassin_blueheart_floe_beta2:GetModifierMPRegenAmplify_Percentage()
        return self.mana_regen_increase
end

-- Prevent the modifier from showing up in the buff bar
function modifier_templar_assassin_blueheart_floe_beta2:IsHidden()
	return true
end
