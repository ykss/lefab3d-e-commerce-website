<?php
/**
* @package Pages
* @copyright Copyright 2008-2009 RubikIntegration.com
* @copyright Copyright 2003-2006 Zen Cart Development Team
* @copyright Portions Copyright 2003 osCommerce
* @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
* @version $Id: loader_google_plus_one.php 3 2011-06-21 07:51:00Z numinix $
*/
  if (GOOGLE_PLUS_ONE_ENABLED == 'true') {
    $pages = explode(',', str_replace(' ', '', GOOGLE_PLUS_ONE_PAGES));                                             
    $loaders[] = array('conditions' => array('pages' => $pages),
                        'jscript_files' => array(
                          'auto_loaders/google_plus_one.php' => 1
                        ),
                        'css_files' => array(
                          'auto_loaders/google_plus_one.css' => 1
                        )
                    );
  }
