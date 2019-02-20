jQuery(document).ready(function() {
	jQuery("#account-password-form").validate({
		rules: {
			password_current: {
				required: true
			},
			password_new: {
				required: true,
				minlength: 7
			},
			password_confirmation: {
				required: true,
				minlength: 7
			}
		}
	});
});