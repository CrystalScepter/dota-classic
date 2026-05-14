-- Declare the ability class
doom_immaterial_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_doom_immaterial_beta2", "abilities/heroes/doom/doom_immaterial_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function doom_immaterial_beta2:GetIntrinsicModifierName()
	return "modifier_doom_immaterial_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_doom_immaterial_beta2 = class({})

-- Called when the modifier is created
function modifier_doom_immaterial_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.evasion = self:GetAbility():GetSpecialValueFor("evasion")
end

-- Called when the modifier is refreshed
function modifier_doom_immaterial_beta2:OnRefresh(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.evasion = self:GetAbility():GetSpecialValueFor("evasion")
end

-- Declare the events and properties that our modifier affects
function modifier_doom_immaterial_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_EVASION_CONSTANT,
        }
end

-- Increase the unit's evasion
function modifier_doom_immaterial_beta2:GetModifierEvasion_Constant()
        return self.evasion
end

-- Prevent the modifier from showing up in the buff bar
function modifier_doom_immaterial_beta2:IsHidden()
	return true
end
