<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=product_info.<br />
 * Displays details of a typical product
 *
 * @package templateSystem
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_product_info_display.php 19690 2011-10-04 16:41:45Z drbyte $
 */
 //require(DIR_WS_MODULES . '/debug_blocks/product_info_prices.php');
?>
<div class="centerColumn" id="productGeneral">

<!--bof Form start-->
<?php echo zen_draw_form('cart_quantity', zen_href_link(zen_get_info_page($_GET['products_id']), zen_get_all_get_params(array('action')) . 'action=add_product', $request_type), 'post', 'enctype="multipart/form-data"') . "\n"; ?>
<!--eof Form start-->

<?php if ($messageStack->size('product_info') > 0) echo $messageStack->output('product_info'); ?>
<?php
  if ($nmx_disk_cache->cacheStart('tpl_product_info_display', '', true, true)) {  
?>
<!--bof Prev/Next top position -->
<?php if (PRODUCT_INFO_PREVIOUS_NEXT == 1 or PRODUCT_INFO_PREVIOUS_NEXT == 3) { ?>
<?php
/**
 * display the product previous/next helper
 */
require($template->get_template_dir('/tpl_products_next_previous.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_products_next_previous.php'); ?>
<?php } ?>
<!--eof Prev/Next top position-->

<div class="two-col-left back">

	<!--bof Main Product Image -->
	<?php
	  if (zen_not_null($products_image)) {
	  ?>
	<?php
	/**
	 * display the main product image
	 */
	   require($template->get_template_dir('/tpl_modules_main_product_image.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_main_product_image.php'); ?>
	<?php
	  }
	?>
	<!--eof Main Product Image-->
	
	<!--bof Additional Product Images -->
	<?php
	/**
	 * display the products additional images
	 */
	  require($template->get_template_dir('/tpl_modules_additional_images.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_additional_images.php'); ?>
	<!--eof Additional Product Images -->

	<!--bof also purchased products module-->
	<?php require($template->get_template_dir('tpl_modules_also_purchased_products.php', DIR_WS_TEMPLATE, $current_page_base,'templates'). '/' . 'tpl_modules_also_purchased_products.php');?>
	<!--eof also purchased products module-->
	
</div><!--EOF .two-col-left-->

<div class="two-col-right forward">

	<!--bof Product Name-->
	<h1 id="productName" class="productGeneral"><?php echo $products_name; ?></h1>
	<!--eof Product Name-->

	<div class="info-rating">

		<?php
		if ($flag_show_product_info_reviews == 1) {
		// if more than 0 reviews, then show reviews button; otherwise, show the "write review" button
		 if ($reviews->fields['count'] > 0 ) { ?>
		
		<?php
			echo '';

		 	if ($flag_show_product_info_reviews_count == 1) {
		 		$stars_image_suffix = str_replace('.', '_', zen_round($reviews_average_rating->fields['average_rating'] * 2, 0) / 2); 
				// for stars_0_5.gif, stars_1.gif, stars_1_5.gif etc.
				echo '<div class="rating-wrap rating-wrap--details">
					 		<span class="note-stars">' . zen_image(DIR_WS_TEMPLATE_IMAGES . 'stars_' . $stars_image_suffix . '.gif', sprintf(BOX_REVIEWS_TEXT_OF_5_STARS, $reviews_average_rating->fields['average_rating'])) . '</span>';
		   		echo '		<span class="note-numbers">(' . $reviews->fields['count'] . ')</span>';
		 		echo '</div>
		 			  <ul>
		 					<li><a href="#" id="show-reviews-tab">' . TEXT_READ_REVIEWS . '</a></li>
							<li><a href="' . zen_href_link(FILENAME_PRODUCT_REVIEWS_WRITE, zen_get_all_get_params(array())) . '">' . TEXT_WRITE_REVIEWS . '</a></li>
					  </ul>   
		 ';	
		} else {
		echo '';
		}
		?>
		
		<?php } else { ?>
			<?php echo '
			<ul>
				<li><a href="' . zen_href_link(FILENAME_PRODUCT_REVIEWS_WRITE, zen_get_all_get_params(array())) . '">Write a Review</a></li>
			</ul>'; ?>
		<?php
		}
		}
		?>

	</div><!--averageReviews-->

	
	<!--bof Attributes Module -->
	<?php
	  if ($pr_attr->fields['total'] > 0) {
	?>
	<?php
	/**
	 * display the product atributes
	 */
	  require($template->get_template_dir('/tpl_modules_attributes.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_attributes.php'); ?>
	<?php
	  }
	?>
	<!--eof Attributes Module -->
	<div id="price-cart-wrapper">
		<div id="price-wrapper" class="back">
			<!--bof Product Price block -->
			<h4 id="price-label" class="back"><?php echo TEXT_PRICE; ?></h4>
			<h2 id="productPrices" class="productGeneral">
			<?php
			// base price
			  if ($show_onetime_charges_description == 'true') {
			    $one_time = '<span >' . TEXT_ONETIME_CHARGE_SYMBOL . TEXT_ONETIME_CHARGE_DESCRIPTION . '</span><br />';
			  } else {
			    $one_time = '';
			  }
			  echo $one_time . ((zen_has_product_attributes_values((int)$_GET['products_id']) and $flag_show_product_info_starting_at == 1) ? TEXT_BASE_PRICE : '') . zen_get_products_display_price((int)$_GET['products_id']);
			?></h2>
			<!--eof Product Price block -->
		</div><!--EOF #price-wraper-->
		<!--bof Add to Cart Box -->
		<?php
		if (CUSTOMERS_APPROVAL == 3 and TEXT_LOGIN_FOR_PRICE_BUTTON_REPLACE_SHOWROOM == '') {
		  // do nothing
		} else {
		?>
		            <?php
		    $display_qty = (($flag_show_product_info_in_cart_qty == 1 and $_SESSION['cart']->in_cart($_GET['products_id'])) ? '<p>' . PRODUCTS_ORDER_QTY_TEXT_IN_CART . $_SESSION['cart']->get_quantity($_GET['products_id']) . '</p>' : '');
		            if ($products_qty_box_status == 0 or $products_quantity_order_max== 1) {
		              	// hide the quantity box and default to 1
		              	$the_button = '<input type="hidden" name="cart_quantity" value="1" /><span class="btn-add-cart">' . zen_draw_hidden_field('products_id', (int)$_GET['products_id']) . zen_image_submit(BUTTON_IMAGE_IN_CART, BUTTON_IN_CART_ALT) .'</span>';
		            } else {
		              	// show the quantity box
		    			$the_button = '<div class="qty-wrapper back"><div class="qty-text back">Qty:</div><input type="text" name="cart_quantity" value="' . (zen_get_buy_now_qty($_GET['products_id'])) . '" maxlength="6" size="4" /></div><span class="btn-add-cart">'. zen_draw_hidden_field('products_id', (int)$_GET['products_id']) . zen_image_submit(BUTTON_IMAGE_IN_CART, BUTTON_IN_CART_ALT) . '</span>
							<div class="qty-limits">
								'. zen_get_products_quantity_min_units_display((int)$_GET['products_id']) .'
							</div>
		    			';
		            }
		    $display_button = zen_get_buy_now_button($_GET['products_id'], $the_button);
		  ?>
		  <?php if ($display_qty != '' or $display_button != '') { ?>
		    <div id="cartAdd" class="back">
		    <?php
		      echo $display_qty;
		      echo $display_button;
		            ?>
	      </div>
	      <div class="clearBoth"></div>
		  <?php } // display qty and button ?>
		<?php } // CUSTOMERS_APPROVAL == 3 ?>
		<!--eof Add to Cart Box-->
	</div>
	
	<?php 
		if (FACEBOOK_LIKE_BUTTON_STATUS == 'true' && $_SERVER['https'] != 'on' || GOOGLE_PLUS_ONE_ENABLED == 'true' || PINTEREST_BUTTON_STATUS == 'true') { ?>
	<div class="social-wrapper">
		
		<!--BOF Facebook Button -->
			<div class="facebook-like-button">
			<?php 
			  if (FACEBOOK_LIKE_BUTTON_STATUS == 'true' && $_SERVER['https'] != 'on') {
			    require($template->get_template_dir('tpl_modules_facebook_like_button.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_facebook_like_button.php'); 
			  }
			?>
			</div>
		<!--EOF Facebook Button -->
		
		<!--BOF Google +1 Button -->
		<?php 
		  if (GOOGLE_PLUS_ONE_ENABLED == 'true') {
		    require($template->get_template_dir('tpl_modules_google_plus_one.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_google_plus_one.php'); 
		  }
		?>
		<!--EOF Google +1 Button -->
		
		<!-- Pin It Button BEGIN -->
		<?php
		  if (PINTEREST_BUTTON_STATUS == 'true') { 
		    require($template->get_template_dir('/tpl_modules_pin_it_button.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_pin_it_button.php');
		  } 
		?>
		<!-- Pin It Button END -->
		
	</div><!--EOF .social-wrapper-->
	<?php } ?>
	
	<div class="tabs minimal-2">
		<section class="tab-content">
			<h3 class="tab"><?php echo TEXT_TAB_ACCORDION_DESCRIPTION; ?></h3>
			<!--bof Product description -->
				<?php if ($products_description != '') { ?>
				<div id="productDescription" class="productGeneral biggerText"><?php echo stripslashes($products_description); ?></div>
				<?php } ?>
			<!--eof Product description -->
		</section>
		<!-- bof Product description 2 -->
		<?php if ($products_description2 != '') { ?>
			<section class="tab-content">
				<h3 class="tab"><?php echo TEXT_TAB_ACCORDION_SPECIFICATIONS; ?></h3>
					<div id="productDescription2" class="productGeneral biggerText"><?php echo stripslashes($products_description2); ?></div>
			</section>
		<?php } ?>
		<!-- eof Product description 2 -->
		<?php 
		if ( (($flag_show_product_info_model == 1 and $products_model != '') or ($flag_show_product_info_weight == 1 and $products_weight !=0) or ($flag_show_product_info_quantity == 1) or ($flag_show_product_info_manufacturer == 1 and !empty($manufacturers_name))) ) { ?>
		<section class="tab-content">
			<h3 class="tab"><?php echo TEXT_TAB_ACCORDION_FEATURES; ?></h3>
			<!--bof Product details list  -->
			
				<ul id="productDetailsList">
				  <?php echo (($flag_show_product_info_model == 1 and $products_model !='') ? '<li>' . TEXT_PRODUCT_MODEL . $products_model . '</li>' : '') . "\n"; ?>
				  <?php echo (($flag_show_product_info_weight == 1 and $products_weight !=0) ? '<li>' . TEXT_PRODUCT_WEIGHT .  $products_weight . TEXT_PRODUCT_WEIGHT_UNIT . '</li>'  : '') . "\n"; ?>
				  <?php echo (($flag_show_product_info_quantity == 1) ? '<li>' . $products_quantity . TEXT_PRODUCT_QUANTITY . '</li>'  : '') . "\n"; ?>
				  <?php echo (($flag_show_product_info_manufacturer == 1 and !empty($manufacturers_name)) ? '<li>' . TEXT_PRODUCT_MANUFACTURER . $manufacturers_name . '</li>' : '') . "\n"; ?>
				  	
				</ul>
		</section>
		<?php
			  }
		?>
		<!--bof Product Reviews -->
		
		<?php require($template->get_template_dir('/tpl_modules_reviews_product_info.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_reviews_product_info.php'); ?>
		
		<!--eof Product Reviews -->
	</div><!--EOF .tabs-minimal-->
	
	
</div><!--EOF .two-col-right-->





<!--bof free ship icon  -->
<?php if(zen_get_product_is_always_free_shipping($products_id_current) && $flag_show_product_info_free_shipping) { ?>
<div id="freeShippingIcon"><?php echo TEXT_PRODUCT_FREE_SHIPPING_ICON; ?></div>
<?php } ?>
<!--eof free ship icon  -->

 
<br class="clearBoth" />

<!--bof Quantity Discounts table -->
<?php
  if ($products_discount_type != 0) { ?>
<?php
/**
 * display the products quantity discount
 */
 require($template->get_template_dir('/tpl_modules_products_quantity_discounts.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_products_quantity_discounts.php'); ?>
<?php
  }
?>
<!--eof Quantity Discounts table -->

<!--bof Prev/Next bottom position -->
<?php if (PRODUCT_INFO_PREVIOUS_NEXT == 2 or PRODUCT_INFO_PREVIOUS_NEXT == 3) { ?>
<?php
/**
 * display the product previous/next helper
 */
 require($template->get_template_dir('/tpl_products_next_previous.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_products_next_previous.php'); ?>
<?php } ?>
<!--eof Prev/Next bottom position -->


<!--bof Product date added/available-->
<?php
  if ($products_date_available > date('Y-m-d H:i:s')) {
    if ($flag_show_product_info_date_available == 1) {
?>
  <p id="productDateAvailable" class="productGeneral centeredContent"><?php echo sprintf(TEXT_DATE_AVAILABLE, zen_date_long($products_date_available)); ?></p>
<?php
    }
  } else {
    if ($flag_show_product_info_date_added == 1) {
?>
      <p id="productDateAdded" class="productGeneral centeredContent"><?php echo sprintf(TEXT_DATE_ADDED, zen_date_long($products_date_added)); ?></p>
<?php
    } // $flag_show_product_info_date_added
  }
?>
<!--eof Product date added/available -->

<!--bof recent products module-->
   <?php require($template->get_template_dir ('tpl_modules_recent_products.php',DIR_WS_TEMPLATE, $current_page_base,'templates') . '/tpl_modules_recent_products.php'); ?>
<!--eof recent products module-->
<?php
  $nmx_disk_cache->cacheEnd();
}
?>
<!--bof Form close-->
</form>
<!--eof Form close-->
<div class="clearBoth"></div>
</div>