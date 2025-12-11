-- Declare the ability class
shadow_demon_enfeeble_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_shadow_demon_enfeeble_beta2", "abilities/heroes/shadow_demon/shadow_demon_enfeeble_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function shadow_demon_enfeeble_beta2:OnSpellStart()
        -- Retrieve values that are going to be used by the ability
        local caster = self:GetCaster()
        local target = self:GetCursorTarget()
        local hero_duration = self:GetSpecialValueFor("hero_duration")
        local creep_duration = self:GetSpecialValueFor("creep_duration")

        -- Check whether the unit is a hero
        if target:IsRealHero() then
                -- Add the modifier to the target hero with its corresponding duration
                target:AddNewModifier(caster, self, "modifier_shadow_demon_enfeeble_beta2", { duration = hero_duration })
        else
                -- Add the modifier to the target creep with its corresponding duration
                target:AddNewModifier(caster, self, "modifier_shadow_demon_enfeeble_beta2", { duration = creep_duration })
        end

        -- Play the corresponding sound
        EmitSoundOn("Hero_Bane.Enfeeble", target)
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_shadow_demon_enfeeble_beta2 = class({})

-- Called when the modifier is created
function modifier_shadow_demon_enfeeble_beta2:OnCreated(kv)
        -- Retrieve the ability values that are going to be used by our modifier
        self.damage_reduction = self:GetAbility():GetSpecialValueFor("damage_reduction")
end

-- Declare the events and properties that our modifier affects
function modifier_shadow_demon_enfeeble_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
        }
end

-- Reduce the damage from the target unit
function modifier_shadow_demon_enfeeble_beta2:GetModifierBaseDamageOutgoing_Percentage()
        return 0 - self.damage_reduction
end

-- Return the particle effect to be used
function modifier_shadow_demon_enfeeble_beta2:GetEffectName()
        return "particles/units/heroes/hero_bane/bane_enfeeble.vpcf"
end

-- Return the particle origin
function modifier_shadow_demon_enfeeble_beta2:GetEffectAttachType()
        return PATTACH_ABSORIGIN_FOLLOW
end

-- Make the modifier dispellable
function modifier_shadow_demon_enfeeble_beta2:IsPurgable()
        return true
end

-- Make the modifier a debuff
function modifier_shadow_demon_enfeeble_beta2:IsDebuff()
        return true
end
