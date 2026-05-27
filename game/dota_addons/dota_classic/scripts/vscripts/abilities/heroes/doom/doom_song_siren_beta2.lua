-- Declare the ability class
doom_song_siren_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_stasis", "modifiers/states/modifier_stasis.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is cast
function doom_song_siren_beta2:OnSpellStart()
        -- Retrieve values that are going to be used by the ability
        local caster = self:GetCaster()
        local duration = self:GetSpecialValueFor("duration")
        local sleep_radius = self:GetSpecialValueFor("sleep_radius")

        -- Retrieve the units in the target area
        local enemies = FindUnitsInRadius(
                caster:GetTeamNumber(),
                caster:GetAbsOrigin(),
                nil,
                sleep_radius,
                DOTA_UNIT_TARGET_TEAM_ENEMY,
                DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP,
                DOTA_UNIT_TARGET_FLAG_NONE,
                FIND_ANY_ORDER,
                false
        )

        -- Loop through every enemy found
        for _, enemy in pairs(enemies) do
                -- Add the stasis modifier to the target
                enemy:AddNewModifier(caster, self, "modifier_stun", {duration = duration})
        end

        -- Create the particle
        local particle = ParticleManager:CreateParticle("particles/units/heroes/hero_siren/naga_siren_siren_song_cast.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
        ParticleManager:SetParticleControl(particle, 61, Vector(1, 0, 0))
        ParticleManager:ReleaseParticleIndex(particle)

        -- Play the corresponding sound
        EmitSoundOn("Hero_NagaSiren.SongOfTheSiren", caster)
end
