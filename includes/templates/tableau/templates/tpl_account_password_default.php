<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=account_password.<br />
 * Allows customer to change their password
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_account_password_default.php 2896 2006-01-26 19:10:56Z birdbrain $
 */
?>
<div class="centerColumn" id="accountPassword">

<h1 class="back"><?php echo HEADING_TITLE; ?></h1>
<div class="required alert forward"><?php echo FORM_REQUIRED_INFORMATION; ?></div> 

<?php require($template->get_template_dir('tpl_modules_account_menu.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_account_menu.php'); ?>


<?php echo zen_draw_form('account_password', zen_href_link(FILENAME_ACCOUNT_PASSWORD, '', 'SSL'), 'post', 'onsubmit="return check_form(account_password);" id="account-password-form"') . zen_draw_hidden_field('action', 'process'); ?>

<?php if ($messageStack->size('account_password') > 0) echo $messageStack->output('account_password'); ?>
	
<?php if ($messageStack->size('current_password') > 0) echo $messageStack->output('current_password'); ?>

<div class="account-info-wrapper">
	
	<label class="inputLabel" for="password-current"><?php echo ENTRY_PASSWORD_CURRENT; ?></label>
	<?php echo zen_draw_password_field('password_current','','id="password-current"') . (zen_not_null(ENTRY_PASSWORD_CURRENT_TEXT) ? '<span class="alert">' . ENTRY_PASSWORD_CURRENT_TEXT . '</span>': ''); ?>
	
	<label class="inputLabel" for="password-new"><?php echo ENTRY_PASSWORD_NEW; ?></label>
	<?php echo zen_draw_password_field('password_new','','id="password-new"') . (zen_not_null(ENTRY_PASSWORD_NEW_TEXT) ? '<span class="alert">' . ENTRY_PASSWORD_NEW_TEXT . '</span>': ''); ?>
	<?php if ($messageStack->size('new_password') > 0) echo $messageStack->output('new_password'); ?>

	
	<label class="inputLabel" for="password-confirm"><?php echo ENTRY_PASSWORD_CONFIRMATION; ?></label>
	<?php echo zen_draw_password_field('password_confirmation','','id="password-confirm"') . (zen_not_null(ENTRY_PASSWORD_CONFIRMATION_TEXT) ? '<span class="alert">' . ENTRY_PASSWORD_CONFIRMATION_TEXT . '</span>': ''); ?>
	<?php if ($messageStack->size('password_not_matching') > 0) echo $messageStack->output('password_not_matching'); ?>
	<div class="clearBoth"></div>
	
	<div class="buttonRow back"><?php echo zen_image_submit(BUTTON_IMAGE_SUBMIT, BUTTON_SUBMIT_ALT); ?></div>

	<div class="clearBoth"></div>
</div><!--EOF .account-info-wrapper-->

</form>
</div>
