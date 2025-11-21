var hud = $.GetContextPanel().GetParent().GetParent().GetParent();
var hero_interface = hud.FindChildTraverse("HUDElements").FindChildTraverse("lower_hud").FindChildTraverse("center_with_stats").FindChildTraverse("center_block");

hero_interface.FindChildTraverse("StatBranch").style.visibility = "collapse";
hero_interface.FindChildTraverse("ContentsContainer").style.visibility = "collapse";
hero_interface.FindChildTraverse("AghsStatusContainer").style.visibility = "collapse";

hero_interface.FindChildTraverse("inventory_composition_layer_container").style.visibility = "collapse";

hud.FindChildTraverse("HUDElements").FindChildTraverse("minimap_container").FindChildTraverse("GlyphScanContainer").style.visibility = "collapse";
hud.FindChildTraverse("HUDElements").FindChildTraverse("minimap_container").FindChildTraverse("RoshanTimerContainer").style.visibility = "collapse";
