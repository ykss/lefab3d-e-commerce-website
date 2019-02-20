<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=account_newsletters.<br />
 * Subscribe/Unsubscribe from General Newsletter
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_account_newsletters_default.php 2896 2006-01-26 19:10:56Z birdbrain $
 */
?>
<div class="centerColumn" id="acctNewslettersDefault">

	<?php echo zen_draw_form('account_newsletter', zen_href_link(FILENAME_ACCOUNT_NEWSLETTERS, '', 'SSL')) . zen_draw_hidden_field('action', 'process'); ?>
		<h1><?php echo HEADING_TITLE; ?></h1>
		<?php require($template->get_template_dir('tpl_modules_account_menu.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_account_menu.php'); ?>
		
		<div class="account-full-width">
				<div class="col2 back">
					<h3><?php echo MY_NEWSLETTERS_TITLE; ?></h3>
					<div><?php echo zen_draw_radio_field('newsletter_general', 1, $newsletter->fields['customers_newsletter'] == 1 ? true : false); ?> <span><?php echo MY_NEWSLETTERS_OPTION_1 ?></span></div>
					<div><?php echo zen_draw_radio_field('newsletter_general', 0, $newsletter->fields['customers_newsletter'] == 0 ? true : false); ?> <span><?php echo MY_NEWSLETTERS_OPTION_2 ?></span></div>
				</div>
				<div class="col2 back">
					<h3><?php echo MY_EMAIL_PREFERENCES_TITLE; ?></h3>
					<div><?php echo zen_draw_radio_field('email_format', 'HTML', $email_pref_html) . ENTRY_EMAIL_HTML_DISPLAY; ?> </div>
					<div><?php echo zen_draw_radio_field('email_format', 'TEXT', $email_pref_text) . ENTRY_EMAIL_TEXT_DISPLAY ;?></div>
				</div>
				<div class="clearBoth"></div>
				<div class="submit-button"><?php echo zen_image_submit(BUTTON_SUBMIT, BUTTON_SUBMIT_ALT); ?></div>			
		</div><!--EOF .account-full-width-->
		
	
	</form>
	
</div>
