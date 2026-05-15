-- Declare the ability class
phantom_lancer_spirit_lance_beta2 = class({})

-- Called when the ability is cast
function phantom_lancer_spirit_lance_beta2:OnSpellStart()
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
		EffectName = "particles/units/heroes/hero_phantom_lancer/phantomlancer_spiritlance_projectile.vpcf",
		bDodgeable = true,
	}
	ProjectileManager:CreateTrackingProjectile(projectile)

        -- Play the corresponding sound
        EmitSoundOn("Hero_PhantomLancer.SpiritLance.Throw", caster)
end

-- Called when the projectile hits a target
function phantom_lancer_spirit_lance_beta2:OnProjectileHit(hTarget, vLocation)
        -- Retrieve values that are going to be used by the projectile on hit
	local caster = self:GetCaster()
	local damage = self:GetAbilityDamage()

	-- Deal damage to the target
	local damage_table = {
		victim = hTarget,
		attacker = caster,
		damage = damage,
		damage_type = DAMAGE_TYPE_MAGICAL,
		ability = self,
	}
	ApplyDamage(damage_table)

	-- Play the corresponding sound
	EmitSoundOn("Hero_PhantomLancer.SpiritLance.Impact", hTarget)
end
