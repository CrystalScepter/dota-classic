// Declare variables
var hud = $.GetContextPanel().GetParent().GetParent().GetParent();
var shop_interface = hud.FindChildTraverse("HUDElements").FindChildTraverse("shop").FindChildTraverse("Main").FindChildTraverse("HeightLimiter").FindChildTraverse("GridMainShop");
var hero_interface = hud.FindChildTraverse("HUDElements").FindChildTraverse("lower_hud").FindChildTraverse("center_with_stats").FindChildTraverse("center_block");

// Disable buttons at the top of the shop
shop_interface.FindChildTraverse("SearchAndButtonsContainer").FindChildTraverse("RequestSuggestion").style.visibility = "collapse";
shop_interface.FindChildTraverse("SearchAndButtonsContainer").FindChildTraverse("PopularItems").style.visibility = "collapse";
shop_interface.FindChildTraverse("SearchAndButtonsContainer").FindChildTraverse("ToggleMinimalShop").style.visibility = "collapse";
shop_interface.FindChildTraverse("SearchAndButtonsContainer").FindChildTraverse("ToggleShopFilter").style.visibility = "collapse";
shop_interface.FindChildTraverse("SearchAndButtonsContainer").FindChildTraverse("BuybackProtection").style.visibility = "collapse";

// Disable neutral items tab in the shop
shop_interface.FindChildTraverse("GridHeaderAndMainContent").FindChildTraverse("GridMainContent").FindChildTraverse("GridShopHeaders").FindChildTraverse("GridMainTabs").FindChildTraverse("GridNeutralsTab").style.visibility = "collapse";

// Disable talent tree
hero_interface.FindChildTraverse("StatBranch").style.visibility = "collapse";
hero_interface.FindChildTraverse("StatBranchHotkey").style.visibility = "collapse";
hero_interface.FindChildTraverse("level_stats_frame").style.visibility = "collapse";
hero_interface.FindChildTraverse("StatBranch").SetPanelEvent("onmouseover", function () { });
hero_interface.FindChildTraverse("StatBranch").SetPanelEvent("onactivate", function () { });
hud.FindChildTraverse("HUDElements").FindChildTraverse("lower_hud").FindChildTraverse("StatBranchDrawer").style.visibility = "collapse";

// Disable innates and Aghanim's indicators
hero_interface.FindChildTraverse("ContentsContainer").style.visibility = "collapse";
hero_interface.FindChildTraverse("AghsStatusContainer").style.visibility = "collapse";

// Disable neutral item and TP scroll slots
hero_interface.FindChildTraverse("inventory_composition_layer_container").style.visibility = "collapse";

// Disable glyph, radar, Roshan and Tormentor indicators
hud.FindChildTraverse("HUDElements").FindChildTraverse("minimap_container").FindChildTraverse("GlyphScanContainer").style.visibility = "collapse";
hud.FindChildTraverse("HUDElements").FindChildTraverse("minimap_container").FindChildTraverse("RoshanTimerContainer").style.visibility = "collapse";
hud.FindChildTraverse("HUDElements").FindChildTraverse("minimap_container").FindChildTraverse("TormentorTimerContainer").style.visibility = "collapse";
