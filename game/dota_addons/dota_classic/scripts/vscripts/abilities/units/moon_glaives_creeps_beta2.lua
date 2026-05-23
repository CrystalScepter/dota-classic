-- Declare the ability class
moon_glaives_creeps_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_moon_glaives_creeps_beta2", "abilities/units/moon_glaives_creeps_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is created
function moon_glaives_creeps_beta2:Spawn()
        -- Proceed if the code is running in the server
	if IsServer() then
		-- Set the ability level to 1
		self:SetLevel(1)
        end
end

-- Return the name of the modifier
function moon_glaives_creeps_beta2:GetIntrinsicModifierName()
        return "modifier_moon_glaives_creeps_beta2"
end

-- Run when a projectile hits
function moon_glaives_creeps_beta2:OnProjectileHit_ExtraData(hTarget, vLocation, ExtraData)
        -- Stop if it's not running on the server
        if not IsServer() then return end

        -- Proceed if there's a target
        if hTarget then
                -- Define the damage to be dealt
                local damageTable = {
                        victim       = hTarget,
                        damage       = ExtraData.damage *
                        ((100 - self:GetSpecialValueFor("damage_reduction_bounce")) * 0.01) ^ (ExtraData.bounces + 1),
                        damage_type  = DAMAGE_TYPE_PHYSICAL,
                        damage_flags = DOTA_DAMAGE_FLAG_NO_SPELL_AMPLIFICATION + DOTA_DAMAGE_FLAG_NO_SPELL_LIFESTEAL,
                        attacker     = self:GetCaster(),
                        ability      = self
                }

                -- Apply the damage
                ApplyDamage(damageTable)

                -- Ensure trackers exist for this attack record
                if not self.target_tracker then
                        self.target_tracker = {}
                end

                -- Ensure the record key is tracked
                if not self.target_tracker[ExtraData.record] then
                        self.target_tracker[ExtraData.record] = {}
                end

                -- Mark the unit as hit so the chain can bounce back to it later
                self.target_tracker[ExtraData.record][hTarget:GetEntityIndex()] = true
        end

        -- Add a bounce count
        ExtraData.bounces = ExtraData.bounces + 1

        -- Initialize the glaive projectile
        local glaive_launched = false

        -- Find close enemies in order of closest first
        local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), vLocation, nil,
                self:GetSpecialValueFor("bounce_range"), DOTA_UNIT_TARGET_TEAM_ENEMY,
                DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_BUILDING,
                DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS +
                DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_CLOSEST, false)

        -- Check if the number of bounces is lower than the limit and whether there is more than 1 enemy found
        if ExtraData.bounces < self:GetSpecialValueFor("bounces_number") and #enemies > 1 then
                -- Create the all bounced enemies variable
                local all_enemies_bounced = true

                -- Loop through all enemies found
                for _, enemy in pairs(enemies) do
                        -- Check if there are targets that haven't been hit yet
                        if enemy ~= hTarget and not self.target_tracker[ExtraData.record][enemy:GetEntityIndex()] then
                                -- Allow the bounces to find other targets instead of going back
                                all_enemies_bounced = false
                                break
                        end
                end

                -- Loop through all enemies found
                for _, enemy in pairs(enemies) do
                        -- Check if 
                        if enemy ~= hTarget and (not self.target_tracker[ExtraData.record][enemy:GetEntityIndex()] or all_enemies_bounced) then
                                -- Define the glaive projectile
                                local glaive =
                                {
                                        Target            = enemy,
                                        Ability           = self,
                                        EffectName        = "particles/base_attacks/ti9_radiant_ranged.vpcf",
                                        iMoveSpeed        = 900,
                                        vSourceLoc        = vLocation,
                                        bDrawsOnMinimap   = false,
                                        bDodgeable        = false,
                                        bIsAttack         = false,
                                        bVisibleToEnemies = true,
                                        bReplaceExisting  = false,
                                        flExpireTime      = GameRules:GetGameTime() + 10,
                                        bProvidesVision   = false,

                                        ExtraData         = {
                                                bounces = ExtraData.bounces,
                                                record  = ExtraData.record,
                                                damage  = ExtraData.damage
                                        }
                                }

                                -- Release the glaive projectile
                                ProjectileManager:CreateTrackingProjectile(glaive)

                                -- Mark the projectile as launched
                                glaive_launched = true

                                break
                        end
                end

                -- If there's no glaive launched then delete all records
                if not glaive_launched then
                        self.target_tracker[ExtraData.record] = nil
                end
        else
                -- Clear the record because there are no bounces left
                self.target_tracker[ExtraData.record] = nil
        end
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_moon_glaives_creeps_beta2 = class({})

