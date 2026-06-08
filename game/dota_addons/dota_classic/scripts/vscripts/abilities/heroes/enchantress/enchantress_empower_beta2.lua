-- Declare the ability class
enchantress_empower_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_enchantress_empower_beta2", "abilities/heroes/enchantress/enchantress_empower_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function enchantress_empower_beta2:OnSpellStart()
        -- Retrieve values that are going to be used by the ability
        local caster = self:GetCaster()
        local duration = self:GetSpecialValueFor("duration")

        -- Check if the target has the modifier already
        if caster:HasModifier("modifier_enchantress_empower_beta2") then
                -- Remove the modifier and reapply if true
                caster:RemoveModifierByName("modifier_enchantress_empower_beta2")
                caster:AddNewModifier(caster, self, "modifier_enchantress_empower_beta2", {duration = duration})
        else
                caster:AddNewModifier(caster, self, "modifier_enchantress_empower_beta2", {duration = duration})
        end

        -- Play the corresponding sound
        EmitSoundOn("Hero_Magnataur.Empower.Cast", caster)
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_enchantress_empower_beta2 = class({})

function modifier_enchantress_empower_beta2:OnCreated()
        -- Retrieve the ability values that are going to be used by our modifier
        self.damage_increase = self:GetAbility():GetSpecialValueFor("damage_increase")
        self.health_increase = self:GetAbility():GetSpecialValueFor("health_increase")
end

-- Declare the events and properties that our modifier affects
function modifier_enchantress_empower_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_PREATTACK_BONUS_DAMAGE,
                MODIFIER_PROPERTY_HEALTH_BONUS,
                MODIFIER_PROPERTY_MODEL_SCALE,
        }
end

-- Make the parent magic immune
function modifier_enchantress_empower_beta2:CheckState()
	return {
		[MODIFIER_STATE_MAGIC_IMMUNE] = true,
	}
end

-- Give the unit extra damage
function modifier_enchantress_empower_beta2:GetModifierPreAttack_BonusDamage()
        return self.damage_increase
end

-- Give the unit extra health
function modifier_enchantress_empower_beta2:GetModifierHealthBonus()
	return self.health_increase
end

-- Increase the model size
function modifier_enchantress_empower_beta2:GetModifierModelScale()
        return 25
end

-- Retrieve the name of the particle
function modifier_enchantress_empower_beta2:GetEffectName()
	return "particles/items_fx/black_king_bar_avatar.vpcf"
end

-- Return the particle origin
function modifier_enchantress_empower_beta2:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
