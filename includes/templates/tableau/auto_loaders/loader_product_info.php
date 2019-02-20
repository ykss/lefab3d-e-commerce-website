<?php
/**
* @package Pages
* @copyright Copyright 2008-2009 RubikIntegration.com
* @copyright Copyright 2003-2006 Zen Cart Development Team
* @copyright Portions Copyright 2003 osCommerce
* @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
* @version $Id: loader_ajax_search.php 10 2012-09-07 04:14:02Z numinix $
*/                                             
  $loaders[] = array('conditions' => array('pages' => array('product_info')),
                      'jscript_files' => array(
                        'jquery/jquery-1.11.0.min.js' => 1,
                        'jquery/jquery-migrate-1.2.1.min.js' => 2,
                        'jquery/jquery-ui-1.10.2.custom.min.js' => 3,
                        'jquery/index.js' => 5,
                        'jquery/jquery.ba-resize.js' => 6,
                        'jquery/jquery.tabs_accordion.js' => 7,
                        'jquery/modernizr.js' => 8,
                        'jquery/jquery_tabs_product_info.js' => 9
                      ),
                      'css_files' => array(
                      	'auto_loaders/tabs_accordion.css' => 1,
                      	'auto_loaders/minimal-2.css' => 2
                      )
                  ); 