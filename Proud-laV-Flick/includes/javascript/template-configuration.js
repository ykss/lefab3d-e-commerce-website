$(document).ready(function(){

	// Load content into configuration wrapper
	var configurationContent = $('.configuration_content').html();
	$('#configuration-wrapper').append(configurationContent);
	
	// Remove from HTML to sanitize
	$('.configuration_content').remove();
	
	
	// Slide Down on Click
	$('.customize').click(function(){
		 		
	 	$('#configuration-wrapper').slideDown();
		
	});
	
	$('#configuration-wrapper .icon a').click(function(){
		
		$('#configuration-wrapper').slideUp();
		
	});
	
	// Tabs
	
	$(function() {
		$( "#tabs" ).tabs();
	});
	
	// Success Message
	$( ".message-success" ).delay( 3000 ).fadeOut( 400 );
	
	

});