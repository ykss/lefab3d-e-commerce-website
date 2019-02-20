// GLOBAL JAVASCRIPT
var sticky = false;
var widthMin = 1000;
jQuery(document).ajaxStop(function() {
  // only unblock ajax if not final submit, used a selector from fec_confirmation that will most likely always be present on that page
  if (jQuery('#checkoutConfirmDefaultBillingAddress').length == 0) {
    jQuery.unblockUI();
  }
});
jQuery(document).ready(function() {
  
  // BEGIN CHECKOUT WIDE EVETNS 
  if (fecAJAXErrors == 'true') {
    jQuery(document).ajaxError(function(e, xhr, settings, exception) {
      alert('error in: ' + settings.url + ' \n'+'error:\n' + xhr.responseText); 
    });
  }
  
  // initial process
  prepareMessages();
  setConfirmButton();  
  reconfigureSideMenu();
  
  //Toggle Products Class
  jQuery(document).on('click', '.bag-items-expand', function() {
    if (!jQuery(this).hasClass('bag-items-collapse')) {
      expandCart(true);
    } else {
      collapseCart(true);
    } 
  }); 
  
  //Toggle Product Container
  jQuery(document).on('click', '.expand', function() {
    if (jQuery(this).hasClass('activate')) {
      jQuery(this).removeClass('activate');
      jQuery(this).parent().find('.productContainer').slideUp(function() {
        setFixedProductsHeight();
        stickySideMenu();
      });
    } else {
      jQuery(this).addClass('activate');
      jQuery(this).parent().find('.productContainer').slideDown(function() {
        setFixedProductsHeight();
        stickySideMenu();        
      });      
    }
    var allExpanded = true;
    jQuery('.expand').each(function() {
      if (!jQuery(this).hasClass('activate')) {
        allExpanded = false;
        return;
      }
    });
    if (allExpanded == true) {
      jQuery('.expandAll').addClass('active');
      expandProducts = true;
    } else if (jQuery('.expandAll').hasClass('active')) {
      jQuery('.expandAll').removeClass('active');
      expandProducts = false;
    }
    stickySideMenu();
  });
  
  //Toggle Expand All
  jQuery(document).on('click', '.expandAll', function(){
    if (jQuery(this).hasClass('active')) {
      collapseAllProducts(true); 
    } else {
      expandAllProducts(true); 
    }
  });
  
  if (fecRemoveCheckout != '') {  
    // remove products from checkout
    jQuery(document).on('click', 'a.removeProduct', function() {
      blockPage();
      if (jQuery('a.removeProduct').size() == 1) {
        return true;
      } else {
        var link = jQuery(this).attr('href');
        // remove the product from the cart
        jQuery.get(link, function() {
          // get the order total
          jQuery.get(fecQuickCheckoutURL + '&request=ajax', function(data) {
            var shopBagWrapper = jQuery(data).find('#shopBagWrapper').html();
            jQuery('#shopBagWrapper').html(shopBagWrapper);
            var bagItemsLabel = jQuery(data).find('#bag-items-label').html();
            jQuery('#bag-items-label').html(bagItemsLabel);
            //reconfigureSideMenu();
            var shippingMethods = jQuery(data).find('#shippingMethods').html();
            jQuery('#shippingMethods').html(shippingMethods);
            if (fecRefreshPayment == 'true') {
              var paymentMethodContainer = jQuery(data).find('#paymentMethodContainer').html();
              jQuery('#paymentMethodContainer').html(paymentMethodContainer);
            }            
            var discountsContainer = jQuery(data).find('#discountsContainer').html();
            jQuery('#discountsContainer').html(discountsContainer);
            fecRemoveCheckoutRefreshSelectors(data);
            if (jQuery('#hideRegistration').length > 0 || jQuery('#easyLogin').length > 0) {
              if (jQuery('#hideRegistration').attr('display') != 'none') {
                var step = 1;
              } else if (jQuery('#easyLogin').attr('display') != 'none') {
                var step = 2;
              }              
              var fecLeft = jQuery(data).find('#fecLeft').html();
              jQuery('#fecLeft').html(fecLeft);
              switch(step) {
                case 1:
                  jQuery('#easyLogin').hide();
                  break;
                case 2:
                  jQuery('#hideRegistration').hide();
                  break;
              }
            }
            showHideShippingInfo(); 
            showHideDiscounts();
            displayCreditUpdate();
            qcGoogleAnalytics('qc_remove_product');
          });
        });
        // remove the item
        jQuery(this).parents('.product').remove();
        return false;
      }
    });
  }
  
  jQuery(document).on('click', '.orderStep a, .fecHead a', function() {
    blockPage();
    var orderStepURL = jQuery(this).attr('href');
    jQuery.get(orderStepURL, function(data) {
      // login check
      jQuery.get('ajax/login_check.php', function(loginCheck) {
        if (parseInt(loginCheck) == 1) {
          // step 3           
        } else {
          // step 1 or 2 
          var step = orderStepURL.match(/step=([0-9]+)/)[1];
          switch(step) {
            case '1':
              var quickCheckout = jQuery(data).find('#quickCheckout').html();
              fecLoginRegistrationRefreshSelectors(data);
              jQuery('#quickCheckout').replaceWith('<div id="quickCheckout" class="centerColumn">' + quickCheckout + '</div>');
              jQuery('#easyLogin').hide(function() {
                if (fecHideRegistration) {
                  reconfigureLogin();
                }
                reconfigureSideMenu();
              });            
              break;
            case '2':
              var quickCheckout = jQuery(data).find('#quickCheckout').html();
              fecLoginRegistrationRefreshSelectors(data);
              jQuery('#quickCheckout').replaceWith('<div id="quickCheckout" class="centerColumn">' + quickCheckout + '</div>');
              jQuery('#hideRegistration').hide(function() {
                if (fecHideRegistration) {
                  reconfigureLogin();
                }
                reconfigureSideMenu();                
              });            
              break;
            default:
              // reload the checkout
              window.location.replace(fecQuickCheckoutURL); 
          }          
        }
      });
    });
    return false;
  });
    
  // END CHECKOUT WIDE EVENTS
  // BEGIN NOT LOGGED IN EVENTS
  // get the URL parameters
  // use:
  // queryParameters['paramaterName'] = 'value';
  // location.search = jQuery.param(queryParameters);
  /*
  var queryParameters = {}, queryString = location.search.substring(1), re = /([^&=]+)=([^&]*)/g, m;

  while (m = re.exec(queryString)) {
    queryParameters[decodeURIComponent(m[1])] = decodeURIComponent(m[2]);
  }
  */
  if (fecHideRegistration) {
    reconfigureLogin();
  }    
  // login
  jQuery(document).on('submit', 'form[name="login"]', function() {
    jQuery('#quickCheckout input').css('border-color', '');
    jQuery('#quickCheckout .validation').remove();
    jQuery('.missing').removeClass('missing');
    jQuery('.disablejAlert').remove();
    jQuery('div#shippingAddressContainer').unblock();
    blockPage();
    if (jQuery('input[name="email_address"]').val() != '' && jQuery('input[name="password"]').val() != '') {
      jQuery.post(jQuery(this).attr('action'), jQuery(this).serialize(), function(data) {
        // check if logged in
        jQuery.get('ajax/login_check.php', function(loginCheck) {
          if (parseInt(loginCheck) == 1) {
            var quickCheckout = jQuery(data).find('#quickCheckout').html();
            jQuery('#quickCheckout').html(quickCheckout);
            reconfigureSideMenu();
            showHideDiscounts();
            showHideShippingInfo();
            displayCreditUpdate();
            scrollToWelcome();
            setConfirmButton();
            jQuery.unblockUI();            
          } else {
            var qc_login = jQuery(data).find('#qc_login').html();
            jQuery('#qc_login').html(qc_login);
            reconfigureLogin();
          }
        });
        fecLoginRegistrationRefreshSelectors(data);         
      });
    } else {
      if (jQuery('input[name="email_address"]').val() == '') {
        jQuery('input[name="email_address"]').addClass('missing');
      }
      if (jQuery('input[name="password"]').val() == '') {
        jQuery('input[name="password"]').addClass('missing');
      }
      jQuery('input[name="password"]').after('<div class="disablejAlert loginError">' + fecLoginValidationErrorMessage + '</div>');
      jQuery.unblockUI();
    }
    return false;
  });  
  
  // registration
  jQuery(document).on('submit', 'form[name="create_account"]', function() {
    jQuery('div#shippingAddressContainer').unblock();
    blockPage();
    jQuery('[name=create_account] *').removeClass('missing');
    jQuery('[name=create_account] .validation').remove();
    if (check_form_registration("create_account")) {
      jQuery.post(jQuery(this).attr('action'), jQuery(this).serialize(), function(data) {
        // check if logged in
        jQuery.get('ajax/login_check.php', function(loginCheck) {
          if (parseInt(loginCheck) == 1) {
            var quickCheckout = jQuery(data).find('#quickCheckout').html();
            jQuery('#quickCheckout').html(quickCheckout);
            reconfigureSideMenu();
            showHideDiscounts();
            showHideShippingInfo();
            displayCreditUpdate();
            scrollToWelcome();
            setConfirmButton()          
            jQuery.unblockUI();            
          } else {
            var easyLogin = jQuery(data).find('#easyLogin').html();
            jQuery('#easyLogin').html(easyLogin);
            reconfigureLogin(); 
          }
        });
        fecLoginRegistrationRefreshSelectors(data);         
      });
    } else {
      jQuery.unblockUI();
      reconfigureLogin();
      return false;
    }
    return false;
  });
  
  if (fecHideRegistrationStatus == 'true' && fecGuestAccountOnly == 'false') {
    jQuery(document).on('submit', 'form[name="hideregistration_register"]', function() {
      jQuery.history.load("hideregistration_register");
      jQuery('#hideRegistration input').css('border-color', '');
      jQuery('#hideRegistration .validation').remove();
      jQuery('.missing').removeClass('missing');
      jQuery('.disablejAlert').remove();      
      jQuery('input[name="cowoa"]').val("false");
      // begin validation
      var error = false;
      var email_address_register = jQuery('form[name="hideregistration_register"] input[name="hide_email_address_register"]').val();
      if (!email_address_register.length > 0 || email_address_register.search(/@/) == -1 || email_address_register.search(/\./) == -1) {
        error = true;
        jQuery('form[name="hideregistration_register"] input[name="hide_email_address_register"]').addClass('missing');
        // add message next to label
        jQuery('form[name="hideregistration_register"] input[name="hide_email_address_register"]').after('<div class="disablejAlert alert validation">&nbsp;invalid email</div>'); 
      }
      if (fecConfirmEmail == 'true') {
        var hide_email_address_confirm = jQuery('form[name="hideregistration_register"] input[name="hide_email_address_confirm"]').val();
        if (!hide_email_address_confirm.length > 0 || hide_email_address_confirm.search(/@/) == -1 || hide_email_address_confirm.search(/\./) == -1) {
          error = true;
          jQuery('form[name="hideregistration_register"] input[name="hide_email_address_confirm"]').addClass('missing');
          // add message next to label
          jQuery('form[name="hideregistration_register"] input[name="hide_email_address_confirm"]').after('<div class="disablejAlert alert validation">&nbsp;invalid email</div>');
        }
        if (email_address_register.length > 0 && hide_email_address_confirm.length > 0 && email_address_register != hide_email_address_confirm) {
          error = true;
          jQuery('form[name="hideregistration_register"] input[name="hide_email_address_register"]').addClass('missing');
          jQuery('form[name="hideregistration_register"] input[name="hide_email_address_confirm"]').addClass('missing');
          // add message next to label
          jQuery('form[name="hideregistration_register"] input[name="hide_email_address_confirm"]').after('<div class="disablejAlert alert validation">&nbsp;email mismatch</div>');
        }
      }
      var hide_password_register = jQuery('form[name="hideregistration_register"] input[name="hide_password_register"]').val();
      if (hide_password_register.length < fecPasswordMinLength) {
        error = true;
        jQuery('form[name="hideregistration_register"] input[name="hide_password_register"]').addClass('missing');
      }
      var hide_password_confirmation = jQuery('form[name="hideregistration_register"] input[name="hide_password_confirmation"]').val();
      if (hide_password_confirmation.length < fecPasswordMinLength) {
        error = true;
        jQuery('form[name="hideregistration_register"] input[name="hide_password_register"]').addClass('missing');
        // add message next to label
        jQuery('form[name="hideregistration_register"] input[name="hide_password_register"]').after('<div class="disablejAlert alert validation">&nbsp;invalid password</div>');
      }
      if (hide_password_register.length >= fecPasswordMinLength && hide_password_confirmation.length >= fecPasswordMinLength && hide_password_register != hide_password_confirmation) {
        error = true;
        jQuery('form[name="hideregistration_register"] input[name="hide_password_register"]').addClass('missing');
        jQuery('form[name="hideregistration_register"] input[name="hide_password_confirmation"]').addClass('missing');
        // add message next to label
        jQuery('form[name="hideregistration_register"] input[name="hide_password_confirmation"]').after('<div class="disablejAlert alert validation">&nbsp;password mismatch</div>');
      }
      if (!error) {
        jQuery.post('ajax/account_check.php', jQuery('[name="hideregistration_register"]').serialize(), function(data) {
          if (data == '1') {
            // display jAlert message
            jAlert(fecEntryEmailAddressErrorExists);
          } else {
            if (fecConfirmEmail == 'true') {
              var email_address_confirm = jQuery('form[name="hideregistration_register"] input[name="hide_email_address_confirm"]').val();
            }
            var password_register = jQuery('form[name="hideregistration_register"] input[name="hide_password_register"]').val();
            var password_confirmation = jQuery('form[name="hideregistration_register"] input[name="hide_password_confirmation"]').val();
            jQuery('div#hideRegistration').hide(function() {
              jQuery('div#easyLogin').show();
              jQuery('div#easyLogin').css('visibility', 'visible');
              stickySideMenu();
              jQuery('form[name="create_account"] input[name="email_address_register"]').val(email_address_register);
              if (fecConfirmEmail == 'true') {
                jQuery('form[name="create_account"] input[name="email_address_confirm"]').val(email_address_confirm);
              }
              jQuery('form[name="create_account"] input[name="password_register"]').val(password_register);
              jQuery('form[name="create_account"] input[name="password_confirmation"]').val(password_confirmation);
            });
            if (fecOrderSteps == 'true') {
              jQuery.get(fecQuickCheckoutURL + '&hideregistration=true', function(data) {
                updateOrderSteps(data);
              });
            }
          }
        });
      } else {
        jQuery('input[name="hide_password_confirmation"]').after('<div class="disablejAlert loginError">' + fecLoginValidationErrorMessage + '</div>');
        window.location.hash = '';
      }
      qcGoogleAnalytics('qc_hideregistration_register');
      return false;  
    });
    jQuery(document).on('submit', 'form[name="hideregistration_guest"]', function() {
      jQuery.history.load("hideregistration_guest");
      jQuery('#hideRegistration input').css('border-color', '');
      jQuery('#hideRegistration .validation').remove();
      jQuery('input[name="cowoa"]').val("true");
      // begin validation
      var error = false;
      if (!error) {
        jQuery('div#hideRegistration').fadeOut('fast', function() {
          jQuery('div#easyLogin').fadeIn();
          jQuery('div#easyLogin').css('visibility', 'visible');
          //reconfigureLogin('true');
          stickySideMenu();
        });
        if (fecOrderSteps == 'true') {
          jQuery.get(fecQuickCheckoutURL + '&hideregistration=true', function(data) {
            updateOrderSteps(data);
          });
        }
        scrollToRegistration();
      }
      qcGoogleAnalytics('qc_hideregistration_guest');
      return false;
    });
    jQuery(document).on('click', '#hideregistrationBack a', function() {
      if (jQuery('div#hideRegistration').length > 0) {
        window.location.hash = '';
        jQuery('div#easyLogin').fadeOut('fast', function() {
          jQuery('div#hideRegistration').fadeIn();
          stickySideMenu();
          if (fecOrderSteps == 'true') {
            jQuery.get(fecQuickCheckoutURL, function(data) {
              updateOrderSteps(data);
            });
          }
        });
        return false;
      } else {
        return true;
      }
    });
  } 

  jQuery(document).on('click', '#shippingAddress-checkbox', function() {
    // clear all message stack errors
    clearMessages();
    if(jQuery(this).is(':checked')) {
      jQuery('#shippingField').fadeOut(function() {
        stickySideMenu();
      });
    } else {
      jQuery('#shippingField').fadeIn(function() {
        stickySideMenu();
      });
    }
  });
  /*
  jQuery(document).on('click', '#shippingField .blockMsg', function() {
    // clear all message stack errors
    clearMessages();
    jQuery('div#shippingField').unblock();
    jQuery('#shippingAddress-checkbox').attr('checked', false);
  });
  */
  if (fecGuestAccountStatus == 'true') {  
    if (fecGuestFieldType == 'button') {
      // hide cowoa field
      jQuery(document).on('click', '#no_account_switch a', function() {
        // clear all message stack errors
        clearMessages();

        jQuery('div#passwordField').fadeOut();
        if (fecGuestHideEmail == 'true') {
          jQuery('div#emailOptions').fadeOut();
        }
        jQuery('div#cowoaOff').fadeOut('fast', function() {
          //jQuery('div#cowoaSwitch').html(regular_checkout);
          jQuery('div#cowoaOn').fadeIn();
        });
        jQuery('input[name=cowoa]').val('true');
        return false;
      });
      
      //show cowoa field
      jQuery(document).on('click', '#register_switch a', function() {
        // clear all message stack errors
        clearMessages();
        jQuery('div#passwordField').fadeIn();
        if (fecGuestHideEmail == 'true') { 
          jQuery('div#emailOptions').fadeIn();
        }
        jQuery('div#cowoaOn').fadeOut('fast', function() {
          //jQuery('div#cowoaSwitch').html(cowoa_checkout);
          jQuery('div#cowoaOff').fadeIn();
        });
        jQuery('input[name=cowoa]').val('false');
        return false;
      });
    } else if (fecGuestFieldType == 'checkbox') {
      // CHECKBOX METHOD
      // unhide checkbox
      jQuery(document).on('click', 'input#cowoa-checkbox', function() {
        // clear all message stack errors
        clearMessages();
        if(jQuery(this).is(':checked')) {
          jQuery('div#passwordField').fadeOut();
          if (fecGuestHideEmail == 'true') {
            jQuery('div#emailOptions').fadeOut();
          }
          jQuery('input[name=cowoa]').val('true');
        } else {
          jQuery('div#passwordField').fadeIn();
          if (fecGuestHideEmail == 'true') {
            jQuery('div#emailOptions').fadeIn();
          }
          jQuery('input[name=cowoa]').val('false');
        }
      });
    } else if (fecGuestFieldType == 'radio') {
      // RADIO METHOD
      jQuery(document).on('change', 'input[name=cowoa-radio]', function() {
        // clear all message stack errors
        clearMessages();
        if(jQuery('input[name=cowoa-radio]:checked').val() == 'on') {
          jQuery('div#passwordField').fadeOut();
          if (fecGuestHideEmail == 'true') {
            jQuery('div#emailOptions').fadeOut();
          }
          jQuery('input[name=cowoa]').val('true');
        } else {
          jQuery('div#passwordField').fadeIn();
          if (fecGuestHideEmail == 'true') {
            jQuery('div#emailOptions').fadeIn();
          }
          jQuery('input[name=cowoa]').val('false');
        }
      });
    }
  }
  jQuery('#forgottenPasswordLink a').fancybox({
    autoSize    : true,
    closeClick  : true,
    openEffect  : 'elastic',
    closeEffect : 'elastic',
    closeClick  : false,
    type        : 'ajax'
  });  
  // END NOT LOGGED IN EVENTS
  // BEGIN LOGGED IN EVENTS
  jQuery(document).on('click', '#submitButtonContainer', function() {
    blockPage();
    submitFunction(parseFloat(fecZenUserHasGVAccount), parseFloat(fecTotalOrder));
    if (check_payment_form("checkout_payment")) {
      if (fecAJAXConfirmStatus == 'false') {
        return true;
      }
      if (jQuery('[name="dc_redeem_code"]').length > 0) { // mod is enabled
        if (jQuery('[name="dc_redeem_code"]').val().length > 0) {
          updateCredit();
          return false;
        } else {
          return submitCheckout();
        }
      } else {
        return submitCheckout();
      }
    } else {
      jQuery.unblockUI();
      return false;
    }
  });
  
  // keypress equivalent for update credit module
  jQuery(document).on('keypress', '.discount input', function(e) {
    if (e.keyCode == 13) {
      updateCredit();
      return false;
    }
  });
  jQuery(document).on('click', '.updateButton', function() {
    updateCredit();
  });
  jQuery(document).on('click', '.gvRemove', function() {
    jQuery('input[name="cot_gv"]').val(0);
    updateCredit();
    //setTimeout(jQuery('#discountFormdisc-ot_gv h2').after('<div class="disablejAlert"><div class="messageStackSuccess">' + fecGVName + ' removed.</div></div>'), 5000);
    return false;
  });
  
  jQuery(document).on('click', '.couponRemove', function() {
    jQuery('input[name="dc_redeem_code"]').val('remove');
    updateCredit();
    return false;
  });

  if (fecCollapseDiscounts == 'true') {
    showHideDiscounts();
    
    jQuery(document).on('click', '.showDiscount', function() {
      jQuery(this).parent('h3').nextAll('.boxContents').slideDown(function() {
        stickySideMenu();
      });
      jQuery(this).addClass('hideDiscount');
      jQuery(this).html('[-]');
      jQuery(this).attr('title', 'Hide Discount Field');
      jQuery(this).removeClass('showDiscount');    
    });
    
    jQuery(document).on('click', '.hideDiscount', function() {
      jQuery(this).parent('h3').nextAll('.boxContents').slideUp(function() {
        stickySideMenu();
      });
      jQuery(this).addClass('showDiscount');
      jQuery(this).html('[+]');
      jQuery(this).attr('title', 'Show Discount Field');
      jQuery(this).removeClass('hideDiscount');    
    });
  } 
  if (fecShippingInfo == 'true') {
    showHideShippingInfo();
    
    // click events     
    jQuery(document).on('click', '.showShippingInfo', function() {
      jQuery(this).parent('h3').next('.shippingInfo').slideDown(function() {
        stickySideMenu();
      });
      jQuery(this).addClass('hideShippingInfo');
      jQuery(this).html('details [-]');
      jQuery(this).attr('title', 'Hide Shipping Info');
      jQuery(this).removeClass('showShippingInfo');    
    });
    
    jQuery(document).on('click', '.hideShippingInfo', function() {
      jQuery(this).parent('h3').next('.shippingInfo').slideUp(function() {
        stickySideMenu();
      });
      jQuery(this).addClass('showShippingInfo');
      jQuery(this).html('details [+]');
      jQuery(this).attr('title', 'Show Shipping Info');
      jQuery(this).removeClass('hideShippingInfo');    
    });
    
    jQuery(document).on('click', '[name="shipping"]', function() {
      jQuery('.shippingInfo').each(function() {
        if (!jQuery(this).siblings('[name="shipping"]').is(':checked')) {
          jQuery(this).hide();
          var hideShippingInfo = jQuery(this).siblings('h3').children('.hideShippingInfo');
          hideShippingInfo.addClass('showShippingInfo');
          hideShippingInfo.html('details [+]');
          hideShippingInfo.attr('title', 'Show Shipping Info');
          hideShippingInfo.removeClass('hideShippingInfo');
        }
      });
      jQuery(this).siblings('.shippingInfo').slideDown(function() {
        stickySideMenu();
      });
      jQuery(this).siblings('h3').children('.showShippingInfo').addClass('hideShippingInfo');
      jQuery(this).siblings('h3').children('.showShippingInfo').html('details [-]');
      jQuery(this).siblings('h3').children('.showShippingInfo').attr('title', 'Hide Shipping Info');
      jQuery(this).siblings('h3').children('.showShippingInfo').removeClass('showShippingInfo');    
    });
  }  
  displayCreditUpdate();
  
  if (jQuery(window).width() > 980) {
    initiateFancyBox('#linkCheckoutShippingAddr');
    initiateFancyBox('#linkCheckoutPaymentAddr');
  } else {
    disableFancyBox('#linkCheckoutShippingAddr');
    disableFancyBox('#linkCheckoutPaymentAddr');
  }
  
  jQuery(document).on('click', '.header-notactive', function() {
    // switch active tab
    jQuery('.header-active').addClass('header-notactive');
    jQuery('.header-active').removeClass('header-active');
    // switch inactive tab    
    jQuery(this).addClass('header-active');
    jQuery(this).removeClass('header-notactive');
    // toggle hidden element
    jQuery('#addressBook').toggle();
    jQuery('#checkoutNewAddress').toggle();
  }); 

  jQuery(document).on('submit', 'form[name="checkout_address"]', function() {
    blockPage();
    // submit the form
    var newAddress = check_new_address('checkout_address');
    if (newAddress) {
      jQuery.post(jQuery('form[name="checkout_address"]').attr('action'), jQuery('form[name="checkout_address"]').serialize(), function() {
        // check if logged in
        jQuery.get('ajax/login_check.php', function(loginCheck) {
          if (parseInt(loginCheck) == 1) {
            jQuery.get(fecQuickCheckoutURL, function(data) {
              var fecAddresses = jQuery(data).find('#fecAddresses').html();
              jQuery('#fecAddresses').html(fecAddresses);
              var shippingMethodContainer = jQuery(data).find('#shippingMethodContainer').html();
              jQuery('#shippingMethodContainer').html(shippingMethodContainer);
              showHideShippingInfo();
              var shopBagWrapper = jQuery(data).find('#shopBagWrapper').html();
              jQuery('#shopBagWrapper').html(shopBagWrapper);
              jQuery.fancybox.close(true);
            });            
          } else {
            // redirect to checkout
            jConfirm('Sorry, your session has expired.', 'Time Out', function(r) {
              window.location.replace(fecQuickCheckoutURL);
            });          
          }
        });
      });
    } else {
      jQuery.unblockUI();
    }
    return false;
  });
    
  // END LOGGED IN EVENTS
});

