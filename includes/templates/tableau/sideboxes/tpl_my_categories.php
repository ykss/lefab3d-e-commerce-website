<?php

	$content = '';
	$content .= '<div id="categoriesContent" class="sideBoxContent">';
	$content .= $_SESSION['category_tree']->buildCategoryString('<ul class="{class}">{child}</ul>', '<li class="{class}"><a title="{name}" class="{class}" href="{link}"><span class="subArrow"></span>{name}</a>{child}</li>');

	if (SHOW_CATEGORIES_BOX_SPECIALS == 'true' or SHOW_CATEGORIES_BOX_PRODUCTS_NEW == 'true' or SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS == 'true' or SHOW_CATEGORIES_BOX_PRODUCTS_ALL == 'true') {

		$content .= '<ul>';

		if (SHOW_CATEGORIES_BOX_SPECIALS == 'true') {

			$show_this = $db->Execute("select s.products_id from " . TABLE_SPECIALS . " s where s.status= 1 limit 1");

			if ($show_this->RecordCount() > 0) {

				$content .= '<li class="level_1 no_sub"><a class="level_1 no_sub" href="' . zen_href_link(FILENAME_SPECIALS) . '">' . CATEGORIES_BOX_HEADING_SPECIALS . '</a></li>' . "\n";

			}

		}

		if (SHOW_CATEGORIES_BOX_PRODUCTS_NEW == 'true') {

			// display limits
			// $display_limit = zen_get_products_new_timelimit();
			$display_limit = zen_get_new_date_range();
			$show_this = $db->Execute("select p.products_id from " . TABLE_PRODUCTS . " p where p.products_status = 1 " . $display_limit . " limit 1");

			if ($show_this->RecordCount() > 0) {

				$content .= '<li class="level_1 no_sub"><a class="level_1 no_sub" href="' . zen_href_link(FILENAME_PRODUCTS_NEW) . '">' . CATEGORIES_BOX_HEADING_WHATS_NEW . '</a></li>' . "\n";

			}
		}

		if (SHOW_CATEGORIES_BOX_FEATURED_PRODUCTS == 'true') {

			$show_this = $db->Execute("select products_id from " . TABLE_FEATURED . " where status= 1 limit 1");

			if ($show_this->RecordCount() > 0) {

				$content .= '<li class="level_1 no_sub"><a class="level_1 no_sub" href="' . zen_href_link(FILENAME_FEATURED_PRODUCTS) . '">' . CATEGORIES_BOX_HEADING_FEATURED_PRODUCTS . '</a></li>' . "\n";

			}

		}

		if (SHOW_CATEGORIES_BOX_PRODUCTS_ALL == 'true') {

			$content .= '<li class="level_1 no_sub"><a class="level_1 no_sub" href="' . zen_href_link(FILENAME_PRODUCTS_ALL) . '">' . CATEGORIES_BOX_HEADING_PRODUCTS_ALL . '</a></li>' . "\n";

		}

		$content .= '</ul>';

	}

	$content .= '</div>';