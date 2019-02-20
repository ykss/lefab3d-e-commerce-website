<?php
  /* 
  Copyright (c) 2012 Numinix Web Development LLC  
  Portions Copyright Zen Cart
  Portions Copyright osCommerce
  author: numinix 
  */
  
  /* usage:
  
  <?php
    require_once(DIR_WS_CLASSES . 'nmx_disk_cache.php');
    $nmx_disk_cache = new nmx_disk_cache();
    // 1: create a cache file with a custom id of tpl_modules_product_listing
    // 2: include a custom string to add to the end of the filename (in this case we want to use a different cache file for each sorting option. Note: all URL get parameters are automatically included) 
    // 3: do not execute if there is a message being output in the html block
    // 4: automatically include all URL params (note: this should be set to false if caching a global block of code and the second parameter, $parameters, should be used)
    // 5: override the cache default time with 3600 seconds
    // 6: override the default gzip compression level with 9.
    //  
    if ($nmx_disk_cache->cacheStart('tpl_modules_product_listing', array('sort_by' => $_SESSION['sort_by']), !($messageStack->size('product_listing') > 0), true, 3600, 9)) {
  ?>
  HTML to cache
  <?php
      $nmx_disk_cache->cacheEnd();
    }
  ?>
  */

  class nmx_disk_cache {
    
    var $enabled;
    var $filename;
    var $gzcompression;
    
    function nmx_disk_cache() {
      $this->enabled = (NMX_DISK_CACHE_STATUS == 'true' ? true : false);
    }
    
    function cacheStart($id = '', $parameters = array(), $enable = true, $use_all_url_params = false, $cache_time = NMX_DISK_CACHE_DEFAULT_TIME, $gzlevel = NMX_DISK_CACHE_DEFAULT_GZIP) {
      if ($this->enabled) {
        $reset_cache = false; // default
        if (SQL_CACHE_METHOD != '') { // SQL caching is enabled
          global $db;
          // we query the database here instead of using the constant because it has been cached
          $nmx_disk_cache_reset = $db->Execute("SELECT configuration_value FROM " . TABLE_CONFIGURATION . " WHERE configuration_key = 'NMX_DISK_CACHE_RESET' LIMIT 1;");
          if ($nmx_disk_cache_reset->RecordCount() > 0 && $nmx_disk_cache_reset->fields['configuration_value'] == 'true') {
            $reset_cache = true;
          }          
        } elseif (NMX_DISK_CACHE_RESET == 'true') {
          $reset_cache = true;
        }
        if ($reset_cache == true) {
          $this->clearResetCache();
          $this->clearCache('*');          
        }
        if ($enable && $cache_time > 0) {
          $this->filename = array();
          // if the id is blank, force using URL parameters for unique file identifier
          if ($id == '') $use_all_url_params = true;
          if ($use_all_url_params == true) {
            // use a different cache file for HTTP vs HTTPS in case of differences in the code to be cached
            // skip zenid 
            $this->filename['url'] = zen_href_link($_GET['main_page'], zen_get_all_get_params(array('zenid')), ($_SERVER['HTTPS'] == 'on' ? 'SSL' : 'NONSSL'), false);
          }
          if ($id == '') {
            // set the id to the page URL
            $id = $this->filename['url'];
            // unset the url element to avoid duplication
            unset($this->filename['url']);
          }
          if (!is_array($parameters)) $parameters = array();
          if (sizeof($parameters) > 0) {
            // combine the additional filename parameters to the end of the filename
            $this->filename = array_merge($this->filename, $parameters);
          }
          if ($gzlevel > 0) {
            // if the file is gzipped, put gz_ at the front
            $id = implode('_', array('gz', $id));
            if ($gzlevel > 9) $gzlevel = 9;
            $this->gzcompression = $gzlevel;
          }
          // build filename as gz_id_md5string.cache
          $this->filename = DIR_FS_SQL_CACHE . '/nmx_disk_cache/' . implode(array($id, md5(implode('_', $this->filename)))) . '.cache';
          $cached_content = '';
          if ( (file_exists($this->filename)) && (file_exists($this->filename) && ((time() - (int)$cache_time) < filemtime($this->filename))) ) {
            $cached_content = $this->getCache($this->filename);
            if ($this->gzcompression) {
              $cached_content = gzinflate($cached_content);
            }
            echo $cached_content; 
            return false;
          } else {
            ob_start(); // Start the output buffer
            return true;
          }        
        } else {
          $this->enabled = false;
          return true;
        }
      } else {
          $this->enabled = false;
          return true;
      }
    }
    
    function cacheEnd() {
      if ($this->enabled && isset($this->filename)) {
        $contents_for_cache = ob_get_contents();
        if ($this->gzcompression) {
          $contents_for_cache = gzdeflate($contents_for_cache, $this->gzcompression); 
        }
        $this->setCache($this->filename, $contents_for_cache);
        ob_end_flush(); // Send the output to the browser
      }
    }
    
    function setCache($filename, $filecontents) {
      $output = serialize($filecontents);
      $fp = fopen($filename,"wb"); // open file with Write permission
      fputs($fp, $output);
      fclose($fp);
    }
    
    function getCache($filename) {
      return unserialize(file_get_contents($filename)); 
    }
    
    function clearCache($cache_files = '*') {
      array_map('unlink', glob(DIR_FS_SQL_CACHE . '/nmx_disk_cache/' . $cache_files . '.cache'));
    }
    
    function clearResetCache() {
      global $db;
      $db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = 'false' WHERE configuration_key = 'NMX_DISK_CACHE_RESET' LIMIT 1;");
    }
  }