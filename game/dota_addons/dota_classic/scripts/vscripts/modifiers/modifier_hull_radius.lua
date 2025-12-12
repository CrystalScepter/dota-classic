-- Declare the modifier class
modifier_hull_radius = class({})

-- Called when the modifier is created
function modifier_hull_radius:OnCreated()
	-- Synchronize with the server
	if IsServer() then
		-- Proceed if the unit is Shadow Demon
		if self:GetParent():GetUnitName() == "npc_dota_hero_shadow_demon" then
			-- Set the custom hull radius
			self:GetParent():SetHullRadius(8)
		-- Proceed if the unit is Venomancer
		elseif self:GetParent():GetUnitName() == "npc_dota_hero_venomancer" then
			-- Set the custom hull radius
			self:GetParent():SetHullRadius(32)
		end
	end
end

-- Prevent the modifier from showing up in the buff bar
function modifier_hull_radius:IsHidden()
	return true
end
