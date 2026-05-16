-- Declare the ability class
riki_shuriken_toss_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_stun", "modifiers/states/modifier_stun.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function riki_shuriken_toss_beta2:OnSpellStart()
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
		EffectName = "particles/units/heroes/hero_bounty_hunter/bounty_hunter_suriken_toss.vpcf",
		bDodgeable = true,
	}
	ProjectileManager:CreateTrackingProjectile(projectile)

        -- Play the corresponding sound
        EmitSoundOn("Hero_BountyHunter.Shuriken", caster)
end

-- Called when the projectile hits a target
function riki_shuriken_toss_beta2:OnProjectileHit(hTarget, vLocation)
        -- Retrieve values that are going to be used by the projectile on hit
	local caster = self:GetCaster()
	local stun_duration_hero = self:GetSpecialValueFor("stun_duration_hero")
	local stun_duration_creep = self:GetSpecialValueFor("stun_duration_creep")

	-- Add the stun modifier to the target based on whether it's a hero or creep
	if hTarget:IsRealHero() then
		hTarget:AddNewModifier(caster, self, "modifier_stun", { duration = stun_duration_hero })
	else
		hTarget:AddNewModifier(caster, self, "modifier_stun", { duration = stun_duration_creep })
	end

	-- Play the corresponding sound
	EmitSoundOn("Hero_BountyHunter.Shuriken.Impact", hTarget)
end
