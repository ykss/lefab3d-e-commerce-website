<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=create_account.<br />
 * Displays Create Account form.
 *
 * @package templateSystem
 * @copyright Copyright 2003-2012 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version GIT: $Id: Author: DrByte  Sun Aug 19 09:47:29 2012 -0400 Modified in v1.5.1 $
 */
?>

<?php if ($messageStack->size('create_account') > 0) echo $messageStack->output('create_account'); ?>


<div class="col-left">
	<div id="billing-address-wrapper" class="login-details-wrapper">
		
		<h2><?php echo CATEGORY_PERSONAL; ?></h2>
		
		<div class="container">
			
			<?php
			  	if (ACCOUNT_GENDER == 'true') {
			?>
				<div class="field-gender">
					<?php echo zen_draw_radio_field('gender', 'm', '', 'id="gender-male"') . '<label class="radioButtonLabel" for="gender-male">' . MALE . '</label>' . zen_draw_radio_field('gender', 'f', '', 'id="gender-female"') . '<label class="radioButtonLabel" for="gender-female">' . FEMALE . '</label>' . (zen_not_null(ENTRY_GENDER_TEXT) ? '<span class="alert">' . ENTRY_GENDER_TEXT . '</span>': ''); ?>
				</div>
			<?php
			  }
			?>

			<label class="inputLabel" for="firstname"><?php echo ENTRY_FIRST_NAME; ?> <?php echo (zen_not_null(ENTRY_FIRST_NAME_TEXT) ? '<span class="alert">' . ENTRY_FIRST_NAME_TEXT . '</span>': '');?></label>
			<?php echo zen_draw_input_field('firstname', '', zen_set_field_length(TABLE_CUSTOMERS, 'customers_firstname', '40') . ' id="firstname"'); ?>
			<?php if ($messageStack->size('first_name') > 0) echo $messageStack->output('first_name'); ?>

			<label class="inputLabel" for="lastname"><?php echo ENTRY_LAST_NAME; ?> <?php echo (zen_not_null(ENTRY_LAST_NAME_TEXT) ? '<span class="alert">' . ENTRY_LAST_NAME_TEXT . '</span>': ''); ?></label>
			<?php echo zen_draw_input_field('lastname', '', zen_set_field_length(TABLE_CUSTOMERS, 'customers_lastname', '40') . ' id="lastname"'); ?>
			
			<?php if ($messageStack->size('last_name') > 0) echo $messageStack->output('last_name'); ?>
			
			<?php if (ACCOUNT_COMPANY == 'true') { ?>
				<label class="inputLabel" for="company"><?php echo ENTRY_COMPANY; ?> <?php echo (zen_not_null(ENTRY_COMPANY_TEXT) ? '<span class="alert">' . ENTRY_COMPANY_TEXT . '</span>': '');?></label>
				<?php echo zen_draw_input_field('company', '', zen_set_field_length(TABLE_ADDRESS_BOOK, 'entry_company', '40') . ' id="company"'); ?>
				<?php if ($messageStack->size('company_error') > 0) echo $messageStack->output('company_error'); ?>
			<?php } ?>
		
			<label class="inputLabel" for="street-address"><?php echo ENTRY_STREET_ADDRESS; ?> <?php echo (zen_not_null(ENTRY_STREET_ADDRESS_TEXT) ? '<span class="alert">' . ENTRY_STREET_ADDRESS_TEXT . '</span>': ''); ?></label>
			<?php echo zen_draw_input_field('street_address', '', zen_set_field_length(TABLE_ADDRESS_BOOK, 'entry_street_address', '40') . ' id="street-address"'); ?>
			<?php if ($messageStack->size('street_address') > 0) echo $messageStack->output('street_address'); ?>
			<?php echo zen_draw_input_field('should_be_empty', '', ' size="40" id="CAAS" style="visibility:hidden; display:none;" autocomplete="off"'); ?>
			
			<?php
			  if (ACCOUNT_SUBURB == 'true') {
			?>
				<label class="inputLabel" for="suburb"><?php echo ENTRY_SUBURB; ?> <?php echo (zen_not_null(ENTRY_SUBURB_TEXT) ? '<span class="alert">' . ENTRY_SUBURB_TEXT . '</span>': '');?></label>
				<?php echo zen_draw_input_field('suburb', '', zen_set_field_length(TABLE_ADDRESS_BOOK, 'entry_suburb', '40') . ' id="suburb"'); ?>
			<?php
			  }
			?>
			
			<label class="inputLabel" for="country"><?php echo ENTRY_COUNTRY; ?> <?php echo (zen_not_null(ENTRY_COUNTRY_TEXT) ? '<span class="alert">' . ENTRY_COUNTRY_TEXT . '</span>': ''); ?></label>
			<?php echo zen_get_country_list('zone_country_id', $selected_country, 'id="country" ' . ($flag_show_pulldown_states == true ? 'onchange="update_zone(this.form);"' : '')); ?>
			<?php if ($messageStack->size('country_error') > 0) echo $messageStack->output('country_error'); ?>
			<?php
			  if (ACCOUNT_STATE == 'true') {
			    if ($flag_show_pulldown_states == true) {
			?>
			<label class="inputLabel" for="stateZone" id="zoneLabel"><?php echo ENTRY_STATE; ?> <?php if (zen_not_null(ENTRY_STATE_TEXT)) echo '&nbsp;<span class="alert">' . ENTRY_STATE_TEXT . '</span>'; ?></label>
			<?php
			      echo zen_draw_pull_down_menu('zone_id', zen_prepare_country_zones_pull_down($selected_country), $zone_id, 'id="stateZone"');
			      
			    }
			?>
		
			<?php if ($flag_show_pulldown_states == true) { ?>
			<?php } ?>
			<label class="inputLabel" for="state" id="stateLabel"><?php echo $state_field_label; ?> <?php if (zen_not_null(ENTRY_STATE_TEXT)) echo '<span class="alert" id="stText">' . ENTRY_STATE_TEXT . '</span>'; ?></label>
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
			<?php if ($messageStack->size('state') > 0) echo $messageStack->output('state'); ?>
			<label class="inputLabel" for="city"><?php echo ENTRY_CITY; ?> <?php echo (zen_not_null(ENTRY_CITY_TEXT) ? '<span class="alert">' . ENTRY_CITY_TEXT . '</span>': '');?></label>
			<?php echo zen_draw_input_field('city', '', zen_set_field_length(TABLE_ADDRESS_BOOK, 'entry_city', '40') . ' id="city"') ?>
			<?php if ($messageStack->size('city') > 0) echo $messageStack->output('city'); ?>
			<label class="inputLabel" for="postcode"><?php echo ENTRY_POST_CODE; ?> <?php echo (zen_not_null(ENTRY_POST_CODE_TEXT) ? '<span class="alert">' . ENTRY_POST_CODE_TEXT . '</span>': ''); ?></label>
			<?php echo zen_draw_input_field('postcode', '', zen_set_field_length(TABLE_ADDRESS_BOOK, 'entry_postcode', '40') . ' id="postcode"'); ?>
			<?php if ($messageStack->size('post_code') > 0) echo $messageStack->output('post_code'); ?>
			<label class="inputLabel" for="telephone"><?php echo ENTRY_TELEPHONE_NUMBER; ?> <?php echo (zen_not_null(ENTRY_TELEPHONE_NUMBER_TEXT) ? '<span class="alert">' . ENTRY_TELEPHONE_NUMBER_TEXT . '</span>': ''); ?></label>
			<?php echo zen_draw_input_field('telephone', '', zen_set_field_length(TABLE_CUSTOMERS, 'customers_telephone', '40') . ' id="telephone"'); ?>
			<?php if ($messageStack->size('telephone_number') > 0) echo $messageStack->output('telephone_number'); ?>

			<?php
			  	if (ACCOUNT_FAX_NUMBER == 'true') {
			?>
				<label class="inputLabel" for="fax"><?php echo ENTRY_FAX_NUMBER; ?> <?php echo (zen_not_null(ENTRY_FAX_NUMBER_TEXT) ? '<span class="alert">' . ENTRY_FAX_NUMBER_TEXT . '</span>': ''); ?></label>
				<?php echo zen_draw_input_field('fax', '', 'id="fax"'); ?>
			<?php
			  }
			?>

		</div>
	
	</div><!--EOF #billing-address-wrapper-->
	
</div><!--EOF .col-left-->


<div class="col-right">
	<div class="login-details-wrapper">
		<h2><?php echo TABLE_HEADING_LOGIN_DETAILS; ?></h2>
		<div class="container">
			<label class="inputLabel" for="email-address"><?php echo ENTRY_EMAIL_ADDRESS; ?> <?php echo (zen_not_null(ENTRY_EMAIL_ADDRESS_TEXT) ? '<span class="alert">' . ENTRY_EMAIL_ADDRESS_TEXT . '</span>': ''); ?></label>
			<?php echo zen_draw_input_field('email_address', '', zen_set_field_length(TABLE_CUSTOMERS, 'customers_email_address', '40') . ' id="email-address"'); ?>
			<?php if ($messageStack->size('email_address') > 0) echo $messageStack->output('email_address'); ?>
			<label class="inputLabel" for="password-new"><?php echo ENTRY_PASSWORD; ?> <?php echo (zen_not_null(ENTRY_PASSWORD_TEXT) ? '<span class="alert">' . ENTRY_PASSWORD_TEXT . '</span>': ''); ?></label>
			<?php echo zen_draw_password_field('password', '', zen_set_field_length(TABLE_CUSTOMERS, 'customers_password', '20') . ' id="password-new"'); ?>
			<?php if ($messageStack->size('password') > 0) echo $messageStack->output('password'); ?>
			<label class="inputLabel" for="password-confirm"><?php echo ENTRY_PASSWORD_CONFIRMATION; ?> <?php echo (zen_not_null(ENTRY_PASSWORD_CONFIRMATION_TEXT) ? '<span class="alert">' . ENTRY_PASSWORD_CONFIRMATION_TEXT . '</span>': ''); ?></label>
			<?php echo zen_draw_password_field('confirmation', '', zen_set_field_length(TABLE_CUSTOMERS, 'customers_password', '20') . ' id="password-confirm"'); ?>
			<?php if ($messageStack->size('password_confirmation') > 0) echo $messageStack->output('password_confirmation'); ?>
		</div>
	</div><!--EOF #login-details-wrapper-->

	<?php
  		if (ACCOUNT_DOB == 'true') {
	?>
	<div class="login-details-wrapper">
		<h2><?php echo TABLE_HEADING_DATE_OF_BIRTH; ?></h2>
		<div class="container">
			<label class="inputLabel" for="dob"><?php echo ENTRY_DATE_OF_BIRTH; ?> <?php echo (zen_not_null(ENTRY_DATE_OF_BIRTH_TEXT) ? '<span class="alert">' . ENTRY_DATE_OF_BIRTH_TEXT . '</span>': ''); ?></label></label>
			<?php echo zen_draw_input_field('dob','', 'id="dob"'); ?>	
		</div>
	</div>
	<?php
	  	}
	?>
	
	<div id="communication-preferences-wrapper" class="login-details-wrapper">
		<h2><?php echo ENTRY_EMAIL_PREFERENCE; ?></h2>
		<div class="container">
			<div id="subscribe-wrapper">
				<?php
				  if (ACCOUNT_NEWSLETTER_STATUS != 0) {
				?>
					<?php echo zen_draw_checkbox_field('newsletter', '1', $newsletter, 'id="newsletter-checkbox"') . '<label class="checkboxLabel" for="newsletter-checkbox">' . ENTRY_NEWSLETTER . '</label>' . (zen_not_null(ENTRY_NEWSLETTER_TEXT) ? '<span class="alert">' . ENTRY_NEWSLETTER_TEXT . '</span>': ''); ?>
				<?php } ?>
			</div><!--EOF #subscribe-wrapper-->
			<?php echo zen_draw_radio_field('email_format', 'HTML', ($email_format == 'HTML' ? true : false),'id="email-format-html"') . '<label class="radioButtonLabel" for="email-format-html">' . ENTRY_EMAIL_HTML_DISPLAY . '</label>' .  zen_draw_radio_field('email_format', 'TEXT', ($email_format == 'TEXT' ? true : false), 'id="email-format-text"') . '<label class="radioButtonLabel" for="email-format-text">' . ENTRY_EMAIL_TEXT_DISPLAY . '</label>'; ?>
		</div>
	</div>

	<?php
	  	if (DISPLAY_PRIVACY_CONDITIONS == 'true') {
	?>
	<div class="login-details-wrapper" id="privacy-conditions">
		<h2><?php echo TABLE_HEADING_PRIVACY_CONDITIONS; ?></h2>
		<div class="information"><?php echo TEXT_PRIVACY_CONDITIONS_DESCRIPTION;?></div>
		<?php echo zen_draw_checkbox_field('privacy_conditions', '1', false, 'id="privacy"');?><label class="checkboxLabel" for="privacy"><?php echo TEXT_PRIVACY_CONDITIONS_CONFIRM;?></label>
	</div>
	<?php
	  	}
	?>
	
	<?php
	  	if (CUSTOMERS_REFERRAL_STATUS == 2) {
	?>
	<div class="login-details-wrapper" id="customer-referral">
		<h2><?php echo TABLE_HEADING_REFERRAL_DETAILS; ?></h2>
		<label class="inputLabel" for="customers_referral"><?php echo ENTRY_CUSTOMERS_REFERRAL; ?></label><?php echo zen_draw_input_field('customers_referral', '', zen_set_field_length(TABLE_CUSTOMERS, 'customers_referral', '15') . ' id="customers_referral"'); ?>
	</div>
	<?php } ?>
