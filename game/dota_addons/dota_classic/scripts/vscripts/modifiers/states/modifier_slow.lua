-- Declare the modifier class
modifier_slow = class({})

-- Called when the modifier is created
function modifier_slow:OnCreated(keys)
	-- Proceed if the code is running in the server
	if IsServer() then
		-- Tell the server we are ready to send data to the client
		self:SetHasCustomTransmitterData(true)

		-- Retrieve the data values
		self.slow = 0 - keys.slow

		-- Calculate the slow duration based on the parent's status resistance
		local resist = 1 - self:GetParent():GetStatusResistance()
		local duration = keys.duration * resist
		self:SetDuration(duration, true)
	end
end

-- Pick the data to be sent to the client
function modifier_slow:AddCustomTransmitterData()
	-- Store the data in the server
	local data = {
		slow = self.slow,
	}

	return data
end

-- Transmit server data to the client
function modifier_slow:HandleCustomTransmitterData(data)
	self.slow = data.slow
end

-- Declare the events and properties that our modifier affects
function modifier_slow:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MOVESPEED_BONUS_PERCENTAGE,
	}
end

-- Reduce the unit's movement speed
function modifier_slow:GetModifierMoveSpeedBonus_Percentage()
	return self.slow
end

-- Make the modifier dispellable
function modifier_slow:IsPurgable()
	return true
end

-- Make the modifier a debuff
function modifier_slow:IsDebuff()
	return true
end

-- Allow the modifier to stack
function modifier_slow:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end
