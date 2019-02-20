<?php
$configuration = $db->Execute("SELECT configuration_group_id FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_title = 'CSS/JS Loader' OR configuration_group_title = 'CSS/JS Loader Configuration';");
if ($configuration->RecordCount() > 0) {
  while (!$configuration->EOF) {
    $db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_group_id = " . $configuration->fields['configuration_group_id'] . ";");
    $db->Execute("DELETE FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_id = " . $configuration->fields['configuration_group_id'] . ";");
    $configuration->MoveNext();
  }
}
$db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_group_id = 0;");
$db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_key = '';");

$db->Execute("INSERT INTO " . TABLE_CONFIGURATION_GROUP . " (configuration_group_id, configuration_group_title, configuration_group_description, sort_order, visible) VALUES (NULL, 'CSS/JS Loader Configuration', 'Set CSS/JS Loader Options', '1', '1');");
$configuration_group_id = $db->Insert_ID();

$db->Execute("UPDATE " . TABLE_CONFIGURATION_GROUP . " SET sort_order = " . $configuration_group_id . " WHERE configuration_group_id = " . $configuration_group_id . ";");

$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
            ('Version', 'CSS_JS_LOADER_VERSION', '2.0.0', 'Installed Version', " . $configuration_group_id . ", 0, NOW(), NOW(), NULL, 'trim('), 
            ('Enable Minify', 'MINIFY_STATUS', 'true', 'Minifying will speed up your site\'s loading speed by combining and compressing css/js files (valid CSS and JS are required).', " . $configuration_group_id . ", 10, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),'),
            ('Max URL Length', 'MINIFY_MAX_URL_LENGHT', '500', 'On some servers the maximum length of any POST/GET request URL is limited. If this is the case for your server, you can change the setting here', " . $configuration_group_id . ", 20, NOW(), NOW(), NULL, NULL),
            ('Minify Cache Time', 'MINIFY_CACHE_TIME_LENGHT', '31536000', 'Set minify cache time (in second). Default is 1 year (31536000)', " . $configuration_group_id . ", 30, NOW(), NOW(), NULL, NULL),
            ('Latest Cache Time', 'MINIFY_CACHE_TIME_LATEST', '0', 'Normally you don\'t have to set this, but if you have just made changes to your js/css files and want to make sure they are reloaded right away, you can reset this to 0.', " . $configuration_group_id . ", 40, NOW(), NOW(), NULL, NULL)");