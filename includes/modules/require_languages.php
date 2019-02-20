<?php
/**
 * loads template specific language override files
 *
 * @package initSystem
 * @copyright Copyright 2003-2018 Zen Cart Development Team
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: Drbyte Sun Jan 7 21:32:45 2018 -0500 Modified in v1.5.6 $
 */
if (!defined('IS_ADMIN_FLAG')) {
  die('Illegal Access');
}
//echo "I AM LOADING: " . DIR_WS_LANGUAGES . $template_dir_select . $_SESSION['language'] . '.php' . '<br />';
//require(DIR_WS_LANGUAGES . $template_dir_select . $_SESSION['language'] . '.php');
//if (!zen_not_null($template_dir_select)) require(DIR_WS_LANGUAGES . $_SESSION['language'] . '.php');

// determine language or template language file
if (file_exists($language_page_directory . $template_dir . '/' . $current_page_base . '.php')) {
  $template_dir_select = $template_dir . '/';
} else {
  $template_dir_select = '';
}

// set language or template language file
$directory_array = $template->get_template_part($language_page_directory . $template_dir_select, '/^'.$current_page_base . '/');
foreach($directory_array as $key => $value) {
  //echo "I AM LOADING: " . $language_page_directory . $template_dir_select . $value . '<br />';
  require_once($language_page_directory . $template_dir_select . $value);
}

// load master language file(s) if lang files loaded previously were "overrides" and not masters.
if ($template_dir_select != '') {
  $directory_array = $template->get_template_part($language_page_directory, '/^'.$current_page_base . '/');
  foreach($directory_array as $key => $value) {
    //echo "I AM LOADING MASTER: " . $language_page_directory . $value.'<br />';
    require_once($language_page_directory . $value);
  }
}