jQuery(window).resize(function() {
  setFixedProductsHeight();
  stickySideMenu();
  setConfirmButton();
  if (jQuery(window).width() > 980) {
    initiateFancyBox('#linkCheckoutShippingAddr');
    initiateFancyBox('#linkCheckoutPaymentAddr');
  } else {
    disableFancyBox('#linkCheckoutShippingAddr');
    disableFancyBox('#linkCheckoutPaymentAddr');
  }  
});

// Events after the page has completely loaded
jQuery(window).load(function() {
  jQuery.history.init(function(hash){
    if(hash == "hideregistration_guest") {
      // initialize your app
      jQuery('form[name="hideregistration_guest"] .button_continue').click();
    } else if(hash == "hideregistration_register") {
      jQuery('form[name="hideregistration_register"] .button_create_account').click();
    } else {
      // restore the state from hash
      jQuery('#hideregistrationBack a').click();
    } 
  },
  { unescape: ",/" });
  
  scrollToError();
});

function initiateFancyBox(selector) {
  jQuery(selector).fancybox({
    autoSize      : true,
    autoResize    : true,
    autoCenter    : false,
    closeClick    : true,
    openEffect    : 'elastic',
    closeEffect   : 'elastic',
    closeClick    : false,
    type          : 'ajax',
    scrollOutside : false,
    scrolling     : 'auto',
    beforeShow    : function() {
      var theForm = jQuery('[name="checkout_address"]');
      jQuery('[name="checkout_address"]').removeAttr('onsubmit');
      update_zone(theForm[0]);
      fecChangeAddressCallback();
      jQuery('body').css({'overflow-y':'auto'});
      if (jQuery('.header-notactive').length > 0) {
        // initiate tabs
        jQuery('#checkoutNewAddress').hide();
        var notactive = jQuery('.header-notactive').html();
        jQuery('.header-notactive').remove();
        jQuery('.header-active').after('<h2 class="header-notactive">' + notactive + '</h2>');
        jQuery('.header-notactive').css('float', 'right');
        jQuery('.header-active').css('float', 'left');
        jQuery('.header-notactive').after('<br class="clearBoth" />');
      }   
    },
    afterShow     : function() {
      jQuery.fancybox.update();
    }
  });    
}

