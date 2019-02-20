<?php
/**
 * Module Template - for shipping-estimator display
 *
 * @package templateSystem
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_modules_shipping_estimator.php 18695 2011-05-04 05:24:19Z drbyte $
 */
?>
<div id="shippingEstimatorContent">
  <?php echo zen_draw_form('estimator', zen_href_link($show_in, '', $request_type), 'post'); ?>
  <?php echo zen_draw_hidden_field('scid', $selected_shipping['id']); ?>
  <?php echo zen_draw_hidden_field('action', 'submit'); ?>
  <?php
    if($_SESSION['cart']->count_contents()) {
      if ($_SESSION['customer_id']) {
  ?>
  <h2>
  	<div><?php echo CART_SHIPPING_OPTIONS; ?></div>
  </h2>


  <?php if (!empty($totalsDisplay)) { ?>
  <div class="cartTotalsDisplay important"><?php echo $totalsDisplay; ?></div>
  <?php } ?>

  <?php
      // only display addresses if more than 1
        if ($addresses->RecordCount() > 1){
  ?>
  <label class="inputLabel" for="seAddressPulldown"><?php echo CART_SHIPPING_METHOD_ADDRESS; ?></label>
  <?php echo zen_draw_pull_down_menu('address_id', $addresses_array, $selected_address, 'onchange="return shipincart_submit();" id="seAddressPulldown" class="seShipAdd"'); ?>
  <?php
        }
  ?>
  <br class="clearBoth" />
  <div class="bold back" id="seShipTo"><?php echo CART_SHIPPING_METHOD_TO; ?></div>
  <address class="back"><?php echo zen_address_format($order->delivery['format_id'], $order->delivery, 1, ' ', '<br />'); ?></address>
  <br class="clearBoth" />
  <?php
      } else {
  ?>
  <h2><?php echo CART_SHIPPING_OPTIONS; ?></h2>
  <?php if (!empty($totalsDisplay)) { ?>
  <!-- <div class="cartTotalsDisplay important"><?php #echo $totalsDisplay; ?></div> -->
  <?php } ?>
  <?php
        if($_SESSION['cart']->get_content_type() != 'virtual'){
  ?>
  <h3 class="estimateCostTitle"><?php echo CART_SHIPPING_OPTIONS_ESTIMATE; ?></h3>
  
  <div class="form-container">
      <label class="inputLabel" for="country"><?php echo ENTRY_COUNTRY; ?></label>
      <?php echo zen_get_country_list('zone_country_id', $selected_country, 'id="country" onchange="update_zone(this.form);"'); ?>
      <br class="clearBoth" />
      <label class="inputLabel" for="stateZone" id="zoneLabel"><?php echo ENTRY_STATE; ?></label>
      <?php echo zen_draw_pull_down_menu('zone_id', zen_prepare_country_zones_pull_down($selected_country), $state_zone_id, 'id="stateZone"');?>
      <br class="clearBoth" />
      <label class="inputLabel" for="state" id="stateLabel"><?php echo $state_field_label; ?></label>
      <?php echo zen_draw_input_field('state', $selectedState, zen_set_field_length(TABLE_ADDRESS_BOOK, 'entry_state', '40') . ' id="state"') .'&nbsp;<span class="alert" id="stText"></span>'; ?>
      <br class="clearBoth" />
      <?php
              if(CART_SHIPPING_METHOD_ZIP_REQUIRED == "true"){
      ?>
      <label class="inputLabel"><?php echo ENTRY_POST_CODE; ?></label>
      <?php echo  zen_draw_input_field('zip_code', $zip_code, 'size="7"'); ?>
      <?php
              }
      ?>
      <div class="buttonRow forward"><?php echo  zen_image_submit(BUTTON_IMAGE_UPDATE, BUTTON_UPDATE_ALT); ?></div>
  </div>

  <?php
        }
      }
      if($_SESSION['cart']->get_content_type() == 'virtual'){
  ?>
  <?php echo CART_SHIPPING_METHOD_FREE_TEXT .  ' ' . CART_SHIPPING_METHOD_ALL_DOWNLOADS; ?>
  <?php
      }elseif ($free_shipping==1) {
  ?>
  <?php echo sprintf(FREE_SHIPPING_DESCRIPTION, $currencies->format(MODULE_ORDER_TOTAL_SHIPPING_FREE_SHIPPING_OVER)); ?>
  <?php
      }else{
  ?>
  <table width="100%" border="1" cellpadding="1" cellspacing ="1">
  <?php if ($_SESSION['customer_id'] < 1 ){ ?>
      <tr>
        <td colspan="2" class="seDisplayedAddressLabel">
          <?php echo CART_SHIPPING_QUOTE_CRITERIA; ?><br />
          <?php echo '<span class="seDisplayedAddressInfo">' . zen_get_zone_name($selected_country, $state_zone_id, '') . ($selectedState != '' ? ' ' . $selectedState : '') . ' ' . $order->delivery['postcode'] . ' ' . zen_get_country_name($order->delivery['country_id']) . '</span>'; ?>
        </td>
      </tr>
  <?php } ?>
       <tr>
         <th colspan="3" scope="colgroup" id="seProductsHeading"><?php echo CART_SHIPPING_METHOD_TEXT; ?></th>
       </tr>
       <tr class="mainLabelRow">
        <td class="firstCol"><?php echo CART_SHIPPING_METHOD_OPTION; ?></td>
          <td class="secondCol"><?php echo CART_SHIPPING_METHOD_COST; ?></td>
          <!--td class="thirdCol"><?php echo CART_SHIPPING_METHOD_BY; ?></td-->
       </tr>
  <?php
        for ($i=0, $n=sizeof($quotes); $i<$n; $i++) {
          if(sizeof($quotes[$i]['methods'])==1){
            // simple shipping method
            $thisquoteid = $quotes[$i]['id'].'_'.$quotes[$i]['methods'][0]['id'];
  ?>
       <tr class="<?php echo $extra; ?> mainRow">
  <?php
            if($quotes[$i]['error']){
  ?>
           <td colspan="3"><?php echo $quotes[$i]['module']; ?>&nbsp;(<?php echo $quotes[$i]['error']; ?>)</td>
         </tr>
  <?php
            }else{
              if($selected_shipping['id'] == $thisquoteid){
  ?>
           <td class="bold"><?php echo $quotes[$i]['module']; ?>&nbsp;(<?php echo $quotes[$i]['methods'][0]['title']; ?>)</td>
           <td class="cartTotalDisplay bold"><?php //echo $currencies->format(zen_add_tax($quotes[$i]['methods'][0]['cost'], $quotes[$i]['tax'])); 
  $shipcost0=zen_add_tax($quotes[$i]['methods'][0]['cost'], $quotes[$i]['tax']); echo $shipcost0==0?'<font color="#DD2419"><strong>'.$currencies->format($shipcost0).'</strong></font>':$currencies->format($shipcost0);

  ?></td>
           <!--td></td-->
         </tr>
  <?php
              }else{
  ?>
            <td><?php echo $quotes[$i]['module']; ?>&nbsp;(<?php echo $quotes[$i]['methods'][0]['title']; ?>)</td>
            <td class="cartTotalDisplay"><?php //echo $currencies->format(zen_add_tax($quotes[$i]['methods'][0]['cost'], $quotes[$i]['tax'])); 

  $shipcost0 = zen_add_tax($quotes[$i]['methods'][0]['cost'], $quotes[$i]['tax']); 
  echo $shipcost0 == 0?'<font color="#DD2419"><strong>'.$currencies->format($shipcost0).'</strong></font>':$currencies->format($shipcost0);
    
  ?></td>
            <!--td></td-->
         </tr>
  <?php
              }
            }
          } else {
            // shipping method with sub methods (multipickup)
            for ($j=0, $n2=sizeof($quotes[$i]['methods']); $j<$n2; $j++) {
              $thisquoteid = $quotes[$i]['id'].'_'.$quotes[$i]['methods'][$j]['id'];
  ?>
      <tr class="<?php echo $extra; ?> mainRow">
  <?php
              if($quotes[$i]['error']){
  ?>
           <td colspan="3"><?php echo $quotes[$i]['module']; ?>&nbsp;(<?php echo $quotes[$i]['error']; ?>)</td>
         </tr>
  <?php
              }else{
                if($selected_shipping['id'] == $thisquoteid){
  ?>
           <td class="bold"><?php echo $quotes[$i]['module']; ?>&nbsp;(<?php echo $quotes[$i]['methods'][$j]['title']; ?>)</td>
           <td class="cartTotalDisplay bold"><?php $shipcost0=zen_add_tax($quotes[$i]['methods'][$j]['cost'], $quotes[$i]['tax']); echo $shipcost0==0?'<font color="#DD2419"><strong>'.$currencies->format($shipcost0).'</strong></font>':$currencies->format($shipcost0); ?></td>
           <!--td></td-->
         </tr>
  <?php
                }else{
  ?>
          <td><?php echo $quotes[$i]['module']; ?>&nbsp;(<?php echo $quotes[$i]['methods'][$j]['title']; ?>)</td>
          <td class="cartTotalDisplay"><?php //echo $currencies->format(zen_add_tax($quotes[$i]['methods'][$j]['cost'], $quotes[$i]['tax'])); 
  $shipcost0=zen_add_tax($quotes[$i]['methods'][$j]['cost'], $quotes[$i]['tax']); echo $shipcost0==0?'<font color="#DD2419"><strong>'.$currencies->format($shipcost0).'</strong></font>':$currencies->format($shipcost0);
  ?></td>
          <!--td></td-->
        </tr>
  <?php
                }
              }
            }
          }
        }
  ?>
  </table>
  <?php
     }
    }
  ?>
  </form>
</div>

<div id="shippingPolicy">
  <h2>
  	<div class="back">Shipping Policy</div>
  	<div class="forward" id="policy">&#xe001;</div>
  	<div class="clearBoth"></div>
  </h2>
  <div id="shipping-policy-contents">
	  <?php
	    $define_page = zen_get_file_directory(DIR_WS_LANGUAGES . $_SESSION['language'] . '/html_includes/', FILENAME_DEFINE_SHIPPINGINFO, 'false');
	    include($define_page);
	  ?>
  </div><!--EOF #shipipng-policy-contents-->
</div>