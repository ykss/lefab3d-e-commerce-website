<?php
$configuration = $db->Execute("SELECT configuration_group_id FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_title = 'Numinix Disk Cache Configuration' ORDER BY configuration_group_id ASC;");
if ($configuration->RecordCount() > 0) {
  while (!$configuration->EOF) {
    $db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_group_id = " . $configuration->fields['configuration_group_id'] . ";");
    $db->Execute("DELETE FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_id = " . $configuration->fields['configuration_group_id'] . ";");
    $configuration->MoveNext();
  }
}
#$db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_group_id = 0;");
$db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_key = '';");

$db->Execute("INSERT INTO " . TABLE_CONFIGURATION_GROUP . " (configuration_group_title, configuration_group_description, sort_order, visible) VALUES ('Numinix Disk Cache Configuration', 'Set Numinix Disk Cache Options', '1', '1');");
$configuration_group_id = $db->Insert_ID();

$db->Execute("UPDATE " . TABLE_CONFIGURATION_GROUP . " SET sort_order = " . $configuration_group_id . " WHERE configuration_group_id = " . $configuration_group_id . ";");

$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
            ('Version', 'NMX_DISK_CACHE_VERSION', '1.0.0', 'Version installed:', " . $configuration_group_id . ", 0, NOW(), NOW(), NULL, NULL), 
            ('Status', 'NMX_DISK_CACHE_STATUS', 'false', 'Enable Numinix Disk Cache?', " . $configuration_group_id . ", 1, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\"true\", \"false\"),'),
            ('Default Cache Time', 'NMX_DISK_CACHE_DEFAULT_TIME', '3600', 'Set a default time limit in seconds for caching content.  Note: setting this option to 0 and not specifying an override in the code will disable the caching function.', " . $configuration_group_id . ", 2, NOW(), NOW(), NULL, NULL),
            ('Default GZip Level', 'NMX_DISK_CACHE_DEFAULT_GZIP', '0', 'Set to a value from 1 to 9 to enable gzip compression.  Leave as 0 or blank to disable.', " . $configuration_group_id . ", 3, NOW(), NOW(), NULL, NULL),
            ('Cron Key', 'NMX_DISK_CACHE_KEY', 'numinix', 'Set a unique key to be used for executing the cron file.', " . $configuration_group_id . ", 4, NOW(), NOW(), NULL, NULL);");

$zc150 = (PROJECT_VERSION_MAJOR > 1 || (PROJECT_VERSION_MAJOR == 1 && substr(PROJECT_VERSION_MINOR, 0, 3) >= 5));
if ($zc150) { // continue Zen Cart 1.5.0
  // delete configuration menu
  $db->Execute("DELETE FROM ".TABLE_ADMIN_PAGES." WHERE page_key = 'configNMXDiskCache' LIMIT 1;");
  // add configuration menu
  if (!zen_page_key_exists('configNMXDiskCache')) {
    $configuration = $db->Execute("SELECT configuration_group_id FROM " . TABLE_CONFIGURATION . " WHERE configuration_key = 'NMX_DISK_CACHE_VERSION' LIMIT 1;");
    $configuration_group_id = $configuration->fields['configuration_group_id'];
    if ((int)$configuration_group_id > 0) {
      zen_register_admin_page('configNMXDiskCache',
                              'BOX_CONFIGURATION_NMX_DISK_CACHE', 
                              'FILENAME_CONFIGURATION',
                              'gID=' . $configuration_group_id, 
                              'configuration', 
                              'Y',
                              $configuration_group_id);
        
      $messageStack->add('Enabled Numinix Disk Cache Configuration menu.', 'success');
    }
  }
}

$messageStack->add('Installed Numinix Disk Cache v1.0.0', 'success');