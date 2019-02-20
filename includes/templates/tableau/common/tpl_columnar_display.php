<?php
/**
 * Common Template - tpl_columnar_display.php
 *
 * This file is used for generating tabular output where needed, based on the supplied array of table-cell contents.
 *
 * @package templateSystem
 * @copyright Copyright 2003-2006 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_columnar_display.php 3157 2006-03-10 23:24:22Z drbyte $
 */

?>
<?php
  if ($title) {
  ?>
<?php echo $title; ?>
<?php
 }
 ?>
 <ul class="productsContainer">
<?php
if (is_array($list_box_contents) > 0 ) {
 for($row=0;$row<sizeof($list_box_contents);$row++) {
    $params = "";
    //if (isset($list_box_contents[$row]['params'])) $params .= ' ' . $list_box_contents[$row]['params'];
?>
<?php
    for($col=0;$col<sizeof($list_box_contents[$row]);$col++) {
    	$product_listing_counter++;
      $r_params = "";
      if (isset($list_box_contents[$row][$col]['params'])) $r_params .= ' ' . (string)$list_box_contents[$row][$col]['params'];
     if (isset($list_box_contents[$row][$col]['text'])) {
?>
<?php
    
    $product_listing_two_column_style = '';
		$product_listing_three_column_style = '';
		$product_listing_four_column_style = '';
	
		// Two Rows
	
		if(($product_listing_counter % 2) == 1) {
			$product_listing_two_column_style = 'twoColOne ';
		}
	
		// Three Rows
	
		if(($product_listing_counter % 3) == 1) {
			$product_listing_three_column_style = 'threeColOne ';
		}
		
		// Four Rows
	
		if(($product_listing_counter % 4) == 1) {
			$product_listing_four_column_style = 'fourColOne ';
		}
		
		$product_listing_style =  $product_listing_two_column_style . $product_listing_three_column_style . $product_listing_four_column_style;
?>

    <?php
	//include("../functions/function_prices.php");
	echo '<li class="' . (sizeof($list_box_contents[$row]) == ($col+1) ? 'productListingL ' : 'productListing ') . $product_listing_style . 'back">';
	$prod_id = $list_box_contents[$row][$col]['product_id'];
	if ((zen_get_products_special_price($prod_id, false) != false) && (zen_get_products_special_price($prod_id, false) != zen_get_products_base_price($prod_id))) {
		echo '<div class="product-badge"><img src="' . DIR_WS_TEMPLATE . 'images/product_badge_sale.png" alt="Sale"></div>';	}	/* products created within last two weeks considered NEW */	elseif ($list_box_contents[$row][$col]['creation_date'] > (time() - 1209600)) {			echo '<div class="product-badge"><img src="' . DIR_WS_TEMPLATE . 'images/product_badge_new.png" alt="New"></div>';	}
	
	echo $list_box_contents[$row][$col]['text'];
	echo '</li>' . "\n";
	?>
<?php
      }
    }
?>
<?php
  }
}
?> 
</ul>
