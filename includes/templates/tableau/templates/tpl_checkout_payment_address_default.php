<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=checkout_payment_address.<br />
 * Allows customer to change the billing address.
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_checkout_payment_address_default.php 3 2012-07-08 21:11:34Z numinix $
 */
?>
<div class="centerColumn" id="checkoutPayAddressDefault">

  <?php echo zen_draw_form('checkout_address', zen_href_link(FILENAME_CHECKOUT_PAYMENT_ADDRESS, '', 'SSL'), 'post', 'onsubmit="return check_form_optional(checkout_address);"'); ?>
  <h1 id="checkoutPayAddressDefaultHeading"><?php echo HEADING_TITLE; ?></h1>
  <?php if ($messageStack->size('checkout_address') > 0) echo $messageStack->output('checkout_address'); ?>
  <div class="address-wrap">
<?php
  if ($process == false || $error == true) {
?>

<?php
     // following disabled to allow user to always change their address
     //if ($addresses_count < MAX_ADDRESS_BOOK_ENTRIES) {
?>

<?php
    //} else {
      //echo TEXT_ADDRESS_BOOK_FULL; 
    //}
    if ($addresses_count > 1 && !$_SESSION['COWOA'] && MAX_ADDRESS_BOOK_ENTRIES > 1) {
?>
    <h2 class="header-active"><?php echo TABLE_HEADING_NEW_PAYMENT_ADDRESS; ?></h2>
    <div id="addressBook"> 
      <div id="addressBookContainer" class="changeAddressFormContainer">
<?php
      require($template->get_template_dir('tpl_modules_checkout_address_book.php', DIR_WS_TEMPLATE, $current_page_base,'templates'). '/' . 'tpl_modules_checkout_address_book.php');
?>
  <div class="clearBoth"></div>
  <div><?php echo zen_draw_hidden_field('action', 'submit') . (FEC_CSS_BUTTONS == 'true' ? zenCssButton(BUTTON_IMAGE_CONTINUE, BUTTON_CONTINUE_ALT, 'submit', 'button_continue') : zen_image_submit(BUTTON_IMAGE_CONTINUE, BUTTON_CONTINUE_ALT)); ?></div>
  <div class="buttonRow back nextstep"><?php echo TITLE_CONTINUE_CHECKOUT_PROCEDURE . '<br /><br />' . TEXT_CONTINUE_CHECKOUT_PROCEDURE; ?></div>

<?php
  if ($process == true) {
?>
  <div class="buttonRow back"><?php echo '<a href="' . zen_href_link(FILENAME_CHECKOUT_PAYMENT_ADDRESS, '', 'SSL') . '">' . (FEC_CSS_BUTTONS == 'true' ? zenCssButton(BUTTON_IMAGE_BACK, BUTTON_BACK_ALT, 'button', 'button_back') : zen_image_button(BUTTON_IMAGE_BACK, BUTTON_BACK_ALT)) . '</a>'; ?></div>

<?php
  }
?>

      </div>
    </div>      
<?php
     }
  }

?>
<?php
/**
 * require template to display new address form
 */
  require($template->get_template_dir('tpl_modules_checkout_new_address.php', DIR_WS_TEMPLATE, $current_page_base,'templates'). '/' . 'tpl_modules_checkout_new_address.php');
?>
  </div>
  </form>
</div>