<?php
/**
 * Side Box Template
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_information.php 2982 2006-02-07 07:56:41Z birdbrain $
 */
  $content = '';
  $content .= '<div id="' . str_replace('_', '-', $box_id . 'Content') . '">';
  
  // categories
  /*if(count($categories_array) > 0) {
    
    $content .= '<ul class="sideBoxContent">';
    $content .= '<li class="heading"><h5>Categories</h5></li>';
    $content .= '<li><ul>';
    $show_reset = false;
    foreach($categories_array as $id => $category) {
      $parameter = '';
      if(!empty($category['value'])) {
        $parameter = '&cid=' . $category['value'];
      }
      $content .= '<li><a class="' . $category['class'] . '" href="' . zen_href_link($_GET['main_page'], zen_get_all_get_params(array('sort', 'alpha_filter_id', 'page', 'cid')) . $parameter) . '"><span>' . $category['name'] . '</span></a></li>';
      if($category['class'] == 'active') {
        $show_reset = true;
      }
    }
    $content .= '</ul></li>';
    if($show_reset === true) {
      $content .= '<li><a href="' . zen_href_link($_GET['main_page'], zen_get_all_get_params(array('sort', 'alpha_filter_id', 'page', 'cid'))) . '">Reset</a></li>';
    }
    $content .= '</ul>';
  }*/
  
  // manufacturers
  /*
if(count($manufacturers_array) > 0) {
    
    $content .= '<ul class="sideBoxContent">';
    $content .= '<li class="heading"><h5>Manufacturers</h5></li>';
    $content .= '<li><ul>';
    $show_reset = false;
    foreach($manufacturers_array as $id => $manufacturer) {
      $parameter = '';
      if(!empty($manufacturer['value'])) {
        $parameter = '&mid=' . $manufacturer['value'];
      }
      $content .= '<li><a class="' . $manufacturer['class'] . '" href="' . zen_href_link($_GET['main_page'], zen_get_all_get_params(array('sort', 'alpha_filter_id', 'page', 'mid')) . $parameter) . '"><span>' . $manufacturer['name'] . '</span></a></li>';
      
      if($manufacturer['class'] == 'active') {
        $show_reset = true;
      }
    }
    $content .= '</ul></li>';
    if($show_reset === true) {
      $content .= '<li><a href="' . zen_href_link($_GET['main_page'], zen_get_all_get_params(array('sort', 'alpha_filter_id', 'page', 'mid'))) . '">Reset</a></li>';
    }
    $content .= '</ul>';
  }
*/
  
  // attributes
  if(count($flt_attributes) > 0) { 
    foreach($flt_attributes as $option_id => $option) {
      $content .= '<ul class="sideBoxContent">';
      $content .= '<li class="heading"><h5><span>' . $option['name'] . '<span></h5></li>';
      $content .= '<li><ul>';
      $show_reset = false;
      foreach($option['options_values_id'] as $options_value_id => $option_value_name) {
        $parameter = '';
        if(!empty($option_value_name['option_value'])) {
          $parameter = '&' . $option_value_name['option_parameter'] . '=' . $option_value_name['option_value'];
        }
        $content .= '<li><a class="' . $option_value_name['class'] . '" href="' . zen_href_link($_GET['main_page'], zen_get_all_get_params(array('sort', 'alpha_filter_id', 'page', $option_value_name['option_parameter'])) . $parameter) . '"><span class="box"></span><span>' . $option_value_name['name'] . '</span></a></li>';
        
        if($option_value_name['class'] == 'active') {
          $show_reset = true;
        }
        
      }
      $content .= '</ul></li>';
      if($show_reset === true) {
        $content .= '<li><a class="filter-reset" href="' . zen_href_link($_GET['main_page'], zen_get_all_get_params(array('sort', 'alpha_filter_id', 'page', $option_value_name['option_parameter']))) . '">Reset</a></li>';
      }
      $content .= '</ul>';
    }
  }
  $content .= '</div>';