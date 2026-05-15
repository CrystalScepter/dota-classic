-- Declare the modifier class
modifier_stun = class({})

-- Called when the modifier is created
function modifier_stun:OnCreated(keys)
	-- Proceed if the code is running in the server
	if IsServer() then
		-- Retrieve the particle effect
		self.particle = "particles/generic_gameplay/generic_stunned.vpcf"

		-- Calculate the stun duration based on the parent's status resistance
		local resist = 1 - self:GetParent():GetStatusResistance()
		local duration = keys.duration * resist
		self:SetDuration(duration, true)
	end
end

-- Called when the modifier is refreshed
function modifier_stun:OnRefresh(keys)
	-- Recalculate the stun if the target is restunned
	self:OnCreated(keys)
end

-- Stun the parent
function modifier_stun:CheckState()
	return {
		[MODIFIER_STATE_STUNNED] = true,
	}
end

-- Declare the events and properties that our modifier affects
function modifier_stun:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_OVERRIDE_ANIMATION,
	}
end

-- Override the parent's animation
function modifier_stun:GetOverrideAnimation(keys)
	return ACT_DOTA_DISABLED
end

-- Return the particle effect to be used
function modifier_stun:GetEffectName()
	return self.particle
end

-- Return the particle origin
function modifier_stun:GetEffectAttachType()
	return PATTACH_OVERHEAD_FOLLOW
end

-- Make the modifier dispellable only by hard dispels
function modifier_stun:IsStunDebuff()
	return true
end

-- Make the modifier a debuff
function modifier_stun:IsDebuff()
	return true
end
