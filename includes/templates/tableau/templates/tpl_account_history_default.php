<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=account_history.<br />
 * Displays all customers previous orders
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_account_history_default.php 2580 2005-12-16 07:31:21Z birdbrain $
 */
?>
<div class="centerColumn" id="accountHistoryDefault">
<h1 id="accountHistoryDefaultHeading"><?php echo HEADING_TITLE; ?></h1>

<?php require($template->get_template_dir('tpl_modules_account_menu.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_account_menu.php'); ?>

<div class="history-filters history-filters-top">
	<ul class="view-buttons">
		<li class="header">View</li>
		<li><a href="<?php echo zen_href_link(FILENAME_ACCOUNT_HISTORY, (isset($_GET['page']) ? 'page=' . $_GET['page'] . '&' : '') . 'view=5') ?>" <?php echo $_GET['view']==5?'class="active"':''; ?>>5</a></li>
		<li><a href="<?php echo zen_href_link(FILENAME_ACCOUNT_HISTORY, (isset($_GET['page']) ? 'page=' . $_GET['page'] . '&' : '') . 'view=10') ?>" <?php echo !$_GET['view'] || $_GET['view']==10?'class="active"':''; ?>>10</a></li>
		<li><a href="<?php echo zen_href_link(FILENAME_ACCOUNT_HISTORY, (isset($_GET['page']) ? 'page=' . $_GET['page'] . '&' : '') . 'view=15') ?>"<?php echo $_GET['view']==15?'class="active"':''; ?>>15</a></li>
	</ul><!--EOF .view-buttons-->
	
	<ul class="pagination">
		<?php
		// output pager
		$num_pages = ceil($total_results / $max_display);
		
		if ($_GET['page']) {
			$current_page = $_GET['page'];
		}
		else {
			$current_page = 1;
		}
		
		if ($num_pages > 1) { // only display pager if there's more than one page
			
			// output left arrow
			if ($current_page != 1) { //don't display left arrow if this is the first page
				?>
				<li class="prev-btn"><a href="<?php echo zen_href_link(FILENAME_ACCOUNT_HISTORY, (isset($_GET['view']) ? 'view=' . $_GET['view'] . '&' : '') . 'page=' . ($current_page-1)); ?>">&#xe008;</a></li>
				<?php
			}
			
			// output page numbers
			for ($i=1; $i<=$num_pages; $i++) {
				echo '<li>';
				if ($i != $current_page) {
					echo '<a href="' . zen_href_link(FILENAME_ACCOUNT_HISTORY, (isset($_GET['view']) ? 'view=' . $_GET['view'] . '&' : '') . 'page=' . $i) . '">'; // output link only if this isn't the current page
				}
				echo $i; // output page number
				if ($i != $current_page) {
					echo '</a>';
				}
				echo '</li>';
			}
			
			// output right arrow
			if ($current_page != $num_pages) { //don't display right arrow if this is the last page
				?>
				<li class="next-btn"><a href="<?php echo zen_href_link(FILENAME_ACCOUNT_HISTORY, (isset($_GET['view']) ? 'view=' . $_GET['view'] . '&' : '') . 'page=' . ($current_page+1)); ?>">&#xe00b;</a></li>
				<?php
			}
		}
		?>
	</ul><!--EOF .pagination-->
	
	<div class="navSplitPagesResult"><?php echo $history_split->display_count(TEXT_DISPLAY_NUMBER_OF_ORDERS); ?></div>
	
	<div class="clearBoth"></div>
</div>

<div class="clearBoth"></div>

<div class="order-history-wrapper">
	<table class="order-history-table">
		<tr>
			<th class="order-date"><?php echo TEXT_ORDER_DATE; ?></th>
			<th class="order-number"><?php echo TEXT_ORDER_NUMBER; ?></th>
			<th class="shipping-to"><?php echo TEXT_ORDER_SHIPPED_TO; ?></th>
			<th class="total"><?php echo TEXT_ORDER_COST; ?></th>
			<th class="status"><?php echo TEXT_ORDER_STATUS; ?></th>
		</tr>
		<?php
		  if ($accountHasHistory === true) {
		    foreach ($accountHistory as $history) {
		?>
		<tr>
			<td class="order-date"><?php echo zen_date_short($history['date_purchased']); ?></td>
			<td  class="order-number"><?php echo '<a class="view-link" href="' . zen_href_link(FILENAME_ACCOUNT_HISTORY_INFO, (isset($_GET['page']) ? 'page=' . $_GET['page'] . '&' : '') . 'order_id=' . $history['orders_id'], 'SSL') . '">';?><span>&#xe001;</span> <?php echo $history['orders_id']; ?></a></td>
			<td class="shipping-to"><?php echo zen_output_string_protected($history['order_name']); ?></td>
			<td class="total"><?php echo strip_tags($history['order_total']); ?></td>
			<td class="status"><?php echo $history['orders_status_name']; ?></td>
	
		</tr>		
	
	<?php
	    }
	?>
	</table>
</div>

<div class="history-filters history-filters-bottom">
	<ul class="view-buttons">
		<li class="header">View</li>
		<li><a href="<?php echo zen_href_link(FILENAME_ACCOUNT_HISTORY, (isset($_GET['page']) ? 'page=' . $_GET['page'] . '&' : '') . 'view=5') ?>" <?php echo $_GET['view']==5?'class="active"':''; ?>>5</a></li>
		<li><a href="<?php echo zen_href_link(FILENAME_ACCOUNT_HISTORY, (isset($_GET['page']) ? 'page=' . $_GET['page'] . '&' : '') . 'view=10') ?>" <?php echo !$_GET['view'] || $_GET['view']==10?'class="active"':''; ?>>10</a></li>
		<li><a href="<?php echo zen_href_link(FILENAME_ACCOUNT_HISTORY, (isset($_GET['page']) ? 'page=' . $_GET['page'] . '&' : '') . 'view=15') ?>"<?php echo $_GET['view']==15?'class="active"':''; ?>>15</a></li>
	</ul><!--EOF .view-buttons-->
	
	<ul class="pagination">
		<?php
		// output pager
		$num_pages = ceil($total_results / $max_display);
		
		if ($_GET['page']) {
			$current_page = $_GET['page'];
		}
		else {
			$current_page = 1;
		}
		
		if ($num_pages > 1) { // only display pager if there's more than one page
			
			// output left arrow
			if ($current_page != 1) { //don't display left arrow if this is the first page
				?>
				<li class="prev-btn"><a href="<?php echo zen_href_link(FILENAME_ACCOUNT_HISTORY, (isset($_GET['view']) ? 'view=' . $_GET['view'] . '&' : '') . 'page=' . ($current_page-1)); ?>">&#xe008;</a></li>
				<?php
			}
			
			// output page numbers
			for ($i=1; $i<=$num_pages; $i++) {
				echo '<li>';
				if ($i != $current_page) {
					echo '<a href="' . zen_href_link(FILENAME_ACCOUNT_HISTORY, (isset($_GET['view']) ? 'view=' . $_GET['view'] . '&' : '') . 'page=' . $i) . '">'; // output link only if this isn't the current page
				}
				echo $i; // output page number
				if ($i != $current_page) {
					echo '</a>';
				}
				echo '</li>';
			}
			
			// output right arrow
			if ($current_page != $num_pages) { //don't display right arrow if this is the last page
				?>
				<li class="next-btn"><a href="<?php echo zen_href_link(FILENAME_ACCOUNT_HISTORY, (isset($_GET['view']) ? 'view=' . $_GET['view'] . '&' : '') . 'page=' . ($current_page+1)); ?>">&#xe00b;</a></li>
				<?php
			}
		}
		?>
	</ul><!--EOF .pagination-->
	
	<div class="navSplitPagesResult"><?php echo $history_split->display_count(TEXT_DISPLAY_NUMBER_OF_ORDERS); ?></div>
	
	<div class="clearBoth"></div>
</div>

<div class="clearBoth"></div>


<?php
  } else {
?>
<div class="centerColumn" id="noAcctHistoryDefault">
<?php echo TEXT_NO_PURCHASES; ?>
</div>
<?php
  }
?>

</div>