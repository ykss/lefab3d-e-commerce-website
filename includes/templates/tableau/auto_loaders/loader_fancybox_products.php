<?php
/**
* @package Pages
* @copyright Copyright 2008-2009 RubikIntegration.com
* @copyright Copyright 2003-2006 Zen Cart Development Team
* @copyright Portions Copyright 2003 osCommerce
* @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
* @version $Id: link.php 149 2009-03-04 05:23:35Z yellow1912 $
*/
                                                            
  $loaders[] = array('conditions' => array('pages' => array('product_info')),
										  'jscript_files' => array(
										    'jquery/jquery-1.11.0.min.js' => 1,
                        'jquery/jquery-migrate-1.2.1.min.js' => 2,
												'jquery/jquery.easing.1.3.js' => 3,
                        'jquery/jquery.simple.inheritance.min.js' =>5,
                        'jquery/jquery.photoswipe.min.js' => 6,
                        'jquery/jquery_fancybox_products.js' => 7
										  ),
                      'css_files' => array(
                        'auto_loaders/jquery.fancybox.css' => 1,
                        'auto_loaders/jquery.photoswipe.css' => 2
                      )
								  );