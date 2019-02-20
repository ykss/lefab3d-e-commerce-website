<?php
/**
 * Module Template
 *
 * Allows entry of new addresses during checkout stages
 *
 * @package templateSystem
 * @copyright Copyright 2003-2006 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_modules_checkout_new_address.php 3 2012-07-08 21:11:34Z numinix $
 */
?>
<?php if (!$_SESSION['cowoa'] && zen_count_customer_address_book_entries() > 1) { ?><h2 class="header-notactive"><?php echo TITLE_PLEASE_SELECT; ?></h2><?php } ?>
<div id="checkoutNewAddress"<?php echo ($_SESSION['cowoa'] || zen_count_customer_address_book_entries() <= 1 ? ' class="newAddressOnly"' : '')?>>

<div class="alert forward required"><?php echo FORM_REQUIRED_INFORMATION; ?></div>
<div id="newAddressContainer" class="changeAddressFormContainer">
  <div id="addressFields">
    <label class="inputLabel" title="address_title"><?php echo ENTRY_ADDRESS_TITLE; ?></label>
    <?php echo zen_draw_input_field('address_title', '', zen_set_field_length(TABLE_ADDRESS_BOOK, 'address_title', '40') . ' id="address_title"'); ?>
    <br class="clearBoth" />

    <?php
      if (ACCOUNT_GENDER == 'true') {
    ?>
    <?php echo zen_draw_radio_field('gender', 'm', '', 'id="gender-male"') . '<label class="radioButtonLabel" for="gender-male">' . MALE . '</label>' . zen_draw_radio_field('gender', 'f', '', 'id="gender-female"') . '<label class="radioButtonLabel" for="gender-female">' . FEMALE . '</label>' . (zen_not_null(ENTRY_GENDER_TEXT) ? '<span class="alert">' . ENTRY_GENDER_TEXT . '</span>': ''); ?>
    <br class="clearBoth" />
    <?php
      }
    ?>

    <label class="inputLabel" for="firstname"><?php echo ENTRY_FIRST_NAME . (zen_not_null(ENTRY_FIRST_NAME_TEXT) ? '<span class="alert">' . ENTRY_FIRST_NAME_TEXT . '</span>': ''); ?></label>
    <?php echo zen_draw_input_field('firstname', '', zen_set_field_length(TABLE_CUSTOMERS, 'customers_firstname', '40') . ' id="firstname"'); ?>
    <br class="clearBoth" />

    <label class="inputLabel" for="lastname"><?php echo ENTRY_LAST_NAME . (zen_not_null(ENTRY_LAST_NAME_TEXT) ? '<span class="alert">' . ENTRY_LAST_NAME_TEXT . '</span>': ''); ?></label>
    <?php echo zen_draw_input_field('lastname', '', zen_set_field_length(TABLE_CUSTOMERS, 'customers_lastname', '40') . ' id="lastname"'); ?>
    <br class="clearBoth" />


    <?php
      if (ACCOUNT_COMPANY == 'true') {
    ?>
    <label class="inputLabel" for="company"><?php echo ENTRY_COMPANY . (zen_not_null(ENTRY_COMPANY_TEXT) ? '<span class="alert">' . ENTRY_COMPANY_TEXT . '</span>': ''); ?></label>
    <?php echo zen_draw_input_field('company', '', zen_set_field_length(TABLE_ADDRESS_BOOK, 'entry_company', '40') . ' id="company"'); ?>
    <br class="clearBoth" />
    <?php
      }
    ?>

    <label class="inputLabel" for="street-address"><?php echo ENTRY_STREET_ADDRESS . (zen_not_null(ENTRY_STREET_ADDRESS_TEXT) ? '<span class="alert">' . ENTRY_STREET_ADDRESS_TEXT . '</span>': ''); ?></label>
      <?php echo zen_draw_input_field('street_address', '', zen_set_field_length(TABLE_ADDRESS_BOOK, 'entry_street_address', '40') . ' id="street-address"'); ?>
    <br class="clearBoth" />

    <?php
      if (ACCOUNT_SUBURB == 'true') {
    ?>
    <label class="inputLabel" for="suburb"><?php echo ENTRY_SUBURB . (zen_not_null(ENTRY_SUBURB_TEXT) ? '<span class="alert">' . ENTRY_SUBURB_TEXT . '</span>': ''); ?></label>
    <?php echo zen_draw_input_field('suburb', '', zen_set_field_length(TABLE_ADDRESS_BOOK, 'entry_suburb', '40') . ' id="suburb"'); ?>
    <br class="clearBoth" />
    <?php
      }
    ?>

    <label class="inputLabel" for="city"><?php echo ENTRY_CITY . (zen_not_null(ENTRY_CITY_TEXT) ? '<span class="alert">' . ENTRY_CITY_TEXT . '</span>': ''); ?></label>
    <?php echo zen_draw_input_field('city', '', zen_set_field_length(TABLE_ADDRESS_BOOK, 'entry_city', '40') . ' id="city"'); ?>
    <br class="clearBoth" />

    <label class="inputLabel" for="country"><?php echo ENTRY_COUNTRY . (zen_not_null(ENTRY_COUNTRY_TEXT) ? '<span class="alert">' . ENTRY_COUNTRY_TEXT . '</span>': ''); ?></label>
    <?php echo zen_get_country_list('zone_country_id', $selected_country, 'id="country" ' . ($flag_show_pulldown_states == true ? 'onchange="update_zone(this.form);"' : '')); ?>
    <br class="clearBoth" />

    <?php
      if (ACCOUNT_STATE == 'true') {
        if ($flag_show_pulldown_states == true) {
    ?>
    <label class="inputLabel" for="stateZone" id="zoneLabel"><?php echo ENTRY_STATE. (zen_not_null(ENTRY_STATE_TEXT) ? '&nbsp;<span class="alert">' . ENTRY_STATE_TEXT . '</span>' : ''); ?></label>
    <?php
          echo zen_draw_pull_down_menu('zone_id', zen_prepare_country_zones_pull_down($selected_country), $zone_id, 'id="stateZone"'); 
        }
    ?>

    <?php if ($flag_show_pulldown_states == true) { ?>
    <br class="clearBoth" id="stBreak" />
    <?php } ?>
    <label class="inputLabel" for="state" id="stateLabel"><?php echo $state_field_label; ?></label>
    <?php
        echo zen_draw_input_field('state', '', zen_set_field_length(TABLE_ADDRESS_BOOK, 'entry_state', '40') . ' id="state"');
        if ($flag_show_pulldown_states == false) {
          echo zen_draw_hidden_field('zone_id', $zone_name, ' ');
        }
    ?>
    <br class="clearBoth" />
    <?php
      }
    ?>

    <label class="inputLabel" for="postcode"><?php echo ENTRY_POST_CODE . (zen_not_null(ENTRY_POST_CODE_TEXT) ? '<span class="alert">' . ENTRY_POST_CODE_TEXT . '</span>': ''); ?></label>
    <?php echo zen_draw_input_field('postcode', '', zen_set_field_length(TABLE_ADDRESS_BOOK, 'entry_postcode', '40') . ' id="postcode"'); ?>
    <br class="clearBoth" />

    <?php if (ACCOUNT_TELEPHONE == 'true' || ACCOUNT_TELEPHONE_SHIPPING == 'true') { ?>
    <label class="inputLabel" for="telephone"><?php echo ENTRY_TELEPHONE . (zen_not_null(ENTRY_TELEPHONE_TEXT) ? '<span class="alert">' . ENTRY_TELEPHONE_TEXT . '</span>': ''); ?></label>
    <?php echo zen_draw_input_field('telephone', '', zen_set_field_length(TABLE_ADDRESS_BOOK, 'entry_telephone', '40') . ' id="telephone"'); ?>
    <br class="clearBoth" />
    <?php } ?>
  </div>
  <div class="buttonRow"><?php echo zen_draw_hidden_field('action', 'submit') . (FEC_CSS_BUTTONS == 'true' ? zenCssButton(BUTTON_IMAGE_CONTINUE, BUTTON_CONTINUE_ALT, 'submit', 'button_continue') : zen_image_submit(BUTTON_IMAGE_CONTINUE, BUTTON_CONTINUE_ALT)); ?></div>
  <div class="buttonRow back nextstep"><?php echo TITLE_CONTINUE_CHECKOUT_PROCEDURE . '<br /><br />' . TEXT_CONTINUE_CHECKOUT_PROCEDURE; ?></div>
  
<?php
  if ($process == true) {
?>
  <div class="buttonRow back"><?php echo '<a href="' . zen_href_link(FILENAME_CHECKOUT_SHIPPING_ADDRESS, '', 'SSL') . '">' . (FEC_CSS_BUTTONS == 'true' ? zenCssButton(BUTTON_IMAGE_BACK, BUTTON_BACK_ALT, 'button', 'button_back') : zen_image_button(BUTTON_IMAGE_BACK, BUTTON_BACK_ALT)) . '</a>'; ?></div>
<?php
  }
?>

  </div>
</div>