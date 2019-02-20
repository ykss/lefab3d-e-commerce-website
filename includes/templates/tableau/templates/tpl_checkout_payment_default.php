<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=checkout_payment.<br />
 * Displays the allowed payment modules, for selection by customer.
 *
 * @package templateSystem
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_checkout_payment_default.php 19358 2011-08-24 17:36:50Z drbyte $
 */
?>
<?php echo $payment_modules->javascript_validation(); ?>
<div class="centerColumn checkout_pages" id="checkoutPayment">
<?php echo zen_draw_form('checkout_payment', zen_href_link(FILENAME_CHECKOUT_CONFIRMATION, '', 'SSL'), 'post', ($flagOnSubmit ? 'onsubmit="return check_form();"' : '')); ?>
<?php echo zen_draw_hidden_field('action', 'submit'); ?>

<h1 id="checkoutPaymentHeading"><?php echo HEADING_TITLE; ?></h1>

<?php if ($messageStack->size('redemptions') > 0) echo $messageStack->output('redemptions'); ?>
<?php if ($messageStack->size('checkout') > 0) echo $messageStack->output('checkout'); ?>
<?php if ($messageStack->size('checkout_payment') > 0) echo $messageStack->output('checkout_payment'); ?>

<div class="col-left col-first">
  <?php
    if (DISPLAY_CONDITIONS_ON_CHECKOUT == 'true') {
  ?>
  <fieldset>
      <legend><?php echo TABLE_HEADING_CONDITIONS; ?></legend>
      <div><?php echo TEXT_CONDITIONS_DESCRIPTION;?></div>
      <?php echo  zen_draw_checkbox_field('conditions', '1', false, 'id="conditions"');?>
      <label class="checkboxLabel" for="conditions"><?php echo TEXT_CONDITIONS_CONFIRM; ?></label>
  </fieldset>
  <?php
    }
  ?>

  <?php // ** BEGIN PAYPAL EXPRESS CHECKOUT **
        if (!$payment_modules->in_special_checkout()) {
        // ** END PAYPAL EXPRESS CHECKOUT ** ?>
  <h2 id="checkoutPaymentHeadingAddress"><?php echo TITLE_BILLING_ADDRESS; ?></h2>

  <div id="checkoutBillto" class="box">
      <address><?php echo zen_address_label($_SESSION['customer_id'], $_SESSION['billto'], true, ' ', '<br />'); ?></address>
      <?php if (MAX_ADDRESS_BOOK_ENTRIES >= 2) { ?>
          <div class="buttonRow"><?php echo '<a href="' . zen_href_link(FILENAME_CHECKOUT_PAYMENT_ADDRESS, '', 'SSL') . '">' . zen_image_button(BUTTON_IMAGE_CHANGE_ADDRESS, BUTTON_CHANGE_ADDRESS_ALT) . '</a>'; ?></div>
      <?php } ?>
  </div>

  <p><?php echo TEXT_SELECTED_BILLING_DESTINATION; ?></p>

</div>
<div class="col-right">
  <?php // ** BEGIN PAYPAL EXPRESS CHECKOUT **
        }
        // ** END PAYPAL EXPRESS CHECKOUT ** ?>

  <fieldset id="checkoutOrderTotals">
  <h2 id="checkoutPaymentHeadingTotal"><?php echo TEXT_YOUR_TOTAL; ?></h2>
  <?php
    if (MODULE_ORDER_TOTAL_INSTALLED) {
      $order_totals = $order_total_modules->process();
  ?>  
      <table>
      <?php $order_total_modules->output(); ?>
      </table>

  <?php
    }
  ?>
  </fieldset>

<?php
  $selection =  $order_total_modules->credit_selection();
  if (sizeof($selection)>0) {
    for ($i=0, $n=sizeof($selection); $i<$n; $i++) {
      if ($_GET['credit_class_error_code'] == $selection[$i]['id']) {
?>
<div class="messageStackError"><?php echo zen_output_string_protected($_GET['credit_class_error']); ?></div>

<?php
      }
      for ($j=0, $n2=sizeof($selection[$i]['fields']); $j<$n2; $j++) {
?>
<fieldset id="discount">
    <h2><?php echo $selection[$i]['module']; ?></h2>
    <div class="box box-form">
        <?php echo $selection[$i]['redeem_instructions']; ?>
        <p><?php echo $selection[$i]['checkbox']; ?></p>
        <div class="field">
            <label class="inputLabel"<?php echo ($selection[$i]['fields'][$j]['tag']) ? ' for="'.$selection[$i]['fields'][$j]['tag'].'"': ''; ?>><?php echo $selection[$i]['fields'][$j]['title']; ?></label>
            <?php echo $selection[$i]['fields'][$j]['field']; ?>
        </div>
    </div>
</fieldset>
<?php
      }
    }
?>

<?php
    }
