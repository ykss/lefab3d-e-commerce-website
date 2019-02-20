<?php
/**
 * Common Template - tpl_main_page.php
 *
 * Governs the overall layout of an entire page<br />
 * Normally consisting of a header, left side column. center column. right side column and footer<br />
 * For customizing, this file can be copied to /templates/your_template_dir/pagename<br />
 * example: to override the privacy page<br />
 * - make a directory /templates/my_template/privacy<br />
 * - copy /templates/templates_defaults/common/tpl_main_page.php to /templates/my_template/privacy/tpl_main_page.php<br />
 * <br />
 * to override the global settings and turn off columns un-comment the lines below for the correct column to turn off<br />
 * to turn off the header and/or footer uncomment the lines below<br />
 * Note: header can be disabled in the tpl_header.php<br />
 * Note: footer can be disabled in the tpl_footer.php<br />
 * <br />
 * $flag_disable_header = true;<br />
 * $flag_disable_left = true;<br />
 * $flag_disable_right = true;<br />
 * $flag_disable_footer = true;<br />
 * <br />
 * // example to not display right column on main page when Always Show Categories is OFF<br />
 * <br />
 * if ($current_page_base == 'index' and $cPath == '') {<br />
 *  $flag_disable_right = true;<br />
 * }<br />
 * <br />
 * example to not display right column on main page when Always Show Categories is ON and set to categories_id 3<br />
 * <br />
 * if ($current_page_base == 'index' and $cPath == '' or $cPath == '3') {<br />
 *  $flag_disable_right = true;<br />
 * }<br />
 *
 * @package templateSystem
 * @copyright Copyright 2003-2007 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_main_page.php 7085 2007-09-22 04:56:31Z ajeh $
 */

// the following IF statement can be duplicated/modified as needed to set additional flags
if ($this_is_home_page || in_array($current_page_base,explode(",",'list_pages_to_skip_all_right_sideboxes_on_here,separated_by_commas,and_no_spaces')) ) {
	$flag_disable_right = true;
}


if ((((isset($_GET['cPath']) && $_GET['cPath'] != '') || (isset($_GET['manufacturers_id']) && $_GET['manufacturers_id'] > 0)) && $_GET['main_page'] == FILENAME_DEFAULT) || (in_array($_GET['main_page'], array(FILENAME_ADVANCED_SEARCH_RESULT, FILENAME_SPECIALS, FILENAME_FEATURED_PRODUCTS, FILENAME_PRODUCTS_NEW, FILENAME_PRODUCTS_ALL, FILENAME_BEST_SELLERS)))) {
	$flag_disable_left = false;
	$flag_disable_right = false;
} else {
	$flag_disable_left = true;
	$flag_disable_right = true;
}

$header_template = 'tpl_header.php';
$footer_template = 'tpl_footer.php';
$left_column_file = 'column_left.php';
$right_column_file = 'column_right.php';
$body_id = ($this_is_home_page) ? 'indexHome' : str_replace('_', '', $_GET['main_page']);
?>
<body id="<?php echo $body_id . 'Body'; ?>"<?php if($zv_onload !='') echo ' onload="'.$zv_onload.'"'; ?>>
	<?php
if (SHOW_BANNERS_GROUP_SET1 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET1)) {
	if ($banner->RecordCount() > 0) {
?>
		<div id="bannerOne" class="banners"><?php echo zen_display_banner('static', $banner); ?></div>
	<?php
	}
}
?>
	<div id="mainWrapper">
			
		

		<?php
/**
 * prepares and displays header output
 *
 */
