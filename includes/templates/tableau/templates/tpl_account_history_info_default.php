<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=account_edit.<br />
 * Displays information related to a single specific order
 *
 * @package templateSystem
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_account_history_info_default.php 19103 2011-07-13 18:10:46Z wilt $
 */
?>



<h1><?php echo HEADING_TITLE; ?></h1>
<?php require($template->get_template_dir('tpl_modules_account_menu.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_account_menu.php'); ?>

<div id="account-content">


<div class="account-full-width">
  <span class="order-title">Order Details</span>

  <div class="details-infos">

    <div class="order-date order-details">
      <strong><?php echo HEADING_ORDER_DATE; ?></strong> <?php echo zen_date_short($order->info['date_purchased']); ?>
    </div><!--EOF .order-date-->
    
    <div class="order-number order-details">
      <?php echo sprintf(HEADING_ORDER_NUMBER, $_GET['order_id']); ?>
    </div><!--EOF .order-number-->
    
    <?php if ($order->delivery != false) {?>
      <div class="shipped-to order-details">
        <strong><?php echo HEADING_DELIVERY_ADDRESS; ?></strong> <?php echo zen_address_format($order->delivery['format_id'], $order->delivery, 1, ' ', ','); ?>
      </div><!--EOF .shipped-to-->
    <?php } ?>
    
    <div class="shipping-method order-details">
      <?php if (zen_not_null($order->info['shipping_method'])) { ?>
        <strong><?php echo HEADING_SHIPPING_METHOD; ?></strong> <?php echo $order->info['shipping_method']; ?>
      <?php } else { // temporary just remove these 4 lines ?>
        WARNING: Missing Shipping Information
      <?php } ?>
    </div><!--EOF .shipping-method-->
    
    <div class="billed-to order-details">
      <strong><?php echo HEADING_BILLING_ADDRESS; ?></strong> <?php echo zen_address_format($order->billing['format_id'], $order->billing, 1, ' ', ','); ?>
    </div><!--EOF .billed-to-->
    
    <div class="payment-method order-details">
      <strong><?php echo HEADING_PAYMENT_METHOD; ?></strong> <?php echo $order->info['payment_method']; ?>
    </div><!--EOF .payment-method-->
  </div>
  
  
  <div class="table-infos">
    <table class="order-details-info">
          <tr class="tableHeading">
              <th scope="col" class="info-product-image" colspan="2"><?php echo HEADING_IMAGE; ?></th>
              <th scope="col" class="product-total"><?php echo HEADING_TOTAL; ?></th>
          </tr>
          
      <?php
        for ($i=0, $n=sizeof($order->products); $i<$n; $i++) {
      ?>
          <tr>
            <td class="info-product-image">
                <span class="img-container">
                    <?php echo zen_get_products_image((int)$order->products[$i]['id']);?>
                </span>
            </td>
            <td class="product-item">
                <span class="product-title-brand">
                    <?php echo $order->products[$i]['name']; ?>
                </span>
                <div class="qty" style="display: none"><?php echo QUANTITY_SUFFIX . ' ' . $order->products[$i]['qty']; ?></div>
                <?php
                if ( (isset($order->products[$i]['attributes'])) && (sizeof($order->products[$i]['attributes']) > 0) ) {
                  echo '<ul class="orderAttribsList">';
                  for ($j=0, $n2=sizeof($order->products[$i]['attributes']); $j<$n2; $j++) {
                    echo '<li><strong>' . $order->products[$i]['attributes'][$j]['option'] . ':</strong> ' . nl2br(zen_output_string_protected($order->products[$i]['attributes'][$j]['value'])) . '</li>';
                  }
                  echo '</ul>';
              }
            ?>
            </td> 
            <td class="product-total">
                <?php 
                 $ppe = zen_round(zen_add_tax($order->products[$i]['final_price'], $order->products[$i]['tax']), $currencies->get_decimal_places($order->info['currency']));
                 $ppt = $ppe * $order->products[$i]['qty']; 
                //        echo $currencies->format(zen_add_tax($order->products[$i]['final_price'], $order->products[$i]['tax']) * $order->products[$i]['qty'], true, $order->info['currency'], $order->info['currency_value']) . ($order->products[$i]['onetime_charges'] != 0 ? '<br />' . $currencies->format(zen_add_tax($order->products[$i]['onetime_charges'], $order->products[$i]['tax']), true, $order->info['currency'], $order->info['currency_value']) : '') 
                echo $currencies->format($ppt, true, $order->info['currency'], $order->info['currency_value']) . ($order->products[$i]['onetime_charges'] != 0 ? '<br />' . $currencies->format(zen_add_tax($order->products[$i]['onetime_charges'], $order->products[$i]['tax']), true, $order->info['currency'], $order->info['currency_value']) : ''); 
                ?>
              </td>
          </tr>
      <?php
        }
      ?>
      </table>

  </div>
  
  <div id="orderTotals">
    <?php for ($i=0, $n=sizeof($order->totals); $i<$n; $i++) {?>
      <?php if($order->totals[$i]['title'] == 'Total:') { ?>
      <div class="order-total-container" id="total-price">
        <div class="order-total-wrapper forward">
          <div class="lineTitle larger back"><?php echo str_replace(':','',$order->totals[$i]['title']); ?>:</div>
          <div class="amount larger back"><?php echo $order->totals[$i]['text']; ?></div>
          <div class="clearBoth"></div>
        </div>
        <div class="clearBoth"></div>
      </div>
      <?php } else {?>
      <div class="order-total-container">
        <div class="order-total-wrapper forward">
          <div class="lineTitle larger back"><?php echo str_replace(':','',$order->totals[$i]['title']); ?>:</div>
          <div class="amount larger back"><?php echo $order->totals[$i]['text']; ?></div>
          <div class="clearBoth"></div>
        </div>
        <div class="clearBoth"></div>
      </div>
      <?php }?>
    <?php }?>
  </div><!--EOF #orderTotals-->
  
  
    
</div><!--EOF .account-full-width-->

<?php
  /**
   * Used to loop thru and display order status information
   */
  if (sizeof($statusArray)) {
  ?>

    <div id="order-status-wrapper" class="account-full-width">

      <h2 id="orderHistoryStatus"><?php echo HEADING_ORDER_HISTORY; ?></h2>
      
      <div class="table-infos">
          <table id="myAccountOrdersStatus">
          <tr class="tableHeading">
              <th scope="col" class="history-date"><?php echo TABLE_HEADING_STATUS_DATE; ?></th>
              <th scope="col" class="history-status"><?php echo TABLE_HEADING_STATUS_ORDER_STATUS; ?></th>
              <th scope="col" class="history-comments"><?php echo TABLE_HEADING_STATUS_COMMENTS; ?></th>
             </tr>
      <?php
        foreach ($statusArray as $statuses) {
      ?>
          <tr>
              <td class="history-date"><?php echo zen_date_short($statuses['date_added']); ?></td>
              <td class="history-status"><?php echo $statuses['orders_status_name']; ?></td>
              <td class="history-comments"><?php echo (empty($statuses['comments']) ? '&nbsp;' : nl2br(zen_output_string_protected($statuses['comments']))); ?></td> 
           </tr>
      <?php
        }
      ?>
      </table>
      </div>
    </div><!--EOF #order-status-wrapper-->
  <?php } ?>


</div>