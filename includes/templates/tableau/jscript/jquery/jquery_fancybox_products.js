jQuery(document).ready(function() {
  
  // images
  var mainImageLarge  = jQuery("#productMainImage a").attr("href"),
      mainImageSrc    = jQuery("#productMainImage a img").attr("src"),
      mainImageAlt    = jQuery("#productMainImage a img").attr("alt"),
      mainImageHref   = jQuery("#productMainImage a").attr("href");
  
  // Addional images for main product image
  var additionalImages = true;

  // Addional Images need to exist to set up the thumb images
  if (!jQuery('#productAdditionalImages').length > 0) { 
       
      additionalImages = false;

  } else {
    if (!isTouchDevice()) {
        jQuery("#productAdditionalImages").find("ul").prepend('<li class="mainImage back"><a href="' + mainImageLarge + '" title="'+mainImageAlt+'" class="current" id="mainImageThumb"><img src="'+mainImageSrc+'" title="'+mainImageAlt+'" alt="'+mainImageAlt+'" height="60" /></a></li>');
    }
  }

  console.log("Hi");

  var $windowWidth = jQuery(window).width();

  // fancybox main image
  if ($windowWidth > 979) {

    console.log("yes");
    
    jQuery("#mainProductImage").fancybox({
      arrows: false,
      helpers : {
        buttons : {}    
      }
    });

    // checking if there are addional images
    if (additionalImages) {                                                                      
        jQuery(document).on('click', '#productAdditionalImages a', function() {
        
          jQuery('#productAdditionalImages a').each(function(){
            jQuery(this).removeClass('current');  
          });
          
          jQuery(this).addClass('current');
              
          // swap main image
          if (jQuery(this).attr('id') == 'mainImageThumb') {
              jQuery('#productMainImage a').attr('href', mainImageLarge);
              jQuery('#productMainImage a img').attr('src', mainImageSrc);      
          } else {                                                                                                              
              jQuery('#productMainImage a').attr('href', jQuery(this).attr('href'));
              jQuery('#productMainImage a img').attr('src', jQuery(this).attr('href'));
          }
          jQuery('#productMainImage').show();
          jQuery.fancybox.cancel();
          return false;
        });

        jQuery(document).on('click', '#mainProductImage', function() {
            var gallery = [{
                href : jQuery('#productAdditionalImages a.current').attr('href'), 
            }];
            
            jQuery('#productAdditionalImages a:not(.current)').each(function() {
                gallery.push({'href' : jQuery(this).attr('href')}); 
            });

            jQuery.fancybox.open(gallery, {
                padding: 0
            });

            return false;
        });
    }

  } else {
      
      // We only call photoSwipe if there is addiotional images
      // It's necessary because if there is no addiotional images, mobile devices will print an error
      if (additionalImages) {

          var myPhotoSwipe = jQuery("#mainProductImage, #productAdditionalImages a").photoSwipe({
              imageScaleMethod: 'fitNoUpscale',
              captionAndToolbarAutoHideDelay: 0
          });
      }
  }
  

});

if (!isTouchDevice()) {
    function createFancyboxAdditional() {
      jQuery("#productAdditionalImages a").fancybox({
        arrows: true,
        helpers : {
          buttons : {}    
        }
      });  
    }

    function createFancyboxMain() {
      jQuery("#mainProductImage").fancybox({
        arrows: true,
        helpers : {
          buttons : {}    
        }
      }); 
    }
}

function isTouchDevice() {
  if (navigator.userAgent.match(/iPhone/i) || navigator.userAgent.match(/iPod/i) || navigator.userAgent.match(/iPad/i) || navigator.userAgent.match(/Android/i) || navigator.userAgent.match(/webOS/i)) {
    return true;
  } else {
    return false;
  }
}