function disableFancyBox(selector) {
  jQuery(selector).unbind('click.fb-start');
}

function reconfigureSideMenu() {
  // add expand all Button
  if ((!jQuery.browser.msie || jQuery.browser.version > 7)) {
    jQuery('.expand').show();
    jQuery('.bag-items-expand').show();
    //jQuery('.productTitle').css('width', '300px');
    jQuery('#expandAllContainer').html('<div class="forward expandAll">Expand All</div>');
    if (expandProducts) {
      expandAllProducts(false);
    } else {
      collapseAllProducts(false);
    }
    if (hideProducts) {
      collapseCart(false);
    } else {
      expandCart(false);
    }
    stickySideMenu(); 
  } 
}

function expandCart (useAnimation) {
  if (useAnimation) {
    jQuery('#cartProducts').slideDown(function() {
      setFixedProductsHeight();
      stickySideMenu();
    });
  } else {
    jQuery('#cartProducts').show(function() {
      setFixedProductsHeight();
      stickySideMenu();
    });    
  }
  hideProducts = false;
  jQuery('.bag-items-expand').addClass('bag-items-collapse');
  jQuery('#expandAllContainer').show();  
  jQuery('#bo-wrapper').show()
}

function collapseCart (useAnimation) {
  if (useAnimation) {
    jQuery('#cartProducts').slideUp(function() {
      setFixedProductsHeight();
      stickySideMenu();
    });
  } else {
    jQuery('#cartProducts').hide(function() {
      setFixedProductsHeight();
      stickySideMenu();
    });      
  }
  hideProducts = true;
  jQuery('.bag-items-expand').removeClass('bag-items-collapse');
  jQuery('#expandAllContainer').hide();  
  jQuery('#bo-wrapper').hide()
}

