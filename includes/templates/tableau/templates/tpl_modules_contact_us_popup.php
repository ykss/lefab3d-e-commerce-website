<div style="display: none;">
	<div id="contact-us-popup-wrapper">
		<div id="contact-us-popup-headline-wrapper">
				<h2><?php echo HEADING_CONTACT_US_POPUP_TITLE; ?></h2>
				<h3><?php echo HEADING_CONTACT_US_POPUP_SUBTITLE; ?></h3>
			<div class="clearBoth"></div>
		</div><!--EOF #contact-us-headline-->
		<?php echo zen_draw_form('contact_us', zen_href_link(FILENAME_CONTACT_US, 'action=send', ($_SERVER['HTTPS'] == 'on' ? 'SSL' : 'NONSSL'))); ?>
		<div class="contact-us-popup-content-wrapper">
			<?php echo zen_draw_input_field('contactname', $name, ' size="40" id="contactname-2" placeholder="'. HEADING_CONTACT_US_FULL_NAME .'"'); ?>
			<?php echo zen_draw_input_field('email', ($email_address), ' size="40" id="email-address-2" placeholder="'. HEADING_CONTACT_US_EMAIL .'"'); ?>
			<?php echo zen_draw_textarea_field('enquiry', '30', '7', $enquiry, 'id="enquiry-2" placeholder="'. HEADING_CONTACT_US_MESSAGE .'"'); ?>
		</div>
		<?php echo zen_draw_input_field('should_be_empty', '', ' size="40" id="CUAS-2" style="visibility:hidden; display:none;" autocomplete="off"'); ?>
		<div class="clearBoth"></div>
		<div class="contact-us-popup-wrapper-button-row">
			<button type="submit" value="<?php echo HEADING_CONTACT_US_SEND_MESSAGE; ?>"><?php echo HEADING_CONTACT_US_SEND_MESSAGE; ?></button>
			<div class="clearBoth"></div>
		</div>
		<div class="clearBoth"></div>
		</form>
		<div class="clearBoth"></div>
	</div>
</div>