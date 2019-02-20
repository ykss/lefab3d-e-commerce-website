<?php
/**
 * Page Template
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_reviews_default.php 2905 2006-01-28 01:25:36Z birdbrain $
 */
?>

<div class="centerColumn" id="reviewsDefault">

    <h1 id="reviewsDefaultHeading"><?php echo $breadcrumb->last();  ?></h1>

    <div class="review">
        <?php
          if ($reviews_split->number_of_rows > 0) {
            if ((PREV_NEXT_BAR_LOCATION == '1') || (PREV_NEXT_BAR_LOCATION == '3')) {
        ?>
        <div class="review-list-tools">
            <div class="navSplitPagesResult"><?php echo $reviews_split->display_count(TEXT_DISPLAY_NUMBER_OF_REVIEWS); ?></div>
            <div class="navSplitPagesLinks"><?php echo TEXT_RESULT_PAGE . ' ' . $reviews_split->display_links(MAX_DISPLAY_PAGE_LINKS, zen_get_all_get_params(array('page', 'info', 'main_page'))); ?></div>
        </div>

        <ul>
        <?php
            }

            $reviews = $db->Execute($reviews_split->sql_query);
            while (!$reviews->EOF) {
        ?>

            <li>
                <div class="col">
                    <div id="productMainImage">
                        <?php echo '<a href="' . zen_href_link(zen_get_info_page($reviews->fields['products_id']), 'products_id=' . $reviews->fields['products_id']) . '">' . zen_image(DIR_WS_IMAGES . $reviews->fields['products_image'], $reviews->fields['products_name'], SMALL_IMAGE_WIDTH, SMALL_IMAGE_HEIGHT) . '</a>'; ?>
                    </div>
                </div>
                <div class="col">
                    <h2><?php echo $reviews->fields['products_name']; ?></h2>
                    
                    <div class="comment">
                        <div class="user">
                            <span class="rating"><?php echo zen_image(DIR_WS_TEMPLATE_IMAGES . 'stars_' . $reviews->fields['reviews_rating'] . '.gif', sprintf(TEXT_OF_5_STARS, $reviews->fields['reviews_rating'])), sprintf(TEXT_OF_5_STARS, $reviews->fields['reviews_rating']); ?></span>  
                            <span class="user-name"><?php echo sprintf(TEXT_REVIEW_BY, zen_output_string_protected($reviews->fields['customers_name'])); ?></span>
                        </div>
                        <?php echo nl2br(zen_output_string_protected(stripslashes($reviews->fields['reviews_text'])))?>
                        <!-- ?php echo '<a href="' . zen_href_link(FILENAME_PRODUCT_REVIEWS_INFO, 'products_id=' . $reviews->fields['products_id'] . '&reviews_id=' . $reviews->fields['reviews_id']) . '">' . zen_image_button(BUTTON_IMAGE_READ_REVIEWS , BUTTON_READ_REVIEWS_ALT) . '</a>'; ?-->
                    </div> 
                    
                </div>
            </li>



        <?php
              $reviews->MoveNext();
            }
        ?>

        <?php
          } else {
        ?>
            <li id="reviewsDefaultNoReviews" class="content"><?php echo TEXT_NO_REVIEWS; ?></li>
        <?php
          }
        ?>
        </ul>
        
        <?php
            if (($reviews_split->number_of_rows > 0) && ((PREV_NEXT_BAR_LOCATION == '2') || (PREV_NEXT_BAR_LOCATION == '3'))) {
        ?>
            <div class="review-list-tools">
                <div class="navSplitPagesResult"><?php echo $reviews_split->display_count(TEXT_DISPLAY_NUMBER_OF_REVIEWS); ?></div>
                <div class="navSplitPagesLinks"><?php echo TEXT_RESULT_PAGE . ' ' . $reviews_split->display_links(MAX_DISPLAY_PAGE_LINKS, zen_get_all_get_params(array('page', 'info', 'main_page'))); ?></div>
            </div>
        <?php 
            }
        ?>
    </div>

</div>