function expandAllProducts(useAnimation) {
  jQuery('.productContainer').each(function() {
    if (useAnimation) {
      jQuery(this).slideDown();
    } else {
      jQuery(this).show();
    }
  }).promise().done(function() { // wait til the first function is complete
    setFixedProductsHeight();
    stickySideMenu();    
  });
  jQuery('.expandAll').addClass('active').html("Collapse All");
  jQuery('.expand').addClass('activate');
  expandProducts = true;   
}

function collapseAllProducts(useAnimation) {  
  jQuery('.productContainer').each(function() {
    if (useAnimation) {
      jQuery(this).slideUp();
    } else {
      jQuery(this).hide();
    }
  }).promise().done(function() { // wait til the first function is complete
    setFixedProductsHeight();
    stickySideMenu();    
  });
  jQuery('.expandAll').removeClass('active').html("Expand All");
  jQuery('.expand').removeClass('activate');
  expandProducts = false;  
}

function setFixedProductsHeight() {
  var windowHeight = jQuery(window).height();
  var cartProductsHeight = jQuery('#cartProducts').height();
  var cartProductsScrollHeight = jQuery('#cartProducts')[0].scrollHeight;
  var fecRightHeight = jQuery('#fecRight').outerHeight(true);
  var productsHeight = jQuery('#cartProducts').outerHeight();
  var remainingfecRightHeight = fecRightHeight - productsHeight;
  var newProductsHeight = windowHeight - remainingfecRightHeight;
  if (newProductsHeight < 228) newProductsHeight = 228;
  //alert(fecRightHeight + ' >= ' + windowHeight);
  //alert(cartProductsHeight + ' = ' + jQuery('#cartProducts').css('max-height'));
  if (cartProductsHeight != jQuery('#cartProducts').css('max-height') && (fecRightHeight + cartProductsScrollHeight - cartProductsHeight) >= windowHeight) {
    jQuery('#cartProducts').css({
      'max-height' : newProductsHeight + 'px',
      'overflow-x' : 'visible',
      'overflow-y' : 'auto'
    });
  } else {
    jQuery('#cartProducts').css({
      'max-height' : 'none',
      'overflow-x' : 'visible',
      'overflow-y' : 'visible'
    });
  }
}

