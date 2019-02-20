<?php
/**
 * breadcrumb Class.
 *
 * @package classes
 * @copyright Copyright 2003-2006 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: breadcrumb.php 3147 2006-03-10 00:43:57Z drbyte $
 */
if (!defined('IS_ADMIN_FLAG')) {
  die('Illegal Access');
}

class nmn_filters extends base {
  
  /*
   * Construct
   */
  function __construct() {

  }
  
  /**
   * Get all products from category Id
   * @param categoryId string
   * @return productId string
   */
  function getAllProductsFromCategoryId($categoryId) {
    global $db;
    
    // replace categories id if cid is valid
    if(isset($_GET['cid']) && !empty($_GET['cid'])) {
      $categoryId = str_replace('_', ',', $_GET['cid']);
    }
    
    //$sql = 'SELECT DISTINCT products_id FROM ' . TABLE_PRODUCTS . ' WHERE master_categories_id IN (' . $categoryId . ')';
    
    $sql = 'SELECT DISTINCT p2c.products_id FROM ' . TABLE_PRODUCTS_TO_CATEGORIES . ' p2c
            LEFT JOIN ' . TABLE_PRODUCTS . ' p ON (p.products_id = p2c.products_id) 
            WHERE p2c.categories_id IN (' . $categoryId . ')
            AND p.products_status = 1';

    // manufacturers
    if(isset($_GET['mid']) && !empty($_GET['mid'])) {
      $sql .= ' AND p.manufacturers_id = ' . $_GET['mid'];
    }
    
    $has_attribute = false;
    $allParams = zen_get_all_get_params(array('cPath', 'sort', 'alpha_filter_id', 'page', 'cid', 'mid', 'showall', 'sortby', 'disp_order', 'pfrom', 'pto','filter_id','cscroll'));
    $compareProductIds = $uniqueProductIds = array();
    if($allParams != '') {
      $paramsString = explode('&', $allParams);
      $optionValuesId = array();
      foreach($paramsString as $paramString) {
        $optionValueArray = explode('=', $paramString);
        $optionValuesId = array_merge($optionValuesId, explode('_', $optionValueArray[1]));
      }

      if(!empty($optionValuesId)) {
        foreach($optionValuesId as $valueId) {
          if(!empty($valueId)) {
            $has_attribute = true;
            $attributes_sql = 'SELECT DISTINCT products_id FROM ' . TABLE_PRODUCTS_ATTRIBUTES . ' WHERE options_values_id = ' . (int)$valueId;
            $product = $db->Execute($attributes_sql);
            $tempProductIds = array();
            while(!$product->EOF) {
              $tempProductIds[] = $product->fields['products_id'];
              $product->MoveNext();
            }
            if(empty($compareProductIds)) {
              $compareProductIds = $tempProductIds;
            } else {
              $compareProductIds = array_intersect($compareProductIds, $tempProductIds);
            }
            $uniqueProductIds = $compareProductIds;
          }
        }
      }
    }
    
    if(!empty($uniqueProductIds)) {
      $sql .= ' AND p.products_id IN (' . implode(',', $uniqueProductIds) . ')';
    } else if(empty($uniqueProductIds) && $has_attribute === true) {
      // if there is no any product when selected the options, the listing shows no product text
      $sql .= ' AND p.products_id = 0';
    }
    
    $products = $db->Execute($sql);
    $productArray = array();
    $productArray[] = 0; // set default product id = 0
    while(!$products->EOF) {
      $productArray[] = $products->fields['products_id'];
      $products->MoveNext();
    }
    return $productArray;
  }
  
  /**
   * Get all attributes from product Ids
   * @param productIds array
   * @return attributes array 
   */
  function getAllAttributesFromProductIds($productIds) {
    global $db;
    $sql = 'SELECT DISTINCT options_id, options_values_id FROM ' . TABLE_PRODUCTS_ATTRIBUTES . ' WHERE products_id IN (' . implode(',', $productIds) . ')';
    $attributes = $db->Execute($sql);
    $attributeArray = array();
    while(!$attributes->EOF) {
      
      // get name
      $option = $db->Execute('SELECT products_options_name FROM ' . TABLE_PRODUCTS_OPTIONS . ' WHERE products_options_id = ' . (int)$attributes->fields['options_id']);
      $optionValue = $db->Execute('SELECT products_options_values_name FROM ' . TABLE_PRODUCTS_OPTIONS_VALUES . ' WHERE products_options_values_id = ' . (int)$attributes->fields['options_values_id']);
      
      // process attribute parameters
      $class = 'no_active';
      $optionParameter = str_replace(array(" ", "/", "\n"), '_', strtolower($option->fields['products_options_name']));
      $optionParameterArray[$optionParameter] = array();
      $urlParams = $_REQUEST[$optionParameter];
      if(!empty($urlParams))   {
        $optionParameterArray[$optionParameter] = explode('_', $urlParams);
      }
      
      // get value id from parameters
      $valuesId = $attributes->fields['options_values_id'];
      if(!in_array($attributes->fields['options_values_id'], $optionParameterArray[$optionParameter])) {
        $valuesId = array_merge($optionParameterArray[$optionParameter], array($attributes->fields['options_values_id']));
      } else {
        $valuesId = array_diff($optionParameterArray[$optionParameter], array($attributes->fields['options_values_id']));
        $class = 'active';
      }
      $valuesId = implode('_', $valuesId);
      $attributeArray[$attributes->fields['options_id']]['name'] = $option->fields['products_options_name'];
      $attributeArray[$attributes->fields['options_id']]['options_values_id'][$attributes->fields['options_values_id']] = array(
        'name' => $optionValue->fields['products_options_values_name'],
        'option_parameter' =>  $optionParameter,
        'option_value' => $valuesId,
        'class' => $class
      );
      $attributes->MoveNext();
    }
    return $attributeArray;
  }
  
