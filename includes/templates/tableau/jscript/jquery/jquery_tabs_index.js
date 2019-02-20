jQuery(document).ready(function() {
  // create and process tabs
	jQuery('.tabContent').hide().first().show();

    jQuery('#infoTabs li').bind('click', function(){
		//open when click
		jQuery('#infoTabs li').removeClass('active');
		jQuery(this).addClass('active');
		jQuery('.tabContent').hide();
		jQuery('#' + jQuery(this).attr('id') + 'Content').show();
		jQuery('#' + jQuery(this).attr('id') + 'Content').find("img").each(function(e){
			
			var $img = jQuery(this).attr("data-src");

			jQuery(this).attr("src", $img);
			
		});
	});
});
