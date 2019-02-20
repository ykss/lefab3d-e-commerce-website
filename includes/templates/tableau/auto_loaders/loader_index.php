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
 * CSS:
 * <style type="text/css">
 * <?php // php code goes here ?>
 * </style>
 */

$loaders[] = array('conditions' => array('pages' => array('index_home')),
	'jscript_files' => array(
		'jquery/jquery-1.11.0.min.js' => 1,
   	'jquery/jquery-migrate-1.2.1.min.js' => 2,
		'jquery/jquery_tabs_index.js' => 5,
		'jquery/jquery.jcarousel.js' => 6,
		'jquery/jquery.touchwipe.1.1.1.js' => 7,
		'jquery/jquery_jcarousel.js' => 8,
		'jquery/jquery_testimonials.js' => 9,
		'jquery/jquery.tweet.js' => 10,
		'jquery/jquery_tweet_addon.php' => 11
	),
	'css_files' => array(
		'auto_loaders/skin.css' => 2
	)
);
