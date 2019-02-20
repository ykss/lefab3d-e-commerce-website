<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=checkout_success.<br />
 * Displays confirmation details after order has been successfully processed.
 *
 * @package templateSystem
 * @copyright Copyright 2003-2010 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_checkout_success_default.php 16435 2010-05-28 09:34:32Z drbyte $
 */
?>
<div class="centerColumn" id="checkoutSuccess">
<!--bof -gift certificate- send or spend box-->
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
<!--eof -gift certificate- send or spend box-->

<div class="col-left back">
	<h1 id="checkout-success-heading"><?php echo HEADING_TITLE; ?></h1>
	<h2 id="order-number-headline">
		<?php echo '<span class="order-number-label">' . TEXT_YOUR_ORDER_NUMBER . '</span><span class="order-number">' . $zv_orders_id . '</span>'; ?>
	</h2><!--EOF #order-number-headline-->
	
	<?php if (DEFINE_CHECKOUT_SUCCESS_STATUS >= 1 and DEFINE_CHECKOUT_SUCCESS_STATUS <= 2) { ?>
		<div id="checkout-success-content" class="content">
		<?php
		/**
		 * require the html_defined text for checkout success
		 */
		  require($define_page);
		?>
		</div>
	<?php } ?>
	
	<a href="<?php echo HTTP_SERVER . DIR_WS_CATALOG; ?>" class="continue-shopping-btn"><?php echo BUTTON_CONTINUE_SHOPPING_ALT ?></a>
	<a href="<?php echo zen_href_link(FILENAME_LOGOFF, '', 'SSL'); ?>" class="log-off-btn"><?php echo BUTTON_LOG_OFF_ALT ?></a>
</div><!--EOF .col-left-->
<div class="col-right back">
	<div class="product-notifications-wrapper">
		<!--bof -product notifications box-->
		<?php
		/**
		 * The following creates a list of checkboxes for the customer to select if they wish to be included in product-notification
		 * announcements related to products they've just purchased.
		 **/
		    if ($flag_show_products_notification == true) {
		?>
		<h3><?php echo TEXT_NOTIFY_PRODUCTS; ?></h3>
		<div class="notifications-form-wrapper">
			<?php echo zen_draw_form('order', zen_href_link(FILENAME_CHECKOUT_SUCCESS, 'action=update', 'SSL')); ?>
			
			<?php foreach ($notificationsArray as $notifications) { ?>
			<?php echo zen_draw_checkbox_field('notify[]', $notifications['products_id'], true, 'id="notify-' . $notifications['counter'] . '"') ;?>
			<label class="checkboxLabel" for="<?php echo 'notify-' . $notifications['counter']; ?>"><?php echo $notifications['products_name']; ?></label>
			<br />
			<?php } ?>
			<div class="buttonRow"><?php echo zen_image_submit(BUTTON_IMAGE_UPDATE, BUTTON_UPDATE_ALT); ?></div>
			</form>
		</div><!--eof .notifications-form-wrapper-->
		<?php
		    }
		?>
		<!--eof -product notifications box-->
	</div>
</div>


<!--bof -product downloads module-->
<!--
<?php
  if (DOWNLOAD_ENABLED == 'true') require($template->get_template_dir('tpl_modules_downloads.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_downloads.php');
?>
-->
<!--eof -product downloads module-->
</div>

<?php $zco_notifier->notify('NOTIFY_TEMPLATE_END_CHECKOUT_SUCCESS'); ?>
