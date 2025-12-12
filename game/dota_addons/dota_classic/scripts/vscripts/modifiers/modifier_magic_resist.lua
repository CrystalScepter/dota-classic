-- Declare the modifier class
modifier_magic_resist = class({})

-- Declare the events and properties that our modifier affects
function modifier_magic_resist:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_MAGICAL_RESISTANCE_DIRECT_MODIFICATION,
	}
end

-- Remove the magic resist coming from intelligence
function modifier_magic_resist:GetModifierMagicalResistanceDirectModification()
	return 0 - self:GetParent():GetIntellect(false) * 0.1
end

-- Prevent the modifier from showing up in the buff bar
function modifier_magic_resist:IsHidden()
	return true
end

-- Make the modifier undispellable
function modifier_magic_resist:IsPurgable()
        return false
end
