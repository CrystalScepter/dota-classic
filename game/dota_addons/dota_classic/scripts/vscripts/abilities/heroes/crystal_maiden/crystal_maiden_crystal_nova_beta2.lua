-- Declare the ability class
crystal_maiden_crystal_nova_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_slow", "modifiers/states/modifier_slow.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_crystal_maiden_crystal_nova_beta2", "abilities/heroes/crystal_maiden/crystal_maiden_crystal_nova_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function crystal_maiden_crystal_nova_beta2:OnSpellStart()
	-- Retrieve values that are going to be used by the ability
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local damage = self:GetAbilityDamage()
	local aoe_damage = self:GetSpecialValueFor("aoe_damage")
	local aoe_radius = self:GetSpecialValueFor("aoe_radius")
	local slow_amount = self:GetSpecialValueFor("slow_amount")
	local duration = self:GetSpecialValueFor("duration")
	local particle_nova = "particles/units/heroes/hero_lich/lich_frost_nova.vpcf"

	-- Add the slow modifier to the target
	target:AddNewModifier(caster, self, "modifier_slow", { duration = duration, slow = slow_amount })
	target:AddNewModifier(caster, self, "modifier_crystal_maiden_frost_nova_beta2", { duration = duration })

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
	EmitSoundOn("Ability.FrostNova", target)

	-- Create the particle effect
	local particle = ParticleManager:CreateParticle(particle_nova, PATTACH_ABSORIGIN_FOLLOW, target)
	ParticleManager:SetParticleControl(particle, 0, target:GetAbsOrigin())
	ParticleManager:SetParticleControl(particle, 1, Vector(radius, radius, radius))
	ParticleManager:SetParticleControl(particle, 2, target:GetAbsOrigin())
	ParticleManager:ReleaseParticleIndex(particle)

	-- Retrieve the units in the target area
	local enemies = FindUnitsInRadius(
		caster:GetTeamNumber(),
		target:GetAbsOrigin(),
		nil,
		aoe_radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP,
		DOTA_UNIT_TARGET_FLAG_NONE,
		FIND_ANY_ORDER,
		false
	)

	-- Loop through every enemy found
	for _, enemy in pairs(enemies) do
		-- Proceed if the enemy isn't the main target
		if enemy ~= target then
			-- Return if the target is magic immune
			if enemy:IsMagicImmune() then
				return
			end

			-- Deal damage to the target
			local damage_table = {
				victim = enemy,
				attacker = caster,
				damage = aoe_damage,
				damage_type = DAMAGE_TYPE_MAGICAL,
				ability = self,
			}
			ApplyDamage(damage_table)

			-- Add the slow modifier to the target
			enemy:AddNewModifier(caster, self, "modifier_slow", { duration = duration, slow = slow_amount })
			enemy:AddNewModifier(caster, self, "modifier_crystal_maiden_frost_nova_beta2", { duration = duration })

			-- Create the particle effect
			local particle = ParticleManager:CreateParticle(particle_nova, PATTACH_ABSORIGIN_FOLLOW, enemy)
			ParticleManager:SetParticleControl(particle, 0, enemy:GetAbsOrigin())
			ParticleManager:SetParticleControl(particle, 1, Vector(radius, radius, radius))
			ParticleManager:SetParticleControl(particle, 2, enemy:GetAbsOrigin())
			ParticleManager:ReleaseParticleIndex(particle)
		end
	end
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_crystal_maiden_crystal_nova_beta2 = class({})

-- Called when the modifier is created
function modifier_crystal_maiden_crystal_nova_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.attack_speed_slow_amount = self:GetAbility():GetSpecialValueFor("attack_speed_slow_amount")
end

-- Declare the events and properties that our modifier affects
function modifier_crystal_maiden_crystal_nova_beta2:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_ATTACKSPEED_PERCENTAGE,
	}
end

-- Reduce attack speed by a percentage
function modifier_crystal_maiden_crystal_nova_beta2:GetModifierAttackSpeedPercentage()
	return 0 - self.attack_speed_slow_amount
end

-- Prevent the modifier from showing up in the buff bar
function modifier_crystal_maiden_crystal_nova_beta2:IsHidden()
	return true
end
