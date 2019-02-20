jQuery(document).ready(function() {
	jQuery('.productSlideInner').jcarousel({
		scroll: 1,
    visible: 1,
    auto: 0,
    wrap: 'circular'
	});
	jQuery('.productSlideInner').touchwipe({
		wipeLeft: function() {
			jQuery('.productSlideInner').jcarousel('next');
		},
		wipeRight: function() {
			jQuery('.productSlideInner').jcarousel('prev');
		},
		min_move_x: 20,
		min_move_y: 20,
		preventDefaultEvents: false
	});
});