  /**
   * Get all categories id from products id
   * @param productIds array
   * @return categoriesIds array
   */
  function getAllCategoriesFromProductIds($productIds) {
    global $db;
    $sql = 'SELECT DISTINCT master_categories_id FROM ' . TABLE_PRODUCTS . ' WHERE products_id IN (' . implode(',', $productIds) . ')';
    $categories = $db->Execute($sql);
    $categoriesArray = array();
    while(!$categories->EOF) {
      
      $class = 'no_active';
      $optionParameterArray = array();
      if(!empty($_REQUEST['cid']))   {
        $optionParameterArray = explode('_', $_REQUEST['cid']);
      }
      
      // get value of cid
      $valuesId = $categories->fields['master_categories_id'];
      if(!in_array($categories->fields['master_categories_id'], $optionParameterArray)) {
        $valuesId = array_merge($optionParameterArray, array($categories->fields['master_categories_id']));
      } else {
        $valuesId = array_diff($optionParameterArray, array($categories->fields['master_categories_id']));
        $class = 'active';
      }
      
      // get categories name
      $categoryName = $db->Execute('SELECT categories_name FROM ' . TABLE_CATEGORIES_DESCRIPTION . ' WHERE categories_id = ' . $categories->fields['master_categories_id']);
      
      $valuesId = implode('_', $valuesId);
      $categoriesArray[$categories->fields['master_categories_id']] = array(
        'name' => $categoryName->fields['categories_name'],
        'value' => $valuesId,
        'class' => $class
      );
      $categories->MoveNext();
    }
    return $categoriesArray;
  }
  
  /**
   * Get all manufacturers from products id
   * @param productIds array
   * @return manufacturerIds array
   */
  function getAllManufacturersFromProductIds($productIds) {
    global $db;
    $sql = 'SELECT DISTINCT manufacturers_id FROM ' . TABLE_PRODUCTS . ' WHERE products_id IN (' . implode(',', $productIds) . ')';
    $manufacturers = $db->Execute($sql);
    $manufacturersArray = array();
    while(!$manufacturers->EOF) {
      
      $class = 'no_active';
      $optionParameterArray = array();
      if(!empty($_REQUEST['mid']))   {
        $optionParameterArray = explode('_', $_REQUEST['mid']);
      }
      
      // get value of cid
      $valuesId = $manufacturers->fields['manufacturers_id'];
      if(!in_array($manufacturers->fields['manufacturers_id'], $optionParameterArray)) {
        $valuesId = array_merge($optionParameterArray, array($manufacturers->fields['manufacturers_id']));
      } else {
        $valuesId = array_diff($optionParameterArray, array($manufacturers->fields['manufacturers_id']));
        $class = 'active';
      }
      
      // get categories name
      $manufacturerName = $db->Execute('SELECT manufacturers_name FROM ' . TABLE_MANUFACTURERS . ' WHERE manufacturers_id = ' . $manufacturers->fields['manufacturers_id']);
      
      $valuesId = implode('_', $valuesId);
      $manufacturersArray[$manufacturers->fields['manufacturers_id']] = array(
        'name' => $manufacturerName->fields['manufacturers_name'],
        'value' => $valuesId,
        'class' => $class
      );
      $manufacturers->MoveNext();
    }
    return $manufacturersArray;
  }
  
