<?php
  if (!defined('IS_ADMIN_FLAG')) {
    die('Illegal Access');
  }
  // add upgrade script
  $facebook_like_button_version = (defined('FACEBOOK_LIKE_BUTTON_VERSION') ? FACEBOOK_LIKE_BUTTON_VERSION : 'new');
  $current_version = '1.3.2';
  while ($facebook_like_button_version != $current_version) {
    switch($facebook_like_button_version) {
      case 'new':
      case '1.3.1':
        // perform upgrade
        if (file_exists(DIR_WS_INCLUDES . 'installers/facebook_like_button/1_3_2.php')) {
          include_once(DIR_WS_INCLUDES . 'installers/facebook_like_button/1_3_2.php');
          $facebook_like_button_version = '1.3.2';          
		  break;
        } else {
          break 2;
		}				 					                  
      default:
        $facebook_like_button_version = $current_version;
        // break all the loops
        break 2;      
    }
  }
  $zc150 = (PROJECT_VERSION_MAJOR > 1 || (PROJECT_VERSION_MAJOR == 1 && substr(PROJECT_VERSION_MINOR, 0, 3) >= 5));
  if ($zc150 && function_exists('zen_page_key_exists')) // continue Zen Cart 1.5.0
  {
	  // add configuration menu
	  if (!zen_page_key_exists('configFacebookLikeButton'))
	  {
		  $configuration          = $db->Execute("SELECT configuration_group_id FROM " . TABLE_CONFIGURATION . " WHERE configuration_key = 'FACEBOOK_LIKE_BUTTON_VERSION' LIMIT 1;");
		  $configuration_group_id = $configuration->fields['configuration_group_id'];
		  if ((int) $configuration_group_id > 0)
		  {
			  zen_register_admin_page('configFacebookLikeButton', 'BOX_CONFIGURATION_FACEBOOKLIKEBUTTON', 'FILENAME_CONFIGURATION', 'gID=' . $configuration_group_id, 'configuration', 'Y', $configuration_group_id);
			  
			  $messageStack->add('Enabled Facebook Like Button Configuration menu.', 'success');
		  }
	  }
  } elseif ($zc150 && !function_exists('zen_page_key_exists')) {
    $messageStack->add('Your Zen Cart has not been properly upgraded!', 'warning');
  }