<?php
$configuration = $db->Execute("SELECT configuration_group_id FROM " . TABLE_CONFIGURATION . " WHERE configuration_key = 'NMX_DISK_CACHE_VERSION' LIMIT 1;");
$configuration_group_id = $configuration->fields['configuration_group_id'];
if ($configuration_group_id > 0) {
  $db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = '1.1.0' WHERE configuration_key = 'NMX_DISK_CACHE_VERSION' LIMIT 1;");
}

$db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
            ('Reset Cache', 'NMX_DISK_CACHE_RESET', 'false', 'Manually force the cache to be reset?', " . $configuration_group_id . ", 99, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\"true\", \"false\"),');");

$messageStack->add('Updated Numinix Disk Cache to v1.1.0', 'success');