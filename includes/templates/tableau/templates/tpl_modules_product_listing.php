<?php
/**
 * Module Template
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_modules_product_listing.php 3241 2006-03-22 04:27:27Z ajeh $
 * UPDATED TO WORK WITH COLUMNAR PRODUCT LISTING 04/04/2006
 */
 include(DIR_WS_MODULES . zen_get_module_directory(FILENAME_PRODUCT_LISTING));
?>
<div id="productListing">

<div class="tools-product-listing">

	<div class="sort-listings-wrapper">
		<?php echo zen_draw_form('sortbyform', zen_href_link($_GET['main_page'], zen_get_all_get_params(), $request_type, false), 'get') . zen_hide_session_id();?>
		<?php 
			$sortbyparams = explode('&', zen_get_all_get_params(array('sortby', 'sort')));
			foreach($sortbyparams as $param) {
		  		$param = explode('=', $param);
		  		echo zen_draw_hidden_field($param[0], $param[1]);
		}
		?>
		<label>Sort By:</label>
		<?php 
			$sortby_array = array(
           array('id' => 0, 'text' => 'Default'),
			  array('id' => 1, 'text' => 'Newest First'),
			  array('id' => 2, 'text' => 'Most Popular'),
			  array('id' => 3, 'text' => 'Price (High to Low)'),
			  array('id' => 4, 'text' => 'Price (Low to High)'),
			  array('id' => 5, 'text' => 'Name (A-Z)'),
			  array('id' => 6, 'text' => 'Name (Z-A)'),
			);
			echo zen_draw_pull_down_menu('sortby', $sortby_array, $_GET['sortby'], 'onchange="this.form.submit();"');
		?>
		<?php echo '</form>';?>
	</div><!--EOF .sort-listings-wrapper-->

	<?php if($_GET['showall'] == 1) {?>
			
		<!-- show less products -->
		<a href="<?php echo zen_href_link($_GET['main_page'], zen_get_all_get_params(array('showall', 'page', 'main_page', 'sort', 'showall')))?>" class="show-less">View Less</a>
		<!-- end/show less products -->

	<?php }?> 

	<?php if ( ($listing_split->number_of_rows > 0) && ( (PREV_NEXT_BAR_LOCATION == '1') || (PREV_NEXT_BAR_LOCATION == '3') ) ) {?>
		
		<!-- disclaimer -->
		<span class="quantity-products"><?php echo $listing_split->display_count(TEXT_DISPLAY_NUMBER_OF_PRODUCTS); ?></span>
		<!-- end/disclaimer -->
		
		<!-- show all products -->
		<a class="show-all" href="<?php echo zen_href_link($_GET['main_page'], zen_get_all_get_params(array('showall', 'page', 'main_page', 'sort')) . '&showall=1')?>">View All</a>
		<!-- end/show all products -->
		
		<!-- pagination -->
		<div class="links-pagination"><?php echo TEXT_RESULT_PAGE . ' ' . $listing_split->display_links(MAX_DISPLAY_PAGE_LINKS, zen_get_all_get_params(array('page', 'info', 'x', 'y', 'main_page'))); ?></div>
		<!-- end/pagination -->
	<?php }?>

</div>

<?php
// only show when there is something to submit and enabled
    if ($show_top_submit_button == true) {
?>
<div class="buttonRow top-add-cart"><?php echo zen_image_submit(BUTTON_IMAGE_ADD_PRODUCTS_TO_CART, BUTTON_ADD_PRODUCTS_TO_CART_ALT, 'id="submit1" name="submit1"'); ?></div>
<?php
    } // show top submit
?>

<?php
/**
 * load the list_box_content template to display the products
 */
if (PRODUCT_LISTING_LAYOUT_STYLE == 'columns') {
  require($template->get_template_dir('tpl_columnar_display.php',DIR_WS_TEMPLATE, $current_page_base,'common'). '/tpl_columnar_display.php');
} else {// (PRODUCT_LISTING_LAYOUT_STYLE == 'rows')
  require($template->get_template_dir('tpl_tabular_display.php',DIR_WS_TEMPLATE, $current_page_base,'common'). '/tpl_tabular_display.php');
}
?>

<?php
// only show when there is something to submit and enabled
    if ($show_bottom_submit_button == true) {
?>
	<div class="buttonRow forward bottom-add-cart"><?php echo zen_image_submit(BUTTON_IMAGE_ADD_PRODUCTS_TO_CART, BUTTON_ADD_PRODUCTS_TO_CART_ALT, 'id="submit2" name="submit1"'); ?></div>
<?php
    } // show_bottom_submit_button
?>

<?php if ( ($listing_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '2') || (PREV_NEXT_BAR_LOCATION == '3')) ) {
?>
<div class="tools-product-listing tools-bottom">
	<span class="quantity-products"><?php echo $listing_split->display_count(TEXT_DISPLAY_NUMBER_OF_PRODUCTS); ?></span>
	<a class="show-all" href="<?php echo zen_href_link($_GET['main_page'], zen_get_all_get_params(array('showall', 'page', 'main_page', 'sort')) . '&showall=1')?>">View All</a>
	<div class="links-pagination"><?php echo TEXT_RESULT_PAGE . ' ' . $listing_split->display_links(MAX_DISPLAY_PAGE_LINKS, zen_get_all_get_params(array('page', 'info', 'x', 'y', 'main_page'))); ?></div>
</div>
<?php
  }
?>
</div>

<?php
// if ($show_top_submit_button == true or $show_bottom_submit_button == true or (PRODUCT_LISTING_MULTIPLE_ADD_TO_CART != 0 and $show_submit == true and $listing_split->number_of_rows > 0)) {
  if ($show_top_submit_button == true or $show_bottom_submit_button == true) {
?>
</form>
<?php } ?>
</div>
