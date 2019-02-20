<?php
/**
 * Common Template - tpl_header.php
 *
 * this file can be copied to /templates/your_template_dir/pagename<br />
 * example: to override the privacy page<br />
 * make a directory /templates/my_template/privacy<br />
 * copy /templates/templates_defaults/common/tpl_footer.php to /templates/my_template/privacy/tpl_header.php<br />
 * to override the global settings and turn off the footer un-comment the following line:<br />
 * <br />
 * $flag_disable_header = true;<br />
 *
 * @package templateSystem
 * @copyright Copyright 2003-2012 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version GIT: $Id: Author: Ian Wilson  Tue Aug 14 14:56:11 2012 +0100 Modified in v1.5.1 $
 */
?>

<?php
// Display all header alerts via messageStack:
if ($messageStack->size('header') > 0) {
	echo $messageStack->output('header');
}
if (isset($_GET['error_message']) && zen_not_null($_GET['error_message'])) {
	echo htmlspecialchars(urldecode($_GET['error_message']), ENT_COMPAT, CHARSET, TRUE);
}
if (isset($_GET['info_message']) && zen_not_null($_GET['info_message'])) {
	echo htmlspecialchars($_GET['info_message'], ENT_COMPAT, CHARSET, TRUE);
} else {

}
?>