function stickySideMenu() {
  // only enable for desktop devices
  //if(jQuery(window).width() >= 1000 && (!jQuery.browser.msie || jQuery.browser.version > 7)) {
  if(!isTouchDevice() && (!jQuery.browser.msie || jQuery.browser.version > 7)) {
    if (sticky != false) {
      sticky.destroy();
    }
    // only exceute if side menu is smaller than left column
    var fecLeftHeight = jQuery('#fecLeft').outerHeight();
    var fecRightHeight = jQuery('#fecRight').outerHeight();
    var rightPosition = jQuery('#fecRight').position().top + jQuery('#fecRight').height();
    var leftPosition = jQuery('#fecLeft').position().top + jQuery('#fecLeft').height();    
    if (fecLeftHeight > fecRightHeight) {
      sticky = jQuery('#quickCheckout').stickem();
      var stickemLeft = jQuery('#fecLeft').outerWidth(true) + jQuery('#fecLeft').offset().left;
      //var stickemLeft = jQuery('#fecRight').offset().left;
      jQuery('.stickem').css('left', stickemLeft);
      if(rightPosition >= leftPosition) {
        jQuery('#fecRight').removeClass('stickit');
        jQuery('#fecRight').addClass('stickit-end');
      }            
    }
  }    
}

function blockPage() {
  jQuery.blockUI({
    message: fecProcessingText, 
    css: { 
      border: 'none', 
      padding: '15px', 
      backgroundColor: fecMessageBackground, 
      '-webkit-border-radius': '10px', 
      '-moz-border-radius': '10px', 
      opacity: fecMessageOpacity, 
      color: fecMessageTextColor 
    },
    overlayCSS: { 
      backgroundColor: fecMessageOverlayColor,
      color: fecMessageOverlayTextColor,
      opacity: fecMessageOverlayOpacity
    } 
  });
}

