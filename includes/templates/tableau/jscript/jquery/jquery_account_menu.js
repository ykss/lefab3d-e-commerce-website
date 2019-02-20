jQuery(document).ready(function() {
	jQuery(window).resize(function() {
		if (jQuery('#account-menu').is(':visible') && jQuery(window).width() < 861) {
			jQuery('#account-menu').hide();
		}
		if (jQuery('#account-menu').is(':hidden') && jQuery(window).width() > 860) {
			jQuery('#account-menu').show();
		}
	});
	
	jQuery('#mobile-account-menu').click(function() { 
		jQuery('#account-menu').slideToggle();
	});
});