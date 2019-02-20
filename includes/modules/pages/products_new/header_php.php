<?php
/**
 * products_new header_php.php
 *
 * @package page
 * @copyright Copyright 2003-2007 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: header_php.php 6912 2007-09-02 02:23:45Z drbyte $
 */

  require(DIR_WS_MODULES . zen_get_module_directory('require_languages.php'));
  $breadcrumb->add(NAVBAR_TITLE);
// display order dropdown
  $disp_order_default = PRODUCT_NEW_LIST_SORT_DEFAULT;
  require(DIR_WS_MODULES . zen_get_module_directory(FILENAME_LISTING_DISPLAY_ORDER));
  $products_new_array = array();
// display limits
//  $display_limit = zen_get_products_new_timelimit();
  $display_limit = zen_get_new_date_range();

  $listing_sql = "SELECT p.products_id, p.products_type, pd.products_name, p.products_image, p.products_price,
                                    p.products_tax_class_id, p.products_date_added, m.manufacturers_name, p.products_model,
                                    p.products_quantity, p.products_weight, p.product_is_call,
                                    p.product_is_always_free_shipping, p.products_qty_box_status,
                                    p.master_categories_id
                             FROM " . TABLE_PRODUCTS . " p
                             LEFT JOIN " . TABLE_MANUFACTURERS . " m
                             ON (p.manufacturers_id = m.manufacturers_id), " . TABLE_PRODUCTS_DESCRIPTION . " pd
                             WHERE p.products_status = 1
                             AND p.products_id = pd.products_id
                             AND pd.language_id = :languageID " . $display_limit . $order_by;

  $listing_sql = $db->bindVars($listing_sql, ':languageID', $_SESSION['languages_id'], 'integer');
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