function isTouchDevice() {
  if (navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPod/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/webOS/i)) {
    return true;
  } else {
    return false;
  }
}

function updateOrderSteps(data) {
  if (fecOrderSteps == 'true') {
    var orderSteps = jQuery(data).find('.orderSteps').html();
    jQuery('.orderSteps').html(orderSteps);
  } else {
    return false;
  }
}  
function qcGoogleAnalytics(pageName) {
  if (fecGAEnabled == 'true') {
    switch(fecGAMethod) {
      case 'asynchronous':
        _gaq.push(['_trackPageview', fecCatalogFolder + pageName]);
        break;
      default:
        pageTracker._trackPageview(fecCatalogFolder + pageName);
        break;
    }
  }
}

function prepareMessages() {
  if (jQuery('.messageStackError').length > 0 || jQuery('.messageStackCaution').length > 0 || jQuery('.messageStackSuccess').length > 0 || jQuery('.messageStackWarning').length > 0) {
    var messageStackErrors = '';
    jQuery('.messageStackError, .messageStackCaution, .messageStackSuccess, .messageStackWarning').each(function() {
      if (!jQuery(this).parents().hasClass('disablejAlert')) {
        messageStackErrors += jQuery(this).text();
      }
    });
    // update messageStack only
    if (messageStackErrors != '') {
      displayErrors(messageStackErrors);
    }
    return true;
  } else {
    return false;
  }
}

function displayErrors(messageStackErrors) {
  if (messageStackErrors.length > 1) {
    jAlert(messageStackErrors);
  }
}

function clearMessages() {
  jQuery('.messageStackError, .messageStackCaution, .messageStackSuccess').each(function() {
    jQuery(this).remove();
  });
}

// Convert HTML breaks to newline
String.prototype.br2nl =
function() {
  return this.replace(/<br\s*\/?>/mg,"\n");
};

