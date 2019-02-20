<?php
  require('../includes/configure.php');
  ini_set('include_path', DIR_FS_CATALOG . PATH_SEPARATOR . ini_get('include_path'));
  chdir(DIR_FS_CATALOG);
  require_once('includes/application_top.php');
  require_once(DIR_WS_CLASSES . 'nmx_disk_cache.php'); 
  if (!defined('NMX_DISK_CACHE_KEY')) define('NMX_DISK_CACHE_KEY', 'numinix');
  $key = NMX_DISK_CACHE_KEY;
  
  if (isset($_GET['key']) && $_GET['key'] == $key) {
    $nmx_disk_cache = new nmx_disk_cache();
    if ($nmx_disk_cache->enabled) {
      $nmx_disk_cache->clearCache();
    }
  } else {
    die('Invalid key!');
  }
?>