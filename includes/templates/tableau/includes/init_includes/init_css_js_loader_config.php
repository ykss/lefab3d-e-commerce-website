<?php
  if (!defined('IS_ADMIN_FLAG')) {
    die('Illegal Access');
  }
  $zc150 = (PROJECT_VERSION_MAJOR > 1 || (PROJECT_VERSION_MAJOR == 1 && substr(PROJECT_VERSION_MINOR, 0, 3) >= 5));
  // add upgrade script
  if (defined('CSS_JS_LOADER_VERSION')) { // does not exist prior to v2.0.0
    $css_js_loader_version = CSS_JS_LOADER_VERSION;
    while ($css_js_loader_version != '3.0.1') {
      switch($css_js_loader_version) {
        case '2.0.0':
          // perform upgrade
          if (file_exists(DIR_WS_INCLUDES . 'installers/css_js_loader/2_1_0.php')) {
            include_once(DIR_WS_INCLUDES . 'installers/css_js_loader/2_1_0.php');
            $messageStack->add('Updated CSS JS Loader to v2.1.0');
            $css_js_loader_version = '2.1.0';
						break;
          } else {
         	 	break 2;
					}
        case '2.1.0':
          // perform upgrade
          if (file_exists(DIR_WS_INCLUDES . 'installers/css_js_loader/2_2_1.php')) {
            include_once(DIR_WS_INCLUDES . 'installers/css_js_loader/2_2_1.php');
            $messageStack->add('Updated CSS JS Loader to v2.2.1');
            $css_js_loader_version = '2.2.1';
						break;
          } else {
         	 	break 2;
					}
        case '2.2.1':
          // perform upgrade
          if (file_exists(DIR_WS_INCLUDES . 'installers/css_js_loader/3_0_0.php')) {
            include_once(DIR_WS_INCLUDES . 'installers/css_js_loader/3_0_0.php');
            $messageStack->add('Updated CSS JS Loader to v3.0.0');
            $css_js_loader_version = '3.0.0';
						break;
          } else {
         	 	break 2;
					}
        case '3.0.0':
          // perform upgrade
          if (file_exists(DIR_WS_INCLUDES . 'installers/css_js_loader/3_0_1.php')) {
            include_once(DIR_WS_INCLUDES . 'installers/css_js_loader/3_0_1.php');
            $messageStack->add('Updated CSS JS Loader to v3.0.1');
            $css_js_loader_version = '3.0.1';
						break;
          } else {
         	 	break 2;
					}					 					          
        default:
          $css_js_loader_version = '3.0.1';
          break 2;      
      }
    }
  } else {
    // begin update to version 2.0.0
    // do a new install
    if (file_exists(DIR_WS_INCLUDES . 'installers/css_js_loader/new_install.php')) {
      include_once(DIR_WS_INCLUDES . 'installers/css_js_loader/new_install.php');
      $messageStack->add('Added CSS JS Loader Configuration');
    } else {
      $messageStack->add('New installation file missing, please make sure you have uploaded all files in the package.');
    }
  }
  
  if ($zc150) { // continue Zen Cart 1.5.0
    // add configuration menu
    if (!zen_page_key_exists('configCSSJSLoader')) {
      $configuration = $db->Execute("SELECT configuration_group_id FROM " . TABLE_CONFIGURATION . " WHERE configuration_key = 'CSS_JS_LOADER_VERSION' LIMIT 1;");
      $configuration_group_id = $configuration->fields['configuration_group_id'];
      if ((int)$configuration_group_id > 0) {
        zen_register_admin_page('configCSSJSLoader',
                                'BOX_CONFIGURATION_CSS_JS_LOADER', 
                                'FILENAME_CONFIGURATION',
                                'gID=' . $configuration_group_id, 
                                'configuration', 
                                'Y',
                                $configuration_group_id);
          
        $messageStack->add('Added to Configuration menu.', 'success');
      }
    }
  }
