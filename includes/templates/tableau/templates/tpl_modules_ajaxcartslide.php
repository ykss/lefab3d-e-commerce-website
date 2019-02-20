<?php
    echo '<div class="ajaxCartSlide"><div class="icons" id="top-arrow">&#xe00a;</div>';
    if ($_SESSION['cart']->count_contents() > 0) {
      echo '  <ul>';

      $products = $_SESSION['cart']->get_products();
      for ($i=0, $n=sizeof($products); $i<$n; $i++) {
        // check stock
        $stock = zen_get_products_stock($products[$i]['id'], $products[$i]['attributes']);        
        $ajaxCartSlideItem = '  <li class="ajaxCartSlideItem"><div class="col-left" id="ajaxProductImage">' . zen_get_products_image($products[$i]['id']) . '</div><div class="col-right" class="ajax-product-wrapper"><a href="'. zen_href_link(FILENAME_PRODUCT_INFO, 'products_id=' . $products[$i]['id']) .'" title="' . htmlentities($products[$i]['name']) . '" class="ajaxCartSlideProductsName"><span class="bold">' . $products[$i]['name'] . '</span>';
        
        if ($stock < $products[$i]['quantity']) {
          //$ajaxCartSlideItem .= '<p><span class="backorder">* backordered</span></p>';
        }
        if (is_array($products[$i]['attributes'])) {
          $options_values_ids = array();
          $ajaxCartSlideItem .= '<span>';
          foreach ($products[$i]['attributes'] as $key => $options_values_id) {
            if (zen_values_name($options_values_id) != 'TEXT') {
              $nontext = true;
              $options_values_ids[] = zen_values_name($options_values_id);
            } else {
              // don't output values from text fields
              //$options_values_ids[] = $products[$i]['attributes_values'][$key];
            }
          }
          if ($nontext) {
            $ajaxCartSlideItem .= '<span class="back">' . implode(', ', $options_values_ids) . '</span>';
          }
          $ajaxCartSlideItem .= '</span><br /><br />';
        }
        $ajaxCartSlideItem .='<p class="qty-price-wrapper"><span>qty:&nbsp;' . $products[$i]['quantity'] . '</span>' . ($stock < $products[$i]['quantity'] ? '<span class="backorder">* backordered</span>' : '') . '<span class="product-price">'. $currencies->display_price($products[$i]['final_price'], zen_get_tax_rate($products[$i]['tax_class_id']), $products[$i]['quantity']) . '</span></a></p><span class="ajaxCartSlideRemove"><a href="' . zen_href_link(FILENAME_SHOPPING_CART, 'action=remove_product&product_id=' . $products[$i]['id'], ($_SERVER['HTTPS'] == 'on' ? 'SSL' : 'NONSSL')) . '" title="Remove Product From Cart">remove</a></span>' . 
                             '</div><div class="clearBoth"></div></li>';
        echo $ajaxCartSlideItem;
      }
      echo '  <li id="subTotal"><span class="slider-subtotal">subtotal:&nbsp;<span class="bold">'. $currencies->format($_SESSION['cart']->show_total()) .'</span></span><br /></li>';
      echo '  <li class="ajaxCartSlideOptions"><span id="ajaxCartSlideShoppingCart" class="back"><a href="' . zen_href_link(FILENAME_SHOPPING_CART) . '" title="Click to view your shopping cart">View Cart</a></span><span id="ajaxCartSlideCheckout" class="back"><a href="' . zen_href_link(FILENAME_CHECKOUT_SHIPPING, '', 'SSL') . '">' . (AC_AJAX_CART_SLIDER_BUTTONS != 'true' ? BUTTON_CHECKOUT_ALT : zen_image_button(BUTTON_IMAGE_CHECKOUT, BUTTON_CHECKOUT_ALT)) . '</a></span><span id="closeAjaxCartSlide" class="closeAjaxCartSlide forward" title="Close Shopping Cart">Close (X)</span><div class="clearBoth"></div></li>';
      echo '</ul>';
    }
    echo '</div>';
?>