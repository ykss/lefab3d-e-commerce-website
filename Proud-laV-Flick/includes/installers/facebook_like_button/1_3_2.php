<?php
  if (defined('FACEBOOK_LIKE_BUTTON_VERSION') && FACEBOOK_LIKE_BUTTON_VERSION == '1.3.1') {
  	$db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = '1.3.2' WHERE configuration_key = 'FACEBOOK_LIKE_BUTTON_VERSION' LIMIT 1;");
  	$messageStack->add('Upgraded Facebook Like Button to v1.3.2', 'success');
  } else {
    $configuration = $db->Execute("SELECT configuration_group_id FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_title = '" . BOX_CONFIGURATION_FACEBOOKLIKEBUTTON . "' ORDER BY configuration_group_id ASC;");
    if ($configuration->RecordCount() > 0) {
      while (!$configuration->EOF) {
        $db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_group_id = " . $configuration->fields['configuration_group_id'] . ";");
        $db->Execute("DELETE FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_id = " . $configuration->fields['configuration_group_id'] . ";");
        $configuration->MoveNext();
      }
    }
    #$db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_group_id = 0;");
    $db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_key = '';");

    $db->Execute("INSERT INTO " . TABLE_CONFIGURATION_GROUP . " (configuration_group_title, configuration_group_description, sort_order, visible) VALUES ('" . BOX_CONFIGURATION_FACEBOOKLIKEBUTTON . "', 'Set Facebook Like Button Options', '1', '1');");
    $configuration_group_id = $db->Insert_ID();

    $db->Execute("UPDATE " . TABLE_CONFIGURATION_GROUP . " SET sort_order = " . $configuration_group_id . " WHERE configuration_group_id = " . $configuration_group_id . ";");

    $db->Execute("INSERT INTO " . TABLE_CONFIGURATION . " (configuration_id, configuration_title, configuration_key, configuration_value, configuration_description, configuration_group_id, sort_order, last_modified, date_added, use_function, set_function) VALUES
      (NULL, 'Version', 'FACEBOOK_LIKE_BUTTON_VERSION', '1.3.2', 'Version Installed:', " . $configuration_group_id . ", 0, NOW(), NOW(), NULL, NULL),
      (NULL, 'Enable Facebook Like Button', 'FACEBOOK_LIKE_BUTTON_STATUS', 'true', 'Enable the Facebook Like Button?', " . $configuration_group_id . ", 10, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),'),
      (NULL, 'Method', 'FACEBOOK_LIKE_BUTTON_METHOD', 'iframe', 'Use the iframe, HTML5, or XBFML method?', " . $configuration_group_id . ", 20, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'iframe\', \'XBFML\', \'HTML5\'),'),
      (NULL, 'Alignment', 'FACEBOOK_LIKE_BUTTON_ALIGNMENT', 'none', 'Float the widget to the left, right, or none', " . $configuration_group_id . ", 40, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'none\', \'left\', \'right\'),'),
      (NULL, 'Layout Style', 'FACEBOOK_LIKE_BUTTON_LAYOUT_STYLE', 'standard', 'Select a layout style', " . $configuration_group_id . ", 50, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'standard\', \'button_count\', \'box_count\'),'),
      (NULL, 'Show Faces', 'FACEBOOK_LIKE_BUTTON_SHOW_FACES', 'false', 'Specifies whether to display profile photos below the button (if true, set height to 80 or more; standard layout only)', " . $configuration_group_id . ", 60, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),'),
      (NULL, 'Action', 'FACEBOOK_LIKE_BUTTON_ACTION', 'like', 'The verb to display on the button', " . $configuration_group_id . ", 70, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'like\', \'recommend\'),'),
      (NULL, 'Font', 'FACEBOOK_LIKE_BUTTON_FONT', 'arial', 'Select a font:', " . $configuration_group_id . ", 80, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'arial\', \'lucida grande\', \'segoe ui\', \'tahoma\', \'trebuchet ms\', \'verdana\'),'),
      (NULL, 'Color Scheme', 'FACEBOOK_LIKE_BUTTON_COLOR_SCHEME', 'light', 'The color scheme for the like button', " . $configuration_group_id . ", 90, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'light\', \'dark\'),'),
      (NULL, 'Width', 'FACEBOOK_LIKE_BUTTON_WIDTH', '450', 'The width of the like button (standard => 450; button_count => 90; box_count => 55)', " . $configuration_group_id . ", 100, NOW(), NOW(), NULL, NULL),
      (NULL, 'Combined Send Button', 'FACEBOOK_LIKE_BUTTON_SEND', 'false', 'Create a combined Like and Send button?', " . $configuration_group_id . ", 110, NOW(), NOW(), NULL, 'zen_cfg_select_option(array(\'true\', \'false\'),');");
  	$messageStack->add('Installed Facebook Like Button v1.3.2', 'success');
  }