<?php
/**
 * Side Box Template
 * includes/templates/templates_default/sideboxes/YOUR_TEMPLATE/tpl_recent.php or includes/templates/templates_default/sideboxes/tpl_recent.php
 * Updated Harolds 2012-08-29
 *
 */
  $content = "";
  while(!$recent_products->EOF){

  $content .= '<div id="' . str_replace('_', '-', $box_id . 'Content') . '" class="sideBoxContent centeredContent">';
  $content .= '<a href="' . zen_href_link(zen_get_info_page($recent_products->fields["products_id"]), 'products_id=' . $recent_products->fields["products_id"]) . '">' .  zen_image(DIR_WS_IMAGES . $recent_products->fields['products_image'], $recent_products->fields['products_name'],SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT, 'class="recentProductsImage"') . '<div class="recently-viewed-product-title">' . $recent_products->fields['products_name'] . '</div></a>' ; 
  $content .= '</div>';
  $recent_products->MoveNext();
 }
 ?>