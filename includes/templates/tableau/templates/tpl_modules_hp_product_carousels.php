<?php
    /**
     * Pull the information needed from the hp product carousel
     * and set up variables with it.
     */

    $hp_product_carousel = hp_product_carousel();
    $tab_positions_array = $hp_product_carousel['tab_positions'];
    $tab_number = $hp_product_carousel['tab_number'];
    $tab_col_width = $hp_product_carousel['tab_col_width'];


    /**
     * If there is at least one tab, run a loop through the 
     * array to grab the positions in the correct order. 
     * Before doing so set up a counter so that we can tell 
     * if this is the first iteration. That way we know which 
     * one to apply the active class to on page load.
     */ 

    if ( $tab_number !== 0 ) :
?>

<div class="content--tabs-products">
    <div class="wrapper--container">
        <div id="tabs-wrapper">
            <ul id="infoTabs">

<?php
        $i = 0;

        foreach ( $tab_positions_array as $key => $tab_position ) :

            /**
             * Create tab id name. In order to do so I
             * need to make sure it is the correct case.
             */
            
            $tab_id_filter = 'tab' . ucwords( strtolower( str_replace( '_', ' ', $key ) ) ); 
            $tab_id = str_replace( ' ', '', $tab_id_filter );

            /**
             * Update key so that it is uppercase and then append
             * to constant variable.
             */

            $tab_name = strtoupper($key);

            $tab_name_constant = constant('TITLE_HOME_TAB_' . $tab_name);


            /**
             * Print out tab. If it is the first tab, then add
             * class active.
             */

            $active_class = '';

            if ( $i == 0 ) {
                $active_class = ' active';
            }

            $tab_properties = 'id="' . $tab_id . '" class="' . $tab_col_width  . $active_class . '"';
?>

                <li <?php echo $tab_properties; ?>>
                    <span><?php echo $tab_name_constant; ?></span>
                </li>

<?php    
            /**
            * Run counter
            */

            $i++;
    
        endforeach;
?>

            </ul><!-- /.infoTabs -->

<?php
        /**
         * Run a loop through the array to grab the 
         * content for the tabs that were printed above.
         * Before doing so reset counter so that we know
         * if this is the first iteration.
         */ 

        $i = 0;

        foreach ( $tab_positions_array as $key => $tab_position ) :

            /**  
             * Set up id for tabbed content
             */
        
            $tab_content_id_filter = 'tab' . ucwords( strtolower( str_replace('_', ' ', $key ) ) ) . 'Content';
            $tab_content_id = str_replace( ' ', '', $tab_content_id_filter );

            /**
             * Set variable for key to slider if best sellers
             */

            $slider_key = $key;

            /**
             * Print tabbed content. If this is the first iterartion,
             * apply normal images, else, lazy load them.
             */
?>   

            <div id="<?php echo $tab_content_id; ?>" class="tabContent">
                <ul class="productSlideInner">

<?php
            $specialSlide = getProductsSlide($slider_key, $_SESSION["languages_id"]);
            foreach($specialSlide as $product):
?>                       

                    <li class="slide">
                        <div class="prod_image">

<?php
                if( $i == 0 ) {
?>

                            <a class="slideProductImage" href="<?php echo zen_href_link(FILENAME_PRODUCT_INFO, "products_id=" . $product["products_id"]); ?>">
                                <?php echo zen_image(DIR_WS_IMAGES . $product["products_image"], $product["products_name"], 124, 124); ?>
                            </a>

<?php
                } else {
?>

                            <a class="slideProductImage" href="<?php echo zen_href_link(FILENAME_PRODUCT_INFO, "products_id=" . $product["products_id"]); ?>">
                                <img src="<?php echo DIR_WS_TEMPLATE . 'images/img_loading_tableau.gif" data-src="images/' . $product["products_image"]; ?>" alt="<?php echo $product["products_name"]; ?>" />
                            </a>

<?php
                }
?>

                        </div><!-- /.prod_image -->
                        <div class="prod-name">
                            <a class="slideProductName" href="<?php echo zen_href_link(FILENAME_PRODUCT_INFO, "products_id=" . $product["products_id"]); ?>">
                                <span><?php echo $product["products_name"]; ?></span>
                            </a>
                        </div><!-- /.prod-name -->
                        <div class="prod-price product-price">
                            <div class="price-container">
                                <?php echo $product["products_price"]; ?></span>
                            </div>
                        </div><!-- /.prod-price -->
                    </li><!-- /.slide -->

<?php
            endforeach;
?>

                </ul><!-- /.productSlideInner -->
            </div><!-- /.tabcontent -->

<?php                       
            /**
             * Run counter
             */

            $i++;
        
        endforeach;
?>
                    
        </div><!-- /.tabs-wrapper -->
    </div><!-- /.wrapper-container -->
</div><!-- /.content-tabs-products -->

<?php
    endif;
?>    