function reconfigureLogin() { // note: cowoaStatus removed, but checks still left in case we need them in the future
  update_zone(document.create_account);
  if (fecShippingAddress == 'true') {
    update_zone_shipping(document.create_account);
  }
  if (fecShippingAddressStatus == true) {
    blockShippingField();
  }
  if (fecShippingAddressCheck != true || (fecGetContentType == 'virtual')) {
    blockShippingContainer();
  }
  if (fecGuestAccountStatus == 'true') {
    if (fecGuestFieldType == 'button') {
      /*
      if (cowoaStatus == 'true') {
        jQuery('div#passwordField').hide();
        if (fecGuestHideEmail == 'true') {
          jQuery('div#emailOptions').hide();
        }
        jQuery('div#cowoaOn').hide(function() {
          jQuery('div#cowoaOff').show();
        });
        jQuery('input[name=cowoa]').val('true');
      } else if (cowoaStatus == 'false') {
        jQuery('div#passwordField').show();
        if (fecGuestHideEmail == 'true') {
          jQuery('div#emailOptions').show();
        }
        jQuery('div#cowoaOff').hide(function() {
          jQuery('div#cowoaOn').show();
        });
        jQuery('input[name=cowoa]').val('false');
      }
      */
    } else if (fecGuestFieldType == 'checkbox') {
      // CHECKBOX METHOD
      // unhide checkbox
      jQuery('input#cowoa-checkbox').removeClass("hiddenField"); 
      /*
      if (cowoaStatus == 'true') {
        jQuery('div#passwordField').hide();
        if (fecGuestHideEmail == 'true') {
          jQuery('div#emailOptions').hide();
        }
        jQuery('div#cowoaOn').hide(function() {
          //jQuery('div#cowoaSwitch').html(regular_checkout);
          jQuery('div#cowoaOff').show();
        });
        jQuery('input[name=cowoa]').val('true');
        if (fecType != 'cowoa') {
          // make sure checkbox is checked
          jQuery('#cowoa-checkbox').attr("checked", true);
        } 
      } else if (cowoaStatus == 'false') {
        jQuery('div#passwordField').show();
        if (fecGuestHideEmail == 'true') {
          jQuery('div#emailOptions').show();
        }
        jQuery('input[name=cowoa]').val('false');
        if (fecType == 'cowoa') {
          // make sure checkbox is unchecked
          jQuery('#cowoa-checkbox').attr("checked", false);
        }    
      }
      */
    } else if (fecGuestFieldType == 'radio') {
      // RADIO METHOD
      jQuery('input[name=cowoa-radio]').removeClass("hiddenField");
      /*
      if (cowoaStatus == 'true') {
        jQuery('div#passwordField').hide();
        if (fecGuestHideEmail == 'true') { 
          jQuery('div#emailOptions').hide();
        }      
        jQuery('input[name=cowoa]').val('true');
        if (fecType != 'cowoa') {
          // make sure on is checked
          jQuery('#cowoa-radio-off').attr("checked", false);
          jQuery('#cowoa-radio-on').attr("checked", true);
        }
      } else if (cowoaStatus == 'false') {
        jQuery('div#passwordField').show();
        if (fecGuestHideEmail == 'true') { 
          jQuery('div#emailOptions').show();
        }
        jQuery('input[name=cowoa]').val('false');
          if (fecType == 'cowoa') {
          // make sure off is checked
          jQuery('#cowoa-radio-off').attr("checked", true);
          jQuery('#cowoa-radio-on').attr("checked", false); 
        }
      }
      */
    }
    // disable the links created for non-JavaScript users since JavaScript is enabled
    jQuery(".disableLink").each(function() {
      var linkContents = jQuery(this).contents();
      jQuery(this).replaceWith(linkContents);
    });
  } // end COWOA check ?>
  reconfigureSideMenu();
}
// blocking functions
function blockShippingField() {
  if (jQuery('#shippingAddress-checkbox').is(':checked')) {          
    jQuery('div#shippingField').hide();
  }
}

function blockShippingField() {
  if (jQuery('#shippingAddress-checkbox').is(':checked')) {          
    jQuery('div#shippingField').hide();
  }
}

function blockShippingContainer() {
  jQuery('div#shippingAddressContainer').hide();
}

function updateForm() {
  blockPage();
  // clear all message stack errors
  clearMessages();
  jQuery.get('ajax/login_check.php', function(loginCheck) {
    if (parseInt(loginCheck) == 1) {
      jQuery.post(fecQuickCheckoutURL, jQuery("[name=checkout_payment]").serialize() + "&fecaction=process&request=ajax", function(data) {
        failCheck(data);
        var shopBagWrapper = jQuery(data).find('#shopBagWrapper').html();
        jQuery('#shopBagWrapper').html(shopBagWrapper);
        //reconfigureSideMenu();
        var discountsContainer = jQuery(data).find('#discountsContainer').html();
        jQuery('#discountsContainer').html(discountsContainer);
        if (fecRefreshPayment == 'true') {
          var paymentMethodContainer = jQuery(data).find('#paymentMethodContainer').html();
          jQuery('#paymentMethodContainer').html(paymentMethodContainer);
        }
        showHideDiscounts();
        jQuery.unblockUI();
        displayCreditUpdate();
        qcGoogleAnalytics('qc_update');
      });           
    } else {
      // redirect to checkout
      jConfirm('Sorry, your session has expired.', 'Time Out', function(r) {
        window.location.replace(fecQuickCheckoutURL);
      });
    }
  }); 
}

function updateCredit() {
  blockPage();
  // clear all message stack errors
  clearMessages();
  jQuery.get('ajax/login_check.php', function(loginCheck) {
    if (parseInt(loginCheck) == 1) {
      jQuery.post(fecQuickCheckoutURL, jQuery("[name=checkout_payment]").serialize() + "&fecaction=updateCredit&request=ajax", function(data) {
      //jQuery.post('ajax/update_credit.php', jQuery("[name=checkout_payment]").serialize() + "&fecaction=updateCredit&request=ajax", function(data) {
        failCheck(data);
        var shopBagWrapper = jQuery(data).find('#shopBagWrapper').html();
        var discountsContainer = jQuery(data).find('#discountsContainer').html();
        jQuery('#shopBagWrapper').html(shopBagWrapper);
        //reconfigureSideMenu();
        jQuery('#discountsContainer').html(discountsContainer);
        // get the current order total
        jQuery.post('ajax/order_total.php', jQuery("[name=checkout_payment]").serialize(), function(orderTotalCheck) {
          if (orderTotalCheck == 0 || (jQuery('#paymentMethodContainer').length > 0 && !jQuery('#paymentMethodContainer').html().trim())) {
            // order total is zero, refresh the payment methods which should mean no payment is required
            var paymentMethodContainer = jQuery(data).find('#paymentMethodContainer').html();
            jQuery('#paymentMethodContainer').html(paymentMethodContainer);
          } else if (!jQuery('#paymentMethodContainer').length > 0) {
            // we need to reload the page
            window.location.replace(fecQuickCheckoutURL);
          }          
        });        
        showHideDiscounts();
        jQuery.unblockUI();
        displayCreditUpdate();
        // display message stack errors
        prepareMessages();
        // if credit box includes an error message, display expanded
        jQuery('#discountsContainer .discount').each(function() {
          if (jQuery(this).children('.boxContents').children('.disablejAlert').length > 0) {
            jQuery(this).children('h3').children('.showDiscount').click();
          }
        });
        qcGoogleAnalytics('qc_credit');
      });
    } else {
      // redirect to checkout
      jAlert('Sorry, your session has expired.');
      window.location.replace(fecQuickCheckoutURL);
    }
  }); 
}

