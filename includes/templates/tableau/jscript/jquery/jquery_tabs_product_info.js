
jQuery(document).ready(function() {
	$('.accordion, .tabs').TabsAccordion({
	  	responsiveSwitch: 1110,
	  	type: 'tabs'
	});

	$("#productAdditionalImages ul").find("li:nth-child(5n + 1)").addClass("first-in-line");

	$('#alsoPurchased ul').find("li a:first-child img").wrap('<div class="wrap-image-inner" />');
	$('#alsoPurchased ul').find(".wrap-image-inner").wrap('<div class="wrap-image" />');

  	// reviews

  	// global vars

  	$reviews = jQuery("#map-reviews");

  	jQuery("#show-reviews-tab").on("click", function(e) {

  		e.preventDefault();

  		var $this = jQuery(this),
  			$ariaValue = $reviews.attr("aria-expanded");

  		if ($ariaValue !== "true") {
  			$reviews.find("h3[role='tab']").trigger("click");
  			$this.addClass("is-active");

  			// go to Tab
  			goToReviews($reviews.attr("id"));

  		} else {
  			$this.removeClass("is-active");

  			// go to Tab
  			goToReviews($reviews.attr("id"));
  		}

  	});

  	$reviews.find("h3[role='tab']").on("click", function(e) {
  		jQuery("#show-reviews-tab").trigger("click");
  	});
  
});

function goToReviews(reviews) {

	console.log(reviews);

	$reviews = jQuery("#" + reviews);

	setTimeout( 
		function() {
			jQuery('html, body').animate({ scrollTop:  $reviews.offset().top }, 700);
		}, 300
	);

}


