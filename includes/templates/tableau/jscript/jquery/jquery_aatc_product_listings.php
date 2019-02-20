<?php if (AATC_STATUS == 'true' && DISPLAY_CART == 'false') { ?> 
<script type="text/javascript">
<!--//
jQuery(document).ready(function() {
  jQuery(document).ajaxStop(jQuery.unblockUI);
  jQuery("form[name=multiple_products_cart_quantity]").submit(function() {
    if (jQuery.browser.msie && parseInt(jQuery.browser.version) <= 7) {
      // ie7 not supported
      return true;
    } else {
      <?php if (AATC_PROCESSING_STATUS == 'true') { ?>
      blockPage();
      <?php } ?>
      var action = jQuery("form[name=multiple_products_cart_quantity]").attr("action");
      jQuery.post(action, jQuery("form[name=multiple_products_cart_quantity]").serialize(), function(data) {
        var messageStackSuccess = jQuery(data).find('.messageStackSuccess').text();
		<?php if (AATC_AJAX_CART_SLIDER == 'true') { ?> 
        getAjaxSliderContent();  
        <?php } ?>
        displayErrors(messageStackSuccess);
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
          if (AATC_CUSTOM_SELECTORS_LISTINGS != '') {
            $custom_selectors = explode(',', AATC_CUSTOM_SELECTORS_LISTINGS);
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
  jQuery("form[name=cart_quantity]").submit(function() {
    if (jQuery.browser.msie && parseInt(jQuery.browser.version) <= 7) {
      // ie6 not supported
      return true;
    } else {
      <?php if (AATC_PROCESSING_STATUS == 'true') { ?>
      blockPage();
      <?php } ?>
      var cart_quantity_form = jQuery(this);
      var action = cart_quantity_form.attr("action");
      jQuery.post(action, cart_quantity_form.serialize(), function(data) {
        var messageStackSuccess = jQuery(data).find('.messageStackSuccess').text();
        <?php if (AATC_AJAX_CART_SLIDER == 'true') { ?> 
        getAjaxSliderContent();  
        <?php } ?>
        displayErrors(messageStackSuccess);
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
          if (AATC_CUSTOM_SELECTORS != '') {
            $custom_selectors = explode(',', AATC_CUSTOM_SELECTORS);
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
