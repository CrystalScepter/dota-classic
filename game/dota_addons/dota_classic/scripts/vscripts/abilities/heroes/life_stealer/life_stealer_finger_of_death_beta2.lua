-- Declare the ability class
life_stealer_finger_of_death_beta2 = class({})

-- Called when the ability is cast
function life_stealer_finger_of_death_beta2:OnSpellStart()
	-- Retrieve values that are going to be used by the ability
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local particle_effect = "particles/units/heroes/hero_lion/lion_spell_finger_of_death.vpcf"
	local damage = self:GetAbilityDamage()
	local effect_delay = self:GetSpecialValueFor("effect_delay")

	Timers:CreateTimer(effect_delay, function()
		-- Return if the target is dead
		if not target:IsAlive() then
			return
		end

		-- Return if the target became magic immune
		if target:IsMagicImmune() then
			return
		end

		-- Deal damage to the target based on the mana burned
		local damage_table = {
			victim = target,
			attacker = caster,
			damage = damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self,
		}
		ApplyDamage(damage_table)

		-- Add particle effect
		local particle = ParticleManager:CreateParticle(particle_effect, PATTACH_ABSORIGIN_FOLLOW, caster)
		ParticleManager:SetParticleControlEnt(particle, 0, caster, PATTACH_POINT_FOLLOW, "attach_attack2", caster:GetAbsOrigin(), true)
		ParticleManager:SetParticleControl(particle, 1, target:GetAbsOrigin())
		ParticleManager:SetParticleControl(particle, 2, target:GetAbsOrigin())
		ParticleManager:ReleaseParticleIndex(particle)   

		-- Play the corresponding sound
		EmitSoundOn("Hero_Lion.FingerOfDeathImpact", target)
	end)
end
