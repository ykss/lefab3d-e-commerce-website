<?php
/**
 * Payment Class.
 *
 * @package classes
 * @copyright Copyright 2003-2018 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: mc12345678 Tue May 8 00:42:18 2018 -0400 Modified in v1.5.6 $
 */
if (!defined('IS_ADMIN_FLAG')) {
  die('Illegal Access');
}
/**
 * Payment Class.
 * This class interfaces with various payment modules
 *
 * @package classes
 */
class payment extends base {
  var $modules, $selected_module, $doesCollectsCardDataOnsite;

  // class constructor
  function __construct($module = '') {
    global $PHP_SELF, $language, $credit_covers, $messageStack;
    $this->doesCollectsCardDataOnsite = false;

    if (defined('MODULE_PAYMENT_INSTALLED') && zen_not_null(MODULE_PAYMENT_INSTALLED)) {
      $this->modules = explode(';', MODULE_PAYMENT_INSTALLED);

      $include_modules = array();

      if ( (zen_not_null($module)) && (in_array($module . '.' . substr($PHP_SELF, (strrpos($PHP_SELF, '.')+1)), $this->modules)) ) {
        $this->selected_module = $module;

        $include_modules[] = array('class' => $module, 'file' => $module . '.php');
      } else {

        // Free Payment Only shows
        if (zen_get_configuration_key_value('MODULE_PAYMENT_FREECHARGER_STATUS') and ($_SESSION['cart']->show_total()==0 and (!isset($_SESSION['shipping']['cost']) || $_SESSION['shipping']['cost'] == 0))) {
          $this->selected_module = $module;
          if (file_exists(DIR_FS_CATALOG . DIR_WS_MODULES . '/payment/' . 'freecharger.php')) {
            $include_modules[] = array('class'=> 'freecharger', 'file' => 'freecharger.php');
          }
        } else {
          // All Other Payment Modules show
          foreach($this->modules as $value) {
            // double check that the module really exists before adding to the array
            if (file_exists(DIR_FS_CATALOG . DIR_WS_MODULES . '/payment/' . $value)) {
              $class = substr($value, 0, strrpos($value, '.'));
              // Don't show Free Payment Module
              if ($class !='freecharger') {
                $include_modules[] = array('class' => $class, 'file' => $value);
              }
            }
          }
        }
      }

      for ($i=0, $n=sizeof($include_modules); $i<$n; $i++) {
        //          include(DIR_WS_LANGUAGES . $_SESSION['language'] . '/modules/payment/' . $include_modules[$i]['file']);
        $lang_file = zen_get_file_directory(DIR_WS_LANGUAGES . $_SESSION['language'] . '/modules/payment/', $include_modules[$i]['file'], 'false');
        if (@file_exists($lang_file)) {
          include_once($lang_file);
        } else {
          if (IS_ADMIN_FLAG === false && is_object($messageStack)) {
            $messageStack->add('checkout_payment', WARNING_COULD_NOT_LOCATE_LANG_FILE . $lang_file, 'caution');
          } else {
            $messageStack->add_session(WARNING_COULD_NOT_LOCATE_LANG_FILE . $lang_file, 'caution');
          }
        }
        include_once(DIR_WS_MODULES . 'payment/' . $include_modules[$i]['file']);

        $this->paymentClass = new $include_modules[$i]['class'];
        $this->notify('NOTIFY_PAYMENT_MODULE_ENABLE');
        if ($this->paymentClass->enabled)
        {
          $GLOBALS[$include_modules[$i]['class']] = $this->paymentClass;
          if (isset($this->paymentClass->collectsCardDataOnsite) && $this->paymentClass->collectsCardDataOnsite == true) {
            $this->doesCollectsCardDataOnsite = true;
          }
        } else {
          unset($include_modules[$i]);
        }
      }
      $include_modules = array_values($include_modules);
      // if there is only one payment method, select it as default because in
      // checkout_confirmation.php the $payment variable is being assigned the
      // $_POST['payment'] value which will be empty (no radio button selection possible)
      if ( (zen_count_payment_modules() == 1) && (!isset($_SESSION['payment']) || (isset($_SESSION['payment']) && !is_object($_SESSION['payment']))) ) {
        if (!isset($credit_covers) || $credit_covers == FALSE) $_SESSION['payment'] = $include_modules[0]['class'];
      }

      if ( (zen_not_null($module)) && (in_array($module, $this->modules)) && (isset($GLOBALS[$module]->form_action_url)) ) {
        $this->form_action_url = $GLOBALS[$module]->form_action_url;
      }
    }
  }

