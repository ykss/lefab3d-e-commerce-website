<?php
  if (defined('GOOGLE_PLUS_ONE_VERSION') && GOOGLE_PLUS_ONE_VERSION == '1.1.1') {
  	$db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = '1.1.2' WHERE configuration_key = 'GOOGLE_PLUS_ONE_VERSION' LIMIT 1;");
  	$messageStack->add('Upgraded Google Plus One Button to v1.1.2', 'success');
  } else {
    $configuration = $db->Execute("SELECT configuration_group_id FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_title = '" . BOX_CONFIGURATION_GOOGLE_PLUS . "' ORDER BY configuration_group_id ASC;");
    if ($configuration->RecordCount() > 0) {
      while (!$configuration->EOF) {
        $db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_group_id = " . $configuration->fields['configuration_group_id'] . ";");
        $db->Execute("DELETE FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_id = " . $configuration->fields['configuration_group_id'] . ";");
        $configuration->MoveNext();
      }
    }
    #$db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_group_id = 0;");
    $db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_key = '';");

    $db->Execute("INSERT INTO " . TABLE_CONFIGURATION_GROUP . " (configuration_group_title, configuration_group_description, sort_order, visible) VALUES ('" . BOX_CONFIGURATION_GOOGLE_PLUS . "', 'Set Google Plus One Button Options', '1', '1');");
    $configuration_group_id = $db->Insert_ID();

    $db->Execute("UPDATE " . TABLE_CONFIGURATION_GROUP . " SET sort_order = " . $configuration_group_id . " WHERE configuration_group_id = " . $configuration_group_id . ";");

    $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
      (NULL, 'Version', 'GOOGLE_PLUS_ONE_VERSION', '1.1.2', 'Version Installed:', " . $configuration_group_id . ", 0, NOW(), NOW(), NULL, NULL),
      (NULL, 'Enable Google Plus One Button', 'GOOGLE_PLUS_ONE_ENABLED', 'true', 'Enable the Google Plus One Button?', " . $configuration_group_id . ", 1, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),'),
      (NULL, 'Enabled Pages', 'GOOGLE_PLUS_ONE_PAGES', 'product_info, document_product_info, document_general_info', 'Specify the page names to enable or use * to enable for all pages:', " . $configuration_group_id . ", 2, NOW(), NOW(), NULL, NULL),
      (NULL, 'Parse', 'GOOGLE_PLUS_ONE_PARSE', 'Default (On Load)', 'Select the parse method:', " . $configuration_group_id . ", 10, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'Default (On Load)\', \'Explicit\'),'),
      (NULL, 'Size', 'GOOGLE_PLUS_ONE_SIZE', 'Standard (24px)', 'Select the button size:', " . $configuration_group_id . ", 20, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'Small (15px)\', \'Medium (20px)\', \'Standard (24px)\', \'Tall (60px)\'),'),
      (NULL, 'Language', 'GOOGLE_PLUS_ONE_LANGUAGE', 'English (US)', 'Select a language:', " . $configuration_group_id . ", 30, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'Arabic\', \'Bulgarian\', \'Catalan\', \'Chinese (Simplified)\', \'Chinese (Traditional)\', \'Croatian\', \'Czech\', \'Danish\', \'Dutch\', \'English (US)\', \'English (UK)\', \'Estonian\', \'Filipino\', \'Finnish\', \'French\', \'German\', \'Greek\', \'Hebrew\', \'Hindi\', \'Hungarian\', \'Indonesian\', \'Italian\', \'Japanese\', \'Korean\', \'Latvian\', \'Malay\', \'Norwegian\', \'Persian\', \'Polish\', \'Portuguese (Brazil)\', \'Portuguese (Portugal)\', \'Romanian\', \'Russian\', \'Serbian\', \'Swedish\', \'Slovak\', \'Slovenian\', \'Spanish\', \'Spanish (Latin America)\', \'Thai\', \'Turkish\', \'Ukranian\', \'Vietnamese\'),'),
      (NULL, 'Callback', 'GOOGLE_PLUS_ONE_CALLBACK', '', 'Optionally specify a callback function:', " . $configuration_group_id . ", 40, NOW(), NOW(), NULL, NULL),
      (NULL, 'Count', 'GOOGLE_PLUS_ONE_COUNT', 'true', 'Display the count?', " . $configuration_group_id . ", 50, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');");
  	$messageStack->add('Installed Google Plus One Button v1.3.2', 'success');
  }