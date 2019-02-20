<?php
/**
 * Page Template
 *
 * Displays page-not-found message and site-map (if configured)
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_page_not_found_default.php 3230 2006-03-20 23:21:29Z drbyte $
 */
?>
<div class="centerColumn" id="pageNotFound">
<h1 id="pageNotFoundHeading"><?php echo HEADING_TITLE; ?></h1>

<!--
<?php if (DEFINE_PAGE_NOT_FOUND_STATUS == '1') { ?>
<div id="pageNotFoundMainContent" class="content">
<?php
/**
 * require the html_define for the page_not_found page
 */
  require($define_page); ?>
</div>
<?php } ?>
-->

<div id="page-not-found-wrapper">
	<div class="col-left back">
	If you think think you should not be seeing this error message, please contact us and tell us what you did to arrive at this page. We will do our best to resolve the error as soon as possible. 
	</div><!--EOF .col-left-->
	<div class="col-right forward">
	Return to the <?php echo '<a href="' . HTTP_SERVER . DIR_WS_CATALOG . '">';?>homepage</a>, or use the site map below to assist you in the navigation of our site.
	</div><!--EOF .col-right-->
	<div class="clearBoth"></div>
</div>

    <div class="site-map-tree">
    	<?php echo $_SESSION['category_tree']->buildCategoryString('<ul class="{class}">{child}</ul>', '<li class="{class}"><a class="{class} category-top" href="{link}"><span class="{class}">{name}</span></a>{child}</li>'); ?>
    </div>

</div>