if (CUSTOMERS_APPROVAL_AUTHORIZATION == 1 && CUSTOMERS_AUTHORIZATION_HEADER_OFF == 'true' and ($_SESSION['customers_authorization'] != 0 or $_SESSION['customer_id'] == '')) {
	$flag_disable_header = true;
}
require($template->get_template_dir('tpl_header.php',DIR_WS_TEMPLATE, $current_page_base,'common'). '/tpl_header.php');?>

		<div id="contentMainWrapper" <?php if ($this_is_home_page) {?><?php } else { ?>class="content-wrapper"<?php } ?>>
		<?php
                if(TABLEAU_SOCIAL_ICONS == "true"){
                ?>
                    <ul class="social-links">
                        <?php
                                echo (TABLEAU_FACEBOOK_URL != '' ? '<li class="is-facebook"><a href="'.TABLEAU_FACEBOOK_URL.'">Facebook</a></li>' : '');
				echo (TABLEAU_TWITTER_URL != '' ? '<li class="is-twitter"><a href="'.TABLEAU_TWITTER_URL.'">Twitter</a></li>' : '');
                                echo (TABLEAU_GOOGLE_PLUS_URL != '' ? '<li class="is-gplus"><a href="'.TABLEAU_GOOGLE_PLUS_URL.'">Google Plus</a></li>' : '');
                                echo (TABLEAU_YOUTUBE_URL != '' ? '<li class="is-youtube"><a href="'.TABLEAU_YOUTUBE_URL.'">YouTube</a></li>' : '');
                                echo (TABLEAU_BLOG_URL != '' ? '<li class="is-rss"><a href="'.TABLEAU_BLOG_URL.'">Blog</a></li>' : '');
			?>
                    </ul>
		<?php
                }
                ?>
		<!--BOF PRODUCT LISTING-->
		<?php
					if (isset($_GET['cPath']) && $_GET['main_page'] == FILENAME_DEFAULT) {
						$cPath_array = explode('_', $_GET['cPath']);
				  	$categories_id = $cPath_array[sizeof($cPath_array) - 1];
		?>
		<!--BOF Category Image-->
		<?php
			if (PRODUCT_LIST_CATEGORIES_IMAGE_STATUS == 'true') {
				if ($categories_image = zen_get_categories_image($current_category_id)) {
		?>
			<div id="categoryImgListing" class="categoryImg"><?php echo zen_image(DIR_WS_IMAGES . $categories_image, '', CATEGORY_ICON_IMAGE_WIDTH, CATEGORY_ICON_IMAGE_HEIGHT); ?></div>
		<?php
			  }
			} 
		?>
		<!--EOF Category Image-->
		<?php
					}
		?>
		<!--EOF PRODUCT LISTING-->
		
		<!--BOF PRODUCT PAGE-->
		<?php
				if ($_GET['main_page'] != FILENAME_DEFAULT) {
		?>
			<div class="sub-page-wrapper">
		<?php } ?>
		<!--EOF PRODUCT PAGE-->
		
		<?php if ((((isset($_GET['cPath']) && $_GET['cPath'] != '') || (isset($_GET['manufacturers_id']) && $_GET['manufacturers_id'] > 0)) && $_GET['main_page'] == FILENAME_DEFAULT) || (in_array($_GET['main_page'], array(FILENAME_ADVANCED_SEARCH_RESULT, FILENAME_SPECIALS, FILENAME_FEATURED_PRODUCTS, FILENAME_PRODUCTS_NEW, FILENAME_PRODUCTS_ALL, FILENAME_BEST_SELLERS)))) { ?>
		
		<div class="product-listing sub-page-wrapper" id="product-listing-<?php echo $categories_id; ?>">			
			
			<div class="product-listing-header">

			<?php } ?>
			<!-- bof  breadcrumb -->
					<?php if (DEFINE_BREADCRUMB_STATUS == '1' || (DEFINE_BREADCRUMB_STATUS == '2' && !$this_is_home_page && !in_array($current_page_base,explode(",",''))) ) { ?>
					      <div id="navBreadCrumb"><?php echo $breadcrumb->trail(BREAD_CRUMBS_SEPARATOR); ?></div>
					<?php } ?>
			<!-- eof breadcrumb -->
			<div class="clearBoth"></div>
				<?php if ((((isset($_GET['cPath']) && $_GET['cPath'] != '') || (isset($_GET['manufacturers_id']) && $_GET['manufacturers_id'] > 0)) && $_GET['main_page'] == FILENAME_DEFAULT) || (in_array($_GET['main_page'], array(FILENAME_SPECIALS, FILENAME_FEATURED_PRODUCTS, FILENAME_PRODUCTS_NEW, FILENAME_PRODUCTS_ALL, FILENAME_BEST_SELLERS)))) { ?>
					<h1 id="productListHeading"><?php echo $breadcrumb->last(); ?></h1>
				<?php
					}
				?>
				<?php if ($_GET['main_page'] == FILENAME_ADVANCED_SEARCH_RESULT) { ?>
				<h1 id="advSearchResultsDefaultHeading"><?php echo HEADING_TITLE; ?></h1>
				<?php } ?>
				
			<?php if ((((isset($_GET['cPath']) && $_GET['cPath'] != '') || (isset($_GET['manufacturers_id']) && $_GET['manufacturers_id'] > 0)) && $_GET['main_page'] == FILENAME_DEFAULT) || (in_array($_GET['main_page'], array(FILENAME_ADVANCED_SEARCH_RESULT, FILENAME_SPECIALS, FILENAME_FEATURED_PRODUCTS, FILENAME_PRODUCTS_NEW, FILENAME_PRODUCTS_ALL, FILENAME_BEST_SELLERS)))) { ?>

				</div>
			<?php } ?>
				
			<?php
