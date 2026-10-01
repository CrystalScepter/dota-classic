-- Declare the ability class
lycan_hex_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_lycan_hex_beta2", "abilities/heroes/lycan/lycan_hex_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function lycan_hex_beta2:OnSpellStart()
	-- Retrieve values that are going to be used by the ability
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local duration = self:GetSpecialValueFor("duration")
	
	target:AddNewModifier(caster, self, "modifier_lycan_hex_beta2", {duration = duration})

	-- Play the corresponding sound
	EmitSoundOn("Hero_ShadowShaman.Hex.Target", target)
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_lycan_hex_beta2 = class({})

function modifier_lycan_hex_beta2:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MODEL_CHANGE,
	}
end

-- Declare the states that our modifier affects
function modifier_lycan_hex_beta2:CheckState()
	return {
		[MODIFIER_STATE_SILENCED] = true,
		[MODIFIER_STATE_MUTED] = true,
		[MODIFIER_STATE_DISARMED] = true,
		[MODIFIER_STATE_BLOCK_DISABLED] = true,
		[MODIFIER_STATE_HEXED] = true,
	}
end

function modifier_lycan_hex_beta2:GetModifierModelChange()
	return "models/props_gameplay/chicken.vmdl"
end

-- Make the modifier a debuff
function modifier_lycan_hex_beta2:IsDebuff()
        return true
end
