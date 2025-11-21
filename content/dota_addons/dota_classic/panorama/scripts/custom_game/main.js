var hud = $.GetContextPanel().GetParent().GetParent().GetParent();
var shop_interface = hud.FindChildTraverse("HUDElements").FindChildTraverse("shop").FindChildTraverse("Main").FindChildTraverse("HeightLimiter").FindChildTraverse("GridMainShop");
var hero_interface = hud.FindChildTraverse("HUDElements").FindChildTraverse("lower_hud").FindChildTraverse("center_with_stats").FindChildTraverse("center_block");

shop_interface.FindChildTraverse("SearchAndButtonsContainer").FindChildTraverse("RequestSuggestion").style.visibility = "collapse";
shop_interface.FindChildTraverse("SearchAndButtonsContainer").FindChildTraverse("PopularItems").style.visibility = "collapse";
shop_interface.FindChildTraverse("SearchAndButtonsContainer").FindChildTraverse("ToggleMinimalShop").style.visibility = "collapse";
shop_interface.FindChildTraverse("SearchAndButtonsContainer").FindChildTraverse("ToggleShopFilter").style.visibility = "collapse";
shop_interface.FindChildTraverse("SearchAndButtonsContainer").FindChildTraverse("BuybackProtection").style.visibility = "collapse";

hero_interface.FindChildTraverse("StatBranch").style.visibility = "collapse";
hero_interface.FindChildTraverse("ContentsContainer").style.visibility = "collapse";
hero_interface.FindChildTraverse("AghsStatusContainer").style.visibility = "collapse";

hero_interface.FindChildTraverse("inventory_composition_layer_container").style.visibility = "collapse";

hud.FindChildTraverse("HUDElements").FindChildTraverse("minimap_container").FindChildTraverse("GlyphScanContainer").style.visibility = "collapse";
hud.FindChildTraverse("HUDElements").FindChildTraverse("minimap_container").FindChildTraverse("RoshanTimerContainer").style.visibility = "collapse";
