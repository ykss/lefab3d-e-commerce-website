<?php
  if (!defined('IS_ADMIN_FLAG')) {
    die('Illegal Access');
  }
  // add upgrade script
  $google_plus_one_button_version = (defined('GOOGLE_PLUS_ONE_VERSION') ? GOOGLE_PLUS_ONE_VERSION : 'new');
  $current_version = '1.1.2';
  while ($google_plus_one_button_version != $current_version) {
    switch($google_plus_one_button_version) {
      case 'new':
      case '1.1.1':
        // perform upgrade
        if (file_exists(DIR_WS_INCLUDES . 'installers/google_plus_one_button/1_1_2.php')) {
          include_once(DIR_WS_INCLUDES . 'installers/google_plus_one_button/1_1_2.php');
          $google_plus_one_button_version = '1.1.2';          
		  break;
        } else {
          break 2;
		}				 					                  
      default:
        $google_plus_one_button_version = $current_version;
        // break all the loops
        break 2;      
    }
  }
  $zc150 = (PROJECT_VERSION_MAJOR > 1 || (PROJECT_VERSION_MAJOR == 1 && substr(PROJECT_VERSION_MINOR, 0, 3) >= 5));
  if ($zc150 && function_exists('zen_page_key_exists')) // continue Zen Cart 1.5.0
  {
	  // add configuration menu
	  if (!zen_page_key_exists('configGooglePlusOne'))
	  {
		  $configuration          = $db->Execute("SELECT configuration_group_id FROM " . TABLE_CONFIGURATION . " WHERE configuration_key = 'GOOGLE_PLUS_ONE_VERSION' LIMIT 1;");
		  $configuration_group_id = $configuration->fields['configuration_group_id'];
		  if ((int) $configuration_group_id > 0)
		  {
			  zen_register_admin_page('configGooglePlusOne', 'BOX_CONFIGURATION_GOOGLE_PLUS', 'FILENAME_CONFIGURATION', 'gID=' . $configuration_group_id, 'configuration', 'Y', $configuration_group_id);
			  
			  $messageStack->add('Enabled Google Plus One Button Configuration menu.', 'success');
		  }
	  }
  } elseif ($zc150 && !function_exists('zen_page_key_exists')) {
    $messageStack->add('Your Zen Cart has not been properly upgraded!', 'warning');
  }