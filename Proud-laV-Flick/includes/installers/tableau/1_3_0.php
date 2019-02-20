<?php
	$db->Execute("INSERT INTO " . TABLE_TEMPLATE_CONFIG . " (template_configuration_title, template_configuration_tab, template_configuration_tab_section, template_configuration_key, template_configuration_value, template_configuration_description, template_configuration_group_id, sort_order, set_function) VALUES 
			('Blog RSS URL', 'Home Page', 'Blog RSS Section', 'BLOG_RSS_URL', 'https://www.numinix.com/blog/feed/rss2', 'Change Blog RSS URL:', " . $template_options_group_id . ", 1, NULL),
			('Blog Section Title', 'Home Page', 'Blog RSS Section', 'BLOG_TITLE', 'Our Blog', 'Change Blog RSS Section Title:', " . $template_options_group_id . ", 1, NULL),
			('Blog Section Button Text', 'Home Page', 'Blog RSS Section', 'BLOG_BTN_TEXT', 'Read More', 'Change Blog Section Button Text:', " . $template_options_group_id . ", 1, NULL),
			('Twitter Feed Section Title', 'Home Page', 'Twitter Feed Section', 'TWITTER_TITLE', 'Twitter Feed', 'Change Twitter Feed Section Title:', " . $template_options_group_id . ", 1, NULL),
			('Twitter Handle', 'Home Page', 'Twitter Feed Section', 'TWITTER_HANDLE', '@tableau', 'Change Twitter Handle:', " . $template_options_group_id . ", 1, NULL)
		");
