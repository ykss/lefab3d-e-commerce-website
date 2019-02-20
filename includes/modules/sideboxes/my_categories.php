<?php
  if ($nmx_disk_cache->cacheStart('my_categories.php', array($_SESSION['languages_id']), true, true)) {  
?>
<?php
/**
 * categories sidebox - prepares content for the main categories sidebox
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: categories.php 2718 2005-12-28 06:42:39Z drbyte $
 */

require($template->get_template_dir('tpl_my_categories.php',DIR_WS_TEMPLATE, $current_page_base,'sideboxes'). '/tpl_my_categories.php');

$title = 'Category';
$title_link = false;

require($template->get_template_dir($column_box_default, DIR_WS_TEMPLATE, $current_page_base,'common') . '/' . $column_box_default);
?>
<?php
  $nmx_disk_cache->cacheEnd();
}
?>