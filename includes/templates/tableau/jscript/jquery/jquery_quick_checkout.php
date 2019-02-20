<script language="javascript" type="text/javascript"><!--//
  var fecAJAXConfirmStatus = '<?php echo FEC_AJAX_CONFIRMATION_STATUS; ?>';
  var fecAJAXErrors = '<?php echo FEC_AJAX_ERRORS; ?>';
  var fecBlockText = '<?php echo FEC_BLOCK_TEXT; ?>';
  var fecCatalogFolder = '<?php echo DIR_WS_CATALOG; ?>';
  var fecChangeAddressPopup = '<?php echo FEC_CHANGE_ADDRESS_POPUP; ?>';
  var fecCollapseDiscounts = '<?php echo FEC_COLLAPSE_DISCOUNTS; ?>';
  var fecConfirmEmail = '<?php echo FEC_CONFIRM_EMAIL; ?>';
  var fecCopyBillingBackgroundColor = '<?php echo FEC_COPYBILLING_BACKGROUND_COLOR; ?>';
  var fecCopyBillingOpacity = '<?php echo FEC_COPYBILLING_OPACITY; ?>';
  var fecCopyBillingTextColor = '<?php echo FEC_COPYBILLING_TEXT_COLOR; ?>';
  var fecEntryEmailAddressErrorExists = '<?php echo ENTRY_EMAIL_ADDRESS_ERROR_EXISTS; ?>';
  var fecGAEnabled = '<?php echo FEC_GA_ENABLED; ?>';
  var fecGAMethod = '<?php echo FEC_GA_METHOD; ?>';
  var fecGetContentType = '<?php echo $_SESSION['cart']->get_content_type(); ?>';
  var fecGuestAccountStatus = '<?php echo FEC_NOACCOUNT_SWITCH; ?>';
  var fecGuestAccountOnly = '<?php echo FEC_NOACCOUNT_ONLY_SWITCH; ?>';
  var fecGuestFieldType = '<?php echo FEC_COWOA_FIELD_TYPE; ?>';
  var fecGuestHideEmail = '<?php echo FEC_NOACCOUNT_HIDEEMAIL; ?>';
  var fecGVName = '<?php echo TEXT_GV_NAME; ?>';
  var fecHideRegistration = '<?php echo ($hideRegistration != 'true' || $_GET['hideregistration'] == 'true'); ?>';
  var fecHideRegistrationStatus = '<?php echo FEC_HIDE_REGISTRATION; ?>';
  var fecNotRequiredBlockText = '<?php echo FEC_NOT_REQUIRED_BLOCK_TEXT; ?>';
  var fecMessageBackground = '<?php echo FEC_MESSAGE_BACKGROUND_COLOR; ?>';
  var fecMessageOpacity = '<?php echo FEC_MESSAGE_OPACITY; ?>';
  var fecMessageOverlayColor = '<?php echo FEC_MESSAGE_OVERLAY_COLOR; ?>';
  var fecMessageOverlayOpacity = '<?php echo FEC_MESSAGE_OVERLAY_OPACITY; ?>';
  var fecMessageOverlayTextColor = '<?php echo FEC_MESSAGE_OVERLAY_TEXT_COLOR; ?>';
  var fecMessageTextColor = '<?php echo FEC_MESSAGE_TEXT_COLOR; ?>';
  var fecOnePageStatus = '<?php echo FEC_ONE_PAGE; ?>';
  var fecOrderSteps = '<?php echo FEC_ORDER_STEPS; ?>';
  var fecPasswordMinLength = '<?php echo ENTRY_PASSWORD_MIN_LENGTH; ?>';
  var fecProcessingText = '<?php echo addslashes(FEC_PROCESSING_TEXT); ?>';
  var fecQCConfirmURL = '<?php echo zen_href_link(FILENAME_QC_CONFIRMATION, '', 'SSL'); ?>';
  var fecQuickCheckoutURL = '<?php echo zen_href_link(FILENAME_QUICK_CHECKOUT, '', 'SSL'); ?>';
  var fecRemoveCheckout = '<?php echo FEC_REMOVE_CHECKOUT; ?>';
  var fecShippingAddress = '<?php echo FEC_SHIPPING_ADDRESS; ?>';
  var fecShippingAddressStatus = '<?php echo $shippingAddress; ?>';
  var fecShippingAddressCheck = '<?php echo $shippingAddressCheck; ?>';
  var fecShippingInfo = '<?php echo FEC_SHIPPING_INFO; ?>';
  var fecTotalOrder = '<?php echo $order->info['total']; ?>';
  var fecType = '<?php echo $_GET['type']; ?>';
  var fecZenUserHasGVAccount = '<?php echo zen_user_has_gv_account($_SESSION['customer_id']) ; ?>';
  var fecRefreshPayment = '<?php echo FEC_REFRESH_PAYMENT; ?>';
  var fecLoginValidationErrorMessage = '<?php echo FEC_LOGIN_VALIDATION_ERROR_MESSAGE; ?>';
  <?php 
    switch(FEC_CHECKOUT_SHOPPING_CART_DISPLAY_DEFAULT) {
      case 'partially expanded':
        echo "var hideProducts = false;\n
              var expandProducts = false;\n";       
        break;
      case 'fully expanded':
        echo "var hideProducts = false;\n
              var expandProducts = true;\n";
        break; 
      case 'collapsed':
      default:
        echo "var hideProducts = true;\n
              var expandProducts = false;\n";
        break;                    
    }
  ?>
  function fecRemoveCheckoutCallback() {
  <?php
    if (FEC_REMOVE_CHECKOUT_REMOVE_CALLBACK != '') {
      echo "\n" . FEC_REMOVE_CHECKOUT_REMOVE_CALLBACK . "\n";
    }
  ?>
  }
  function fecChangeAddressCallback() {
  <?php 
    if (FEC_CHANGE_ADDRESS_CALLBACK != '') {
      echo "\n" . FEC_CHANGE_ADDRESS_CALLBACK . "\n";
    } 
  ?>
  }
  
  function fecRemoveCheckoutRefreshSelectors(data) {
  <?php 
    if (FEC_REMOVE_CHECKOUT_REFRESH_SELECTORS != '') {
      $refresh_selectors = explode(',', FEC_REMOVE_CHECKOUT_REFRESH_SELECTORS);
      foreach ($refresh_selectors as $refresh_selector) {
  ?>
    jQuery('<?php echo trim($refresh_selector); ?>').html(jQuery(data).find('<?php echo trim($refresh_selector); ?>').html());
  <?php 
      } 
  ?>
    fecRemoveCheckoutCallback();  
  <?php
    } 
  ?>
  }
  
  function fecLoginRegistrationRefreshSelectors(data) {
  <?php 
    if (FEC_CHECKOUT_LOGIN_REGISTRATION_REFRESH_SELECTORS != '') {
      $refresh_selectors = explode(',', FEC_CHECKOUT_LOGIN_REGISTRATION_REFRESH_SELECTORS);
      foreach ($refresh_selectors as $refresh_selector) {
  ?>
    jQuery('<?php echo trim($refresh_selector); ?>').html(jQuery(data).find('<?php echo trim($refresh_selector); ?>').html()); 
  <?php
      }
    } 
  ?>      
  }
  
  function fecCheckoutSubmitCallback() {
  <?php
    if (FEC_CHECKOUT_SUBMIT_CALLBACK != '') {
      echo "\n" . FEC_CHECKOUT_SUBMIT_CALLBACK . "\n";
    }
  ?>
  }
//--></script>