<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=checkout_confirmation.<br />
 * Displays final checkout details, cart, payment and shipping info details.
 *
 * @package templateSystem
 * @copyright Copyright 2003-2006 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_checkout_confirmation_default.php 6247 2007-04-21 21:34:47Z wilt $
 */
?>
<div class="centerColumn checkout_pages" id="checkoutConfirmDefault">

<h1 id="checkoutConfirmDefaultHeading"><?php echo HEADING_TITLE; ?></h1>

<?php if ($messageStack->size('redemptions') > 0) echo $messageStack->output('redemptions'); ?>
<?php if ($messageStack->size('checkout_confirmation') > 0) echo $messageStack->output('checkout_confirmation'); ?>
<?php if ($messageStack->size('checkout') > 0) echo $messageStack->output('checkout'); ?>

<div class="container-cols">
    <div class="col-left col-first">
      <div id="checkoutBillto">
          <h2 id="checkoutConfirmDefaultBillingAddress"><?php echo HEADING_BILLING_ADDRESS; ?></h2>
          <div class="checkoutShipto box">
              <address><?php echo zen_address_format($order->billing['format_id'], $order->billing, 1, ' ', '<br />'); ?></address>
              <?php if (!$flagDisablePaymentAddressChange) { ?>
                  <div class="buttonRow"><?php echo '<a href="' . zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL') . '">' . zen_image_button(BUTTON_IMAGE_EDIT_SMALL, BUTTON_EDIT_SMALL_ALT) . '</a>'; ?></div>
              <?php } ?>
          </div>

          <?php
            $class =& $_SESSION['payment'];
          ?>
          <div class="box">
              <span><strong id="checkoutConfirmDefaultPayment"><?php echo HEADING_PAYMENT_METHOD; ?></strong> <span id="checkoutConfirmDefaultPaymentTitle"><?php echo $GLOBALS[$class]->title; ?></span></span> 
          </div>

          <?php
            if (is_array($payment_modules->modules)) {
              if ($confirmation = $payment_modules->confirmation()) {
          ?>
          <div class="important box"><?php echo $confirmation['title']; ?></div>
          <?php
              }
          ?>
          
          <?php
                for ($i=0, $n=sizeof($confirmation['fields']); $i<$n; $i++) {
          ?>
          <div class="important">
              <div class="back"><?php echo $confirmation['fields'][$i]['title']; ?></div>
              <div ><?php echo $confirmation['fields'][$i]['field']; ?></div>
          </div>
          <?php
               }
          ?>
          
          <?php
            }
          ?>
      </div>
  </div>
  <div class="col-right">
      <?php
        if ($_SESSION['sendto'] != false) {
      ?>
      <div id="checkoutShipto">
          <h2 id="checkoutConfirmDefaultShippingAddress"><?php echo HEADING_DELIVERY_ADDRESS; ?></h2>
          <div class="checkoutShipto box">
              <address><?php echo zen_address_format($order->delivery['format_id'], $order->delivery, 1, ' ', '<br />'); ?></address>
              <div class="buttonRow"><?php echo '<a href="' . $editShippingButtonLink . '">' . zen_image_button(BUTTON_IMAGE_EDIT_SMALL, BUTTON_EDIT_SMALL_ALT) . '</a>'; ?></div>
          </div>

          <?php
              if ($order->info['shipping_method']) {
          ?>
          <div class="box">
              <span><strong id="checkoutConfirmDefaultShipment"><?php echo HEADING_SHIPPING_METHOD; ?></strong> <span id="checkoutConfirmDefaultShipmentTitle"><?php echo $order->info['shipping_method']; ?></span></span>
          </div>
          <?php
              }
          ?>
      </div>
      <?php
        }
      ?>
      
      <?php
      // always show comments
      //  if ($order->info['comments']) {
      ?>
      <h2 id="checkoutConfirmDefaultHeadingComments"><?php echo HEADING_ORDER_COMMENTS; ?></h2>
      <div class="box comment-written">
          <div class="buttonRow forward"><?php echo  '<a href="' . zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL') . '">' . zen_image_button(BUTTON_IMAGE_EDIT_SMALL, BUTTON_EDIT_SMALL_ALT) . '</a>'; ?></div>
          <div class="comments"><?php echo (empty($order->info['comments']) ? NO_COMMENTS_TEXT : nl2br(zen_output_string_protected($order->info['comments'])) . zen_draw_hidden_field('comments', $order->info['comments'])); ?></div>
      </div>
      

  </div>

<?php
//  }
?>
</div>
  
