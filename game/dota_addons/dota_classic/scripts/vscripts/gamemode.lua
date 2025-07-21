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
        GameMode:SetGiveFreeTPOnDeath(false)

        GameMode:SetAllowNeutralItemDrops(false)
        GameMode:SetNeutralStashEnabled(false)
        GameMode:SetNeutralStashTeamViewOnlyEnabled(true)
        GameMode:SetNeutralItemHideUndiscoveredEnabled(true)

        GameRules:SetTreeRegrowTime(300)

        GameMode:SetTowerBackdoorProtectionEnabled(false)

        GameRules:SetFirstBloodActive(false)
end
