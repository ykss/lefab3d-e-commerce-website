  jQuery(function() {
    var cache = {}, lastXhr;
    
    jQuery.ui.autocomplete.prototype._renderItem = function( ul, item) {
      var term = this.term.split(' ').join('|');
      var re = new RegExp("(" + term + ")", "gi") ;
      var t = item.label.replace(re,"<strong>$1</strong>");
      return jQuery( "<li></li>" )
       .data( "item.autocomplete", item )
       .append( "<a>" + t + "</a>" )
       .appendTo( ul );
    };
    
    initializeAjaxSearchSuggest('form[name="quick_find_header"]');
    initializeAjaxSearchSuggest('form[name="quick_find"]');

    function initializeAjaxSearchSuggest(formSelector) {
      jQuery(formSelector + ' input[name="keyword"]').autocomplete({
        minLength: 2,
        autoFocus: false,
        delay: 100,
        dataType: 'json',
        source: function( request, response ) {
          var term = request.term;
          if ( term in cache ) {
            response( cache[ term ] );
            return;
          }

          lastXhr = jQuery.getJSON('ajax/ajax_search.php', jQuery(formSelector).serialize(), function(data, status, xhr) {
            cache[ term ] = data;
            if ( xhr === lastXhr ) {
              response( data );
            }
          });
        },
        select: function(event, ui) {
          if (ui.item) {
            switch(ui.item.value) {
              case 'no results found':
                return false;
                break;
              case '... more results':
                jQuery(formSelector).submit();
                return false;
                break;
              default:
                jQuery(formSelector + ' input[name="keyword"]').val(ui.item.value);
                jQuery(formSelector).submit();
                break;
            }
          }
        },
        create: function(event, ui) {
          jQuery(formSelector).css({
            'position' : 'relative',
            'display' : 'inline-block'
          });
          var ajaxSearchHeight = jQuery(formSelector).outerHeight(true);
          // create inverted colors
          //var ajaxSearchBGColor = jQuery('body').css('color');
          //var ajaxSearchFontColor = jQuery('body').css('background-color');
          var ajaxSearchFontSize = jQuery(formSelector + ' input[name="keyword"]').css('font-size');
          jQuery('ul.ui-autocomplete').css({
            'position' : 'absolute',
            'left' : 0,
            'display' : 'none',
            //'background-color' : ajaxSearchBGColor,
            //'color' : ajaxSearchFontColor,
            'font-size' : ajaxSearchFontSize,
            'width' : '100%'
          });
          //jQuery('ul.ui-autocomplete li a').css({
            //'color' : ajaxSearchFontColor
          //});        
        },
        open: function(event, ui) {
          var ajaxSearchWidth = jQuery(formSelector).outerWidth(false) - 2; // subtract borders
          jQuery('ul.ui-autocomplete').css('width', ajaxSearchWidth);        
        }
      });
    }
  });