jQuery(document).ready(function() {
	jQuery("#address_book_process").validate({
		rules: {
			firstname: {
				required: true,
				minlength: 2
			},
			lastname: {
				required: true,
				minlength: 2
			},
			street_address: {
				required: true,
				minlength: 5
			},
			zone_country_id: {
				required: true
			},
			city: {
				required: true,
				minlength: 2,
		        phoneUS: true
			},
			zone_id: {
				required: true
			},
			postcode: {
				required: true,
				minlength: 4
			}
		}
	});
});