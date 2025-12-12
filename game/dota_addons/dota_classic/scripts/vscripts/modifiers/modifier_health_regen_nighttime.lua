-- Declare the modifier class
modifier_health_regen_nighttime = class({})

-- Declare the events and properties that our modifier affects
function modifier_health_regen_nighttime:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
	}
end

-- Give the unit extra health regen
function modifier_health_regen_nighttime:GetModifierConstantHealthRegen()
	-- Proceed if synchronized with the server
	if IsServer() then
		-- Check whether it's day time and assign the stack count
		if GameRules:IsDaytime() then
            		self:SetStackCount(1)
        	else
            		self:SetStackCount(0)
        	end
	end

	-- Check if it's night time and the unit is Venomancer to assign the correct health regen value
	if self:GetStackCount() == 0 and self:GetParent():GetUnitName() == "npc_dota_hero_venomancer" then
		self.health_regen = 0.5
	else
		self.health_regen = 0
	end

	return self.health_regen
end

-- Prevent the modifier from showing up in the buff bar
function modifier_health_regen_nighttime:IsHidden()
	return true
end

-- Make the modifier undispellable
function modifier_health_regen_nighttime:IsPurgable()
	return false
end