  // class methods
  /* The following method is needed in the checkout_confirmation.php page
  due to a chicken and egg problem with the payment class and order class.
  The payment modules needs the order destination data for the dynamic status
  feature, and the order class needs the payment module title.
  The following method is a work-around to implementing the method in all
  payment modules available which would break the modules in the contributions
  section. This should be looked into again post 2.2.
  */
  function update_status() {
    if (is_array($this->modules)) {
      if (is_object($GLOBALS[$this->selected_module])) {
        if (method_exists($GLOBALS[$this->selected_module], 'update_status')) {
          $GLOBALS[$this->selected_module]->update_status();
        }
      }
    }
  }

  function javascript_validation() {
    $js = '';
    if (is_array($this->modules) && sizeof($this->selection()) > 0) {
      $js = '<script type="text/javascript"><!-- ' . "\n" .
      'function check_form() {' . "\n" .
      '  var error = 0;' . "\n" .
      '  var error_message = "' . JS_ERROR . '";' . "\n" .
      '  var payment_value = null;' . "\n" .
      '  if (document.checkout_payment.payment) {' . "\n" .
      '    if (document.checkout_payment.payment.length) {' . "\n" .
      '      for (var i=0; i<document.checkout_payment.payment.length; i++) {' . "\n" .
      '        if (document.checkout_payment.payment[i].checked) {' . "\n" .
      '          payment_value = document.checkout_payment.payment[i].value;' . "\n" .
      '        }' . "\n" .
      '      }' . "\n" .
      '    } else if (document.checkout_payment.payment.checked) {' . "\n" .
      '      payment_value = document.checkout_payment.payment.value;' . "\n" .
      '    } else if (document.checkout_payment.payment.value) {' . "\n" .
      '      payment_value = document.checkout_payment.payment.value;' . "\n" .
      '    }' . "\n" .
      '  }' . "\n\n";

      foreach($this->modules as $value) {
        $class = substr($value, 0, strrpos($value, '.'));
        if (isset($GLOBALS[$class]->enabled) && $GLOBALS[$class]->enabled == true) {
          $js .= $GLOBALS[$class]->javascript_validation();
        }
      }

       $js =  $js . "\n" . '  if (payment_value == null && submitter != 1) {' . "\n";
       $js =  $js .'    error_message = error_message + "' . JS_ERROR_NO_PAYMENT_MODULE_SELECTED . '";' . "\n";
       $js =  $js .'    error = 1;' . "\n";
       $js =  $js .'  }' . "\n\n";
       $js =  $js .'  if (error == 1 && submitter != 1) {' . "\n";
       $js =  $js .'    alert(error_message);' . "\n";
       $js =  $js . '    return false;' . "\n";
       $js =  $js .'  } else {' . "\n";
       $js =  $js .' var result = true; '  . "\n";
       if ($this->doesCollectsCardDataOnsite == true && PADSS_AJAX_CHECKOUT == '1') {
         $js .= '      result = !(doesCollectsCardDataOnsite(payment_value));' . "\n";
       }
       $js =  $js .' if (result == false) doCollectsCardDataOnsite();' . "\n";
       $js =  $js .'    return result;' . "\n";
       $js =  $js .'  }' . "\n" . '}' . "\n" . '//--></script>' . "\n";
    }
    return $js;
  }

  function selection() {
    $selection_array = array();
    if (is_array($this->modules)) {
      foreach($this->modules as $value) {
        $class = substr($value, 0, strrpos($value, '.'));
        if (isset($GLOBALS[$class]->enabled) && $GLOBALS[$class]->enabled == true) {
          $selection = $GLOBALS[$class]->selection();
          if (isset($GLOBALS[$class]->collectsCardDataOnsite) && $GLOBALS[$class]->collectsCardDataOnsite == true) {
            $selection['fields'][] = array('title' => '',
                                         'field' => zen_draw_hidden_field($class . '_collects_onsite', 'true', 'id="' . $class . '_collects_onsite"'),
                                         'tag' => '');

          }
          if (is_array($selection)) $selection_array[] = $selection;
        }
      }
    }
    return $selection_array;
  }
  function in_special_checkout() {
    $result = false;
    if (is_array($this->modules)) {
      foreach($this->modules as $value) {
        $class = substr($value, 0, strrpos($value, '.'));
        if (isset($GLOBALS[$class]) && is_object($GLOBALS[$class]) && $GLOBALS[$class]->enabled && method_exists($GLOBALS[$class], 'in_special_checkout')) {
          $module_result = $GLOBALS[$class]->in_special_checkout();
          if ($module_result === true) $result = true;
        }
      }
    }
    return $result;
  }

