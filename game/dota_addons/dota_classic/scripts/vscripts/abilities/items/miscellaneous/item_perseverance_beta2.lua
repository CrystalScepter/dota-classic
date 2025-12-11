-- Declare the item class
item_perseverance_beta2 = class({})

-- Link the modifiers that are going to be used by our item
LinkLuaModifier("modifier_perseverance_beta2", "abilities/items/miscellaneous/item_perseverance_beta2.lua", LUA_MODIFIER_MOTION_NONE)
LinkLuaModifier("modifier_perseverance_truesight_beta2", "abilities/items/miscellaneous/item_perseverance_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function item_perseverance_beta2:GetIntrinsicModifierName()
	return "modifier_perseverance_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_perseverance_beta2 = class({})

-- Called when the modifier is created
function modifier_perseverance_beta2:OnCreated(kv)
	-- Retrieve the ability values that are going to be used by our modifier
	self.bonus_health_regen = self:GetAbility():GetSpecialValueFor("bonus_health_regen")
	self.bonus_mana_regen = self:GetAbility():GetSpecialValueFor("bonus_mana_regen")
end

-- Declare the events and properties that our modifier affects
function modifier_perseverance_beta2:DeclareFunctions()
	return {
		MODIFIER_PROPERTY_HEALTH_REGEN_CONSTANT,
		MODIFIER_PROPERTY_MP_REGEN_AMPLIFY_PERCENTAGE,
	}
end

-- Give the unit extra health regen
function modifier_perseverance_beta2:GetModifierConstantHealthRegen()
	return self.bonus_health_regen
end

-- Give the unit extra mana regen
function modifier_perseverance_beta2:GetModifierMPRegenAmplify_Percentage()
	return self.bonus_mana_regen
end

-- Allow the modifier to stack
function modifier_perseverance_beta2:GetAttributes()
	return MODIFIER_ATTRIBUTE_MULTIPLE
end

-- Prevent the modifier from showing up in the buff bar
function modifier_perseverance_beta2:IsHidden()
	return true
end

-- Indicate that the item has an aura
function modifier_perseverance_beta2:IsAura()
	return true
end

-- Return the name of the aura modifier
function modifier_perseverance_beta2:GetModifierAura()
	return "modifier_perseverance_truesight_beta2"
end

-- Restrict the aura to only allied units
function modifier_perseverance_beta2:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_FRIENDLY
end

-- Allow the aura to affect only heroes
function modifier_perseverance_beta2:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO
end

-- Return the radius of the aura
function modifier_perseverance_beta2:GetAuraRadius()
	return 0
end

----------------------------------------------------------------------------------------------------
-- True Sight modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_perseverance_truesight_beta2 = class({})

-- Called when the modifier is created
function modifier_perseverance_truesight_beta2:OnCreated(kv)
	-- Retrieve the ability values that are going to be used by our modifier
	self.radius = self:GetAbility():GetSpecialValueFor("radius")
end

-- Indicate that the item has an aura
function modifier_perseverance_truesight_beta2:IsAura()
	return true
end

-- Return the name of the aura modifier
function modifier_perseverance_truesight_beta2:GetModifierAura()
	return "modifier_truesight"
end

-- Reveal only enemy units
function modifier_perseverance_truesight_beta2:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_ENEMY
end

-- Allow the aura to reveal only heroes, creeps and summons
function modifier_perseverance_truesight_beta2:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP
end

-- Allow the aura to reveal magic immune and invulnerable heroes
function modifier_perseverance_truesight_beta2:GetAuraSearchFlags()
	return DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_INVULNERABLE
end

-- Return the radius of the aura
function modifier_perseverance_truesight_beta2:GetAuraRadius()
	return self.radius
end