<!--bof-header logo and navigation display-->
<?php
if (!isset($flag_disable_header) || !$flag_disable_header) {
?>
<?php
  if ($nmx_disk_cache->cacheStart('tpl_header', array($_SESSION['customer_id'], $_SESSION['customer_first_name'], $_SESSION['cart']->count_contents()), array($_SESSION['languages_id']), true, true)) {  
?>
	<div id="header" role="banner">

		<!-- 
			1. banner area
			if no banner associated, this are shouldn't appear.
		-->
		<?php
			if (SHOW_BANNERS_GROUP_SET2 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET2)) {
				if ($banner->RecordCount() > 0) {
		?>
			<?php echo zen_display_banner('static', $banner);?>

		<?php
				}
			}
		?>


		<?php
			$banner = $db->Execute("SELECT banners_id, banners_html_text, banners_title, banners_image, banners_url FROM " . TABLE_BANNERS . " WHERE status = 1 AND banners_group = 'headerbanner' ORDER BY banners_sort_order ASC LIMIT 1");
	
			if ($banner->RecordCount() > 0) {
		?>
		<div class="header--banner">
			<div class="wrapper--container">
				<?php

					while (!$banner->EOF) {
	
					if($banner->fields['banners_html_text']){
						$banner_string = $banner->fields['banners_html_text'];
						}else{
						$banner_string = '<a href="' . zen_href_link(FILENAME_REDIRECT, 'action=banner&goto=' . $banner->fields['banners_id']) . '" target="_blank">' . zen_image(DIR_WS_IMAGES . $banner->fields['banners_image'], $banner->fields['banners_title']) . '</a>';
						}
				
						echo $banner_string;
				
						zen_update_banner_display_count($banner->fields['banners_id']);
						$banner->MoveNext();
							
					}
				
				?>

			</div>
		</div>
		<?php 
			}
		?>
		
		<!-- 
			2. logo company, account links and shopping cart
		-->
		<div class="header--middle">
			<div class="wrapper--container">
				
				<!-- items responsible for the mobile navigation -->
				<div id="mobile-nav-menu"></div>
				<div id="mobile-nav" class="back"><a href="#menu-selector" class="icon header-menu">&#xe004;</a></div>
				<!-- end/items responsible for the mobile navigation -->

				<!-- logo -->
				<?php echo '<a id="logo" href="' . HTTP_SERVER . DIR_WS_CATALOG . '">' . zen_image($template->get_template_dir(TABLEAU_LOGO_UPLOAD, DIR_WS_TEMPLATE, $current_page_base,'images'). '/' . TABLEAU_LOGO_UPLOAD, HEADER_ALT_TEXT) . '</a>'; ?>
				<!-- end/logo -->

				<!-- account links -->
				<ul class="hidden-mobile" id="account-nav">
	  				<li class="back account-contact-us">
	  					<a href="<?php echo zen_href_link(FILENAME_CONTACT_US, '', 'NONSSL'); ?>"><?php echo HEADER_TITLE_CONTACT_US; ?></a>
	  				</li>
	  				<?php if (!$_SESSION['customer_id']) { ?>
			    		<li class="back account-login">
			    			<a href="<?php echo zen_href_link(FILENAME_LOGIN, '', 'SSL'); ?>"><?php echo HEADER_TITLE_LOGIN; ?></a>
			  			</li>
			  		<?php } ?>
	  				<?php if(isset($_SESSION['customer_first_name']) && $_SESSION['customer_first_name'] != "") { ?>
		  				<li class="back account-customers-name"><span>Welcome <?php echo $_SESSION['customer_first_name']; ?>!</span></li>
	  				<?php } ?>
	  				
	  				<li class="back account-my-account">
	  					<a href="<?php echo zen_href_link(FILENAME_ACCOUNT, '', 'SSL'); ?>"><?php echo HEADER_TITLE_MY_ACCOUNT; ?></a>
	  				</li>
	  				
			  		<?php if ($_SESSION['customer_id']) { ?>
						<li class="back account-logoff">		
								<a href="<?php echo zen_href_link(FILENAME_LOGOFF, '', 'SSL'); ?>"><?php echo HEADER_TITLE_LOGOFF; ?></a>	
						</li>
	  				<?php } ?>
	  				
				</ul>
				<!-- end/#account-nav-->
				
				<!-- shopping cart -->
				<a href="<?php echo zen_href_link(FILENAME_SHOPPING_CART, '', 'SSL'); ?>" id="ajaxCartSlideSelector" class="closed">
					<span id="cart-count-wrapper" class="back">
						<span id="cart-icon" class="back">&#xe027;<!--Shopping Cart Icon--></span>
                  <span class="back" id="cart-count"><span><?php echo HEADER_TITLE_CART_CONTENTS; ?></span> <?php echo $_SESSION['cart']->count_contents();?></span>
					</span>
				</a>
				<!-- end/shopping cart -->

				<!-- search -->
				<div id="search-wrapper">
					<?php require(DIR_WS_MODULES . 'sideboxes/search_header.php'); ?>
				</div>
				<!-- end/search -->

			</div>
		</div>
		
		<!-- 
			2. navigation and search
		-->
		<div class="header--navigation">
			<div class="wrapper--container">
				
				<!-- navigation -->
				<div id="js-nav-menu--container">
					<ul id="nav-menu">
						<li>
							<a href="#" class="category-top">
                     <span><?php echo HEADER_TITLE_CATEGORIES; ?></span>
							</a>
							<!--bof-optional categories tabs navigation display-->
							<?php require($template->get_template_dir('tpl_modules_categories_tabs.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_categories_tabs.php'); ?>
							<!--eof-optional categories tabs navigation display-->
						</li>
						<!--bof-header ezpage links-->
						<?php if (EZPAGES_STATUS_HEADER == '1' or (EZPAGES_STATUS_HEADER == '2' and (strstr(EXCLUDE_ADMIN_IP_FOR_MAINTENANCE, $_SERVER['REMOTE_ADDR'])))) { ?>
						<?php require($template->get_template_dir('tpl_ezpages_bar_header.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_ezpages_bar_header.php'); ?>
						<?php } ?>
						<!--eof-header ezpage links-->
					</ul>

				</div>
				<!-- end/navigation -->
			
			</div>
		</div>
	
	</div>
<?php
  $nmx_disk_cache->cacheEnd();
}
?>
	
	
	<!--bof contact us popup-->
	<?php require($template->get_template_dir('tpl_modules_contact_us_popup.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_contact_us_popup.php'); ?>
	<!--eof contact us popup-->

<?php } ?>