if (COLUMN_LEFT_STATUS == 0 || (CUSTOMERS_APPROVAL == '1' and $_SESSION['customer_id'] == '') || (CUSTOMERS_APPROVAL_AUTHORIZATION == 1 && CUSTOMERS_AUTHORIZATION_COLUMN_LEFT_OFF == 'true' and ($_SESSION['customers_authorization'] != 0 or $_SESSION['customer_id'] == ''))) {
	// global disable of column_left
	$flag_disable_left = true;
}
if (!isset($flag_disable_left) || !$flag_disable_left) {
?>

				<div id="navColumnOne" class="columnLeft back">
					<span class="filter-results-title">Refine your results</span>
					<?php
	/**
	 * prepares and displays left column sideboxes
	 *
	 */
?>
						<div id="navColumnOneWrapper"><?php require(DIR_WS_MODULES . zen_get_module_directory('column_left.php')); ?></div>
				</div><!--EOF #navColumnOne-->
			<?php
}
?>

	    <div class="back" id="middle-column-wrapper">

				<?php
if (SHOW_BANNERS_GROUP_SET3 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET3)) {
	if ($banner->RecordCount() > 0) {
?>
					<div id="bannerThree" class="banners"><?php echo zen_display_banner('static', $banner); ?></div>
				<?php
	}
}
?>

				<!-- bof upload alerts -->
				<?php if ($messageStack->size('upload') > 0) echo $messageStack->output('upload'); ?>
				<!-- eof upload alerts -->

				<?php
/**
 * prepares and displays center column
 *
 */
require($body_code); ?>

				<?php
if (SHOW_BANNERS_GROUP_SET4 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET4)) {
	if ($banner->RecordCount() > 0) {
?>
				<div id="bannerFour" class="banners"><?php echo zen_display_banner('static', $banner); ?></div>
				<?php
	}
}
?>

		</div><!--EOF #middle-column-wrapper-->

		<?php
//if (COLUMN_RIGHT_STATUS == 0 || (CUSTOMERS_APPROVAL == '1' and $_SESSION['customer_id'] == '') || (CUSTOMERS_APPROVAL_AUTHORIZATION == 1 && CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF == 'true' && $_SESSION['customers_authorization'] != 0)) {
if (COLUMN_RIGHT_STATUS == 0 || (CUSTOMERS_APPROVAL == '1' and $_SESSION['customer_id'] == '') || (CUSTOMERS_APPROVAL_AUTHORIZATION == 1 && CUSTOMERS_AUTHORIZATION_COLUMN_RIGHT_OFF == 'true' and ($_SESSION['customers_authorization'] != 0 or $_SESSION['customer_id'] == ''))) {
	// global disable of column_right
	$flag_disable_right = true;
}
if (!isset($flag_disable_right) || !$flag_disable_right) {
?>

			<div id="navColumnTwo" class="columnRight back" style="width: <?php echo COLUMN_WIDTH_RIGHT; ?>">
		<?php
	/**
	 * prepares and displays right column sideboxes
	 *
	 */
?>
		<div id="navColumnTwoWrapper" style="width: <?php echo BOX_WIDTH_RIGHT; ?>"><?php require(DIR_WS_MODULES . zen_get_module_directory('column_right.php')); ?></div>
		</div><!--EOF #navColumnTwo-->
	<?php
}
?>
	<div class="clearBoth"></div>
	<?php
		if (isset($_GET['cPath']) && $_GET['main_page'] == FILENAME_DEFAULT) {
			$cPath_array = explode('_', $_GET['cPath']);
			echo '</div>';
		}
	?>
	<!--BOF PRODUCT PAGE-->
		<?php
				if ($_GET['main_page'] != FILENAME_DEFAULT) {
		?>
			</div>
		<?php } ?>
		<!--EOF PRODUCT PAGE-->
		<div class="clearBoth"></div>
	</div>
<?php
/**
 * prepares and displays footer output
 *
 */
if (CUSTOMERS_APPROVAL_AUTHORIZATION == 1 && CUSTOMERS_AUTHORIZATION_FOOTER_OFF == 'true' and ($_SESSION['customers_authorization'] != 0 or $_SESSION['customer_id'] == '')) {
	$flag_disable_footer = true;
}
require($template->get_template_dir('tpl_footer.php',DIR_WS_TEMPLATE, $current_page_base,'common'). '/tpl_footer.php');
?>
<!--bof- parse time display -->
<?php
if (DISPLAY_PAGE_PARSE_TIME == 'true') {
?>
<div class="smallText center">Parse Time: <?php echo $parse_time; ?> - Number of Queries: <?php echo $db->queryCount(); ?> - Query Time: <?php echo $db->queryTime(); ?></div>
<?php
}
?>
</div>
<!--eof- parse time display -->
</body>