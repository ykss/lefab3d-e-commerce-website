<?php
/**
 * @package Pages
 * @copyright Copyright 2008-2010 RubikIntegration.com
 * @author yellow1912
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.
 */

/**
 * NOTE: You can use php files for both javascript and css.
 *
 * Global variables must be declared global as they are referenced inside the loader class
 *
 * They must be coded like so:
 * Javascript:
 * <script language="javascript" type="text/javascript">
 * <?php // php code goes here ?>
 * </script>
 *
 * CSS:s
 * <style type="text/css">
 * <?php // php code goes here ?>
 * </style>
 */

$loaders[] = array('conditions' => array('pages' => array(FILENAME_ACCOUNT, FILENAME_ACCOUNT_EDIT, FILENAME_ADDRESS_BOOK, FILENAME_ADDRESS_BOOK_PROCESS, FILENAME_ACCOUNT_NEWSLETTERS, FILENAME_ACCOUNT_PASSWORD, FILENAME_ACCOUNT_HISTORY, FILENAME_ACCOUNT_HISTORY_INFO)),
	'jscript_files' => array(
	    'jquery/jquery-1.11.0.min.js' => 1,
	    'jquery/jquery-migrate-1.2.1.min.js' => 2,
	    'jquery/jquery_account_menu.js' => 3
	  ),
	'css_files' => array(
		'auto_loaders/account_menu.css' => 1
	)
);
