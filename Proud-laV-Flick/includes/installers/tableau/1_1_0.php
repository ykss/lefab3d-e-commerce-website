<?php
$template_options = $db->Execute("SELECT template_configuration_group_id FROM " . TABLE_TEMPLATE_CONFIG_GROUP . " WHERE template_configuration_group_title = 'tableau' ORDER BY template_configuration_group_id ASC;");
 
if ($template_options->RecordCount() > 0) {
  while (!$template_options->EOF) {
    $db->Execute("DELETE FROM " . TABLE_TEMPLATE_CONFIG . " WHERE template_configuration_group_id = " . $template_options->fields['template_configuration_group_id'] . ";");
    $db->Execute("DELETE FROM " . TABLE_TEMPLATE_CONFIG_GROUP . " WHERE template_configuration_group_id = " . $template_options->fields['template_configuration_group_id'] . ";");
    $template_options->MoveNext();
  }
}

$db->Execute("DELETE FROM " . TABLE_TEMPLATE_CONFIG . " WHERE template_configuration_key = '';");

$db->Execute("INSERT INTO " . TABLE_TEMPLATE_CONFIG_GROUP . " (template_configuration_group_title, template_group_description, sort_order, visible) VALUES ('tableau', 'Set Tableau Template Options', '1', '1');");
$template_options_group_id = $db->Insert_ID();

$db->Execute("UPDATE " . TABLE_TEMPLATE_CONFIG_GROUP . " SET sort_order = " . $template_options_group_id . " WHERE template_configuration_group_id = " . $template_options_group_id . ";");