// display the credit class update button if it exists
function displayCreditUpdate() {
  if (jQuery(".updateButton").length > 0) {
    jQuery(".updateButton").removeAttr("style");
  }
}

function submitCheckout() {
  if ((fecOnePageStatus == 'true') && (jQuery(window).width() >= widthMin)) {
    var onePageStatus = true;
  } else {
    return true;
  }
  if (fecAJAXConfirmStatus == 'false') {
    if (jQuery('textarea[name="comments"]').val().length > 0) {
      return true; // in case comments field has special characters, do not use AJAX post if AJAX status is false
    }
  }
  // clear validation errors
  jQuery('.validation').remove();
  jQuery('.missing').removeClass('missing');
  jQuery.get('ajax/login_check.php', function(loginCheck) {
    if (parseInt(loginCheck) == 1) {
      jQuery.post(fecQCConfirmURL, jQuery("[name=checkout_payment]").serialize() + '&request=ajax', function(data) {
        failCheckConfirmation(jQuery(data).find('#quickCheckoutContent').html());
        jQuery('div#quickCheckout').html('<div id="quickCheckoutContent">' + jQuery(data).find('#quickCheckoutContent').html() + '</div>');
        fecCheckoutSubmitCallback();
        var messagesExist = prepareMessages();
        if (!messagesExist) {
          if (onePageStatus == true) {
            jQuery('div#quickCheckout').css('visibility', 'hidden');
            jQuery('[name="checkout_confirmation"]').submit();
            return false;
          } else {
            jQuery.unblockUI();
            return false;
          }
        } else {
          showHideDiscounts();
          showHideShippingInfo();
          displayCreditUpdate();
          scrollToError();
        }
        qcGoogleAnalytics('qc_confirmation');
      });           
    } else {
      // redirect to checkout
      jConfirm('Sorry, your session has expired.', 'Time Out', function(r) {
        window.location.replace(fecQuickCheckoutURL);
      });
    }
  });
  return false;
}

function scrollToWelcome() {
  if (jQuery("#fecWelcome").length > 0) {
    jQuery('html, body').animate({
      scrollTop: jQuery("#fecWelcome").offset().top
    }, 1000);
  }  
}

function scrollToError() {
  if (jQuery('.disablejAlert').length > 0) {
    // scroll to top error message
    jQuery('html, body').animate({
      scrollTop: jQuery(".disablejAlert:first").offset().top
    }, 1000);
  }  
}

function scrollToRegistration() {
  if (jQuery('h2.current').length > 0) {
    jQuery('html, body').animate({
      scrollTop: jQuery("h2.current").offset().top
    }, 1000);    
  }
}

function showHideDiscounts() {
  if (fecCollapseDiscounts != 'true') {
    return false;
  }
  jQuery('.discount h3').each(function() {
    var boxTitle = jQuery(this).text();
    jQuery(this).append('<span class="forward showDiscount" title="Show ' + boxTitle + '">[+]</span>');
  });   
  jQuery('.discount .boxContents').hide(function() {
    stickySideMenu();
  });
}

function showHideShippingInfo() {
  if (fecShippingInfo != 'true') {
    return false;
  }
  if (jQuery('.shippingInfo').prev('h3 span.showShippingInfo').length == 0) {
    jQuery('.shippingInfo').prev('h3').append('<span class="forward showShippingInfo" title="View Shipping Info">details [+]</span>');
  }
  jQuery('.shippingInfo').each(function() {
    var thisShippingInput = jQuery(this).nextAll('input[name="shipping"]');
    if (thisShippingInput.is(':checked')) {
      jQuery(this).show();
      thisShippingInput.prevAll('h3').children('span:first-child').addClass('hideShippingInfo');
      thisShippingInput.prevAll('h3').children('span:first-child').html('details [-]');
      thisShippingInput.prevAll('h3').children('span:first-child').attr('title', 'Hide Shipping Info');
      thisShippingInput.prevAll('h3').children('span:first-child').removeClass('showShippingInfo');      
    } else {
      jQuery(this).hide();
    }    
  }).promise().done(function() { // wait til the first function is complete
    stickySideMenu();    
  });
}

function setConfirmButton() {
  if (jQuery('#submitButtonContainer .button_confirm').length > 0 && jQuery(window).width() < widthMin) {
    jQuery('#submitButtonContainer .button_confirm').addClass('button_continue');
    jQuery('#submitButtonContainer .button_confirm').removeClass('button_confirm');
    jQuery('#submitButtonContainer .button_continue').val('Continue Checkout');
    jQuery('#submitButtonContainer .button_continue').attr('onmouseout', "this.className='cssButton button_continue'");
    jQuery('#submitButtonContainer .button_continue').attr('onmouseover', "this.className='cssButtonHover button_continue button_continueHover'");
  } else if (jQuery('#submitButtonContainer .button_continue').length > 0 && jQuery(window).width() >= widthMin) {
    jQuery('#submitButtonContainer .button_continue').addClass('button_confirm');
    jQuery('#submitButtonContainer .button_continue').removeClass('button_continue');
    jQuery('#submitButtonContainer .button_confirm').val('Confirm Order');
    jQuery('#submitButtonContainer .button_confirm').attr('onmouseout', "this.className='cssButton button_confirm'");
    jQuery('#submitButtonContainer .button_confirm').attr('onmouseover', "this.className='cssButtonHover button_confirm button_confirmHover'");    
  }
}

function failCheck(data) {
  if (data.length == 0) {
    window.location.replace(fecQuickCheckoutURL);
  }
}

function failCheckConfirmation(data) {
  if (data == null || data.length == 0) {
    jQuery('form[name="checkout_payment"]').submit();
  }
}
