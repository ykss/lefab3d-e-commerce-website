<?php
/**
 * Common Template main_template_vars handler
 *
 * Normally a page will automatically load its own template based on the page name.<br />
 * so that a page called some_page will load tpl_some_page_default.php from the template directory.<br />
 * <br />
 * However sometimes a page may need to choose the template it displays based on a set of criteria.<br />
 * Placing a file in the includes/modules/pages/some_page/ directory called main_template_vars.php<br />
 * allows you to override this page and choose the template that loads.<br />
 *
 * @package templateSystem
 * @copyright Copyright 2003-2018 Zen Cart Development Team
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: mc12345678 Tue May 8 00:42:18 2018 -0400 Modified in v1.5.6 $
 */

  $zco_notifier->notify('NOTIFY_MAIN_TEMPLATE_VARS_START', $template_dir);

/**
 * set some variables used by templates
 */
  if (!isset($layoutType)) $layoutType = 'legacy';
  if (!isset($max_display_page_links)) $max_display_page_links = ($layoutType == 'mobile' ? MAX_DISPLAY_PAGE_LINKS_MOBILE : MAX_DISPLAY_PAGE_LINKS);
  if (!isset($paginateAsUL)) $paginateAsUL = $layoutType == 'mobile' || (isset($isMobile) && $isMobile) || (isset($isTablet) && $isTablet);
  if (!isset($flag_disable_left)) {
    $flag_disable_left = false;
  }
  if (!isset($flag_disable_right)) {
    $flag_disable_right = false;
  }

/**
 * load page-specific main_template_vars if present, or jump directly to template file
 */
  if (file_exists(DIR_WS_MODULES . 'pages/' . $current_page_base . '/main_template_vars.php')) {
    $body_code = DIR_WS_MODULES . 'pages/' . $current_page_base . '/main_template_vars.php';
  } else {
    $body_code = $template->get_template_dir('tpl_' . preg_replace('/.php/', '',$_GET['main_page']) . '_default.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_' . $_GET['main_page'] . '_default.php';
  }

  $zco_notifier->notify('NOTIFY_MAIN_TEMPLATE_VARS_END', $template_dir, $body_code);
