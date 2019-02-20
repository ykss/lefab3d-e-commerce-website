<?php
/**
* @package Pages
* @copyright Copyright 2008-2009 RubikIntegration.com
* @copyright Copyright 2003-2006 Zen Cart Development Team
* @copyright Portions Copyright 2003 osCommerce
* @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
* @version $Id: loader_ajax_search.php 10 2012-09-07 04:14:02Z numinix $
*/                                             
  $loaders[] = array('conditions' => array('pages' => array('product_reviews_write')),
                      'jscript_files' => array(
                        'jquery/jquery-1.11.0.min.js' => 1,
                        'jquery/jquery-migrate-1.2.1.min.js' => 2,
                        'jquery/jquery.rating.pack.js' => 3,
                        'jquery/jquery_rating.js' => 4
                      ),
                      'css_files' => array(
                        'auto_loaders/jquery.rating.css' => 1
                      )
                  ); 