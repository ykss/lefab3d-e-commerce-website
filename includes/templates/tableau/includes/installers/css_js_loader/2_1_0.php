<?php
$configuration = $db->Execute("SELECT configuration_group_id FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_title = 'CSS/JS Loader Configuration' LIMIT 1;");
$configuration_group_id = $configuration->fields['configuration_group_id'];

$db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_key = 'MINIFY_STATUS' LIMIT 1;");

if ($configuration_group_id) {
  $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
  ('Minify CSS', 'MINIFY_STATUS_CSS', 'false', 'Minifying will speed up your site\'s loading speed by combining and compressing CSS files (valid CSS is required).', " . $configuration_group_id . ", 10, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),'),
  ('Minify JavaScript', 'MINIFY_STATUS_JS', 'false', 'Minifying will speed up your site\'s loading speed by combining and compressing JavaScript files (valid JavaScript is required).', " . $configuration_group_id . ", 10, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');");
}

$db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = '2.1.0' WHERE configuration_key = 'CSS_JS_LOADER_VERSION' LIMIT 1;");