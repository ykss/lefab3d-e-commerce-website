<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=fec_confirmation.<br />
 * Displays final checkout details, cart, payment and shipping info details.
 *
 * @package templateSystem
 * @copyright Copyright 2003-2006 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_fec_confirmation_default.php 3 2012-07-08 21:11:34Z numinix $
 */
?>
<?php
  if (!$_SESSION['sendto']) {
    $columns = "2";
  } 
?>
<div class="centerColumn" id="checkoutConfirmDefault">
  <div id="quickCheckoutContent">

<?php 
     /*
 if (FEC_ORDER_STEPS == 'true') {
        require($template->get_template_dir('tpl_modules_qc_order_steps.php',DIR_WS_TEMPLATE, $current_page_base,'templates/quick_checkout'). '/tpl_modules_qc_order_steps.php');  
      } 
*/
    ?>

    <h1 id="checkoutConfirmDefaultHeading"><?php echo HEADING_TITLE; ?></h1>
    <div id="messageStackErrors"><?php if ($messageStack->size('redemptions') > 0) echo $messageStack->output('redemptions'); ?><?php if ($messageStack->size('checkout_confirmation') > 0) echo $messageStack->output('checkout_confirmation'); ?><?php if ($messageStack->size('checkout') > 0) echo $messageStack->output('checkout'); ?><?php  if ($flagAnyOutOfStock) { ?><?php if (STOCK_ALLOW_CHECKOUT != 'true') {  ?><div class="messageStackError"><?php echo OUT_OF_STOCK_CANT_CHECKOUT; ?></div><?php } //endif STOCK_ALLOW_CHECKOUT ?><?php } //endif flagAnyOutOfStock ?></div> 
    <div id="column1<?php echo $columns; ?>">
      <div id="column2<?php echo $columns; ?>">
        <div id="qc_column1<?php echo $columns; ?>" class="back">
          <div class="columnInner">
            <h2 id="checkoutConfirmDefaultBillingAddress"><?php echo HEADING_BILLING_ADDRESS; ?></h2>
            <div class="boxContents">
            <?php if (!$flagDisablePaymentAddressChange) { ?>
              <div class="buttonRow forward"><?php echo '<a href="' . zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL') . '">' . (FEC_CSS_BUTTONS == 'false' ? zen_image_button(BUTTON_IMAGE_EDIT_SMALL, BUTTON_EDIT_SMALL_ALT) : zenCssButton(BUTTON_IMAGE_EDIT_SMALL, BUTTON_EDIT_SMALL_ALT, 'button', 'buttom_small_edit')) . '</a>'; ?></div>
            <?php } ?>

              <address><?php echo zen_address_format($order->billing['format_id'], $order->billing, 1, ' ', '<br />'); ?></address>

            <?php
              $class =& $_SESSION['payment'];
            ?>

              <h3 id="checkoutConfirmDefaultPayment"><?php echo HEADING_PAYMENT_METHOD; ?></h3> 
              <h4 id="checkoutConfirmDefaultPaymentTitle"><?php echo $GLOBALS[$class]->title; ?></h4>

            <?php
              if (is_array($payment_modules->modules)) {
                if ($confirmation = $payment_modules->confirmation()) {
            ?>
              <div class="important"><?php echo $confirmation['title']; ?></div>
            <?php
                }
            ?>
              <div class="important">
            <?php
                  for ($i=0, $n=sizeof($confirmation['fields']); $i<$n; $i++) {
            ?>
              <div class="back"><?php echo $confirmation['fields'][$i]['title']; ?></div>
              <div ><?php echo $confirmation['fields'][$i]['field']; ?></div>
            <?php
                 }
            ?>
                  </div>
            <?php
              }
            ?>
            </div>
            <div class="boxBottom"></div>
          </div>
        </div>

      <?php
        if ($_SESSION['sendto'] != false) {
      ?>
        <div id="qc_column2" class="back">
          <div class="columnInner">
            <h2 id="checkoutConfirmDefaultShippingAddress"><?php echo HEADING_DELIVERY_ADDRESS; ?></h2>
            <div class="boxContents">
              <div class="buttonRow forward"><?php echo '<a href="' . $editShippingButtonLink . '">' . (FEC_CSS_BUTTONS == 'false' ? zen_image_button(BUTTON_IMAGE_EDIT_SMALL, BUTTON_EDIT_SMALL_ALT) : zenCssButton(BUTTON_IMAGE_EDIT_SMALL, BUTTON_EDIT_SMALL_ALT, 'button', 'buttom_small_edit')) . '</a>'; ?></div>

              <address><?php echo zen_address_format($order->delivery['format_id'], $order->delivery, 1, ' ', '<br />'); ?></address>

            <?php
                if ($order->info['shipping_method']) {
            ?>
              <h3 id="checkoutConfirmDefaultShipment"><?php echo HEADING_SHIPPING_METHOD; ?></h3>
              <h4 id="checkoutConfirmDefaultShipmentTitle"><?php echo $order->info['shipping_method']; ?></h4>

            <?php
                }
            ?>
            </div>
            <div class="boxBottom"></div>
          </div>
        </div>
      <?php
        }
      ?>
      <?php
      // always show comments
      //  if ($order->info['comments']) {
      ?>
        <div id="qc_column3<?php echo $columns; ?>" class="back">
          <div class="columnInner">
            <h2 id="checkoutConfirmDefaultHeadingComments"><?php echo HEADING_ORDER_COMMENTS; ?></h2>
            <div class="boxContents">
              <div class="buttonRow forward"><?php echo  '<a href="' . zen_href_link(FILENAME_CHECKOUT_PAYMENT, '', 'SSL') . '">' . (FEC_CSS_BUTTONS == 'false' ? zen_image_button(BUTTON_IMAGE_EDIT_SMALL, BUTTON_EDIT_SMALL_ALT) : zenCssButton(BUTTON_IMAGE_EDIT_SMALL, BUTTON_EDIT_SMALL_ALT, 'button', 'buttom_small_edit')) . '</a>'; ?></div>
              <div><?php echo (empty($order->info['comments']) ? NO_COMMENTS_TEXT : nl2br(zen_output_string_protected($order->info['comments'])) . zen_draw_hidden_field('comments', $order->info['comments'])); ?></div>
              <br class="clearBoth" />
            <?php
            //  }
            ?>
            </div>
            <div class="boxBottom"></div>
            <h2><?php echo HEADING_PRODUCTS; ?></h2>
            <div class="boxContents">
              <div class="buttonRow forward editButton"><?php echo '<a href="' . zen_href_link(FILENAME_SHOPPING_CART, '', 'NONSSL') . '">' . (FEC_CSS_BUTTONS == 'false' ? zen_image_button(BUTTON_IMAGE_EDIT_SMALL, BUTTON_EDIT_SMALL_ALT) : zenCssButton(BUTTON_IMAGE_EDIT_SMALL, BUTTON_EDIT_SMALL_ALT, 'button', 'buttom_small_edit')) . '</a>'; ?></div>
              <br class="clearBoth" />      
              <table border="0" width="100%" cellspacing="0" cellpadding="0" id="cartContentsDisplay">
                    <!--tr class="cartTableHeading">
                    <th scope="col" id="ccQuantityHeading"><?php echo TABLE_HEADING_QUANTITY; ?></th>
                    <th scope="col" id="ccProductsHeading" colspan="3"><?php echo TABLE_HEADING_PRODUCTS; ?></th>
            <?php
              // If there are tax groups, display the tax columns for price breakdown
              if (sizeof($order->info['tax_groups']) > 1) {
            ?>
                      <th scope="col" id="ccTaxHeading"><?php echo HEADING_TAX; ?></th>
            <?php
              }
            ?>
                      <th scope="col" id="ccTotalHeading"><?php echo TABLE_HEADING_TOTAL; ?></th>
                    </tr-->
                    <!--tr>
                      <td colspan="5"><hr /></td>
                    </tr-->
          <?php // now loop thru all products to display quantity and price ?>
          <?php for ($i=0, $n=sizeof($order->products); $i<$n; $i++) { ?>
          <?php $thumbnail = zen_get_products_image($order->products[$i]['id'], 40, 42); ?>
                      <tr class="<?php echo $order->products[$i]['rowClass']; ?>">
                        <td  class="cartQuantity"><?php echo $order->products[$i]['qty']; ?>&nbsp;x</td>
                        <td class="cartImage"><?php echo $thumbnail; ?></td>
                        <td class="cartProductDisplay" colspan="2"><?php echo $order->products[$i]['name']; ?>
                    <?php  echo $stock_check[$i]; ?>
          
          <?php // if there are attributes, loop thru them and display one per line
              if (isset($order->products[$i]['attributes']) && sizeof($order->products[$i]['attributes']) > 0 ) {
              //echo '<ul class="cartAttribsList">';
                for ($j=0, $n2=sizeof($order->products[$i]['attributes']); $j<$n2; $j++) {
          ?>
                <!--li--><?php echo '<br />' . $order->products[$i]['attributes'][$j]['option'] . ': ' . nl2br(zen_output_string_protected($order->products[$i]['attributes'][$j]['value'])); ?><!--/li-->
          <?php
                } // end loop
                //echo '</ul>';
              } // endif attribute-info
          ?>
                      </td>
                      <td class="cartTotalDisplay">
                    <?php echo $currencies->display_price($order->products[$i]['final_price'], $order->products[$i]['tax'], $order->products[$i]['qty']);
                    if ($order->products[$i]['onetime_charges'] != 0 ) echo '<br /> ' . $currencies->display_price($order->products[$i]['onetime_charges'], $order->products[$i]['tax'], 1);
          ?>
                      </td>
                    </tr>
          <?php  }  // end for loopthru all products 
          ?>
                  </table>
            <?php
              if (MODULE_ORDER_TOTAL_INSTALLED) {
                //$order_totals = $order_total_modules->process();
            ?>
              <div id="orderTotals">
                <table border="0">
                  <?php $order_total_modules->output(); ?>
                </table>
              </div>
              <br class="clearBoth" />
            <?php
              }
            ?>
            </div>
            <div class="boxBottom"></div>

          <?php
            echo zen_draw_form('checkout_confirmation', $form_action_url, 'post', 'id="checkout_confirmation"');
            if (FEC_ONE_PAGE == 'true') {
              echo zen_draw_hidden_field('onePageStatus', 'on', 'class="hiddenField"') . zen_draw_hidden_field('email_pref_html', 'email_format', 'class="hiddenField"');
            }
            if (is_array($payment_modules->modules)) {
              echo $payment_modules->process_button();
            }
          ?>
            <div class="buttonRow forward"><?php echo (FEC_CSS_BUTTONS == 'false' ? zen_image_submit(BUTTON_IMAGE_CONFIRM_ORDER, BUTTON_CONFIRM_ORDER_ALT, 'name="btn_submit" id="btn_submit"') : zenCssButton(BUTTON_IMAGE_CONFIRM_ORDER, BUTTON_CONFIRM_ORDER_ALT, 'submit', 'button_confirm_checkout')) ;?></div>
            </form>
            <div class="clearBoth"></div>
          </div>
          <div class="clearBoth"></div> 
        </div>
        <div class="clearBoth"></div>
      </div>
      <div class="clearBoth"></div>
    </div>
  </div>
</div>
