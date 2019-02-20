<?php
$configuration = $db->Execute("SELECT configuration_group_id FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_title = '" . BOX_CONFIGURATION_TABLEAU . "' ORDER BY configuration_group_id ASC;");
if ($configuration->RecordCount() > 0) {
  while (!$configuration->EOF) {
    $db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_group_id = " . $configuration->fields['configuration_group_id'] . ";");
    $db->Execute("DELETE FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_id = " . $configuration->fields['configuration_group_id'] . ";");
    $configuration->MoveNext();
  }
}

// Breadcrumbs
$db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = '&nbsp;<span class=\"separator\">//</span>&nbsp;' WHERE configuration_key = 'BREAD_CRUMBS_SEPARATOR' LIMIT 1;");
$db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = 2 WHERE configuration_key = 'DEFINE_BREADCRUMB_STATUS' LIMIT 1;");

// CSS Buttons
$db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = 'Yes' WHERE configuration_key = 'IMAGE_USE_CSS_BUTTONS' LIMIT 1;");

// Search Header
$db->Execute("UPDATE " . TABLE_LAYOUT_BOXES . " SET layout_box_status_single = 1 WHERE layout_box_name = 'search_header.php' LIMIT 1;");

// My Categories Sidebox
$db->Execute("UPDATE " . TABLE_LAYOUT_BOXES . " SET layout_box_status = 1 WHERE layout_box_name = 'my_categories.php' LIMIT 1;");

// Column Layout Grid
$db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " where configuration_key IN ('PRODUCT_LISTING_LAYOUT_STYLE,PRODUCT_LISTING_COLUMNS_PER_ROW,PRODUCT_LISTING_LAYOUT_STYLE_CUSTOMER,PRODUCT_LISTING_GRID_SORT');");

$db->Execute("INSERT IGNORE INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, 
       configuration_description, configuration_group_id, sort_order, 
       last_modified, date_added, use_function, set_function) 
       VALUES ('Product Listing - Layout Style', 'PRODUCT_LISTING_LAYOUT_STYLE', 'rows', 
               'Select the layout style:<br />Each product can be listed in its own row (rows option)
                or products can be listed in multiple columns per row (columns option)<br />
				If customer control is enabled this sets the default style.', '8', '41', NULL, 
                now(), NULL, 'zen_cfg_select_option(array(\'rows\', \'columns\'),'),
               ('Product Listing - Columns Per Row', 'PRODUCT_LISTING_COLUMNS_PER_ROW', '3', 
               'Select the number of columns of products to show in each row in the product listing.  
               The default setting is 3.', '8', '42', NULL, now(), NULL, NULL),
               ('Product Listing - Layout Style - Customer Control', 'PRODUCT_LISTING_LAYOUT_STYLE_CUSTOMER', '0', 
               'Allow the customer to select the layout style (0=no, 1=yes):', '8', '43', NULL, 
                now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),'),
               ('Product Listing - Show Sorter for Columns Layout', 'PRODUCT_LISTING_GRID_SORT', '0', 
               'Allow the customer to select the item sort order (0=no, 1=yes):', '8', '44', NULL, 
                now(), NULL, 'zen_cfg_select_option(array(\'0\', \'1\'),');");
                
// Product Listing
$db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = 0 WHERE configuration_key = 'PRODUCT_LIST_FILTER' LIMIT 1;");
$db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = 0 WHERE configuration_key = 'PRODUCT_LIST_PRICE_BUY_NOW' LIMIT 1;");
$db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = 'columns' WHERE configuration_key = 'PRODUCT_LISTING_LAYOUT_STYLE' LIMIT 1;");
$db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = 4 WHERE configuration_key = 'PRODUCT_LISTING_COLUMNS_PER_ROW' LIMIT 1;");
$db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = 'false' WHERE configuration_key = 'PRODUCT_LIST_ALPHA_SORTER' LIMIT 1;");

// Banners
$db->Execute("INSERT IGNORE INTO " . TABLE_BANNERS . " (banners_title, banners_group, banners_html_text, status, banners_on_ssl)
  VALUES 
  ('We are LeFab 3D', 'homepageslide', '<img src=\"images/banners/skyhigh.png\" alt=\"\" class=\"banner-img\"><div class=\"banner\" /><p>The sky is the limit!</p></div>', 1, 1),
  ('We are LeFab 3D', 'homepageslide', '<img src=\"images/banners/success.png\" alt=\"\" class=\"banner-img\"><div class=\"banner\" /><p>Turn Your Idea into Success!</p></div>', 1, 1),
  ('We are LeFab 3D', 'homepageslide', '<img src=\"images/banners/unique.png\" alt=\"\" class=\"banner-img\"><div class=\"banner\" /><p>Unique and Exciting!</p></div>', 1, 1),
  ('We are LeFab 3D', 'homepageslide', '<img src=\"images/banners/customized_template.png\" alt=\"\" class=\"banner-img\"><div class=\"banner\" /><p>Get Up and Running Fast!</p></div>', 1, 1),  
  ('We are LeFab 3D', 'headerbanner', '<a href=\"index.php?main_page=shippinginfo\"><span class=\"banner-topo-first\"><strong>Free Shipping</strong> on all orders over $50 within the US</span><span class=\"banner-topo-second\"><span class=\"ico\">+</span><strong>Free Returns</strong> on all orders within the US</span><span class=\"banner-fake-button\">Learn More</span></a>', 1, 1),
  ('We are LeFab 3D', 'aboutus', 'hello', 1, 1),
  ('We are LeFab 3D', 'footerbanner', '<span><strong>24 hour Customer Support:</strong> 1-800-555-5555</span>', 1, 1);");

$db->Execute("INSERT IGNORE INTO " . TABLE_CONFIGURATION_GROUP . " (configuration_group_title, configuration_group_description, sort_order, visible) VALUES ('" . BOX_CONFIGURATION_TABLEAU. "', 'Set Tableau Template Options', '1', '1');");
$configuration_group_id = $db->Insert_ID();

$db->Execute("UPDATE " . TABLE_CONFIGURATION_GROUP . " SET sort_order = " . $configuration_group_id . " WHERE configuration_group_id = " . $configuration_group_id . ";");
