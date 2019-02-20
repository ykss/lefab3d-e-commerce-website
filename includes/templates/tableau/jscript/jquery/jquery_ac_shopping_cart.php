<?php if (AC_STATUS == 'true') { ?>
<script type="text/javascript">
<!--//
<?php
  if (AC_TABLE_HEADERS == 'true') {
    echo 'var headerRow = 1;' . "\n";
  } else {
    echo 'var headerRow = 0;' . "\n";
  }
?>
jQuery(document).ready(function() {
  jQuery(document).ajaxStop(jQuery.unblockUI);
<?php if (AC_REMOVE_SELECTOR != '') { ?>  
  jQuery(document).on('click', '<?php echo AC_REMOVE_SELECTOR; ?>', function() {
    if (jQuery.browser.msie && parseInt(jQuery.browser.version) <= 7) {
      // ie6 not supported
      return true;             
    } else {
      <?php if (AC_PROCESSING_STATUS == 'true') { ?>
      blockPage();
      <?php } ?>
      <?php if (AC_SHOPPING_CART_CONTAINER_SELECTOR != '') { ?>
      var ct = jQuery('<?php echo AC_SHOPPING_CART_CONTAINER_SELECTOR; ?>').children().size();
      <?php } else { ?>
      var ct = 0;
      <?php } ?>
      // do not count header row
      if (ct > 0 + headerRow) {
        var url = jQuery(this).closest("<?php echo AC_PRODUCT_URL_SELECTOR; ?>").attr("href");
        var loc = new String(window.parent.document.location); 
        if (loc.indexOf("https://")!= -1) {
         url = url.replace(RegExp("http:", "g"), 'https:');
        }
        jQuery.get(url, function(data) {
          <?php if (AC_MESSAGESTACK_SELECTOR != '') { ?> 
          // replace message stack
          var messageStackErrors = jQuery(data).find('<?php echo AC_MESSAGESTACK_SELECTOR; ?>').text();
          if (messageStackErrors != null && messageStackErrors.length > 0) {
            displayErrors(messageStackErrors);
          }
          <?php } ?>
          <?php if (AC_ORDER_TOTAL_SELECTOR != '') { ?>
          // replace order totals
          var orderTotal = jQuery(data).find('<?php echo AC_ORDER_TOTAL_SELECTOR; ?>').html();
          if (orderTotal != null) {
            jQuery("<?php echo AC_ORDER_TOTAL_SELECTOR; ?>").html(orderTotal);
          }
          <?php } ?>
          // replace cart totals
          <?php if (!empty($totalsDisplay) && AC_CART_TOTALS_SELECTOR != '') { ?>
          var cartTotals = jQuery(data).find('<?php echo AC_CART_TOTALS_SELECTOR; ?>').html();
          if (cartTotals != null) {
            jQuery("<?php echo AC_CART_TOTALS_SELECTOR; ?>").html(cartTotals); 
          }
          <?php } ?>
          // replace estimator
          <?php if (SHOW_SHIPPING_ESTIMATOR_BUTTON == '2' && AC_SHIPPING_ESTIMATOR_SELECTOR != '') { ?>
          var estimator = jQuery(data).find('<?php echo AC_SHIPPING_ESTIMATOR_SELECTOR; ?>').html();
          if (estimator != null) {
            jQuery('<?php echo AC_SHIPPING_ESTIMATOR_SELECTOR; ?>').html(estimator);
            update_zone(document.estimator);
          }
          <?php } ?>
          <?php if (AC_SHOPPINGCART_SIDEBOX_SELECTOR != '') { ?>
          var shoppingCartSidebox = jQuery(data).find('<?php echo AC_SHOPPINGCART_SIDEBOX_SELECTOR; ?>').html();
          if (shoppingCartSidebox != null) {
            jQuery('<?php echo AC_SHOPPINGCART_SIDEBOX_SELECTOR; ?>').html(shoppingCartSidebox);
          }          
          <?php } ?>
          <?php if (AC_SHOPPINGCART_HEADER_SELECTOR != '') { ?>
          var shoppingCartHeader = jQuery(data).find('<?php echo AC_SHOPPINGCART_HEADER_SELECTOR; ?>').html();
          if (shoppingCartHeader != null) {
            jQuery('<?php echo AC_SHOPPINGCART_HEADER_SELECTOR; ?>').html(shoppingCartHeader);
          }          
          <?php } ?>
          // begin custom selectors
          <?php 
            if (AC_CUSTOM_SELECTORS != '') {
              $custom_selectors = explode(',', AC_CUSTOM_SELECTORS);
              foreach ($custom_selectors as $custom_selector) {
          ?>
          jQuery('<?php echo trim($custom_selector); ?>').html(jQuery(data).find('<?php echo trim($custom_selector); ?>').html()); 
          <?php
              }
            } 
          ?>
          <?php 
            if (AC_CALLBACK != '') {
              echo "\n" . AC_CALLBACK . "\n";
            } 
          ?>        
        });
        jQuery(this).closest('<?php echo AC_PRODUCT_SELECTOR; ?>').fadeOut("fast", function() {
          jQuery(this).closest('<?php echo AC_PRODUCT_SELECTOR; ?>').remove();
        });
        return false;
      } else {
        return true;
      }
    }
  });
<?php } ?>
  jQuery(document).on('submit', 'form[name="cart_quantity"]', function() {
    if (jQuery.browser.msie && parseInt(jQuery.browser.version) <= 7) {
      // ie6 not supported
      return true;
    } else {
    <?php if (AC_PROCESSING_STATUS == 'true') { ?>
      blockPage();
    <?php } ?>
    <?php if ($_SERVER['HTTPS'] == "on") $requestType = 'SSL'; else $requestType = 'NONSSL'; ?>
      jQuery.post("<?php echo str_replace('&amp;', '&', zen_href_link(FILENAME_SHOPPING_CART, 'action=update_product', $requestType, false)); ?>", jQuery(this).serialize(), function(data) {
        <?php if (AC_SHOPPING_CART_CONTAINER_SELECTOR != '') { ?>
        var ct = jQuery(data).find('<?php echo AC_SHOPPING_CART_CONTAINER_SELECTOR; ?>').children().size();
        <?php } else { ?>
        var ct = 0;
        <?php } ?>
        if (ct < 1 + headerRow) {
          window.location = '<?php echo zen_href_link(FILENAME_SHOPPING_CART, '', ($_SERVER['HTTPS'] == "on" ? 'SSL' : 'NONSSL'), false); ?>';
        }
        <?php if (AC_MESSAGESTACK_SELECTOR != '') { ?>
        var messageStackErrors = jQuery(data).find('<?php echo AC_MESSAGESTACK_SELECTOR; ?>').text();
        if (messageStackErrors && messageStackErrors.length > 0) {
          displayErrors(messageStackErrors);
        }
        <?php } ?>
        <?php if (AC_ORDER_TOTAL_SELECTOR != '') { ?>
        var orderTotal = jQuery(data).find('<?php echo AC_ORDER_TOTAL_SELECTOR; ?>').html();
        if (orderTotal != null) {
          jQuery('<?php echo AC_ORDER_TOTAL_SELECTOR; ?>').html(orderTotal);
        }
        <?php } ?>
        // replace cart totals
        <?php if (!empty($totalsDisplay) && AC_CART_TOTALS_SELECTOR != '') { ?>
        var cartTotals = jQuery(data).find('<?php echo AC_CART_TOTALS_SELECTOR; ?>').html();
        if (cartTotals != null) {
          jQuery("<?php echo AC_CART_TOTALS_SELECTOR; ?>").html(cartTotals); 
        }
        <?php } ?>
        <?php if (SHOW_SHIPPING_ESTIMATOR_BUTTON == '2' && AC_SHIPPING_ESTIMATOR_SELECTOR != '') { ?>
        var estimator = jQuery(data).find('<?php echo AC_SHIPPING_ESTIMATOR_SELECTOR; ?>').html();
        if (estimator != null) {
          jQuery('<?php echo AC_SHIPPING_ESTIMATOR_SELECTOR; ?>').html(estimator);
          update_zone(document.estimator);
        }
        <?php } ?>
        <?php if (AC_SHOPPINGCART_SIDEBOX_SELECTOR != '') { ?>
        var shoppingCartSidebox = jQuery(data).find('<?php echo AC_SHOPPINGCART_SIDEBOX_SELECTOR; ?>').html();
        if (shoppingCartSidebox != null) {
          jQuery('<?php echo AC_SHOPPINGCART_SIDEBOX_SELECTOR; ?>').html(shoppingCartSidebox);
        }          
        <?php } ?>
        <?php if (AC_SHOPPING_CART_CONTAINER_SELECTOR != '') { ?>
        var shopping_cart = jQuery(data).find('<?php echo AC_SHOPPING_CART_CONTAINER_SELECTOR; ?>').html();
        if (shopping_cart != null) {
          jQuery('<?php echo AC_SHOPPING_CART_CONTAINER_SELECTOR; ?>').html(shopping_cart);
        }
        <?php } ?>
        <?php if (AC_SHOPPINGCART_HEADER_SELECTOR != '') { ?>
        var shoppingCartHeader = jQuery(data).find('<?php echo AC_SHOPPINGCART_HEADER_SELECTOR; ?>').html();
        if (shoppingCartHeader != null) {
          jQuery('<?php echo AC_SHOPPINGCART_HEADER_SELECTOR; ?>').html(shoppingCartHeader);
        }          
        <?php } ?>
        // begin custom selectors
        <?php 
          if (AC_CUSTOM_SELECTORS != '') {
            $custom_selectors = explode(',', AC_CUSTOM_SELECTORS);
            foreach ($custom_selectors as $custom_selector) {
        ?>
        jQuery('<?php echo trim($custom_selector); ?>').html(jQuery(data).find('<?php echo trim($custom_selector); ?>').html()); 
        <?php
            }
          } 
        ?>
        <?php 
          if (AC_CALLBACK != '') {
            echo "\n" . AC_CALLBACK . "\n";
          } 
        ?>
          
      });
      return false;
    }
  });
<?php if (AC_SHOPPING_CART_COUPONS == 'true') { ?>  
  jQuery(document).on('submit', 'form[name=coupon]', function() {
    if (jQuery.browser.msie && parseInt(jQuery.browser.version) <= 7) {
      // ie6 not supported
      return true;
    } else {
      <?php if (AC_PROCESSING_STATUS == 'true') { ?>
      blockPage();
      <?php } ?>
      jQuery.post("<?php echo zen_href_link(FILENAME_SHOPPING_CART, '', ($_SERVER['HTTPS'] == "on" ? 'SSL' : 'NONSSL')); ?>", jQuery(this).serialize(), function(data) {
        <?php if (AC_MESSAGESTACK_SELECTOR != '') { ?>
        var messageStackErrors = jQuery(data).find('<?php echo AC_MESSAGESTACK_SELECTOR; ?>').text();
        if (messageStackErrors && messageStackErrors.length > 0) {
          displayErrors(messageStackErrors);
        }
        <?php } ?>
        <?php if (AC_ORDER_TOTAL_SELECTOR != '') { ?>
        var orderTotal = jQuery(data).find('<?php echo AC_ORDER_TOTAL_SELECTOR; ?>').html();
        if (orderTotal != null) {
          jQuery('<?php echo AC_ORDER_TOTAL_SELECTOR; ?>').html(orderTotal);
        }
        <?php } ?>
        <?php if (SHOW_SHIPPING_ESTIMATOR_BUTTON == '2' && AC_SHIPPING_ESTIMATOR_SELECTOR != '') { ?>
        var estimator = jQuery(data).find('<?php echo AC_SHIPPING_ESTIMATOR_SELECTOR; ?>').html();
        if (estimator != null) {
          jQuery('<?php echo AC_SHIPPING_ESTIMATOR_SELECTOR; ?>').html(estimator);
          update_zone(document.estimator);
        }
        <?php } ?>
        // begin custom selectors
        <?php 
          if (AC_CUSTOM_SELECTORS != '') {
            $custom_selectors = explode(',', AC_CUSTOM_SELECTORS);
            foreach ($custom_selectors as $custom_selector) {
        ?>
        jQuery('<?php echo trim($custom_selector); ?>').html(jQuery(data).find('<?php echo trim($custom_selector); ?>').html()); 
        <?php
            }
          } 
        ?>
      });
      return false;
    }    
  });
<?php } ?>
<?php if (SHOW_SHIPPING_ESTIMATOR_BUTTON == '2') { ?>  
  jQuery(document).on('submit', 'form[name=estimator]', function() {
    if (jQuery.browser.msie && parseInt(jQuery.browser.version) <= 7) {
      // ie6 not supported
      return true;
    } else {
      blockPage();
      jQuery.post("<?php echo zen_href_link(FILENAME_AJAX_ESTIMATOR, '', ($_SERVER['HTTPS'] == "on" ? 'SSL' : 'NONSSL')); ?>", jQuery(this).serialize(), function(data) {
        <?php if (SHOW_SHIPPING_ESTIMATOR_BUTTON == '2' && AC_SHIPPING_ESTIMATOR_SELECTOR != '') { ?>
        var estimator = data; 
        jQuery('<?php echo AC_SHIPPING_ESTIMATOR_SELECTOR; ?>').replaceWith(estimator);
        update_zone(document.estimator);
        <?php } ?>        
      });
      /*
      jQuery.get("<?php echo str_replace('&amp;', '&', zen_href_link(FILENAME_SHOPPING_CART, 'action=update_product', $requestType, false)); ?>", function(data) {
        <?php if (AC_ORDER_TOTAL_SELECTOR != '') { ?>
        var orderTotal = jQuery(data).find('<?php echo AC_ORDER_TOTAL_SELECTOR; ?>').html();
        if (orderTotal != null) {
          jQuery('<?php echo AC_ORDER_TOTAL_SELECTOR; ?>').html(orderTotal);
        }
        <?php } ?>      
      });
      */
      return false;
    }
  });
<?php } ?>
  jQuery(document).on('click', '.cta', function() {
    if (jQuery(this).siblings('.hidden').is(':hidden')) {
      jQuery(this).siblings('.hidden').show();
    } else {
      jQuery(this).siblings('.hidden').hide();
    }
    return false;
  });
});

function displayErrors(messageStackErrors) {
  alert(messageStackErrors);
}

function blockPage() {
  jQuery.blockUI({
    message: '<?php echo addslashes(AC_PROCESSING_TEXT); ?>', 
    css: { 
      border: 'none', 
      padding: '15px', 
      backgroundColor: '<?php echo AC_MESSAGE_BACKGROUND_COLOR; ?>', 
      '-webkit-border-radius': '10px', 
      '-moz-border-radius': '10px', 
      opacity: '<?php echo AC_MESSAGE_OPACITY; ?>', 
      color: '<?php echo AC_MESSAGE_TEXT_COLOR; ?>' 
    },
    overlayCSS: { 
      backgroundColor: '<?php echo AC_MESSAGE_OVERLAY_COLOR; ?>',
      color: '<?php echo AC_MESSAGE_OVERLAY_TEXT_COLOR; ?>',
      opacity: '<?php echo AC_MESSAGE_OVERLAY_OPACITY; ?>'
    } 
  });
}
//-->
</script>
<?php } ?>
