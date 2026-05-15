-- Declare the ability class
underlord_mist_coil_beta2 = class({})

-- Called when the ability is cast
function underlord_mist_coil_beta2:OnSpellStart()
        -- Retrieve values that are going to be used by the ability
        local caster = self:GetCaster()
        local target = self:GetCursorTarget()
        local projectile_speed = self:GetSpecialValueFor("projectile_speed")

        -- Create a tracking projectile
	local projectile = {
		Source = caster,
		Target = target,
		Ability = self,
		iMoveSpeed = projectile_speed,
		EffectName = "particles/units/heroes/hero_abaddon/abaddon_death_coil.vpcf",
		bDodgeable = true,
	}
	ProjectileManager:CreateTrackingProjectile(projectile)

        -- Play the corresponding sound
        EmitSoundOn("Hero_Abaddon.DeathCoil.Cast", caster)
end

-- Called when the projectile hits a target
function underlord_mist_coil_beta2:OnProjectileHit(hTarget, vLocation)
        -- Retrieve values that are going to be used by the projectile on hit
	local caster = self:GetCaster()
	local damage = self:GetAbilityDamage()

	-- Check whether the target is an ally or enemy
	if not hTarget:GetTeamNumber() == caster:GetTeamNumber() then
		-- Deal damage to the enemy target
		local damage_table = {
			victim = hTarget,
			attacker = caster,
			damage = damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self,
		}
		ApplyDamage(damage_table)
	else
		-- Heal the friendly unit
		hTarget:Heal(damage, self)
	end

	-- Play the corresponding sound
	EmitSoundOn("Hero_Abaddon.DeathCoil.Target", hTarget)
end
