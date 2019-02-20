<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=account.<br />
 * Displays previous orders and options to change various Customer Account settings
 *
 * @package templateSystem
 * @copyright Copyright 2003-2012 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version GIT: $Id: Author: DrByte  Sun Aug 5 20:48:10 2012 -0400 Modified in v1.5.1 $
 */
?>

<div class="centerColumn" id="accountDefault">

<h1 id="accountDefaultHeading"><?php echo HEADING_TITLE; ?></h1>

<?php require($template->get_template_dir('tpl_modules_account_menu.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_account_menu.php'); ?>


<?php if ($messageStack->size('account') > 0) echo $messageStack->output('account'); ?>

<?php
	if (zen_count_customer_orders() > 0) {
?>
  
<div class="order-history-wrapper">
	<table id="prevOrders" class="order-history-table">
	    <tr class="tableHeading">
	    <th class="order-date"><?php echo TEXT_ORDER_DATE; ?></th>
		<th class="order-number"><?php echo TEXT_ORDER_NUMBER; ?></th>
		<th class="shipping-to"><?php echo TEXT_ORDER_SHIPPED_TO; ?></th>
		<th class="total"><?php echo TEXT_ORDER_COST; ?></th>
		<th class="status"><?php echo TEXT_ORDER_STATUS; ?></th>
	  </tr>
	<?php
	  foreach($ordersArray as $orders) {
	?>
	  <tr>
	    <td class="order-date"><?php echo zen_date_short($orders['date_purchased']); ?></td>
	    <td class="order-number"><?php echo '<a class="view-link" href="' . zen_href_link(FILENAME_ACCOUNT_HISTORY_INFO, 'order_id=' . $orders['orders_id'], 'SSL') . '"> '; ?><span>&#xe001;</span> <?php echo $orders['orders_id']; ?></a></td>
	    <td class="shipping-to"><?php echo zen_output_string_protected($orders['order_name']) ?></td>
	    <td class="total"><?php echo $orders['orders_status_name']; ?></td>
	    <td class="status"><?php echo $orders['order_total']; ?></td>
	  </tr>
	
	<?php
	  }
	?>
	</table>
</div><!--EOF .order-history-wrapper-->

	<?php
		if (zen_count_customer_orders() > 2) {
	?>

	<div id="show-all-orders"><?php echo '<a href="' . zen_href_link(FILENAME_ACCOUNT_HISTORY, '', 'SSL') . '">Show All Orders</a>'; ?></div>
	
	<?php
	  	}
	?>

<?php
  }
?>
<br class="clearBoth" />

<?php
// only show when there is a GV balance
  if ($customer_has_gv_balance ) {
?>
<div id="sendSpendWrapper">
<?php require($template->get_template_dir('tpl_modules_send_or_spend.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_send_or_spend.php'); ?>
</div>
<?php
  }
?>
<br class="clearBoth" />
</div>