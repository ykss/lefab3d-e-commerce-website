<?php

// Create Template Configuration Group

$db->Execute("CREATE TABLE IF NOT EXISTS " . TABLE_TEMPLATE_CONFIG_GROUP . " (
	`template_configuration_group_id` int(11) NOT NULL AUTO_INCREMENT,
	`template_configuration_group_title` varchar(64) NOT NULL,
	`template_group_description` varchar(255) NOT NULL,
	`sort_order` int(5) NOT NULL,
	`visible` int(1) NOT NULL,
	PRIMARY KEY (`template_configuration_group_id`)
);");


// Create Template Configuration

$db->Execute("CREATE TABLE IF NOT EXISTS " . TABLE_TEMPLATE_CONFIG . " (
	`template_configuration_id` int(11) NOT NULL AUTO_INCREMENT,
	`template_configuration_title` text NOT NULL,
	`template_configuration_tab` text NOT NULL,
	`template_configuration_tab_section` text NOT NULL,
	`template_configuration_key` varchar(255) NOT NULL,
	`template_configuration_value` text NOT NULL,
	`template_configuration_description` text NOT NULL,
	`template_configuration_group_id` int(11) NOT NULL,
	`sort_order` int(5) DEFAULT NULL,
	`set_function` text DEFAULT NULL,
	PRIMARY KEY (`template_configuration_id`)
);");