-- Called when the modifier is created
function modifier_moon_glaives_creeps_beta2:OnCreated(keys)
        -- Retrieve the ability values that are going to be used by our modifier
        self.bounce_range = self:GetAbility():GetSpecialValueFor("bounce_range")
        self.bounces_number = self:GetAbility():GetSpecialValueFor("bounces_number")
        self.damage_reduction_bounce = self:GetAbility():GetSpecialValueFor("damage_reduction_bounce")
end

-- Declare the events and properties that our modifier affects
function modifier_moon_glaives_creeps_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_PROCATTACK_FEEDBACK
        }
end

-- Run when an attack happens
function modifier_moon_glaives_creeps_beta2:GetModifierProcAttack_Feedback(keys)
        -- Stop if it's not running on the server
        if not IsServer() then return end

        -- Check if the attacker is the parent and passives aren't disabled
        if keys.attacker == self:GetParent() and not self:GetParent():PassivesDisabled() then
                -- Find enemies close to the attacked unit
                local enemies = FindUnitsInRadius(self:GetCaster():GetTeamNumber(), keys.target:GetAbsOrigin(), nil,
                        self.bounce_range, DOTA_UNIT_TARGET_TEAM_ENEMY,
                        DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_BASIC + DOTA_UNIT_TARGET_BUILDING,
                        DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE + DOTA_UNIT_TARGET_FLAG_NO_INVIS +
                        DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES, FIND_CLOSEST, false)

                -- Ensure trackers exist for this attack record
                if not self:GetAbility().target_tracker then
                        self:GetAbility().target_tracker = {}
                end

                -- Ensure the record key is tracked
                if not self:GetAbility().target_tracker[keys.record] then
                        self:GetAbility().target_tracker[keys.record] = {}
                end

                -- Mark the original attacked unit as already hit so the chain can bounce back to it later
                self:GetAbility().target_tracker[keys.record][keys.target:GetEntityIndex()] = true

                -- Loop through all enemies found
                for _, enemy in pairs(enemies) do
                        -- Ignore the target itself
                        if enemy ~= keys.target then
                                -- Define the glaive projectile
                                local glaive =
                                {
                                        Target            = enemy,
                                        Source            = keys.target,
                                        Ability           = self:GetAbility(),
                                        EffectName        = "particles/base_attacks/ti9_radiant_ranged.vpcf",
                                        iMoveSpeed        = 900,
                                        bDrawsOnMinimap   = false,
                                        bDodgeable        = false,
                                        bIsAttack         = false,
                                        bVisibleToEnemies = true,
                                        bReplaceExisting  = false,
                                        flExpireTime      = GameRules:GetGameTime() + 10,
                                        bProvidesVision   = false,

                                        ExtraData         = {
                                                bounces = 0,
                                                record  = keys.record,
                                                damage  = keys.original_damage
                                        }
                                }

                                -- Release the glaive projectile
                                ProjectileManager:CreateTrackingProjectile(glaive)

                                -- Stop so that it only launches one projectile
                                break
                        end
                end
        end
end

-- Prevent the modifier from showing up in the buff bar
function modifier_moon_glaives_creeps_beta2:IsHidden()
        return true
end
