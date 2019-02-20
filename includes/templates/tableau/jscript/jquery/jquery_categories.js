jQuery(document).ready(function() {
	
	if(jQuery('.level_2').hasClass('active1')) {
		jQuery('.level_2.active1').parent().show();
		jQuery('.level_2.active1').parent().siblings().addClass('active_level_1');
	} 
	
	jQuery("#btn-back-top").on("click", function(e) {

		// alert(jQuery("#header").offset().top);

		jQuery('body, html').animate({
			scrollTop: "10px"
		}, 1000);

		e.preventDefault();
	});

	$('#recentproducts > div, .sideBoxContentItem, .reviewsContent').find("a:first-child img").wrap('<div class="wrap-image-inner" />');
	$('#recentproducts > div, .sideBoxContentItem, .reviewsContent').find(".wrap-image-inner").wrap('<div class="wrap-image" />');

	/*	
		Created by: Cyro Morais
		Email: cyro.numinix@gmail.com

	 	jQuery to control categories without product 
	*/
	
	// vars
	var 
		$elements = jQuery(".productsContainer").find("li");
		$count = $elements.length;

	$elements.each(function (i) {

		if (!--$count) {
			if (i < 1) {
				formatList(jQuery(this));
			}
		}

	});

});

function formatList(elem) {

	jQuery(".tools-product-listing").hide();

	elem.parent().addClass("no-product");

}
