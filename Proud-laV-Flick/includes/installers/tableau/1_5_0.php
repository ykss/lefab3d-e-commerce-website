<?php
$db->Execute("INSERT IGNORE INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES ('Show Best Sellers on Main Page', 'SHOW_PRODUCT_INFO_MAIN_BEST_SELLERS', '1', 'Show Best Sellers Products on Main Page<br />0= off or set ...', 24, 0, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\"0\", \"1\", \"2\", \"3\", \"4\"),');");