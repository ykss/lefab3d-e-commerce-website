if(navigator.userAgent.indexOf("Mac") > 0) {
	jQuery("html").addClass("mac-os");
} else {
	jQuery("html").addClass("windows");
}

var jPM = '';
jQuery(document).ready(function() {
		
	var $mainNav = "<div class='search-wrapper'>";
	$mainNav += jQuery('#search-wrapper').html();
	$mainNav += "</div>";
	$mainNav += jQuery('#js-nav-menu--container').html();
	$mainNav += "<ul class='account-nav'>";
	$mainNav += jQuery('#account-nav').html();
	$mainNav += "</ul>";
	
	jQuery('#mobile-nav-menu').append($mainNav);
	
	var jPM = $.jPanelMenu({
		menu: '#mobile-nav-menu',
		trigger: '.header-menu',
		openPosition: '285px',
		keyboardShortcuts: false,
		duration: 10
	});
	
	jPM.on();
	jQuery('.jPanelMenu-panel').bind('touchend', function() {
		if (jPM.isOpen()) {
			jPM.close();
			return false;
		}
	});
	jQuery('.jPanelMenu-panel').bind('click', function() {
		if (jPM.isOpen()) {
			jPM.close();
			return false;
		}
	});
	jQuery(window).resize(function() {
		if (jPM.isOpen() && jQuery(window).width() > 980) {
			jPM.close();
		}
	});
	
	jQuery('#jPanelMenu-menu #navCatTabsDropdown ul li ul').hide();
	
	jQuery('li a.category-top').on('click', function(){
		if (jQuery(this).parent().find('.sub-menu').is(':hidden')) {
			jQuery('#jPanelMenu-menu .hasSub a.category-top').removeClass('expanded-cat');
			jQuery(this).parent().children('a.category-top').addClass('expanded-cat');
			jQuery('#jPanelMenu-menu #nav-menu ul li ul').hide();
			jQuery(this).parent().find('.sub-menu').slideDown();
			return false;
		} else {
			return true;
		}
	});
	
});