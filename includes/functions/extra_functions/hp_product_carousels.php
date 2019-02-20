<?php

/**
 * Numinix Home Page Product Carousels
 * ===================================
 * This file contains all of the functions
 * needed for the plugin.
 */


/**
 * The following function is set up to
 * sort the positions of the tabs. It then
 * counts the number of tabs enabled, and
 * sets up a variable for the tabs width
 */

if (!function_exists('hp_product_carousel')) {
    function hp_product_carousel() {

        /**
         * Build an array of the positions of the different
         * sections that are provided within the ZC Configuration.
         * This can be found within the admin under 
         * admin => configuration => index. 
         *
         * In order to make this light weight, you need 
         * to insert the keys into the array in reverse 
         * alphabetical order.
         */

        $tab_position_array = array(
            'specials'      =>  SHOW_PRODUCT_INFO_MAIN_SPECIALS_PRODUCTS,   
            'new'           =>  SHOW_PRODUCT_INFO_MAIN_NEW_PRODUCTS,
            'featured'      =>  SHOW_PRODUCT_INFO_MAIN_FEATURED_PRODUCTS,
            'best_sellers'  =>  SHOW_PRODUCT_INFO_MAIN_BEST_SELLERS
        );


        /**
         * Filter array to remove any values of FALSE.
         */

        $tab_position_filtered_array = array_filter( $tab_position_array ); 
      

        /**
         * Sort the array based on it's position
         */

        asort( $tab_position_filtered_array );


        /**
         * Count all elements in array to determine how wide tabs should spread.
         * Once you have done that decide the width of tab content.
         */
        
        $tab_number = count( $tab_position_filtered_array );

        switch ( $tab_number ) {

            case '1' :
                $tab_col_width = 'one-col';
                break;

            case '2' :
                $tab_col_width = 'two-col';
                break;

            case '3' :
                $tab_col_width = 'three-col';
                break;

            case '4' :
                $tab_col_width = 'four-col';
                break;

            default :
                $tab_col_width = '';
                break;
        }


        /**
         * Create an array of the tab information
         * Once the array is created, return it.
         */

        $hp_tab_array = array(
            'tab_positions'     =>  $tab_position_filtered_array,
            'tab_number'        =>  $tab_number,
            'tab_col_width'     =>  $tab_col_width
        );

        return $hp_tab_array;

    }

}


/**
 * The following function is set up to
 * call the content for the different slides
 */
if (!function_exists('getProductsSlide')) { 
    function getProductsSlide($type, $language_id, $limit = 20) {
        global $db;
        $limitQuery = " LIMIT " . $limit;
        switch($type) {

        /**
         * Pull the content from the database
         * in order to print special products
         */
        case "specials":
            $sql = "SELECT p.products_id, p.products_image, pd.products_name, p.products_price,
                            p.master_categories_id
                           FROM (" . TABLE_PRODUCTS . " p
                           LEFT JOIN " . TABLE_SPECIALS . " s on p.products_id = s.products_id
                           LEFT JOIN " . TABLE_PRODUCTS_DESCRIPTION . " pd on p.products_id = pd.products_id )
                           WHERE p.products_id = s.products_id and p.products_id = pd.products_id and p.products_status = '1'
                           AND s.status = 1
                           AND pd.language_id = '" . $language_id . "'
                           ORDER BY s.specials_date_added ASC" . $limitQuery;

            break;

        /**
         * Pull the content from the database
         * in order to print featured products
         */
        case "featured":
            $sql = "SELECT p.products_id, p.products_type, pd.products_name, p.products_image, p.products_price, p.products_tax_class_id, p.products_date_added, m.manufacturers_name, p.products_model, p.products_quantity, p.products_weight, p.product_is_call,
                                    p.product_is_always_free_shipping, p.products_qty_box_status,
                                    p.master_categories_id
                                    FROM (" . TABLE_PRODUCTS . " p
                                    LEFT JOIN " . TABLE_MANUFACTURERS . " m on (p.manufacturers_id = m.manufacturers_id), " .
			  TABLE_PRODUCTS_DESCRIPTION . " pd
                                    LEFT JOIN " . TABLE_FEATURED . " f on pd.products_id = f.products_id )
                                    WHERE p.products_status = 1 and p.products_id = f.products_id and f.status = 1
                                    AND p.products_id = pd.products_id and pd.language_id = '" . $language_id . "'
                                    ORDER BY f.featured_date_added DESC " . $limitQuery;
            break;
        
        /**
         * Pull the content from the database
         * in order to print new products
         */
        case "new":
            $display_limit = zen_get_new_date_range();
            $sql = "SELECT p.products_id, p.products_type, pd.products_name, p.products_image, p.products_price,
                                      p.products_tax_class_id, p.products_date_added, m.manufacturers_name, p.products_model,
                                      p.products_quantity, p.products_weight, p.product_is_call,
                                      p.product_is_always_free_shipping, p.products_qty_box_status,
                                      p.master_categories_id
                               FROM " . TABLE_PRODUCTS . " p
                               LEFT JOIN " . TABLE_MANUFACTURERS . " m
                               ON (p.manufacturers_id = m.manufacturers_id), " . TABLE_PRODUCTS_DESCRIPTION . " pd
                               WHERE p.products_status = 1
                               AND p.products_id = pd.products_id
                               AND pd.language_id = '" . $language_id . "' " . $display_limit . "
                               ORDER BY p.products_date_added DESC " . $limitQuery;
            break;

        /**
         * Pull the content from the database
         * in order to print best seller products
         */
        case "best_sellers":
            $sql = "SELECT p.products_type, p.products_id, pd.products_name, p.products_image, p.products_price, p.products_tax_class_id,
                                      p.products_date_added, m.manufacturers_name, p.products_model, p.products_quantity, p.products_weight, p.product_is_call,
                                      p.product_is_always_free_shipping, p.products_qty_box_status,
                                      p.master_categories_id
                               FROM " . TABLE_PRODUCTS . " p
                               LEFT JOIN " . TABLE_MANUFACTURERS . " m ON (p.manufacturers_id = m.manufacturers_id), " . TABLE_PRODUCTS_DESCRIPTION . " pd
                               WHERE p.products_status = 1
                               AND p.products_id = pd.products_id
                               AND pd.language_id = '" . $language_id . "' ORDER BY p.products_ordered DESC" . $limitQuery;
            break;
        }//end switch

        /**
         * Use the database information pulled above
         * in order to set up an array with the
         * information we need to pull to print
         * the products
         */
        $productsSlide = $db->Execute($sql);
        $productSlideArray = array();
	    while(!$productsSlide->EOF) {
		    $productSlideArray[] = array(
			    "products_id" => $productsSlide->fields["products_id"],
			    "products_name" => $productsSlide->fields["products_name"],
			    "products_image" => $productsSlide->fields["products_image"],
			    "products_price" => zen_get_products_display_price($productsSlide->fields["products_id"])
        );
            $productsSlide->MoveNext();
        }
	    return $productSlideArray;  
    }
}