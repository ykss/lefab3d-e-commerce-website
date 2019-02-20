<?php
/**
 * Module Template - categories_tabs with dropdown product menus
 *
 * Template stub used to display categories-tabs output
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_modules_categories_tabs.php 3395 2011-06-10 21:13:00Z dbltoe $
 */
?>
<?php
if (CATEGORIES_TABS_STATUS == '1') 
{

	echo '<ul class="sub-menu">' . "\n";

	$categories_tab_query = "SELECT c.categories_id, cd.categories_name FROM ".TABLE_CATEGORIES." c, ".TABLE_CATEGORIES_DESCRIPTION . " cd WHERE c.categories_id = cd.categories_id AND c.parent_id= '0' AND cd.language_id='" . (int)$_SESSION['languages_id'] . "' AND c.categories_status='1' ORDER BY c.sort_order, cd.categories_name;";
	$categories_tab = $db->Execute($categories_tab_query);
  	
  	$cPath = explode('_', $_GET['cPath']);
	while (!$categories_tab->EOF) 
	{

      $subcategories_tab_query="SELECT c.categories_id, cd.categories_name FROM ".TABLE_CATEGORIES." c, ".TABLE_CATEGORIES_DESCRIPTION . " cd WHERE c.categories_id=cd.categories_id AND c.parent_id= '".(int)$categories_tab->fields['categories_id']."' AND cd.language_id='" . (int)$_SESSION['languages_id'] . "' AND c.categories_status='1' ORDER BY c.sort_order, cd.categories_name;";
      $subcategories_tab=$db->Execute($subcategories_tab_query);
	  // currently selected category
      $dropdownmenu_current = (($categories_tab->fields['categories_id'] == current($cPath)) || ($categories_tab->fields['categories_id'] == 55 && $_GET['main_page'] == FILENAME_BEST_SELLERS) ? ' ddmCurrent' : '');
      echo '<li' . ($subcategories_tab->RecordCount() > 0 ? ' class="topmenu hasSub no-js' . $dropdownmenu_current . '"' : '') . '>';
      //echo '<a class="category-top" href="'.zen_href_link(FILENAME_DEFAULT,'cPath=' . (int)$categories_tab->fields['categories_id']).'">'; 
      echo '<a class="category-top" href="'.zen_href_link(FILENAME_DEFAULT,'cPath=' . (int)$categories_tab->fields['categories_id']).'">';
      echo htmlentities($categories_tab->fields['categories_name'], ENT_QUOTES, 'UTF-8');
      echo '</a>' . "\n";
		  //echo '</a>' . "\n";

		  if($subcategories_tab->RecordCount() > 0)
		  {
			  echo '<ul class="sub--sub-menu">' . "\n";

			  while (!$subcategories_tab->EOF) 
			  {
		  		
				  $cPath_new=zen_get_path($subcategories_tab->fields['categories_id']);
				  $cPath_new=str_replace('=0_', '=', $cPath_new);
				  $cPath_new="cPath=".$subcategories_tab->fields['categories_id'];
				  echo '<li>'.'<a href="' . zen_href_link(FILENAME_DEFAULT, $cPath_new) . '">'.htmlentities($subcategories_tab->fields['categories_name'], ENT_QUOTES, 'UTF-8').'</a></li>' . "\n";
				  $subcategories_tab->MoveNext();
			  }
			  echo '</ul>' . "\n";
		  }
		  $products_tab_query="SELECT p.`products_id`, pd.`products_name`, pd.`language_id` FROM ".TABLE_PRODUCTS." p, ".TABLE_PRODUCTS_DESCRIPTION." pd WHERE p.`master_categories_id`='".(int)$categories_tab->fields['categories_id']."' AND p.`products_id`=pd.`products_id` AND p.products_status='1' AND pd.`language_id`='".(int)$_SESSION['languages_id']."' ORDER BY p.`products_sort_order`;";
		  $products_tab=$db->Execute($products_tab_query);
		  if($products_tab->RecordCount()>0)
		  {
			  echo '<ul class="sub--sub-menu">' . "\n";
			  while (!$products_tab->EOF) 
			  {	
				  $cPath_new=zen_get_path($categories->fields['categories_id']);
				  $cPath_new=str_replace('=0_', '=', $cPath_new);
				  echo '<li>'.'<a href="'.zen_href_link(zen_get_info_page($products_tab->fields['products_id']),$cPath_new. '&products_id=' . $products_tab->fields['products_id']) . '">'.htmlentities($products_tab->fields['products_name']).'</a></li>' . "\n";
				  $products_tab->MoveNext();
			  }
			  echo '</ul>' . "\n";
		  }
		  echo '</li>' . "\n";
    
		$categories_tab->MoveNext();
	}
  
	echo '</ul>' . "\n";
}
?>
