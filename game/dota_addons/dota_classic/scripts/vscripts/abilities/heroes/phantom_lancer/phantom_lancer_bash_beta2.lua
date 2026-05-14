-- Declare the ability class
phantom_lancer_bash_beta2 = class({})

-- Link the modifiers that are going to be used by our ability
LinkLuaModifier("modifier_phantom_lancer_bash_beta2", "abilities/heroes/phantom_lancer/phantom_lancer_bash_beta2.lua", LUA_MODIFIER_MOTION_NONE)

-- Return the name of the modifier
function phantom_lancer_bash_beta2:GetIntrinsicModifierName()
	return "modifier_phantom_lancer_bash_beta2"
end

----------------------------------------------------------------------------------------------------
-- Modifier class
----------------------------------------------------------------------------------------------------

-- Declare the modifier class
modifier_phantom_lancer_bash_beta2 = class({})

-- Called when the modifier is created
function modifier_phantom_lancer_bash_beta2:OnCreated(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.damage = self:GetAbility():GetSpecialValueFor("damage")
	self.chance = self:GetAbility():GetSpecialValueFor("chance")
end

-- Called when the modifier is refreshed
function modifier_phantom_lancer_bash_beta2:OnRefresh(keys)
	-- Retrieve the ability values that are going to be used by our modifier
	self.damage = self:GetAbility():GetSpecialValueFor("damage")
	self.chance = self:GetAbility():GetSpecialValueFor("chance")
end

-- Declare the events and properties that our modifier affects
function modifier_phantom_lancer_bash_beta2:DeclareFunctions()
        return {
                MODIFIER_EVENT_ON_ATTACK_LANDED,
        }
end

-- Called when an attack is successful
function modifier_phantom_lancer_bash_beta2:OnAttackLanded(keys)
        -- Retrieves the owner of the modifier
	local parent = self:GetParent()

	-- Returns if the attacker is not the parent of the modifier
	if keys.attacker ~= parent then
		return
	end

	-- Rolls the dice to check whether the attack will deal extra damage
	if RandomFloat(0, 100) < self.chance then
		-- Deals damage to the target
		local damage_table = {
			victim = keys.target,
			attacker = parent,
			damage = self.damage,
			damage_type = DAMAGE_TYPE_MAGICAL,
			ability = self:GetAbility(),
		}
		ApplyDamage(damage_table)
	end
end

-- Prevent the modifier from showing up in the buff bar
function modifier_phantom_lancer_bash_beta2:IsHidden()
	return true
end
