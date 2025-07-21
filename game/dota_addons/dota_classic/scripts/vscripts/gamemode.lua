GameMode = class({})

function GameMode:InitGameMode()
        local GameMode = GameRules:GetGameModeEntity()

        SendToConsole("sv_cheats 1")

        GameRules:EnableCustomGameSetupAutoLaunch(true)
        GameRules:SetCustomGameSetupAutoLaunchDelay(0)
        GameRules:SetStrategyTime(0)
        GameRules:SetShowcaseTime(0)

        GameMode:SetCustomGameForceHero("npc_dota_hero_medusa")

        GameMode:SetRecommendedItemsDisabled(true)
        GameMode:SetStickyItemDisabled(true)
        GameMode:SetGiveFreeTPOnDeath(false)
end
