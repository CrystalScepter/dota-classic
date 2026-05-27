-- Declare the ability class
necrophos_corrosive_haze_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_necrophos_corrosive_haze_beta2", "abilities/heroes/necrophos/necrophos_corrosive_haze_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function necrophos_corrosive_haze_beta2:OnSpellStart()
	-- Retrieve values that are going to be used by the ability
	local caster = self:GetCaster()
	local target = self:GetCursorTarget()
	local armor_reduction = self:GetSpecialValueFor("armor_reduction")
	local duration = self:GetSpecialValueFor("duration")

        -- Check if the target has the modifier already
	if target:HasModifier("modifier_necrophos_corrosive_haze_beta2") then
		-- Remove the modifier and reapply if true
		target:RemoveModifierByName("modifier_necrophos_corrosive_haze_beta2")
		target:AddNewModifier(caster, self, "modifier_necrophos_corrosive_haze_beta2", {duration = duration})
	else
		target:AddNewModifier(caster, self, "modifier_necrophos_corrosive_haze_beta2", {duration = duration})
	end

	-- Play the corresponding sound
	EmitSoundOn("Hero_Slardar.Amplify_Damage", target)
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_necrophos_corrosive_haze_beta2 = class({})

-- Called when the modifier is created
function modifier_necrophos_corrosive_haze_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.armor_reduction = self:GetAbility():GetSpecialValueFor("armor_reduction")
end

-- Declare the events and properties that our modifier affects
function modifier_necrophos_corrosive_haze_beta2:DeclareFunctions()
        return {
		MODIFIER_PROPERTY_PHYSICAL_ARMOR_BONUS,
        }
end

-- Declare the states that our modifier affects
function modifier_necrophos_corrosive_haze_beta2:CheckState()
	return {
		[MODIFIER_STATE_PROVIDES_VISION] = true,
		[MODIFIER_STATE_INVISIBLE] = false,
	}
end

-- Reduce armor from the unit
function modifier_necrophos_corrosive_haze_beta2:GetModifierPhysicalArmorBonus()
        return 0 - self.armor_reduction
end

-- Retrieve the name of the particle
function modifier_necrophos_corrosive_haze_beta2:GetEffectName()
	return "particles/units/heroes/hero_slardar/slardar_amp_damage.vpcf"
end

-- Return the particle origin
function modifier_necrophos_corrosive_haze_beta2:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end

-- Make the modifier a debuff
function modifier_necrophos_corrosive_haze_beta2:IsDebuff()
        return true
end

-- Make the modifier undispellable
function modifier_necrophos_corrosive_haze_beta2:IsPurgable()
        return true
end
