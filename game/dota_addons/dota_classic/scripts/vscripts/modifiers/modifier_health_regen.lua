-- Declare the modifier class
modifier_health_regen = class({})

-- Declare the events and properties that our modifier affects
function modifier_health_regen:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
	}
end

-- Reduce the health regen coming from strength
function modifier_health_regen:GetModifierConstantHealthRegen()
	return 0 - self:GetParent():GetStrength() * 0.05
end

-- Prevent the modifier from showing up in the buff bar
function modifier_health_regen:IsHidden()
	return true
end

-- Make the modifier undispellable
function modifier_health_regen:IsPurgable()
        return false
end
