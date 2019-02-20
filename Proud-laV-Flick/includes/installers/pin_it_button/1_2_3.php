<?php
  if (defined('PIN_IT_BUTTON_VERSION') && PIN_IT_BUTTON_VERSION == '1.2.2') {
  	$db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = '1.2.3' WHERE configuration_key = 'PIN_IT_BUTTON_VERSION' LIMIT 1;");
  	$messageStack->add('Upgraded Pin It Button to v1.2.3', 'success');
  } else {
    $configuration = $db->Execute("SELECT configuration_group_id FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_title = '" . BOX_CONFIGURATION_PINITBUTTON . "' ORDER BY configuration_group_id ASC;");
    if ($configuration->RecordCount() > 0) {
      while (!$configuration->EOF) {
        $db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_group_id = " . $configuration->fields['configuration_group_id'] . ";");
        $db->Execute("DELETE FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_id = " . $configuration->fields['configuration_group_id'] . ";");
        $configuration->MoveNext();
      }
    }
    #$db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_group_id = 0;");
    $db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_key = '';");

    $db->Execute("INSERT INTO " . TABLE_CONFIGURATION_GROUP . " (configuration_group_title, configuration_group_description, sort_order, visible) VALUES ('" . BOX_CONFIGURATION_PINITBUTTON . "', 'Set Pin It Button Options', '1', '1');");
    $configuration_group_id = $db->Insert_ID();

    $db->Execute("UPDATE " . TABLE_CONFIGURATION_GROUP . " SET sort_order = " . $configuration_group_id . " WHERE configuration_group_id = " . $configuration_group_id . ";");

    $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
      (NULL, 'Version', 'PIN_IT_BUTTON_VERSION', '1.2.3', 'Version Installed:', " . $configuration_group_id . ", 0, NOW(), NOW(), NULL, NULL),
      (NULL, 'Enable Pinterest Button', 'PINTEREST_BUTTON_STATUS', 'false', 'Enable the Pinterest.com Pin It Button?', " . $configuration_group_id . ", 0, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),'), 
      (NULL, 'Pinterest Button Count', 'PINTEREST_BUTTON_COUNT', 'none', 'Display the count horizontally, vertically, or disable (none)', " . $configuration_group_id . ", 10, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'none\', \'vertical\', \'horizontal\'),'),
      (NULL, 'Pinterest Method', 'PINTEREST_BUTTON_METHOD', 'basic', 'Use the basic method (for single pin-it buttons per page) or the advanced method (for multiple buttons - asynchronous):', " . $configuration_group_id . ", 20, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'basic\', \'advanced\'),');");
  	$messageStack->add('Installed Pin It Button v1.2.3', 'success');
  }