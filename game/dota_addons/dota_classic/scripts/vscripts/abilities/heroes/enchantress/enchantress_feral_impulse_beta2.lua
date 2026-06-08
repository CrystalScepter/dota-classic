-- Declare the ability class
enchantress_feral_impulse_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_enchantress_feral_impulse_beta2", "abilities/heroes/enchantress/enchantress_feral_impulse_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function enchantress_feral_impulse_beta2:OnSpellStart()
        -- Retrieve values that are going to be used by the ability
        local caster = self:GetCaster()
        local duration = self:GetSpecialValueFor("duration")
        local radius = self:GetSpecialValueFor("radius")

        -- Retrieve the units in the target area
        local allies = FindUnitsInRadius(
                caster:GetTeamNumber(),
                caster:GetAbsOrigin(),
                nil,
                radius,
                DOTA_UNIT_TARGET_TEAM_FRIENDLY,
                DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP,
                DOTA_UNIT_TARGET_FLAG_INVULNERABLE,
                FIND_ANY_ORDER,
                false
        )

        -- Loop through every ally found
        for _, ally in pairs(allies) do
                -- Check if the target has the modifier already
                if ally:HasModifier("modifier_enchantress_feral_impulse_beta2") then
                        -- Remove the modifier and reapply if true
                        ally:RemoveModifierByName("modifier_enchantress_feral_impulse_beta2")
                        ally:AddNewModifier(caster, self, "modifier_enchantress_feral_impulse_beta2", {duration = duration})
                else
                        ally:AddNewModifier(caster, self, "modifier_enchantress_feral_impulse_beta2", {duration = duration})
                end
        end

        -- Play the corresponding sound
        EmitSoundOn("DOTA_Item.DoE.Activate", caster)
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_enchantress_feral_impulse_beta2 = class({})

function modifier_enchantress_feral_impulse_beta2:OnCreated()
        -- Retrieve the ability values that are going to be used by our modifier
        self.parent = self:GetParent()
        self.damage_increase = self:GetAbility():GetSpecialValueFor("damage_increase")

        -- Play the visual effect
	self:PlayEffects()
end

-- Declare the events and properties that our modifier affects
function modifier_enchantress_feral_impulse_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_BASEDAMAGEOUTGOING_PERCENTAGE,
        }
end

-- Increase the unit's damage
function modifier_enchantress_feral_impulse_beta2:GetModifierBaseDamageOutgoing_Percentage()
        return self.damage_increase
end

-- Play the visual effect of the modifier
function modifier_enchantress_feral_impulse_beta2:PlayEffects()
	-- Retrieve the particle
	local particle_effect = "particles/items_fx/drum_of_endurance_buff.vpcf"

	-- Add particle effect
	local particle = ParticleManager:CreateParticle(particle_effect, PATTACH_ABSORIGIN_FOLLOW, self.parent)
	ParticleManager:SetParticleControl(particle, 0, self.parent:GetAbsOrigin())
	ParticleManager:SetParticleControl(particle, 1, Vector(0, 0, 0))
	self:AddParticle(particle, false, false, -1, false, false)
end
