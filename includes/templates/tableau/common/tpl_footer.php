<?php
  if ($nmx_disk_cache->cacheStart('tpl_footer', array(), true, true)) {  
?>
<?php
/**
 * Common Template - tpl_footer.php
 *
 * this file can be copied to /templates/your_template_dir/pagename<br />
 * example: to override the privacy page<br />
 * make a directory /templates/my_template/privacy<br />
 * copy /templates/templates_defaults/common/tpl_footer.php to /templates/my_template/privacy/tpl_footer.php<br />
 * to override the global settings and turn off the footer un-comment the following line:<br />
 * <br />
 * $flag_disable_footer = true;<br />
 *
 * @package templateSystem
 * @copyright Copyright 2003-2010 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_footer.php 15511 2010-02-18 07:19:44Z drbyte $
 */
require(DIR_WS_MODULES . zen_get_module_directory('footer.php'));
?>

<?php
if (!isset($flag_disable_footer) || !$flag_disable_footer) {
?>

<div id="footer">
	
	<!-- 
		1. message
	-->
	
	<?php
		$banner = $db->Execute("SELECT banners_id, banners_html_text, banners_title, banners_image, banners_url FROM " . TABLE_BANNERS . " WHERE status = 1 AND banners_group = 'footerbanner' ORDER BY banners_sort_order ASC LIMIT 1");

		if ($banner->RecordCount() > 0) {

	?>
		<div class="footer--message">
			<div class="wrapper--container">
				<?php 
					while (!$banner->EOF) {
			
						if($banner->fields['banners_html_text']){
							$banner_string = $banner->fields['banners_html_text'];
						} else {
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
		2. links and newsletter
	-->
	<div class="footer--navigation">
		<div class="wrapper--container">
			
			<div class="list-footer list--shop">
         <h5><?php echo FOOTER_SHOP; ?></h5>
				<ul>
            <li><a href="<?php echo zen_href_link(FILENAME_SITE_MAP, '', 'NONSSL'); ?>"><?php echo FOOTER_CATEGORIES; ?></a></li>
					<?php if (EZPAGES_STATUS_FOOTER == '1' or (EZPAGES_STATUS_FOOTER == '2' and (strstr(EXCLUDE_ADMIN_IP_FOR_MAINTENANCE, $_SERVER['REMOTE_ADDR'])))) { ?>
						<?php require($template->get_template_dir('tpl_ezpages_bar_footer.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_ezpages_bar_footer.php'); ?>
					<?php } ?>
				</ul>
			</div>

			<div class="list-footer list--services">
         <h5><?php echo FOOTER_CUSTOMER_SERVICES; ?></h5>
				<ul>
               <?php if (DEFINE_CONTACT_US_STATUS == 1) { ?>
                  <li><a href="<?php echo zen_href_link(FILENAME_CONTACT_US, '', 'NONSSL'); ?>"><?php echo FOOTER_TITLE_CONTACT_US; ?></a></li>
               <?php } ?>
                  <li><a href="<?php echo zen_href_link(FILENAME_ACCOUNT, '', 'SSL'); ?>"><?php echo FOOTER_TITLE_MY_ACCOUNT; ?></a></li>
               <?php if (DEFINE_DISCOUNT_COUPON_STATUS == 1) { ?>
                  <li><a href="<?php echo zen_href_link(FILENAME_DISCOUNT_COUPON); ?>"><?php echo FOOTER_DISCOUNT_COUPONS; ?></a></li>
               <?php } ?>
               <li><a href="<?php echo zen_href_link(FILENAME_GV_FAQ); ?>"><?php echo FOOTER_GIFT_CERT; ?></a></li>
				</ul>
			</div>
			
			<div class="list-footer list--policies">
         <h5><?php echo FOOTER_POLICIES; ?></h5>
            <ul>
            <?php if (DEFINE_SHIPPINGINFO_STATUS == 1) { ?>
               <li><a href="<?php echo zen_href_link(FILENAME_SHIPPING, '', 'NONSSL'); ?>"><?php echo FOOTER_SHIPPING; ?></a></li>
            <?php } ?>
            <?php if (DEFINE_PRIVACY_STATUS == 1) { ?>
               <li><a href="<?php echo zen_href_link(FILENAME_PRIVACY, '', 'NONSSL'); ?>"><?php echo FOOTER_PRIVACY; ?></a></li>
            <?php } ?>
            <?php if (DEFINE_CONDITIONS_STATUS == 1) { ?> 
               <li><a href="<?php echo zen_href_link(FILENAME_CONDITIONS, '', 'NONSSL'); ?>"><?php echo FOOTER_CONDITIONS; ?></a></li>
            <?php } ?>
				</ul>
			</div>
			
			<!-- newsletter -->
			<div id="newsletter-wrapper" class="footer-content-container">
         <h5 class="ftr-title"><?php echo FOOTER_NEWSLETTER; ?></h5>
				<?php 
					echo zen_draw_form('subscribe', zen_href_link(FILENAME_SUBSCRIBE, '', 'SSL'), 'post', '');
					echo zen_draw_hidden_field('act', 'subscribe');
					echo zen_draw_hidden_field('main_page',FILENAME_SUBSCRIBE);
				?>
	        		<?php echo zen_draw_input_field('email', '', 'id="txtsubscribe" autocomplete="off" placeholder="' . FOOTER_NEWSLETTER_PLACEHOLDER . '"');?>
               <button type="submit" value="Sign Up"><?php echo FOOTER_SUBSCRIBE; ?></button>
	        		<?php echo zen_draw_hidden_field('email_format', 'HTML');?>
	   			</form>
                  <a href="<?php echo zen_href_link(FILENAME_UNSUBSCRIBE); ?>"><?php echo FOOTER_UNSUBSCRIBE; ?></a>
			</div>
			<!-- end/newsletter -->

		</div>
	</div>

	<!-- 
		3. copy and flags
	-->
	<div class="footer--copyright-flags">
		<div class="wrapper--container">
			
			<div id="copyright-wrapper">
				<p>
					<span class="copyright"><?php echo TABLEAU_FTR_COPYRIGHT; ?></span>
					<span class="designed-by">Web Design by <a href="https://www.numinix.com/" target="_blank">Numinix</a></span>
				</p>
			</div>
		
				<?php
	$banner = $db->Execute("SELECT banners_id, banners_html_text, banners_title, banners_image, banners_url FROM " . TABLE_BANNERS . " WHERE status = 1 AND banners_group = 'securitybadges' ORDER BY banners_sort_order ASC LIMIT 5");
	
	if ($banner->RecordCount() > 0) {

		while (!$banner->EOF) {
	
	if($banner->fields['banners_url']){
			$banner_string = '<div style="margin-left:20px;" class="flags"><a href="' . zen_href_link(FILENAME_REDIRECT, 'action=banner&goto=' . $banner->fields['banners_id']) . '" target="_blank">' . zen_image(DIR_WS_IMAGES . $banner->fields['banners_image'], $banner->fields['banners_title']) . '</a></div>';
			}else{
			$banner_string = '<div style="margin-left:20px;" class="flags">' . zen_image(DIR_WS_IMAGES . $banner->fields['banners_image'], $banner->fields['banners_title']) . '</div>';
	}
	if($banner->fields['banners_html_text']){
	$banner_string = '<div style="margin-left:20px;" class="flags">' . stripslashes($banner->fields['banners_html_text']) . '</div>';
	}
			echo $banner_string;
	
			zen_update_banner_display_count($banner->fields['banners_id']);
			$banner->MoveNext();
			
		}
	}
?>

		</div>
	</div>

	<!--bof-banner #5 display -->
	<?php
	  if (SHOW_BANNERS_GROUP_SET5 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET5)) {
	    if ($banner->RecordCount() > 0) {
	?>
		<div id="bannerFive" class="banners" style="display: none"><?php echo zen_display_banner('static', $banner); ?></div>
	<?php
	    }
	  }
	?>
	<!--eof-banner #5 display -->

	<!--bof- banner #6 display -->
	<?php
	  if (SHOW_BANNERS_GROUP_SET6 != '' && $banner = zen_banner_exists('dynamic', SHOW_BANNERS_GROUP_SET6)) {
	    if ($banner->RecordCount() > 0) {
	?>
		<div id="bannerSix" class="banners" style="display: none"><?php echo zen_display_banner('static', $banner); ?></div>
	<?php
	    }
	  }
	?>

</div>


<?php
} // flag_disable_footer
?>
<?php
  $nmx_disk_cache->cacheEnd();
}
?>
