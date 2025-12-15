-- Declare the ability class
abilities_vision_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_vision_beta2", "abilities/buildings/abilities_vision_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function abilities_vision_beta2:GetIntrinsicModifierName()
	return "modifier_vision_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_vision_beta2 = class({})

-- Declare the states that our modifier affects
function modifier_vision_beta2:CheckState()
	return {
		[MODIFIER_STATE_PROVIDES_VISION] = true,
	}
end

-- Prevent the modifier from showing up in the buff bar
function modifier_vision_beta2:IsHidden()
	return true
end

-- Make the modifier undispellable
function modifier_vision_beta2:IsPurgable()
	return false
end
