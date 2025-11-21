var hud = $.GetContextPanel().GetParent().GetParent().GetParent();
var hero_interface = hud.FindChildTraverse("HUDElements").FindChildTraverse("lower_hud").FindChildTraverse("center_with_stats").FindChildTraverse("center_block");

hero_interface.FindChildTraverse("inventory_composition_layer_container").style.visibility = "collapse";

hud.FindChildTraverse("HUDElements").FindChildTraverse("minimap_container").FindChildTraverse("RoshanTimerContainer").style.visibility = "collapse";
