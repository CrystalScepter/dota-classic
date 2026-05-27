-- Declare the ability class
bloodseeker_ice_armor_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_bloodseeker_ice_armor_beta2", "abilities/heroes/bloodseeker/bloodseeker_ice_armor_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function bloodseeker_ice_armor_beta2:OnSpellStart()
	-- Retrieve values that are going to be used by the ability
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local duration = self:GetSpecialValueFor("duration")

	-- Check if the target has the modifier already
	if target:HasModifier("modifier_bloodseeker_ice_armor_beta2") then
		-- Remove the modifier and reapply if true
		target:RemoveModifierByName("modifier_bloodseeker_ice_armor_beta2")
		target:AddNewModifier(caster, self, "modifier_bloodseeker_ice_armor_beta2", {duration = duration})
	else
		target:AddNewModifier(caster, self, "modifier_bloodseeker_ice_armor_beta2", {duration = duration})
	end

	-- Play the corresponding sound
	EmitSoundOn("Hero_Lich.IceAge", target)
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_bloodseeker_ice_armor_beta2 = class({})

-- Called when the modifier is created
function modifier_bloodseeker_ice_armor_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.parent = self:GetParent()
	self.armor_increase = self:GetAbility():GetSpecialValueFor("armor_increase")

	-- Play the visual effect
	self:PlayEffects()
end

-- Declare the events and properties that our modifier affects
function modifier_bloodseeker_ice_armor_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
        }
end

-- Increase the unit's armor
function modifier_bloodseeker_ice_armor_beta2:GetModifierPhysicalArmorBonus()
        return self.armor_increase
end

-- Play the visual effect of the modifier
function modifier_bloodseeker_ice_armor_beta2:PlayEffects()
	-- Retrieve the particle
	local particle_effect = "particles/units/heroes/hero_lich/lich_frost_armor.vpcf"

	-- Add particle effect
	local particle = ParticleManager:CreateParticle(particle_effect, PATTACH_OVERHEAD_FOLLOW, self.parent)
	ParticleManager:SetParticleControl(particle, 0, self.parent:GetAbsOrigin())
	ParticleManager:SetParticleControl(particle, 1, Vector(1, 1, 1))
	self:AddParticle(particle, false, false, -1, false, false)
end
