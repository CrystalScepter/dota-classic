GameMode = class({})

function GameMode:InitGameMode()
        local GameMode = GameRules:GetGameModeEntity()

        SendToConsole("sv_cheats 1")

        GameRules:EnableCustomGameSetupAutoLaunch(true)
        GameRules:SetCustomGameSetupAutoLaunchDelay(0)
        GameRules:SetStrategyTime(0)
        GameRules:SetShowcaseTime(0)

        GameRules:SetEnableAlternateHeroGrids(false)
        GameRules:SetSuggestAbilitiesEnabled(false)
        GameRules:SetSuggestItemsEnabled(false)

        GameMode:SetCustomGameForceHero("npc_dota_hero_medusa")

        GameRules:SetStartingGold(50000)

        GameMode:SetRecommendedItemsDisabled(true)
        GameMode:SetStickyItemDisabled(true)
        GameMode:SetSendToStashEnabled(false)
        GameMode:SetStashPurchasingDisabled(true)
	GameRules:SetUseUniversalShopMode(true)

        GameMode:SetGiveFreeTPOnDeath(false)
        GameMode:SetBuybackEnabled(false)

        GameMode:SetAllowNeutralItemDrops(false)
        GameMode:SetNeutralStashEnabled(false)
        GameMode:SetNeutralStashTeamViewOnlyEnabled(true)
        GameMode:SetNeutralItemHideUndiscoveredEnabled(true)

        GameRules:SetTreeRegrowTime(300)

        GameRules:SetPreGameTime(0)
        GameRules:SetTimeOfDay(0)
        GameMode:SetDaynightCycleAdvanceRate(0.625)

        GameMode:SetTowerBackdoorProtectionEnabled(false)

        GameRules:SetFirstBloodActive(false)

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

        GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_DAMAGE, 1)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_HP, 25)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_STRENGTH_HP_REGEN, 0.05)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_DAMAGE, 1)
        GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_ATTACK_SPEED, 2)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_AGILITY_ARMOR, 0.3)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_DAMAGE, 1)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_MANA, 15)
	GameMode:SetCustomAttributeDerivedStatValue(DOTA_ATTRIBUTE_INTELLIGENCE_MANA_REGEN, 0.05)

        GameMode:SetInnateMeleeDamageBlockPercent(0)
        GameMode:SetInnateMeleeDamageBlockAmount(0)
	GameMode:SetInnateMeleeDamageBlockPerLevelAmount(0)

        GameMode:SetRemoveIllusionsOnDeath(false)
end
