jQuery(function(){
	// Variable to store files
	var files;

	jQuery('input[type=file]').on('change', prepareUpload);

	// Grab the files and set them to our variable
	function prepareUpload(event){
		files = event.target.files;
	}

	// On submit run AJAX request
	jQuery('#updata-temp-form').on('submit', function(e){
		e.preventDefault();
		var data = jQuery('#updata-temp-form').serialize();
		var data = new FormData(this);
		if( files ){
			jQuery.each(files, function(key, value){
				data.append(key, value);
			});
		}
		jQuery.ajax({
			url: "template_update.php",
			type: "POST",
			data: data,
			dataType: 'json',
			processData: false,
			contentType: false,
			success: function( response ) {
				for( var i in response ) {
					jQuery('input[name='+i+']').next('img').attr('src', response[i]);
				}

				jQuery('html, body').animate({
					scrollTop:jQuery('#configuration-wrapper').position().top
				}, 'slow');


				jQuery('.ui-tabs-panel .message').fadeIn().delay(3000).fadeOut();


				
			}
		});
	});



});