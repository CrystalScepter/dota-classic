-- Declare the ability class
razor_bloodrage_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_razor_bloodrage_beta2", "abilities/heroes/razor/razor_bloodrage_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function razor_bloodrage_beta2:OnSpellStart()
	-- Retrieve values that are going to be used by the ability
	local caster = self:GetCaster()
	local duration = self:GetSpecialValueFor("duration")

	-- Check if the target has the modifier already
	if caster:HasModifier("modifier_razor_bloodrage_beta2") then
		-- Remove the modifier and reapply if true
		caster:RemoveModifierByName("modifier_razor_bloodrage_beta2")
		caster:AddNewModifier(caster, self, "modifier_razor_bloodrage_beta2", {duration = duration})
	else
		caster:AddNewModifier(caster, self, "modifier_razor_bloodrage_beta2", {duration = duration})
	end

	-- Play the corresponding sound
	EmitSoundOn("Hero_Bloodseeker.BloodRage", caster)
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_razor_bloodrage_beta2 = class({})

-- Called when the modifier is created
function modifier_razor_bloodrage_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.parent = self:GetParent()
	self.attack_speed_bonus = self:GetAbility():GetSpecialValueFor("attack_speed_bonus")
	self.health_drain_second = self:GetAbility():GetSpecialValueFor("health_drain_second")
	self.tick_interval = self:GetAbility():GetSpecialValueFor("tick_interval")

	-- Deal damage to self
	local damage_table = {
		victim = self:GetCaster(),
		attacker = self:GetCaster(),
		damage = self.health_drain_second,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self:GetAbility(),
	}
	ApplyDamage(damage_table)

	-- Start interval think
	if IsServer() then
		self:StartIntervalThink(self.tick_interval)
	end
end

-- Declare the events and properties that our modifier affects
function modifier_razor_bloodrage_beta2:DeclareFunctions()
        return {
		MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
        }
end

-- Give the unit extra attack speed
function modifier_razor_bloodrage_beta2:GetModifierAttackSpeedBonus_Constant()
        return self.attack_speed_bonus
end

-- Run every time the interval ticks
function modifier_razor_bloodrage_beta2:OnIntervalThink()
	-- Deal damage to self
	local damage_table = {
		victim = self:GetCaster(),
		attacker = self:GetCaster(),
		damage = self.health_drain_second,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self:GetAbility(),
	}
	ApplyDamage(damage_table)
end

-- Retrieve the name of the particle
function modifier_razor_bloodrage_beta2:GetEffectName()
	return "particles/units/heroes/hero_bloodseeker/bloodseeker_bloodrage.vpcf"
end

-- Return the particle origin
function modifier_razor_bloodrage_beta2:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end