  /**
   * Get all attributes from categories id
   * @param $categories_id int
   * @return $attributes_array array
   */
  function getAllAttributesFromCategoryIds($categoryIds) {
    global $db;
    $products_id_sql = 'SELECT DISTINCT products_id FROM ' . TABLE_PRODUCTS . ' WHERE master_categories_id IN (' . $categoryIds . ')';
    $sql = 'SELECT DISTINCT options_id, options_values_id FROM ' . TABLE_PRODUCTS_ATTRIBUTES . ' WHERE products_id IN (' . $products_id_sql . ')';
    $attributes = $db->Execute($sql);
    $attributeArray = array();
    while(!$attributes->EOF) {
      
      // get name
      $option = $db->Execute('SELECT products_options_name FROM ' . TABLE_PRODUCTS_OPTIONS . ' WHERE products_options_id = ' . (int)$attributes->fields['options_id']);
      $optionValue = $db->Execute('SELECT products_options_values_name FROM ' . TABLE_PRODUCTS_OPTIONS_VALUES . ' WHERE products_options_values_id = ' . (int)$attributes->fields['options_values_id']);
      
      // process attribute parameters
      $class = 'no_active';
      $optionParameter = str_replace(array(" ", "/", "\n"), '_', strtolower($option->fields['products_options_name']));
      $optionParameterArray[$optionParameter] = array();
      $urlParams = $_REQUEST[$optionParameter];
      if(!empty($urlParams))   {
        $optionParameterArray[$optionParameter] = explode('_', $urlParams);
      }
      
      // get value id from parameters
      $valuesId = $attributes->fields['options_values_id'];
      if(!in_array($attributes->fields['options_values_id'], $optionParameterArray[$optionParameter])) {
        $valuesId = array_merge($optionParameterArray[$optionParameter], array($attributes->fields['options_values_id']));
      } else {
        $valuesId = array_diff($optionParameterArray[$optionParameter], array($attributes->fields['options_values_id']));
        $class = 'active';
      }
      $valuesId = implode('_', $valuesId);
      $attributeArray[$attributes->fields['options_id']]['name'] = $option->fields['products_options_name'];
      $attributeArray[$attributes->fields['options_id']]['options_values_id'][$attributes->fields['options_values_id']] = array(
        'name' => $optionValue->fields['products_options_values_name'],
        'option_parameter' =>  $optionParameter,
        'option_value' => $valuesId,
        'class' => $class
      );
      $attributes->MoveNext();
    }
    return $attributeArray;
  }
  
  /**
   * 
   */
  function getAllProductsFromProductIds($productIds) {
    global $db;
    $sql = 'SELECT DISTINCT products_id FROM ' . TABLE_PRODUCTS . ' WHERE products_status = 1';
    
    // manufacturers
    if(isset($_GET['mid']) && !empty($_GET['mid'])) {
      $sql .= ' AND manufacturers_id = ' . $_GET['mid'];
    }
    
    $has_attribute = false;
    $allParams = zen_get_all_get_params(array('cPath', 'sort', 'disp_order', 'alpha_filter_id', 'page', 'cid', 'mid', 'showall', 'sortby'));
    $compareProductIds = $uniqueProductIds = array();
    if($allParams != '') {
      $paramsString = explode('&', $allParams);
      $optionValuesId = array();
      foreach($paramsString as $paramString) {
        $optionValueArray = explode('=', $paramString);
        $optionValuesId = array_merge($optionValuesId, explode('_', $optionValueArray[1]));
      }

      if(!empty($optionValuesId)) {
        foreach($optionValuesId as $valueId) {
          if(!empty($valueId)) {
            $has_attribute = true;
            $attributes_sql = 'SELECT DISTINCT products_id FROM ' . TABLE_PRODUCTS_ATTRIBUTES . ' WHERE options_values_id = ' . (int)$valueId;
            $product = $db->Execute($attributes_sql);
            $tempProductIds = array();
            while(!$product->EOF) {
              $tempProductIds[] = $product->fields['products_id'];
              $product->MoveNext();
            }
            if(empty($compareProductIds)) {
              $compareProductIds = $tempProductIds;
            } else {
              $compareProductIds = array_intersect($compareProductIds, $tempProductIds);
            }
            $uniqueProductIds = $compareProductIds;
          }
        }
      }
    }
    
    $uniqueProductIds = array_intersect($productIds, $uniqueProductIds);
    //echo '<pre>';var_dump($uniqueProductIds);echo '</pre>';die;
    if(!empty($uniqueProductIds)) {
      $sql .= ' AND products_id IN (' . implode(',', $uniqueProductIds) . ')';
    } else if(!empty($productIds)) {      $sql .= ' AND products_id IN (' . implode(',', $productIds) . ')';    } else if(empty($uniqueProductIds) && $has_attribute === true) {
      // if there is no any product when selected the options, the listing shows no product text
      $sql .= ' AND products_id = 0';
    }    
    $products = $db->Execute($sql);
    $productArray = array();
    $productArray[] = 0; // set default product id = 0
    while(!$products->EOF) {
      $productArray[] = $products->fields['products_id'];
      $products->MoveNext();
    }
    return $productArray;
  }
  
  
}
