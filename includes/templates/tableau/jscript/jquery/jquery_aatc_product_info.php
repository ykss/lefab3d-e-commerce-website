<?php if (AATC_STATUS == 'true' && DISPLAY_CART == 'false') { ?> 
<script type="text/javascript">
<!--//
jQuery(document).ready(function() {
  jQuery(document).ajaxStop(jQuery.unblockUI);
  jQuery("form[name=cart_quantity]").submit(function() { 
    var submitcontinue = true;
    if (typeof chksel == 'function') {
      submitcontinue = chksel();
    }
    if (submitcontinue) {
      if (jQuery.browser.msie && parseInt(jQuery.browser.version) <= 7) {
        // ie7 not supported
        return true;
      } else {
        <?php if (AATC_PROCESSING_STATUS == 'true') { ?>
        blockPage();
        <?php } ?>
        var action = jQuery(this).attr("action");
        jQuery.post(action, jQuery(this).serialize(), function(data) {
          var messageStackSuccess = jQuery(data).find('.messageStackSuccess').text();
          <?php if (AATC_AJAX_CART_SLIDER == 'true') { ?>
          getAjaxSliderContent(<?php echo AATC_AJAX_CART_SLIDER_AUTO_CLOSE; ?>);
          <?php } ?>
          displayErrors(messageStackSuccess);
          <?php if (AATC_ADD_TO_CART_SELECTOR != '') { // deliberately did not check for "Show quantity in cart" status in case of different product types ?> 
          var cartAdd = jQuery(data).find("<?php echo AATC_ADD_TO_CART_SELECTOR; ?>").html();
          if (cartAdd != null) {
            jQuery("<?php echo AATC_ADD_TO_CART_SELECTOR; ?>").html(cartAdd);
          }
          <?php } ?>
				  
          <?php if (AATC_SHOPPINGCART_SIDEBOX_SELECTOR != '') { ?>
          var shoppingCartSidebox = jQuery(data).find('<?php echo AATC_SHOPPINGCART_SIDEBOX_SELECTOR; ?>').html();
          if (shoppingCartSidebox != null) {
            jQuery('<?php echo AATC_SHOPPINGCART_SIDEBOX_SELECTOR; ?>').html(shoppingCartSidebox);
          }          
          <?php } ?>
          <?php if (AATC_SHOPPINGCART_HEADER_SELECTOR != '') { ?>
          var shoppingCartHeader = jQuery(data).find('<?php echo AATC_SHOPPINGCART_HEADER_SELECTOR; ?>').html();
          if (shoppingCartHeader != null) {
            jQuery('<?php echo AATC_SHOPPINGCART_HEADER_SELECTOR; ?>').html(shoppingCartHeader);
          }          
          <?php } ?>
          // begin custom selectors
          <?php 
            if (AATC_CUSTOM_SELECTORS_PRODUCTS != '') {
              $custom_selectors = explode(',', AATC_CUSTOM_SELECTORS_PRODUCTS);
              foreach ($custom_selectors as $custom_selector) {
          ?>
          jQuery('<?php echo trim($custom_selector); ?>').html(jQuery(data).find('<?php echo trim($custom_selector); ?>').html()); 
          <?php
              }
            } 
          ?>
          <?php 
            if (AATC_CALLBACK != '') {
              echo "\n" . AATC_CALLBACK . "\n";
            } 
          ?>
        });
        return false;
      }
    } else {
      return false;
    }
  });    
  function displayErrors(messageStackErrors) {
    <?php if (AATC_ADD_TO_CART_MESSAGES == 'true') { ?>
    if (messageStackErrors.length > 0) {
      alert(messageStackErrors);
    }
    <?php } ?>
  } 
});

function blockPage() {
  jQuery.blockUI({
    message: '<?php echo addslashes(AATC_ADD_TO_CART_TEXT); ?>', 
    css: { 
      border: 'none', 
      padding: '15px', 
      backgroundColor: '<?php echo AATC_MESSAGE_BACKGROUND_COLOR; ?>', 
      '-webkit-border-radius': '10px', 
      '-moz-border-radius': '10px', 
      opacity: '<?php echo AATC_MESSAGE_OPACITY; ?>', 
      color: '<?php echo AATC_MESSAGE_TEXT_COLOR; ?>' 
    },
    overlayCSS: { 
      backgroundColor: '<?php echo AATC_MESSAGE_OVERLAY_COLOR; ?>',
      color: '<?php echo AATC_MESSAGE_OVERLAY_TEXT_COLOR; ?>',
      opacity: '<?php echo AATC_MESSAGE_OVERLAY_OPACITY; ?>'
    } 
  });
}
//-->
</script>
<?php } ?>