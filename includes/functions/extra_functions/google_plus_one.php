<?php
  // builds the string of variables to be included in the head section of the page
  function build_google_plus_one_vars() {
    $vars = array();
    
    if (get_google_plus_one_lang()) $vars[] = get_google_plus_one_lang();
    if (GOOGLE_PLUS_ONE_PARSE != 'Default (On Load)') $vars[] = "parsetags: 'explicit'"; 
    
    $vars = '{' . implode(', ', $vars) . '}';
    return vars;
  }
  
  // builds the string of 
  function build_google_plus_one_params() {
    $params = array();
    
    if (GOOGLE_PLUS_ONE_SIZE != 'Standard (24px)') {
      switch(GOOGLE_PLUS_ONE_SIZE) {
        case 'Small (15px)':
          $size = 'small';
          break;
        case 'Medium (20px)':
          $size = 'medium';
          break;
        case 'Tall (60px)':
          $size = 'tall';
          break;
      }
      $params[] = 'size="' . $size . '"';
    }
    if (GOOGLE_PLUS_ONE_COUNT == 'false') $params[] = 'count="false"';
    if (GOOGLE_PLUS_ONE_CALLBACK != '') $params[] = 'callback="' . GOOGLE_PLUS_ONE_CALLBACK . '"';
    if (count($params) > 0) {
      return ' ' . implode(' ', $params);
    } else {
      return '';
    }    
  }
  
  // builds the lang parameter
  function get_google_plus_one_lang() {
    if (GOOGLE_PLUS_ONE_LANGUAGE != 'English (US)') {
      switch(GOOGLE_PLUS_ONE_LANGUAGE) {
        case 'Arabic':
          $lang = 'ar';
          break;
        case 'Bulgarian':
          $lang = 'bg';
          break;
        case 'Catalan':
          $lang = 'ca';
          break;
        case 'Chinese (Simplified)':
          $lang = 'zh-CN';
          break;
        case 'Chinese (Traditional)':
          $lang = 'zh-TW';
          break;
        case 'Croatian':
          $lang = 'hr';
          break;
        case 'Czech':
          $lang = 'cs';
          break;
        case 'Danish':
          $lang = 'da';
          break;
        case 'Dutch':
          $lang = 'nl';
          break;
        case 'English (UK)':
          $lang = 'en-GB';
          break;
        case 'Estonian':
          $lang = 'et';
          break;
        case 'Filipino':
          $lang = 'fil';
          break;
        case 'Finnish':
          $lang = 'fi';
          break;
        case 'French':
          $lang = 'fr';
          break;
        case 'German':
          $lang = 'de';
          break;
        case 'Greek':
          $lang = 'el';
          break;
        case 'Hebrew':
          $lang = 'iw';
          break;
        case 'Hindi':
          $lang = 'hi';
          break;
        case 'Hungarian':
          $lang = 'hu';
          break;
        case 'Indonesian':
          $lang = 'id';
          break;
        case 'Italian':
          $lang = 'it';
          break;
        case 'Japanese':
          $lang = 'ja';
          break;
        case 'Korean':
          $lang = 'ko';
          break;
        case 'Latvian':
          $lang = 'lv';
          break;
        case 'Malay':
          $lang = 'ms';
          break;
        case 'Norwegian':
          $lang = 'no';
          break;
        case 'Persian':
          $lang = 'fa';
          break;
        case 'Polish';
          $lang = 'pl';
          break;
        case 'Portuguese (Brazil)':
          $lang = 'pt-BR';
          break;
        case 'Portuguese (Portugal)':
          $lang = 'pt-PT';
          break;
        case 'Romanian':
          $lang = 'ro';
          break;
        case 'Russian':
          $lang = 'ru';
          break;
        case 'Serbian':
          $lang = 'sr';
          break;
        case 'Swedish':
          $lang = 'sv';
          break;
        case 'Slovak';
          $lang = 'sk';
          break;
        case 'Slovenian':
          $lang = 'sl';
          break;
        case 'Spanish':
          $lang = 'es';
          break;
        case 'Spanish (Latin America)':
          $lang = 'es-419';
          break;
        case 'Thai':
          $lang = 'th';
          break;
        case 'Turkish':
          $lang = 'tr';
          break;
        case 'Ukranian':
          $lang = 'uk';
          break;
        case 'Vietnamese':
          $lang = 'vi';
          break;
        default:
          return false;
          break;
      }
      return "lang: '$lang'";
    } else {
      return false;
    }
  }
?>