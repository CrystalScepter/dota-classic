-- Declare the item class
item_gem_beta2 = class({})

-- Link the modifiers that are going to be used by our item
LinkLuaModifier("modifier_gem_beta2", "abilities/items/midlaneshop/item_gem_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function item_gem_beta2:GetIntrinsicModifierName()
	return "modifier_gem_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_gem_beta2 = class({})

-- Called when the modifier is created
function modifier_gem_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.radius = self:GetAbility():GetSpecialValueFor("radius")
end

-- Indicate that the item has an aura
function modifier_gem_beta2:IsAura()
	return true
end

-- Return the name of the aura modifier
function modifier_gem_beta2:GetModifierAura()
	return "modifier_truesight"
end

-- Reveal only enemy units
function modifier_gem_beta2:GetAuraSearchTeam()
	return DOTA_UNIT_TARGET_TEAM_ENEMY
end

-- Allow the aura to reveal only heroes, creeps and summons
function modifier_gem_beta2:GetAuraSearchType()
	return DOTA_UNIT_TARGET_HERO + DOTA_UNIT_TARGET_CREEP
end

-- Allow the aura to reveal magic immune and invulnerable heroes
function modifier_gem_beta2:GetAuraSearchFlags()
	return DOTA_UNIT_TARGET_FLAG_MAGIC_IMMUNE_ENEMIES + DOTA_UNIT_TARGET_FLAG_INVULNERABLE
end

-- Return the radius of the aura
function modifier_gem_beta2:GetAuraRadius()
	return self.radius
end
