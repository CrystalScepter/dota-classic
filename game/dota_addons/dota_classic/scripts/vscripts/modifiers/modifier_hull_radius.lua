-- Declare the modifier class
modifier_hull_radius = class({})

-- Called when the modifier is created
function modifier_hull_radius:OnCreated()
	-- Proceed if synchronized with the server
	if IsServer() then
		-- Proceed if the unit is Shadow Demon and set the custom hull radius
		if self:GetParent():GetUnitName() == "npc_dota_hero_elder_titan" then
			self:GetParent():SetHullRadius(48)
		-- Proceed if the unit is Shadow Demon and set the custom hull radius
		elseif self:GetParent():GetUnitName() == "npc_dota_hero_shadow_demon" then
			self:GetParent():SetHullRadius(0)
		-- Proceed if the unit is Underlord and set the custom hull radius
		elseif self:GetParent():GetUnitName() == "npc_dota_hero_abyssal_underlord" then
			self:GetParent():SetHullRadius(0)
		-- Set a standard hull radius value for heroes if it's none of the listed units
		else
			self:GetParent():SetHullRadius(32)
		end
	end
end

-- Prevent the modifier from showing up in the buff bar
function modifier_hull_radius:IsHidden()
	return true
end

-- Make the modifier undispellable
function modifier_hull_radius:IsPurgable()
	return false
end
