-- Declare the ability class
rubick_living_armor_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_rubick_living_armor_beta2", "abilities/heroes/rubick/rubick_living_armor_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function rubick_living_armor_beta2:OnSpellStart()
	-- Retrieve values that are going to be used by the ability
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local duration = self:GetSpecialValueFor("duration")

	-- Check if the target has the modifier already
	if target:HasModifier("modifier_rubick_living_armor_beta2") then
		-- Remove the modifier and reapply if true
		target:RemoveModifierByName("modifier_rubick_living_armor_beta2")
		target:AddNewModifier(caster, self, "modifier_rubick_living_armor_beta2", {duration = duration})
	else
		target:AddNewModifier(caster, self, "modifier_rubick_living_armor_beta2", {duration = duration})
	end

	-- Play the corresponding sound
	EmitSoundOn("Hero_Treant.LivingArmor.Target", target)
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_rubick_living_armor_beta2 = class({})

-- Called when the modifier is created
function modifier_rubick_living_armor_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.parent = self:GetParent()
	self.damage_increase_pct = self:GetAbility():GetSpecialValueFor("damage_increase_pct")
	self.armor_increase = self:GetAbility():GetSpecialValueFor("armor_increase")

	-- Play the visual effect
	self:PlayEffects()
end

-- Declare the events and properties that our modifier affects
function modifier_rubick_living_armor_beta2:DeclareFunctions()
        return {
		MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
                MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
        }
end

-- Increase the unit's damage
function modifier_rubick_living_armor_beta2:GetModifierBaseDamageOutgoing_Percentage()
        return self.damage_increase_pct
end

-- Increase the unit's armor
function modifier_rubick_living_armor_beta2:GetModifierPhysicalArmorBonus()
        return self.armor_increase
end

-- Play the visual effect of the modifier
function modifier_rubick_living_armor_beta2:PlayEffects()
	-- Retrieve the particle
	local particle_effect = "particles/units/heroes/hero_treant/treant_livingarmor.vpcf"

	-- Add particle effect
	local particle = ParticleManager:CreateParticle(particle_effect, PATTACH_OVERHEAD_FOLLOW, self.parent)
	ParticleManager:SetParticleControlEnt(particle, 1, self.parent, PATTACH_POINT_FOLLOW, "attach_origin", self.parent:GetAbsOrigin(), true)
	self:AddParticle(particle, false, false, -1, false, false)
end
