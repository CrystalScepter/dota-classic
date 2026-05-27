-- Declare the ability class
shadow_demon_midnight_pulse_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_shadow_demon_midnight_pulse_beta2", "abilities/heroes/shadow_demon/shadow_demon_midnight_pulse_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function shadow_demon_midnight_pulse_beta2:OnSpellStart()
        -- Retrieve values that are going to be used by the ability
        local caster = self:GetCaster()
        local point = self:GetCursorPosition()
        local duration = self:GetChannelTime()

        -- Create the modifier thinker
        CreateModifierThinker(
                caster,
                self,
                "modifier_shadow_demon_midnight_pulse_beta2",
                { duration = duration },
                point,
                caster:GetTeamNumber(),
                false
        )

        -- Play the corresponding sound
        EmitSoundOnLocationWithCaster(point, "Hero_Enigma.Midnight_Pulse", caster)
end

-- Return the size of the casting indicator
function shadow_demon_midnight_pulse_beta2:GetAOERadius()
        return self:GetSpecialValueFor("radius")
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_shadow_demon_midnight_pulse_beta2 = class({})

-- Called when the modifier is created
function modifier_shadow_demon_midnight_pulse_beta2:OnCreated(keys)
        -- Proceed if synchronized with the server
        if IsServer() then
                -- Retrieve the ability values that are going to be used by our modifier
                self.max_health_second = self:GetAbility():GetSpecialValueFor("max_health_second")
                self.radius = self:GetAbility():GetSpecialValueFor("radius")
                self.tick_rate = self:GetAbility():GetSpecialValueFor("tick_rate")

                -- Start the thinking function
                self:StartIntervalThink(self.tick_rate)

                -- Create the particle
                self.particle = ParticleManager:CreateParticle("particles/units/heroes/hero_enigma/enigma_midnight_pulse.vpcf", PATTACH_ABSORIGIN_FOLLOW, self:GetParent())
                ParticleManager:SetParticleControl(self.particle, 0, self:GetParent():GetAbsOrigin())
                ParticleManager:SetParticleControl(self.particle, 1, Vector(self.radius, 0, 0))
        end
end

-- Called when the modifier ticks
function modifier_shadow_demon_midnight_pulse_beta2:OnIntervalThink()
        -- Check if the player is still channeling the ability
        if self:GetCaster():IsChanneling() then
                -- Retrieve the parent
                local parent = self:GetParent()

                -- Destroy all trees within the radius
                GridNav:DestroyTreesAroundPoint(parent:GetAbsOrigin(), self.radius, false)

                -- Retrieve the units in the target area
                local units = FindUnitsInRadius(
                        parent:GetTeamNumber(),
                        parent:GetAbsOrigin(),
                        nil,
                        self.radius,
                        DOTA_UNIT_TARGET_TEAM_BOTH,
                        DOTA_UNIT_TARGET_ALL,
                        DOTA_UNIT_TARGET_FLAG_NONE,
                        FIND_ANY_ORDER,
                        false
                )

                -- Loop through all units
                for i, unit in pairs(units) do
                        -- Create a damage table
                        local damage_table = {
                                victim = unit,
                                attacker = self:GetCaster(),
                                damage = unit:GetMaxHealth() * self.max_health_second / 100,
                                damage_type = DAMAGE_TYPE_PURE,
                                damage_flags = DOTA_DAMAGE_FLAG_NONE,
                                ability = self:GetAbility()
                        }

                        -- Apply damage to all units found
                        ApplyDamage(damage_table)
                end
        else
                -- Remove the modifier if the player isn't channeling the ability anymore
                self:Destroy()
                
                -- Destroy the particle
                ParticleManager:DestroyParticle(self.particle, false)
                ParticleManager:ReleaseParticleIndex(self.particle)
        end
end

-- Make the modifier undispellable
function modifier_shadow_demon_midnight_pulse_beta2:IsPurgable()
        return false
end
