-- Declare the ability class
doom_void_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_slow", "modifiers/states/modifier_slow.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_doom_void_beta2", "abilities/heroes/doom/doom_void_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function doom_void_beta2:OnSpellStart()
	-- Retrieve values that are going to be used by the ability
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local damage = self:GetAbilityDamage()
	local slow_amount = self:GetSpecialValueFor("slow_amount")
	local duration = self:GetSpecialValueFor("duration")

	-- Add the slow modifier to the target
	target:AddNewModifier(caster, self, "modifier_slow", {duration = duration, slow = slow_amount})
	target:AddNewModifier(caster, self, "modifier_doom_void_beta2", {duration = duration})

	-- Deal damage to the target
	local damage_table = {
		victim = target,
		attacker = caster,
		damage = damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self,
	}
	ApplyDamage(damage_table)

	-- Play the corresponding sound
	EmitSoundOn("Hero_Nightstalker.Void", target)
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_doom_void_beta2 = class({})

-- Called when the modifier is created
function modifier_doom_void_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.attack_speed_slow_amount = self:GetAbility():GetSpecialValueFor("attack_speed_slow_amount")
end

-- Declare the events and properties that our modifier affects
function modifier_doom_void_beta2:DeclareFunctions()
        return {
		MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE,
        }
end

-- Reduce attack speed by a percentage
function modifier_doom_void_beta2:GetModifierAttackSpeedPercentage()
        return 0 - self.attack_speed_slow_amount
end

-- Retrieve the name of the particle
function modifier_doom_void_beta2:GetEffectName()
	return "particles/units/heroes/hero_night_stalker/nightstalker_void.vpcf"
end

-- Return the particle origin
function modifier_doom_void_beta2:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end

-- Prevent the modifier from showing up in the buff bar
function modifier_doom_void_beta2:IsHidden()
	return true
end
