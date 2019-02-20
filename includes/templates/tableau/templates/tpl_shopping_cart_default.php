<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=shopping_cart.<br />
 * Displays shopping-cart contents
 *
 * @package templateSystem
 * @copyright Copyright 2003-2010 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_shopping_cart_default.php 15881 2010-04-11 16:32:39Z wilt $
 */
?>
<div class="centerColumn" id="shoppingCartDefault">
<?php
  if ($flagHasCartContents) {
?>

<?php
  if ($_SESSION['cart']->count_contents() > 0) {
?>
<!-- <div class="forward"><?php echo TEXT_VISITORS_CART; ?></div> -->
<?php
  }
?>

<h1 id="cartDefaultHeading"><?php echo HEADING_TITLE; ?></h1>

<?php echo zen_draw_form('cart_quantity', zen_href_link(FILENAME_SHOPPING_CART, 'action=update_product', $request_type)); ?>
<div id="cartInstructionsDisplay" class="content"><?php echo TEXT_INFORMATION; ?></div>

<?php if (!empty($totalsDisplay)) { ?>
  <div class="cartTotalsDisplay important"><?php echo $totalsDisplay; ?></div>
  <br class="clearBoth" />
<?php } ?>

<table id="cartContentsDisplay">
     <tr class="tableHeading">
        <th scope="col" id="scImageHeading"><?php echo TABLE_HEADING_IMAGE; ?></th>
        <th scope="col" id="scProductsHeading"><?php echo TABLE_HEADING_PRODUCTS; ?></th>
        <th scope="col" id="scUnitHeading"><?php echo TABLE_HEADING_PRICE; ?></th>
        <th scope="col" id="scQuantityHeading"><?php echo TABLE_HEADING_QUANTITY; ?></th>
        <th scope="col" id="scTotalHeading"><?php echo TABLE_HEADING_TOTAL; ?></th>
        <!-- <th scope="col" id="scRemoveHeading">&nbsp;</th> -->
     </tr>
         <!-- Loop through all products /-->
<?php
  foreach ($productArray as $product) {
?>
     <tr class="<?php echo $product['rowClass']; ?>">
        <td class="productImage">
            <a href="<?php echo $product['linkProductsName']; ?>"><span id="cartImage" class="back"><?php echo $product['productsImage']; ?></span></a>
        </td>
        <td class="cartProductDisplay">
            <span class="mobile-only"><?php echo TABLE_HEADING_PRODUCTS; ?>:</span>
            <a href="<?php echo $product['linkProductsName']; ?>"><span id="cartProdTitle"><?php echo $product['productsName'] . '<span class="alert bold">' . $product['flagStockCheck'] . '</span>'; ?></span></a>
            <?php
              echo $product['attributeHiddenField'];
              if (isset($product['attributes']) && is_array($product['attributes'])) {
              echo '<div class="cartAttribsList">';
              echo '<ul>';
                reset($product['attributes']);
                foreach ($product['attributes'] as $option => $value) {
            ?>

                      <li><?php echo $value['products_options_name'] . TEXT_OPTION_DIVIDER . nl2br($value['products_options_values_name']); ?></li>

            <?php
                }
              echo '</ul>';
              echo '</div>';
              }
            ?>
        </td>
       
        <td class="cartUnitDisplay">
            <span class="mobile-only"><?php echo TABLE_HEADING_PRICE; ?>:</span>
            <?php echo $product['productsPriceEach']; ?>
        </td>
        <td class="cartQuantity">
            <span class="mobile-only"><?php echo TABLE_HEADING_QUANTITY; ?>:</span>
            <?php
              if ($product['flagShowFixedQuantity']) {
                echo $product['showFixedQuantityAmount'] . '<span class="alert bold">' . $product['flagStockCheck'] . '</span>' . $product['showMinUnits'];
              } else {
                echo $product['quantityField'] . '<span class="alert bold">' . $product['flagStockCheck'] . '</span>' . $product['showMinUnits'];
              }
            ?>
            <div class="qty-btns">
                <?php
                  if ($product['buttonUpdate'] == '') {
                    echo '' ;
                  } else {
                    echo $product['buttonUpdate'];
                  }
                ?>

                <?php
                    if ($product['buttonDelete']) {
                ?>
                    <a href="<?php echo zen_href_link(FILENAME_SHOPPING_CART, 'action=remove_product&product_id=' . $product['id']); ?>">Remove</a>
                <?php
                    }
                    if ($product['checkBoxDelete'] ) {
                        // echo zen_draw_checkbox_field('cart_delete[]', $product['id']);
                    }
                ?>
            </div>
        </td>
        <td class="cartTotalDisplay">
            <span class="mobile-only label">
                <?php echo TABLE_HEADING_TOTAL; ?>:
            </span>
            <?php echo $product['productsPrice']; ?>
        </td>
    </tr>
    <?php
      } // end foreach ($productArray as $product)
    ?>
    <!-- Finished loop through all products /-->
</table>
<table>
    <tr id="cartSubTotal">
        <td class="title">
            <?php echo SUB_TITLE_SUB_TOTAL; ?>
        </td>
        <td>
            <?php echo $cartShowTotal; ?>
        </td>
    </tr>
</table>
<div class="buttons-container">
    <!--bof shopping cart buttons-->
    <div class="buttonRow forward checkout-btn"><?php echo '<a href="' . zen_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL') . '">' . BUTTON_CHECKOUT_ALT . ' <span class="right-arrow">&#xe00b;</span></a>'; ?></div>
    <div class="buttonRow back continue-btn">
        <span class="left-arrow">&#xe008;</span>
        <?php echo zen_back_link() . '' . BUTTON_CONTINUE_SHOPPING_ALT . '</a>'; ?>
    </div>
  
    <?php
        // show update cart button
        if (SHOW_SHOPPING_CART_UPDATE == 2 or SHOW_SHOPPING_CART_UPDATE == 3) {
    ?>
            <div class="buttonRow back update-cart"><?php echo zen_image_submit(BUTTON_IMAGE_UPDATE, BUTTON_UPDATE_ALT); ?></div>
    <?php
        } else { // don't show update button below cart
    ?>
    <?php
      } // show update button
    ?>

    <?php
        if (SHOW_SHIPPING_ESTIMATOR_BUTTON == '1') {
    ?>

    <div class="buttonRow back shopping-estimator"><?php echo '<a id="shopping-cart-estimator-link" data-fancybox-type="iframe" href="' . zen_href_link(FILENAME_POPUP_SHIPPING_ESTIMATOR) . '">' . BUTTON_SHIPPING_ESTIMATOR_ALT . '</a>'; ?></div>
    <?php
        }
    ?>

    

    <!--eof shopping cart buttons-->
</div>
<?php if ($messageStack->size('shopping_cart') > 0) echo $messageStack->output('shopping_cart'); ?>
<?php  if ($flagAnyOutOfStock) { ?>

<?php    if (STOCK_ALLOW_CHECKOUT == 'true') {  ?>

<div class="messageStackError"><?php echo OUT_OF_STOCK_CAN_CHECKOUT; ?></div>

<?php    } else { ?>
<div class="messageStackError"><?php echo OUT_OF_STOCK_CANT_CHECKOUT; ?></div>

<?php    } //endif STOCK_ALLOW_CHECKOUT ?>
<?php  } //endif flagAnyOutOfStock ?>
<!-- ** BEGIN PAYPAL EXPRESS CHECKOUT ** -->
<?php  // the tpl_ec_button template only displays EC option if cart contents >0 and value >0
if (defined('MODULE_PAYMENT_PAYPALWPP_STATUS') && MODULE_PAYMENT_PAYPALWPP_STATUS == 'True') {
  include(DIR_FS_CATALOG . DIR_WS_MODULES . 'payment/paypal/tpl_ec_button.php');
}
?>
<!-- ** END PAYPAL EXPRESS CHECKOUT ** -->

<?php
      if (SHOW_SHIPPING_ESTIMATOR_BUTTON == '2') {
/**
 * load the shipping estimator code if needed
 */
?>
      <?php require(DIR_WS_MODULES . zen_get_module_directory('shipping_estimator.php')); ?>

<?php
      }
?>
</form>
<?php
  } else {
?>

<div class="content" id="cartEmptyText"><?php echo TEXT_CART_EMPTY; ?></div>

<?php
  }
?>
</div>
