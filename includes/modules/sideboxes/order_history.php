<?php
/**
 * order_history sidebox - if enabled, shows customers' most recent orders
 *
 * @package templateSystem
 * @copyright Copyright 2003-2016 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: Author: DrByte  Fri Jan 8 15:00:45 2016 -0500 Modified in v1.5.5 $
 */

  if (isset($_SESSION['customer_id']) && (int)$_SESSION['customer_id'] != 0) {
// retrieve the last x products purchased
  $orders_history_query = "select distinct op.products_id, o.date_purchased
                   from " . TABLE_ORDERS . " o, " . TABLE_ORDERS_PRODUCTS . " op, " . TABLE_PRODUCTS . " p
                   where o.customers_id = '" . (int)$_SESSION['customer_id'] . "'
                   and o.orders_id = op.orders_id
                   and op.products_id = p.products_id
                   and p.products_status = 1
                   group by products_id, date_purchased
                   order by o.date_purchased desc, products_id
                   limit " . MAX_DISPLAY_PRODUCTS_IN_ORDER_HISTORY_BOX;

    $orders_history = $db->Execute($orders_history_query);

    if ($orders_history->RecordCount() > 0) {
      $product_ids = '';
      while (!$orders_history->EOF) {
        $product_ids .= (int)$orders_history->fields['products_id'] . ',';
        $orders_history->MoveNext();
      }
      $product_ids = substr($product_ids, 0, -1);
      $rows=0;

      $products_history_query = "select products_id, products_name
                         from " . TABLE_PRODUCTS_DESCRIPTION . "
                         where products_id in (" . $product_ids . ")
                         and language_id = '" . (int)$_SESSION['languages_id'] . "'
                         order by products_name";

      $products_history = $db->Execute($products_history_query);

      while (!$products_history->EOF) {
        $rows++;
        $customer_orders[$rows]['id'] = $products_history->fields['products_id'];
        $customer_orders[$rows]['name'] = $products_history->fields['products_name'];
        $products_history->MoveNext();
      }

      require($template->get_template_dir('tpl_order_history.php',DIR_WS_TEMPLATE, $current_page_base,'sideboxes'). '/tpl_order_history.php');
      $title =  BOX_HEADING_CUSTOMER_ORDERS;
      $title_link = false;
      require($template->get_template_dir($column_box_default, DIR_WS_TEMPLATE, $current_page_base,'common') . '/' . $column_box_default);
    }
  }
