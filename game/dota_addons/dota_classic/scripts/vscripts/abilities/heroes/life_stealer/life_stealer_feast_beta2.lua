-- Declare the ability class
life_stealer_feast_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_life_stealer_feast_beta2", "abilities/heroes/life_stealer/life_stealer_feast_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function life_stealer_feast_beta2:GetIntrinsicModifierName()
	return "modifier_life_stealer_feast_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_life_stealer_feast_beta2 = class({})

-- Called when the modifier is created
function modifier_life_stealer_feast_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.life_steal = self:GetAbility():GetSpecialValueFor("life_steal")
end

-- Called when the modifier is refreshed
function modifier_life_stealer_feast_beta2:OnRefresh(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.life_steal = self:GetAbility():GetSpecialValueFor("life_steal")
end

-- Declare the events and properties that our modifier affects
function modifier_life_stealer_feast_beta2:DeclareFunctions()
        return {
                MODIFIER_EVENT_ON_ATTACK_LANDED,
        }
end

-- Called when an attack is successful
function modifier_life_stealer_feast_beta2:OnAttackLanded(keys)
        -- Retrieve the owner of the modifier
	local parent = self:GetParent()

	-- Return if the attacker is not the parent of the modifier
	if keys.attacker ~= parent then
		return
	end

	-- Return if the target is not on the opposite team
	if keys.target:GetTeamNumber() == parent:GetTeamNumber() then
		return
	end

	-- Return if the target is a building
	if keys.target:IsBuilding() then
		return
	end

	-- Heal based on a percentage of the parent's damage
	parent:Heal(parent:GetAverageTrueAttackDamage(parent) * self.life_steal / 100, self:GetAbility())

	-- Create the particle effect
	local effect_cast = ParticleManager:CreateParticle(
		"particles/generic_gameplay/generic_lifesteal.vpcf",
		PATTACH_ABSORIGIN_FOLLOW,
		parent
	)
	ParticleManager:ReleaseParticleIndex(effect_cast)
end

-- Prevent the modifier from showing up in the buff bar
function modifier_life_stealer_feast_beta2:IsHidden()
	return true
end
