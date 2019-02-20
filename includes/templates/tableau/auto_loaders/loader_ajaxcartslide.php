<?php
/**
* @package Pages
* @copyright Copyright 2008-2009 RubikIntegration.com
* @copyright Copyright 2003-2006 Zen Cart Development Team
* @copyright Portions Copyright 2003 osCommerce
* @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
* @version $Id: loader_ajaxcartslide.php 8 2011-06-03 22:24:04Z numinix $
*/
if (!$disable_ajaxcartslide) {
  $disabled_pages = explode(',', str_replace(' ', '', AATC_AJAX_CART_SLIDER_DISABLED_PAGES));                                             
  if (AATC_AJAX_CART_SLIDER == 'true' && !in_array($_GET['main_page'], $disabled_pages) && ($_GET['main_page'] != FILENAME_QUICK_CHECKOUT || ($_GET['main_page'] == FILENAME_QUICK_CHECKOUT && !isset($_SESSION['customer_id'])))) {
    $loaders[] = array('conditions' => array('pages' => array('*')),
                        'jscript_files' => array(
                          
                        ),
                        'css_files' => array(
                          'auto_loaders/ajaxcartslide.css' => 1,
                          'auto_loaders/ajaxcartslide_overrides.css' => 2
                        )
                    );
  } else {                                                            
    $loaders[] = array('conditions' => array('pages' => array('*')),
										    'css_files' => array(
                          'auto_loaders/ajaxcartslide.css' => 1,
                          'auto_loaders/ajaxcartslide_overrides.css' => 2
                        )
                    );
  } 
}