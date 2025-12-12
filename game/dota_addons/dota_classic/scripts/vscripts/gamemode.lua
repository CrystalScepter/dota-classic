-- Declare the class itself
GameMode = class({})

-- Import the following classes
require("events")

-- Called when the custom game starts by the addon_game_mode class
function GameMode:InitGameMode()
        -- Declare the game mode variable
        local GameMode = GameRules:GetGameModeEntity()

        -- Enable cheats for testing purposes, should be disabled when the custom game launches
        SendToConsole("sv_cheats 1")

        -- Speed up the process for testing by throwing you straight into the game as Crystal Maiden
        GameRules:EnableCustomGameSetupAutoLaunch(true)
        GameRules:SetCustomGameSetupAutoLaunchDelay(0)
        GameRules:SetStrategyTime(0)
        GameRules:SetShowcaseTime(0)
        GameMode:SetCustomGameForceHero("npc_dota_hero_venomancer")

        -- Disable hero grids and ability / item suggestions since we will use custom heroes
        GameRules:SetEnableAlternateHeroGrids(false)
        GameRules:SetSuggestAbilitiesEnabled(false)
        GameRules:SetSuggestItemsEnabled(false)

        -- Change the starting gold to a much higher value for testing purposes
        GameRules:SetStartingGold(50000)

        -- Change some inventory / shopping mechanics to be accurate to how it worked back
        GameMode:SetRecommendedItemsDisabled(true)
        GameMode:SetStickyItemDisabled(true)
        GameMode:SetSendToStashEnabled(false)
        GameMode:SetStashPurchasingDisabled(true)
        GameRules:SetUseUniversalShopMode(true)

        -- Disable TP on death award and buyback
        GameMode:SetGiveFreeTPOnDeath(false)
        GameMode:SetBuybackEnabled(false)

        -- Essentially removes glyph / scan by giving it a 100 hour long cooldown
        GameMode:SetCustomGlyphCooldown(360000)
        GameMode:SetCustomScanCooldown(360000)

        -- Disable neutral items
        GameMode:SetAllowNeutralItemDrops(false)
        GameMode:SetNeutralStashEnabled(false)
        GameMode:SetNeutralStashTeamViewOnlyEnabled(true)
        GameMode:SetNeutralItemHideUndiscoveredEnabled(true)

        -- Set trees to respawn every 5 minutes
        GameRules:SetTreeRegrowTime(300)

        -- Remove pregame time, start at night and make the day/night cycle last 16 minutes
        GameRules:SetPreGameTime(0)
        GameRules:SetTimeOfDay(0)
        GameMode:SetDaynightCycleAdvanceRate(0.625)

        -- Disable backdoor protection
        GameMode:SetTowerBackdoorProtectionEnabled(false)

        -- Disable first blood
        GameRules:SetFirstBloodActive(false)

        -- Change hero maximum level to 10
        GameMode:SetUseCustomHeroLevels(true)
        GameMode:SetCustomXPRequiredToReachNextLevel({
                0,
                200,
                500,
                900,
                1400,
                2000,
                2700,
                3500,
                4400,
                5400,
        })

        -- Change hero attribute values, except for intelligence giving base magic resist since it's broken
        GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_DAMAGE, 1)
        GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_HP, 25)
        GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_HP_REGEN, 0.05)
        GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_DAMAGE, 1)
        GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_ATTACK_SPEED, 2)
        GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_ARMOR, 0.3)
        GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_DAMAGE, 1)
        GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_MANA, 15)
        GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_MANA_REGEN, 0.05)

        -- Disable innate damage block on melee heroes
        GameMode:SetInnateMeleeDamageBlockPercent(0)
        GameMode:SetInnateMeleeDamageBlockAmount(0)
        GameMode:SetInnateMeleeDamageBlockPerLevelAmount(0)

        -- Disable illusions being removed when your hero dies
        GameMode:SetRemoveIllusionsOnDeath(false)

        -- Register unit spawns
        ListenToGameEvent("npc_spawned", Dynamic_Wrap(self, "OnNPCSpawned"), self)

        -- Links the modifiers that are going to be used by our events
        LinkLuaModifier("modifier_magic_resist", "modifiers/modifier_magic_resist.lua", LUA_MODIFIER_MOTION_NONE)
        LinkLuaModifier("modifier_health_regen", "modifiers/modifier_health_regen.lua", LUA_MODIFIER_MOTION_NONE)
        LinkLuaModifier("modifier_health_regen_nighttime", "modifiers/modifier_health_regen_nighttime.lua", LUA_MODIFIER_MOTION_NONE)
        LinkLuaModifier("modifier_hull_radius", "modifiers/modifier_hull_radius.lua", LUA_MODIFIER_MOTION_NONE)
end