  function pre_confirmation_check() {
    global $credit_covers, $payment_modules;
    if (is_array($this->modules)) {
      if (is_object($GLOBALS[$this->selected_module]) && ($GLOBALS[$this->selected_module]->enabled) ) {
        if ($credit_covers) {
          $GLOBALS[$this->selected_module]->enabled = false;
          $GLOBALS[$this->selected_module] = NULL;
          $payment_modules = '';
        } else {
          $GLOBALS[$this->selected_module]->pre_confirmation_check();
        }
      }
    }
  }

  function confirmation() {
    if (is_array($this->modules)) {
      if (is_object($GLOBALS[$this->selected_module]) && ($GLOBALS[$this->selected_module]->enabled) ) {
        $confirmation = $GLOBALS[$this->selected_module]->confirmation();
        if (!is_array($confirmation)) $confirmation = array('title' => '');
        if (!(isset($confirmation['fields']) && is_array($confirmation['fields']))) $confirmation['fields'] = array();
        if (!isset($confirmation['title'])) $confirmation['title'] = '';
        return $confirmation;
      }
    }
  }

  function process_button_ajax() {
    if (is_array($this->modules)) {
      if (is_object($GLOBALS[$this->selected_module]) && ($GLOBALS[$this->selected_module]->enabled) ) {
        return $GLOBALS[$this->selected_module]->process_button_ajax();
      }
    }
  }
  function process_button() {
    if (is_array($this->modules)) {
      if (is_object($GLOBALS[$this->selected_module]) && ($GLOBALS[$this->selected_module]->enabled) ) {
        return $GLOBALS[$this->selected_module]->process_button();
      }
    }
  }

  function before_process() {
    if (is_array($this->modules)) {
      if (is_object($GLOBALS[$this->selected_module]) && ($GLOBALS[$this->selected_module]->enabled) ) {
        return $GLOBALS[$this->selected_module]->before_process();
      }
    }
  }

  function after_process() {
    if (is_array($this->modules)) {
      if (is_object($GLOBALS[$this->selected_module]) && ($GLOBALS[$this->selected_module]->enabled) ) {
        return $GLOBALS[$this->selected_module]->after_process();
      }
    }
  }

  function after_order_create($zf_order_id) {
    if (is_array($this->modules)) {
      if (is_object($GLOBALS[$this->selected_module]) && ($GLOBALS[$this->selected_module]->enabled) && (method_exists($GLOBALS[$this->selected_module], 'after_order_create'))) {
        return $GLOBALS[$this->selected_module]->after_order_create($zf_order_id);
      }
    }
  }

  function admin_notification($zf_order_id) {
    if (is_array($this->modules)) {
      if (is_object($GLOBALS[$this->selected_module]) && ($GLOBALS[$this->selected_module]->enabled) && (method_exists($GLOBALS[$this->selected_module], 'admin_notification'))) {
        return $GLOBALS[$this->selected_module]->admin_notification($zf_order_id);
      }
    }
  }

  function get_error() {
    if (is_array($this->modules)) {
      if (is_object($GLOBALS[$this->selected_module]) && ($GLOBALS[$this->selected_module]->enabled) ) {
        return $GLOBALS[$this->selected_module]->get_error();
      }
    }
  }

  function get_checkout_confirm_form_replacement() {
    if (is_array($this->modules)) {
      if (is_object($GLOBALS[$this->selected_module]) && ($GLOBALS[$this->selected_module]->enabled) ) {
        if (method_exists($GLOBALS[$this->selected_module], 'get_checkout_confirm_form_replacement')) {
          return $GLOBALS[$this->selected_module]->get_checkout_confirm_form_replacement();
        }
      }
    }
    return array(false, '');
  }
}
