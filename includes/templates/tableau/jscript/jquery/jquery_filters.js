jQuery(document).ready(function() {
	
	// Toggle Side Boxes

	var sideboxToggle = '<div id="toggle-sidebox-switch" class="collapse-sidebox"></div>';
   var $heading = jQuery( '.leftBoxContaines h3' );
   var $headingCategories = jQuery( '#mycategories h4' );
   var $collapseSidebox = jQuery( '.collapse-sidebox' );
   var expandSidebox = 'expand-sidebox';
   var removePadding = 'remove-padding';
	
	$heading.prepend( sideboxToggle );
	$headingCategories.prepend( sideboxToggle );
	
	$collapseSidebox.on( 'click', function(){
		jQuery(this).toggleClass( expandSidebox )
                  .parent().toggleClass( removePadding )
                  .siblings().slideToggle();
	});


   // TODO: Move this to where it should be (I know it shouldn't be in this file)!
	
	jQuery("#shopping-cart-estimator-link").fancybox({
		maxWidth	: 800,
		maxHeight	: 600,
		fitToView	: false,
		width		: '70%',
		height		: '70%',
		autoSize	: false,
		closeClick	: false,
		openEffect	: 'none',
		closeEffect	: 'none'
	});

});
