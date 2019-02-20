<?php
/**
 * Page Template
 *
 * @package templateSystem
 * @copyright Copyright 2003-2012 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version GIT: $Id: Author: DrByte  Sun Aug 19 09:47:29 2012 -0400 Modified in v1.5.1 $
 */
?>
<?php require(DIR_WS_MODULES . zen_get_module_directory(FILENAME_MAIN_PRODUCT_IMAGE)); ?>

<h1 id="reviewsDefaultHeading"><?php echo $breadcrumb->last();  ?></h1>

<div class="review">

    <div class="header">
        <div class="product-image-review">
            <!--bof Main Product Image -->
            <div id="productMainImage2">
                <?php echo '<a href="' . zen_href_link(zen_get_info_page($_GET['products_id']), 'products_id=' . $_GET['products_id']) . '">' . zen_image($products_image_medium, addslashes($products_name), MEDIUM_IMAGE_WIDTH, MEDIUM_IMAGE_HEIGHT, 'itemprop="image"') . '</a>'; ?>
            </div>
            <?php echo zen_draw_form('product_reviews_write', zen_href_link(FILENAME_PRODUCT_REVIEWS_WRITE, 'action=process&products_id=' . $_GET['products_id'], 'SSL'), 'post', 'onsubmit="return checkForm(product_reviews_write);"'); ?>
            
                <?php
                    if (zen_not_null($products_image)) {?>
                      
                      <?php
                          /* display the main product image */
                          require($template->get_template_dir('/tpl_modules_main_product_image.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_main_product_image.php');
                      ?>

                <?php
                    //} else {
                ?>

            <?php } ?>

            
            <!--eof Main Product Image-->
        </div>
        <!-- end/images -->

        <div class="product-info">
            <h1 id="reviewsWriteHeading"><?php echo $products_name . $products_model; ?></h1>
            <!-- <h2 id="reviewsWritePrice"><?php echo $products_price; ?></h2> -->
        </div>
        <!-- end/product-info -->

        <!-- <div class="links">
            <?php echo '<a href="' . zen_href_link(zen_get_info_page($_GET['products_id']), zen_get_all_get_params()) . '">' . zen_image_button(BUTTON_IMAGE_GOTO_PROD_DETAILS , BUTTON_GOTO_PROD_DETAILS_ALT) . '</a>'; ?>
            <?php echo '<a href="' . zen_href_link(FILENAME_REVIEWS) . '">' . zen_image_button(BUTTON_IMAGE_REVIEWS, BUTTON_REVIEWS_ALT) . '</a>'; ?>
        </div> -->
        <!-- end/links -->
    </div>

    <div class="col">
        
        <?php if ($messageStack->size('review_text') > 0) echo $messageStack->output('review_text'); ?>

        <div class="form-review">
            
            <div class="form-field">
                <label id="reviewsWriteReviewsRate" class="center"><?php echo SUB_TITLE_RATING; ?>:</label>

                <div class="ratingRow">
                    <ul>
                        <li>
                            <?php echo zen_draw_radio_field('rating', '1', '', 'id="rating-1" class="star"'); ?>
                            <!--?php echo '<label class="" for="rating-1">' . zen_image($template->get_template_dir(OTHER_IMAGE_REVIEWS_RATING_STARS_ONE, DIR_WS_TEMPLATE, $current_page_base,'images'). '/' . OTHER_IMAGE_REVIEWS_RATING_STARS_ONE, OTHER_REVIEWS_RATING_STARS_ONE_ALT) . '</label> '; ?-->
                        </li>
                        <li>
                            <?php echo zen_draw_radio_field('rating', '2', '', 'id="rating-2" class="star"'); ?>
                            <!-- ?php echo '<label class="" for="rating-2">' . zen_image($template->get_template_dir(OTHER_IMAGE_REVIEWS_RATING_STARS_TWO, DIR_WS_TEMPLATE, $current_page_base,'images'). '/' . OTHER_IMAGE_REVIEWS_RATING_STARS_TWO, OTHER_REVIEWS_RATING_STARS_TWO_ALT) . '</label>'; ?-->
                        </li>
                        <li>
                            <?php echo zen_draw_radio_field('rating', '3', '', 'id="rating-3" class="star"'); ?>
                            <!--?php echo '<label class="" for="rating-3">' . zen_image($template->get_template_dir(OTHER_IMAGE_REVIEWS_RATING_STARS_THREE, DIR_WS_TEMPLATE, $current_page_base,'images'). '/' . OTHER_IMAGE_REVIEWS_RATING_STARS_THREE, OTHER_REVIEWS_RATING_STARS_THREE_ALT) . '</label>'; ?-->
                        </li>
                        <li>
                            <?php echo zen_draw_radio_field('rating', '4', '', 'id="rating-4" class="star"'); ?>
                        </li>

                        <li>
                            <?php echo zen_draw_radio_field('rating', '5', '', 'id="rating-5" class="star"'); ?>
                            <!--?php echo '<label class="" for="rating-5">' . zen_image($template->get_template_dir(OTHER_IMAGE_REVIEWS_RATING_STARS_FIVE, DIR_WS_TEMPLATE, $current_page_base,'images'). '/' . OTHER_IMAGE_REVIEWS_RATING_STARS_FIVE, OTHER_REVIEWS_RATING_STARS_FIVE_ALT) . '</label>'; ? -->
                        </li>
                    </ul>
                </div>
            </div>

            <div class="form-field">
                <label id="textAreaReviews" for="review-text"><?php echo SUB_TITLE_REVIEW; ?>:</label>
                <?php echo zen_draw_textarea_field('review_text', 60, 5, '', 'id="review-text"'); ?>
                <?php echo zen_draw_input_field('should_be_empty', '', ' size="60" id="RAS" style="visibility:hidden; display:none;" autocomplete="off"'); ?>
            </div>

            <div class="buttonRow">
                <?php echo zen_image_submit(BUTTON_IMAGE_SUBMIT, BUTTON_SUBMIT_ALT); ?>
            </div>
            
            <div id="reviewsWriteReviewsNotice" class="notice"><?php echo TEXT_NO_HTML . (REVIEWS_APPROVAL == '1' ? '<br />' . TEXT_APPROVAL_REQUIRED: ''); ?></div>
        </div>
        <!-- end/form-review -->

    </div>
    <!-- end/first-col -->

    <div class="col second">
        
        <h3>To Write a Review:</h3>

        <ul class="styled">
            <li>Be detailed and specific. What would you have wanted to know before you purchased the product?</li>
            <li>Not too short and not too long. Aim for between 75 and 300 words.</li>
        </ul>

        <h3>Do Not Include:</h3>

        <ul class="styled">
            <li>Info that changes, such as price and promotional details</li>
            <li>Inappropriate language and attitude</li>
            <li>Info about other companies and websites</li>
            <li>Personal info (such as your e-mail or phone number)</li>
        </ul>

    </div>
    <!-- end/second-col -->

</div>
