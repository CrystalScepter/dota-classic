-- Declare the ability class
out_of_the_world_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_out_of_the_world_beta2", "abilities/buildings/out_of_the_world_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Called when the ability is created
function out_of_the_world_beta2:Spawn()
	-- Proceed if the code is running in the server
	if IsServer() then
		-- Set the ability level to 1
		self:SetLevel(1)
	end
end

-- Return the name of the modifier
function out_of_the_world_beta2:GetIntrinsicModifierName()
	return "modifier_out_of_the_world_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_out_of_the_world_beta2 = class({})

-- Declare the states that our modifier affects
function modifier_out_of_the_world_beta2:CheckState()
	return {
		[MODIFIER_STATE_DEBUFF_IMMUNE] = true,
		[MODIFIER_STATE_INVISIBLE] = true,
		[MODIFIER_STATE_NOT_ON_MINIMAP] = true,
		[MODIFIER_STATE_NO_HEALTH_BAR] = true,
		[MODIFIER_STATE_NO_UNIT_COLLISION] = true,
		[MODIFIER_STATE_OUT_OF_GAME] = true,
		[MODIFIER_STATE_TRUESIGHT_IMMUNE] = true,
		[MODIFIER_STATE_UNSELECTABLE] = true,
		[MODIFIER_STATE_UNTARGETABLE] = true,
	}
end
