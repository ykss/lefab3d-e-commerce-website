<?php
/**
 * Specials
 *
 * @package page
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: main_template_vars.php 18802 2011-05-25 20:23:34Z drbyte $
 */

if (MAX_DISPLAY_SPECIAL_PRODUCTS > 0 ) {
  $listing_sql = "SELECT p.products_id, p.products_image, pd.products_name,
                          p.master_categories_id, p.products_qty_box_status
                         FROM (" . TABLE_PRODUCTS . " p
                         LEFT JOIN " . TABLE_SPECIALS . " s on p.products_id = s.products_id
                         LEFT JOIN " . TABLE_PRODUCTS_DESCRIPTION . " pd on p.products_id = pd.products_id )
                         WHERE p.products_id = s.products_id and p.products_id = pd.products_id and p.products_status = '1'
                         AND s.status = 1
                         AND pd.language_id = :languagesID
                         ORDER BY s.specials_date_added DESC";

  $listing_sql = $db->bindVars($listing_sql, ':languagesID', $_SESSION['languages_id'], 'integer');
  // create column list
  $define_list = array('PRODUCT_LIST_MODEL' => PRODUCT_LIST_MODEL,
  'PRODUCT_LIST_NAME' => PRODUCT_LIST_NAME,
  'PRODUCT_LIST_MANUFACTURER' => PRODUCT_LIST_MANUFACTURER,
  'PRODUCT_LIST_PRICE' => PRODUCT_LIST_PRICE,
  'PRODUCT_LIST_QUANTITY' => PRODUCT_LIST_QUANTITY,
  'PRODUCT_LIST_WEIGHT' => PRODUCT_LIST_WEIGHT,
  'PRODUCT_LIST_IMAGE' => PRODUCT_LIST_IMAGE);
  
  /*                         ,
  'PRODUCT_LIST_BUY_NOW' => PRODUCT_LIST_BUY_NOW);
  */
  asort($define_list);
  reset($define_list);
  $column_list = array();
  foreach ($define_list as $key => $value)
  {
    if ($value > 0) $column_list[] = $key;
  }
  
  $select_column_list = '';
  
  for ($i=0, $n=sizeof($column_list); $i<$n; $i++)
  {
    switch ($column_list[$i])
    {
      case 'PRODUCT_LIST_MODEL':
      $select_column_list .= 'p.products_model, ';
      break;
      case 'PRODUCT_LIST_NAME':
      $select_column_list .= 'pd.products_name, ';
      break;
      case 'PRODUCT_LIST_MANUFACTURER':
      $select_column_list .= 'm.manufacturers_name, ';
      break;
      case 'PRODUCT_LIST_QUANTITY':
      $select_column_list .= 'p.products_quantity, ';
      break;
      case 'PRODUCT_LIST_IMAGE':
      $select_column_list .= 'p.products_image, ';
      break;
      case 'PRODUCT_LIST_WEIGHT':
      $select_column_list .= 'p.products_weight, ';
      break;
    }
  }
  
  require($template->get_template_dir('tpl_specials_default.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_specials_default.php');
}