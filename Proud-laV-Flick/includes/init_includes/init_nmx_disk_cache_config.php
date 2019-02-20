<?php
  if (!defined('IS_ADMIN_FLAG')) {
    die('Illegal Access');
  }
  // add upgrade script
  $nmx_disk_cache_version = (defined('NMX_DISK_CACHE_VERSION') ? NMX_DISK_CACHE_VERSION : 'new');
  $current_version = '1.2.0';
  while ($nmx_disk_cache_version != $current_version) {
    switch($nmx_disk_cache_version) {
      case 'new':
        // perform upgrade
        if (file_exists(DIR_WS_INCLUDES . 'installers/nmx_disk_cache/1_0_0.php')) {
          include_once(DIR_WS_INCLUDES . 'installers/nmx_disk_cache/1_0_0.php');
          $nmx_disk_cache_version = '1.0.0';          
						break;
          } else {
         	 	break 2;
					}
      case '1.0.0':
        // perform upgrade
        if (file_exists(DIR_WS_INCLUDES . 'installers/nmx_disk_cache/1_1_0.php')) {
          include_once(DIR_WS_INCLUDES . 'installers/nmx_disk_cache/1_1_0.php');
          $nmx_disk_cache_version = '1.1.0';          
						break;
          } else {
         	 	break 2;
					}
      case '1.1.0':
        // perform upgrade
        if (file_exists(DIR_WS_INCLUDES . 'installers/nmx_disk_cache/1_1_1.php')) {
          include_once(DIR_WS_INCLUDES . 'installers/nmx_disk_cache/1_1_1.php');
          $nmx_disk_cache_version = '1.1.1';          
						break;
          } else {
         	 	break 2;
					}
      case '1.1.1':
        // perform upgrade
        if (file_exists(DIR_WS_INCLUDES . 'installers/nmx_disk_cache/1_2_0.php')) {
          include_once(DIR_WS_INCLUDES . 'installers/nmx_disk_cache/1_2_0.php');
          $nmx_disk_cache_version = '1.2.0';          
						break;
          } else {
         	 	break 2;
					}					 					                  
      default:
        $nmx_disk_cache_version = $current_version;
        // break all the loops
        break 2;      
    }
  }