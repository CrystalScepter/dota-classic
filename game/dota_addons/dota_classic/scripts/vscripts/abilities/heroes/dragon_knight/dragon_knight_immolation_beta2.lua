-- Declare the ability class
dragon_knight_immolation_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_dragon_knight_immolation_beta2", "abilities/heroes/dragon_knight/dragon_knight_immolation_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function dragon_knight_immolation_beta2:GetIntrinsicModifierName()
	return "modifier_dragon_knight_immolation_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_dragon_knight_immolation_beta2 = class({})

-- Called when the modifier is created
function modifier_dragon_knight_immolation_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.damage_per_tick = self:GetAbility():GetSpecialValueFor("damage_per_tick")
	self.tick_interval = self:GetAbility():GetSpecialValueFor("tick_interval")
	self.radius = self:GetAbility():GetSpecialValueFor("radius")

	-- Proceed if the code is running in the server
	if IsServer() then
		-- Start the interval think
		self:StartIntervalThink(self.tick_interval)
	end
end

-- Called when the modifier is refreshed
function modifier_dragon_knight_immolation_beta2:OnRefresh(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.damage_per_tick = self:GetAbility():GetSpecialValueFor("damage_per_tick")
end

-- Called when the think interval occurs
function modifier_dragon_knight_immolation_beta2:OnIntervalThink()
	-- Retrieve the owner of the modifier
	local parent = self:GetParent()

	-- Find enemies nearby the parent
	local enemies = FindUnitsInRadius(
		parent:GetTeamNumber(),
		parent:GetAbsOrigin(),
		nil,
		self.radius,
		DOTA_UNIT_TARGET_TEAM_ENEMY,
		DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP,
		0,
		FIND_ANY_ORDER,
		false
	)

	-- Damage every enemy unit found
	for _, enemy in pairs(enemies) do
		-- Deal damage to the target
		local damage_table = {
			victim = enemy,
			attacker = parent,
			damage = self.damage_per_tick,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self:GetAbility(),
		}
		ApplyDamage(damage_table)
	end
end

-- Prevent the modifier from showing up in the buff bar
function modifier_dragon_knight_immolation_beta2:IsHidden()
	return true
end
