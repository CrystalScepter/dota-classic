-- Declare the ability class
riki_critical_strike_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_riki_critical_strike_beta2", "abilities/heroes/riki/riki_critical_strike_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function riki_critical_strike_beta2:GetIntrinsicModifierName()
	return "modifier_riki_critical_strike_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_riki_critical_strike_beta2 = class({})

-- Called when the modifier is created
function modifier_riki_critical_strike_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.critical_damage = self:GetAbility():GetSpecialValueFor("critical_damage")
	self.critical_chance = self:GetAbility():GetSpecialValueFor("critical_chance")
end

-- Called when the modifier is refreshed
function modifier_riki_critical_strike_beta2:OnRefresh(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.critical_damage = self:GetAbility():GetSpecialValueFor("critical_damage")
	self.critical_chance = self:GetAbility():GetSpecialValueFor("critical_chance")
end

-- Declare the events and properties that our modifier affects
function modifier_riki_critical_strike_beta2:DeclareFunctions()
        return {
                MODIFIER_PROPERTY_PREATTACK_CRITICALSTRIKE,
        }
end

-- Increases the damage output if the unit crits
function modifier_riki_critical_strike_beta2:GetModifierPreAttack_CriticalStrike(keys)
	-- Retrieve the owner of the modifier
	local parent = self:GetParent()

	-- Return if the attacker is not the parent of the modifier
	if keys.attacker ~= parent then
		return
	end

        -- Return if the target is not on the opposite team
	if keys.target:GetTeamNumber() == parent:GetTeamNumber() then
		return
	end

	-- Return if the target is a building
	if keys.target:IsBuilding() then
		return
	end

	-- Return if the target has magic immunity
	if keys.target:IsMagicImmune() then
		return
	end

	-- Roll the dice to determine whether it's a critical attack or not
	if RandomFloat(0, 100) < self.critical_chance then
		return self.critical_damage
	end
end

-- Prevent the modifier from showing up in the buff bar
function modifier_riki_critical_strike_beta2:IsHidden()
	return true
end