?>

<?php // ** BEGIN PAYPAL EXPRESS CHECKOUT **
      if (!$payment_modules->in_special_checkout()) {
      // ** END PAYPAL EXPRESS CHECKOUT ** ?>
<fieldset id="checkoutPaymentMethod">
  <h2><?php echo TABLE_HEADING_PAYMENT_METHOD; ?></h2>
  <div class="box">
<?php
  if (SHOW_ACCEPTED_CREDIT_CARDS != '0') {
?>

<?php
    if (SHOW_ACCEPTED_CREDIT_CARDS == '1') {
      echo TEXT_ACCEPTED_CREDIT_CARDS . zen_get_cc_enabled();
    }
    if (SHOW_ACCEPTED_CREDIT_CARDS == '2') {
      echo TEXT_ACCEPTED_CREDIT_CARDS . zen_get_cc_enabled('IMAGE_');
    }
?>
<?php } ?>

<?php
  $selection = $payment_modules->selection();

  if (sizeof($selection) > 1) {
?>
<p><?php echo TEXT_SELECT_PAYMENT_METHOD; ?></p>
<?php
  } elseif (sizeof($selection) == 0) {
?>
<p><?php echo TEXT_NO_PAYMENT_OPTIONS_AVAILABLE; ?></p>

<?php
  }
?>

<?php
  $radio_buttons = 0;
  for ($i=0, $n=sizeof($selection); $i<$n; $i++) {
?>
<?php
    if (sizeof($selection) > 1) {
        if (empty($selection[$i]['noradio'])) {
 ?>
<?php echo zen_draw_radio_field('payment', $selection[$i]['id'], ($selection[$i]['id'] == $_SESSION['payment'] ? true : false), 'id="pmt-'.$selection[$i]['id'].'"'); ?>
<?php   } ?>
<?php
    } else {

?>
<?php echo zen_draw_hidden_field('payment', $selection[$i]['id'], 'id="pmt-'.$selection[$i]['id'].'"'); ?>
<?php
    }
?>
<label for="pmt-<?php echo $selection[$i]['id']; ?>" class="radioButtonLabel"><?php echo $selection[$i]['module']; ?></label>

<?php
    if (defined('MODULE_ORDER_TOTAL_COD_STATUS') && MODULE_ORDER_TOTAL_COD_STATUS == 'true' and $selection[$i]['id'] == 'cod') {
?>
<div class="alert"><?php echo TEXT_INFO_COD_FEES; ?></div>
<?php
    } else {
      // echo 'WRONG ' . $selection[$i]['id'];
?>
<?php
    }
?>

<?php
    if (isset($selection[$i]['error'])) {
?>
    <div><?php echo $selection[$i]['error']; ?></div>

<?php
    } elseif (isset($selection[$i]['fields']) && is_array($selection[$i]['fields'])) {
?>

<div class="ccinfo">
<?php
      for ($j=0, $n2=sizeof($selection[$i]['fields']); $j<$n2; $j++) {
?>
  <?php echo $selection[$i]['fields'][$j]['field']; ?>
  <label <?php echo (isset($selection[$i]['fields'][$j]['tag']) ? 'for="'.$selection[$i]['fields'][$j]['tag'] . '" ' : ''); ?>class="inputLabelPayment"><?php echo $selection[$i]['fields'][$j]['title']; ?></label>
<hr class="clearBoth" />
<?php
      }
?>
</div>

<?php
    }
    $radio_buttons++;
?>
<hr class="clearBoth" />
<?php
  }
?>
</div>
</fieldset>
<?php // ** BEGIN PAYPAL EXPRESS CHECKOUT **
      } else {
        ?><input type="hidden" name="payment" value="<?php echo $_SESSION['payment']; ?>" /><?php
      }
      // ** END PAYPAL EXPRESS CHECKOUT ** ?>

<fieldset id="comments">
    <h2><?php echo TABLE_HEADING_COMMENTS; ?></h2>
    <?php echo zen_draw_textarea_field('comments', '45', '3'); ?>
</fieldset>

<div class="container-button">
    <div class="buttonRow forward"><?php echo zen_image_submit(BUTTON_IMAGE_CONTINUE_CHECKOUT, BUTTON_CONTINUE_ALT, 'onclick="submitFunction('.zen_user_has_gv_account($_SESSION['customer_id']).','.$order->info['total'].')"'); ?></div>
    <div class="back"><?php echo TITLE_CONTINUE_CHECKOUT_PROCEDURE . '<br />' . TEXT_CONTINUE_CHECKOUT_PROCEDURE; ?></div>
</div>
</div>
</form>
</div>
