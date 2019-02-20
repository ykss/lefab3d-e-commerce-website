<?php
/**
 * Page Template
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_discount_coupon_default.php 3464 2006-04-19 00:07:26Z ajeh $
 */
?>
<div class="centerColumn" id="discountcouponInfo">
<h1 id="discountcouponInfoHeading"><?php echo HEADING_TITLE; ?></h1>

<div class="discount-wrapper">

	<div id="discountcouponInfoMainContent" class="content">
		<?php if ((DEFINE_DISCOUNT_COUPON_STATUS >= 1 and DEFINE_DISCOUNT_COUPON_STATUS <= 2) && $text_coupon_help == '') {
		  require($define_page);
		 } else {
		  echo $text_coupon_help;
		} ?>
	</div>
    <?php echo zen_draw_form('discount_coupon', zen_href_link(FILENAME_DISCOUNT_COUPON, 'action=lookup', 'NONSSL', false)); ?>
		<h2><?php echo TEXT_DISCOUNT_COUPON_ID_INFO; ?></h2>
		<div class="discount-content">
			<label class="inputLabel" for="lookup-discount-coupon"><?php echo TEXT_DISCOUNT_COUPON_ID; ?></label>
			<?php echo zen_draw_input_field('lookup_discount_coupon', $_POST['lookup_discount_coupon'], 'size="40" id="lookup-discount-coupon"');?>
			
			<?php if ($text_coupon_help == '') { ?>
			<div class="buttonRow"><?php echo zen_image_submit(BUTTON_IMAGE_SEND, BUTTON_SEND_ALT); ?></div>
			<?php } else { ?>
			<div class="buttonRow"><?php echo '<a href="' . zen_href_link(FILENAME_DISCOUNT_COUPON) . '">' . zen_image_button(BUTTON_IMAGE_CANCEL, BUTTON_CANCEL_ALT) . '</a>&nbsp;&nbsp;' . zen_image_submit(BUTTON_IMAGE_SEND, BUTTON_SEND_ALT); ?></div>
			<?php } ?>
		</div>
	</form>
</div><!--EOF .discount-wrapper-->
<br class="clearBoth" />

</div>