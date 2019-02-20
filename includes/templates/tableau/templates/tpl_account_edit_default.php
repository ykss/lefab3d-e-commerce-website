	<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=account_edit.<br />
 * View or change Customer Account Information
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_account_edit_default.php 3848 2006-06-25 20:33:42Z drbyte $
 * @copyright Portions Copyright 2003 osCommerce
 */
?>
<div class="centerColumn" id="accountEditDefault">

<?php echo zen_draw_form('account_edit', zen_href_link(FILENAME_ACCOUNT_EDIT, '', 'SSL'), 'post', 'onsubmit="return check_form(account_edit);" id="account-edit-form"') . zen_draw_hidden_field('action', 'process'); ?>

<h1 class="back"><?php echo HEADING_TITLE; ?></h1>
<div class="required alert forward"><?php echo FORM_REQUIRED_INFORMATION; ?></div>
<?php require($template->get_template_dir('tpl_modules_account_menu.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_account_menu.php'); ?>

<?php if ($messageStack->size('account_edit') > 0) echo $messageStack->output('account_edit'); ?>
	
<div class="account-info-wrapper">
	
	<label class="inputLabel" for="firstname"><?php echo ENTRY_FIRST_NAME; ?> <span class="alert"><?php echo ENTRY_FIRST_NAME_TEXT; ?></span></label>
	<?php echo zen_draw_input_field('firstname', $account->fields['customers_firstname'], 'id="firstname"') . (zen_not_null(ENTRY_FIRST_NAME_TEXT) ? '': ''); ?>
	<?php if ($messageStack->size('first_name') > 0) echo $messageStack->output('first_name'); ?>
	
	<label class="inputLabel" for="lastname"><?php echo ENTRY_LAST_NAME; ?> <span class="alert"><?php echo ENTRY_LAST_NAME_TEXT; ?></span></label>
	<?php echo zen_draw_input_field('lastname', $account->fields['customers_lastname'], 'id="lastname"') . (zen_not_null(ENTRY_LAST_NAME_TEXT) ? '': ''); ?>
	<?php if ($messageStack->size('last_name') > 0) echo $messageStack->output('last_name'); ?>
	
	<label class="inputLabel" for="email-address"><?php echo ENTRY_EMAIL_ADDRESS; ?> <span class="alert"><?php echo ENTRY_EMAIL_ADDRESS_TEXT; ?></span></label>
	<?php echo zen_draw_input_field('email_address', $account->fields['customers_email_address'], 'id="email-address"') . (zen_not_null(ENTRY_EMAIL_ADDRESS_TEXT) ? '': ''); ?>
	<?php if ($messageStack->size('email_address') > 0) echo $messageStack->output('email_address'); ?>
	
	<label class="inputLabel" for="telephone"><?php echo ENTRY_TELEPHONE_NUMBER; ?> <span class="alert"><?php echo ENTRY_TELEPHONE_NUMBER_TEXT; ?></span></label>
	<?php echo zen_draw_input_field('telephone', $account->fields['customers_telephone'], 'id="telephone"') . (zen_not_null(ENTRY_TELEPHONE_NUMBER_TEXT) ? '': ''); ?>
	<?php if ($messageStack->size('phone') > 0) echo $messageStack->output('phone'); ?>
	
	<div class="clearBoth"></div>
	
	<div class="buttonRow back"><?php echo zen_image_submit(BUTTON_IMAGE_UPDATE , BUTTON_UPDATE_ALT); ?></div>
	
	
	<div class="clearBoth"></div>
</div><!--EOF .account-inf-wrapper-->
</form>
</div>