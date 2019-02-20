<?php
  if (!defined('IS_ADMIN_FLAG')) {
    die('Illegal Access');
  }   
   
  // add upgrade script
  if(defined('TO_VERSION')){
  	$template_options_version =  TO_VERSION;
  } else {
  	$template_options_version = "new";
  }
  
  $current_version = "1.0.0";
  $stoperr = 0;
  while ($template_options_version != $current_version && $stoperr != 1) {
    switch($template_options_version) {
      case "new":
        // perform upgrade
        if (file_exists(DIR_WS_INCLUDES . 'installers/template_options/1_0_0.php')) {
          include_once(DIR_WS_INCLUDES . 'installers/template_options/1_0_0.php');
          $template_options_version = "1.0.0";
          break;          
        } else {
		      $messageStack->add('Cannot install Template Options, please make sure you have uploaded all files in the package.', 'error');
		      break 2;
        }
        case "1.0.0":
        // perform upgrade
        if (file_exists(DIR_WS_INCLUDES . 'installers/template_options/1_1_0.php')) {
          include_once(DIR_WS_INCLUDES . 'installers/template_options/1_1_0.php');
          $template_options_version = "1.1.0";
          break;          
        } else {
		      $messageStack->add('Cannot upgrade Template Options, please make sure you have uploaded all files in the package.', 'error');
		      break 2;
      	}
          default:
        $template_options_version = $current_version;
        // break all the loops
      	break 2;      
    }
  }