<div class="shopping-cart">
    <h2 id="checkoutConfirmDefaultHeadingCart"><?php echo HEADING_PRODUCTS; ?></h2>

    <div class="buttonRow forward"><?php echo '<a href="' . zen_href_link(FILENAME_SHOPPING_CART, '', 'SSL') . '">' . zen_image_button(BUTTON_IMAGE_EDIT_SMALL, BUTTON_EDIT_SMALL_ALT) . '</a>'; ?></div>

    <table id="cartContentsDisplay">
        <thead>
            <tr>
                <th scope="col" id="ccQuantityHeading"><?php echo TABLE_HEADING_QUANTITY; ?></th>
                <th scope="col" id="ccProductsHeading"><?php echo TABLE_HEADING_PRODUCTS; ?></th>
                <?php
                    // If there are tax groups, display the tax columns for price breakdown
                    if (sizeof($order->info['tax_groups']) > 1) {
                ?>
                <th scope="col" id="ccTaxHeading"><?php echo HEADING_TAX; ?></th>
                <?php
                    }
                ?>
                <th scope="col" id="ccTotalHeading" class="cl-total"><?php echo TABLE_HEADING_TOTAL; ?></th>
            </tr>
        </thead>
        <tbody>
            <?php // now loop thru all products to display quantity and price ?>
            <?php for ($i=0, $n=sizeof($order->products); $i<$n; $i++) { ?>
            <tr class="<?php echo $order->products[$i]['rowClass']; ?>">
                <td><?php echo $order->products[$i]['qty']; ?>&nbsp;x</td>
                <td><?php echo $order->products[$i]['name']; ?>
                    <?php  echo $stock_check[$i]; ?>

                    <?php // if there are attributes, loop thru them and display one per line
                        if (isset($order->products[$i]['attributes']) && sizeof($order->products[$i]['attributes']) > 0 ) {
                            echo '<ul class="cartAttribsList">';
                            for ($j=0, $n2=sizeof($order->products[$i]['attributes']); $j<$n2; $j++) {
                    ?>
                            <li><?php echo $order->products[$i]['attributes'][$j]['option'] . ': ' . nl2br(zen_output_string_protected($order->products[$i]['attributes'][$j]['value'])); ?></li>
                    <?php
                            } // end loop
                            echo '</ul>';
                        } // endif attribute-info
                    ?>
                </td>
            <?php // display tax info if exists ?>
            <?php if (sizeof($order->info['tax_groups']) > 1)  { ?>
                <td class="cl-total">
                    <?php echo zen_display_tax_value($order->products[$i]['tax']); ?>%</td>
            <?php  }  // endif tax info display  ?>
                <td class="cl-total">
                    <?php echo $currencies->display_price($order->products[$i]['final_price'], $order->products[$i]['tax'], $order->products[$i]['qty']);
                          if ($order->products[$i]['onetime_charges'] != 0 ) echo '<br /> ' . $currencies->display_price($order->products[$i]['onetime_charges'], $order->products[$i]['tax'], 1);
                    ?>
                </td>
            </tr>
            <?php  }  // end for loopthru all products ?>
        </tbody>
    </table>
</div>

<?php
  if (MODULE_ORDER_TOTAL_INSTALLED) {
    $order_totals = $order_total_modules->process();
?>
    <div id="checkoutOrderTotals">
        <table>
            <?php $order_total_modules->output(); ?>
        </table>  
    </div>
    
<?php
  }
?>

<?php
  echo zen_draw_form('checkout_confirmation', $form_action_url, 'post', 'id="checkout_confirmation" onsubmit="submitonce();"');

  if (is_array($payment_modules->modules)) {
    echo $payment_modules->process_button();
  }
?>
    <div class="container-button">
        <div class="buttonRow forward"><?php echo zen_image_submit(BUTTON_IMAGE_CONFIRM_ORDER, BUTTON_CONFIRM_ORDER_ALT, 'name="btn_submit" id="btn_submit"') ;?></div>
        <!-- <div class="back"><?php echo TITLE_CONTINUE_CHECKOUT_PROCEDURE . '<br />' . TEXT_CONTINUE_CHECKOUT_PROCEDURE; ?></div> -->
    </div>
    
    <?php  if ($flagAnyOutOfStock) { ?>
      
        <?php  if (STOCK_ALLOW_CHECKOUT == 'true') {  ?>
            <div class="messageStackError"><?php echo OUT_OF_STOCK_CAN_CHECKOUT; ?></div>
        <?php  } else { ?>
            <div class="messageStackError"><?php echo OUT_OF_STOCK_CANT_CHECKOUT; ?></div>

        <?php  } //endif STOCK_ALLOW_CHECKOUT ?>
    <?php  } //endif flagAnyOutOfStock ?>

</form>
</div>