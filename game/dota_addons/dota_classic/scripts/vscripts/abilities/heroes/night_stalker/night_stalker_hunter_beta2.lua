-- Declare the ability class
night_stalker_hunter_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_night_stalker_hunter_beta2", "abilities/heroes/night_stalker/night_stalker_hunter_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function night_stalker_hunter_beta2:GetIntrinsicModifierName()
	return "modifier_night_stalker_hunter_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_night_stalker_hunter_beta2 = class({})

-- Called when the modifier is created
function modifier_night_stalker_hunter_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.attack_speed = self:GetAbility():GetSpecialValueFor("attack_speed")
end

-- Called when the modifier is refreshed
function modifier_night_stalker_hunter_beta2:OnRefresh(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.attack_speed = self:GetAbility():GetSpecialValueFor("attack_speed")
end

-- Declare the events and properties that our modifier affects
function modifier_night_stalker_hunter_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_ATTACKSPEED_BONUS_CONSTANT,
        }
end

-- Increase the unit's attack speed
function modifier_night_stalker_hunter_beta2:GetModifierAttackSpeedBonus_Constant()
        return self.attack_speed
end

-- Prevent the modifier from showing up in the buff bar
function modifier_night_stalker_hunter_beta2:IsHidden()
	return true
end
