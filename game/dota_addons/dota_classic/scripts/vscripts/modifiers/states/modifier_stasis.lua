-- Declare the modifier class
modifier_stasis = class({})

-- Called when the modifier is created
function modifier_stasis:OnCreated(keys)
	-- Proceed if the code is running in the server
	if IsServer() then
		self:SetDuration(keys.duration, true)
	end
end

-- Called when the modifier is refreshed
function modifier_stasis:OnRefresh(keys)
	-- Recalculate the stun if the target is restunned
	self:OnCreated(keys)
end

-- Stun the parent
function modifier_stasis:CheckState()
	return {
		[MODIFIER_STATE_INVULNERABLE] = true,
	        [MODIFIER_STATE_NIGHTMARED] = true,
	        [MODIFIER_STATE_STUNNED] = true,
	}
end

-- Declare the events and properties that our modifier affects
function modifier_stasis:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
	}
end

-- Override the parent's animation
function modifier_stasis:GetOverrideAnimation(keys)
	return ACT_DOTA_DISABLED
end

-- Make the modifier a debuff
function modifier_stasis:IsDebuff()
	return true
end

-- Make the modifier undispellable
function modifier_stasis:IsPurgable()
	return false
end

-- Don't allow purging exceptions
function modifier_stasis:IsPurgableException()
	return false
end