$db->Execute("INSERT INTO " . TABLE_TEMPLATE_CONFIG . " (template_configuration_title, template_configuration_tab, template_configuration_tab_section, template_configuration_key, template_configuration_value, template_configuration_description, template_configuration_group_id, sort_order, set_function) VALUES
						('Body Background Color', 'Global', 'Styling', 'BODY_BACKGROUND_COLOR', '#FFFFFF', 'Body Background Color', " . $template_options_group_id . ", 1, NULL),
						('Body Headline Color', 'Global', 'Styling', 'BODY_HEADLINE_COLOR', '#000000', 'Body Headline Color', " . $template_options_group_id . ", 2, NULL),
						('Body Text Color', 'Global', 'Styling', 'BODY_TEXT_COLOR', '#000000', 'Body Headline Color', " . $template_options_group_id . ", 3, NULL),
						('Body Link Color', 'Global', 'Styling', 'BODY_LINK_COLOR', '#0000FF', 'Body Link Color', " . $template_options_group_id . ", 4, NULL),
						('Body Link Hover Color', 'Global', 'Styling', 'BODY_LINK_HOVER_COLOR', '#C0C0C0', 'Body Link Hover Color', " . $template_options_group_id . ", 5, NULL),
						('Logo Upload', 'Header', 'Logo Upload', 'LOGO_UPLOAD', 'logo.png', 'Upload your Logo (make sure that your images folder has write permissions):', " . $template_options_group_id . ", 0, 'zen_draw_file_field(\'logo\''),
						('Header Background Color', 'Header', 'Styling', 'HEADER_BG_COLOR', '#2e3233', 'Change your header background color', " . $template_options_group_id . ", 1, NULL),
						('Header Link Color', 'Header', 'Styling', 'HEADER_LINK_COLOR', '#e2e3df', 'Change your header link color', " . $template_options_group_id . ", 2, NULL),
						('Header Link Hover Color', 'Header', 'Styling', 'HEADER_LINK_HOVER_COLOR', '#caf200', 'Change your header link hover color', " . $template_options_group_id . ", 3, NULL),
						('Drop Down Background Color', 'Header', 'Styling', 'DROP_DOWN_BG_COLOR', '#e2e3df', 'Change your drop down background color', " . $template_options_group_id . ", 4, NULL),
						('Drop Down Link Color', 'Header', 'Styling', 'DROP_DOWN_LINK_COLOR', '#2e3233', 'Change your drop down link color', " . $template_options_group_id . ", 5, NULL),
						('Drop Down Link Hover Color', 'Header', 'Styling', 'DROP_DOWN_LINK_HOVER_COLOR', '#e2e3df', 'Change your drop down link hover color', " . $template_options_group_id . ", 6, NULL),
						('Banner Background Color', 'Banners', 'Styling', 'BANNER_BG_COLOR', 'rgba(46, 50, 51, 0.8)', 'Change Banner Background Color:', " . $template_options_group_id . ", 0, NULL),
						('Banner Text Color', 'Banners', 'Styling', 'BANNER_TXT_COLOR', '#ffffff', 'Change Banner Text Color:', " . $template_options_group_id . ", 1, NULL),
						('Footer Background Color', 'Footer', 'Styling', 'FTR_BG_COLOR', '#2e3233', 'Change Footer Background Color:', " . $template_options_group_id . ", 0, NULL),
						('Footer Text Color', 'Footer', 'Styling', 'FTR_TXT_COLOR', '#caf200', 'Change Footer Text Color:', " . $template_options_group_id . ", 1, NULL),
						('Footer Link Color', 'Footer', 'Styling', 'FTR_LINK_COLOR', '#e2e3df', 'Change Footer Link Color:', " . $template_options_group_id . ", 2, NULL),
						('Footer Link Hover Color', 'Footer', 'Styling', 'FTR_LINK_HOVER_COLOR', '#caf200', 'Change Footer Link Hover Color:', " . $template_options_group_id . ", 3, NULL),
						('Copyright Text', 'Footer', 'Copyright Text', 'FTR_COPYRIGHT', '&copy; ".STORE_NAME." ". date('Y')."', 'Change Copyright Text', " . $template_options_group_id . ", 4, 'text'),
						('Show Social Icons', 'Social Networking', 'Social Networking Status', 'SOCIAL_ICONS', 'true', 'Change Status of Social Icons:', " . $template_options_group_id . ", 0, 'truefalse'),
						('Facebook URL', 'Social Networking', 'URLS', 'FACEBOOK_URL', 'https://www.facebook.com/numinix', 'Change Facebook URL:', " . $template_options_group_id . ", 1, NULL),
						('Twitter URL', 'Social Networking', 'URLS', 'TWITTER_URL', 'http://twitter.com/numinix', 'Change Twitter URL:', " . $template_options_group_id . ", 2, NULL),
						('Google Plus URL', 'Social Networking', 'URLS', 'GOOGLE_PLUS_URL', 'https://plus.google.com/117475223233843437812', 'Change Google Plus URL:', " . $template_options_group_id . ", 3, NULL),
						('YouTube URL', 'Social Networking', 'URLS', 'YOUTUBE_URL', 'https://www.youtube.com/numinix', 'Change YouTube URL:', " . $template_options_group_id . ", 4, NULL),
						('Blog URL', 'Social Networking', 'URLS', 'BLOG_URL', 'http://www.numinix.com/blog/', 'Change Blog URL:', " . $template_options_group_id . ", 5, NULL)");
						
// remove old configuraition page
$configuration = $db->Execute("SELECT configuration_group_id FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_title = '" . BOX_CONFIGURATION_TABLEAU . "' ORDER BY configuration_group_id ASC;");
if ($configuration->RecordCount() > 0) {
  while (!$configuration->EOF) {
    $db->Execute("DELETE FROM " . TABLE_CONFIGURATION . " WHERE configuration_group_id = " . $configuration->fields['configuration_group_id'] . ";");
    $db->Execute("DELETE FROM " . TABLE_CONFIGURATION_GROUP . " WHERE configuration_group_id = " . $configuration->fields['configuration_group_id'] . ";");
    $configuration->MoveNext();
  }
}

$zc150 = (PROJECT_VERSION_MAJOR > 1 || (PROJECT_VERSION_MAJOR == 1 && substr(PROJECT_VERSION_MINOR, 0, 3) >= 5));

if ($zc150 && function_exists('zen_page_key_exists') && function_exists('zen_register_admin_page')) // continue Zen Cart 1.5.0
{
  	$db->Execute("DELETE FROM " . TABLE_ADMIN_PAGES . " WHERE page_key = 'configTableau' LIMIT 1;");
	// add configuration menu
	if (!zen_page_key_exists('configTableau'))
	{
		$configuration          = $db->Execute("SELECT template_configuration_group_id FROM " . TABLE_TEMPLATE_CONFIG . " WHERE template_configuration_key = 'TABLEAU_VERSION' LIMIT 1;");
		$configuration_group_id = $configuration->fields['template_configuration_group_id'];
		if ((int) $configuration_group_id > 0)
		{
			zen_register_admin_page('configTableau', 'BOX_CONFIGURATION_TABLEAU_OPTIONS', 'FILENAME_TEMPLATE_CONFIGURATION', '', 'tools', 'N', $configuration_group_id);
			
			$messageStack->add('Added to Template Configuration menu.', 'success');
		}
	}
}
