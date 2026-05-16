-- Declare the ability class
night_stalker_mana_burn_beta2 = class({})

-- Called when the ability is cast
function night_stalker_mana_burn_beta2:OnSpellStart()
	-- Retrieve values that are going to be used by the ability
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local particle_effect = "particles/units/heroes/hero_nyx_assassin/nyx_assassin_mana_burn.vpcf"
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

		-- Retrieve the amount of mana the target currently has
		local target_mana = target:GetMana()
		local mana_burn = self:GetSpecialValueFor("mana_burn")

		-- Adjusts the mana burn value if the target has less mana than the maximum threshold
		local actual_mana_burn = math.min(target_mana, mana_burn)

		-- Reduce the target's mana
		target:Script_ReduceMana(actual_mana_burn, self)

		-- Deal damage to the target based on the mana burned
		local damage_table = {
			victim = target,
			attacker = caster,
			damage = actual_mana_burn,
			damage_type = DAMAGE_TYPE_PURE,
			ability = self,
		}
		ApplyDamage(damage_table)

		-- Add particle effect onto the target
		local particle = ParticleManager:CreateParticle(particle_effect, PATTACH_CUSTOMORIGIN, target)
		ParticleManager:SetParticleControlEnt(particle, 0, target, PATTACH_POINT_FOLLOW, "attach_hitloc", target:GetAbsOrigin(), true)
		ParticleManager:ReleaseParticleIndex(particle)

		-- Play the corresponding sound
		EmitSoundOn("Hero_NyxAssassin.ManaBurn.Target", target)
	end)
end
