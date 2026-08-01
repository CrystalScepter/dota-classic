-- Declare the ability class
life_stealer_rage_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_life_stealer_rage_beta2", "abilities/heroes/life_stealer/life_stealer_rage_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function life_stealer_rage_beta2:OnSpellStart()
        -- Retrieve values that are going to be used by the ability
        local caster = self:GetCaster()
        local duration = self:GetSpecialValueFor("duration")

        -- Remove debuffs when the spell is cast
        caster:Purge(false, true, false, false, false)

        -- Check if the target has the modifier already
        if caster:HasModifier("modifier_life_stealer_rage_beta2") then
                -- Remove the modifier and reapply if true
                caster:RemoveModifierByName("modifier_life_stealer_rage_beta2")
                caster:AddNewModifier(caster, self, "modifier_life_stealer_rage_beta2", {duration = duration})
        else
                caster:AddNewModifier(caster, self, "modifier_life_stealer_rage_beta2", {duration = duration})
        end

        -- Play the corresponding sound
        EmitSoundOn("Hero_LifeStealer.Rage", caster)
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_life_stealer_rage_beta2 = class({})

function modifier_life_stealer_rage_beta2:OnCreated()
        -- Retrieve the ability values that are going to be used by our modifier
        self.health_increase = self:GetAbility():GetSpecialValueFor("health_increase")
end

-- Declare the events and properties that our modifier affects
function modifier_life_stealer_rage_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_HEALTH_BONUS,
                MODIFIER_PROPERTY_MODEL_SCALE,
        }
end

-- Make the parent magic immune
function modifier_life_stealer_rage_beta2:CheckState()
	return {
		[MODIFIER_STATE_MAGIC_IMMUNE] = true,
	}
end

-- Give the unit extra health
function modifier_life_stealer_rage_beta2:GetModifierHealthBonus()
	return self.health_increase
end

-- Increase the model size
function modifier_life_stealer_rage_beta2:GetModifierModelScale()
        return 25
end

-- Retrieve the name of the particle
function modifier_life_stealer_rage_beta2:GetEffectName()
	return "particles/items_fx/black_king_bar_avatar.vpcf"
end

-- Return the particle origin
function modifier_life_stealer_rage_beta2:GetEffectAttachType()
	return PATTACH_ABSORIGIN_FOLLOW
end
