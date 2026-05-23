-- Declare the ability class
doom_nightmare_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_stasis", "modifiers/states/modifier_stasis.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function doom_nightmare_beta2:OnSpellStart()
	-- Retrieve values that are going to be used by the ability
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local duration = self:GetSpecialValueFor("duration")

	-- Add the stasis modifier to the target
	target:AddNewModifier(caster, self, "modifier_stasis", {duration = duration})

	-- Play the corresponding sound
	EmitSoundOn("Hero_Bane.Nightmare", target)
end
