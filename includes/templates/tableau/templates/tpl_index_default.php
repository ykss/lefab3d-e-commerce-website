<?php
  if ($nmx_disk_cache->cacheStart('tpl_index_default', array($_SESSION['languages_id']), true, true)) {  
?>
<?php
/**
 * Page Template
 *
 * Main index page<br />
 * Displays greetings, welcome text (define-page content), and various centerboxes depending on switch settings in Admin<br />
 * Centerboxes are called as necessary
 *
 * @package templateSystem
 * @copyright Copyright 2003-2006 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_index_default.php 3464 2006-04-19 00:07:26Z ajeh $
 */
?>

<!-- 
	1. Responsive slider
	Banners
-->
<div class="content--slider">
	<?php

		$banner = $db->Execute("SELECT banners_id, banners_title, banners_image, banners_html_text, banners_open_new_windows, banners_url FROM " . TABLE_BANNERS . " WHERE status = 1 AND banners_group = 'homepageslide' ORDER BY banners_sort_order ASC LIMIT 1");
		
		if ($banner->RecordCount() > 0) {
		
			echo '<div class="hero">';
		
			while (!$banner->EOF) {
		
				if (zen_not_null($banner->fields['banners_html_text'])) {
					$banner_string = $banner->fields['banners_html_text'];
				} else {
					if ($banner->fields['banners_url'] == '') {
						$banner_string = zen_image(DIR_WS_IMAGES . $banner->fields['banners_image'], $banner->fields['banners_title'], '', '', 'class="hero__image"');
					} else {
						if ($banner->fields['banners_open_new_windows'] == '1') {
							$banner_string = '<a class="hero__link" href="' . zen_href_link(FILENAME_REDIRECT, 'action=banner&goto=' . $banner->fields['banners_id']) . '" target="_blank" style="background-image:url(\''. DIR_WS_IMAGES . $banner->fields['banners_image'] . '\');"><div class="hero__link__cta">' . $banner->fields['banners_title'] . '</div></a>';
						} else {
							$banner_string = '<a class="hero__link" href="' . zen_href_link(FILENAME_REDIRECT, 'action=banner&goto=' . $banner->fields['banners_id']) . '" style="background-image:url(\''. DIR_WS_IMAGES . $banner->fields['banners_image'] . '\');"><div class="hero__link__cta">' . $banner->fields['banners_title'] . '</div></a>';
						}
					}
				}
		
				echo $banner_string;
		
				zen_update_banner_display_count($banner->fields['banners_id']);
				$banner->MoveNext();
				
			}
		
			echo '</div>';
		}
		
	?>
</div>

<?php

  /**
   * Require the home page product carousel
   */ 
    
  require( $template->get_template_dir('tpl_modules_hp_product_carousels.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_hp_product_carousels.php');

?>

<div class="wrapper--container">
	
	<div class="content--institucional">
	<!-- about us -->
	
	<?php
	$banner = $db->Execute("SELECT banners_html_text, banners_title FROM " . TABLE_BANNERS . " WHERE status = 1 AND banners_group = 'aboutus' LIMIT 1");
	if ($banner->RecordCount() > 0) {
		while (!$banner->EOF) {
			$banner_title = '<a>We are LeFab 3D</a>';//$banner->fields['banners_title'];
			$banner_html = $banner->fields['banners_html_text'];
			$banner_link = '<a href="' . zen_href_link(FILENAME_ABOUT_US, '', 'NONSSL') . '" class="content--read-more">Read More</a>';
			echo '<div class="content--column is-about-us"><div class="content-inner"><div class="content--header"><span class="ico is-about-us"></span><h3>'.$banner_title.'</h3><span class="content--intro">Buy our creative product!</span></div><div class="content--body"><p class="content--text">'.$banner_html.'</p><div class="links">'.$banner_link.'</div></div></div></div>';
			zen_update_banner_display_count($banner->fields['banners_id']);
			$banner->MoveNext();
		}
	}
?>
	
		<!-- end/about us -->
		
		
				<?php
$xml=(TABLEAU_BLOG_RSS_URL);
global $item_title, $item_link, $item_description, $item_date;

$xmlDoc = new DOMDocument();

$xml_test = $xmlDoc->load($xml);

if ($xml_test !== false) {
	$x=$xmlDoc->getElementsByTagName('item');
	
	for ($i=0; $i<1; $i++)
	
	{
	
		$item_title[$i] = $x->item($i)->getElementsByTagName('title')->item(0)->childNodes->item(0)->nodeValue;
		
		$item_link[$i] = $x->item($i)->getElementsByTagName('link')->item(0)->childNodes->item(0)->nodeValue;
		
		$item_description[$i] = $x->item($i)->getElementsByTagName('description')->item(0)->childNodes->item(0)->nodeValue;
		
		$item_date[$i] = $x->item($i)->getElementsByTagName('pubDate')->item(0)->childNodes->item(0)->nodeValue;
	
	}

?>

<!-- our blog -->
		<div class="content--column">
			<div class="content--header">
				<span class="ico is-blog"></span>
				<h3><?php echo TABLEAU_BLOG_TITLE ?></h3>
				<span class="content--intro">
					<?php echo zen_trunc_string($item_title[0], 36); ?>
				</span>
			</div>
			<div class="content--body">
	<!--span class="blogdate"><?php //echo date('D, j M Y', strtotime($item_date[0])); ?></span-->

					<p class="content--text"><?php echo zen_trunc_string($item_description[0], 150); ?></p>
					<?php } else { ?>
							<p><?php echo TEXT_HOME_INFO_UNCONNECTED; ?></p>
							<a href="/blog/" class="button"><?php echo TABLEAU_BLOG_BTN_TEXT; ?></a> 
					<?php } ?>
				<a href="<?php echo $item_link[0]; ?>" class="content--read-more" target="_blank"><?php echo TABLEAU_BLOG_BTN_TEXT; ?></a>
			</div>
		</div>
		<!-- end/our blog -->
		
		<!-- twitter feed -->
		<div class="content--column">
			<div class="content--header">
				<span class="ico is-twitter"></span>
				<h3><?php echo TABLEAU_TWITTER_TITLE ?></h3>
				<span class="content--intro">
					<a href="http://www.twitter.com/<?php echo TABLEAU_TWITTER_HANDLE; ?>" target="_blank"><?php echo TABLEAU_TWITTER_HANDLE; ?></a>
				</span>
			</div>
			<div class="content--body">
				<div class="tweet"></div> 
			</div>
		</div>
		<!-- end/twitter feed -->

	</div>
 
</div>
<?php
  $nmx_disk_cache->cacheEnd();
}
?>
