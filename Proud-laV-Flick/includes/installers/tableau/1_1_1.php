<?php

$template_query = $db->Execute("SELECT template_configuration_group_id FROM " . TABLE_TEMPLATE_CONFIG_GROUP . " WHERE template_configuration_group_title='tableau'");
$template_options_group_id = $template_query->fields['template_configuration_group_id'];

$db->Execute("UPDATE " . TABLE_TEMPLATE_CONFIG . " SET set_function='color' WHERE template_configuration_group_id = " . $template_options_group_id . " AND template_configuration_title LIKE '%Color%'");
$db->Execute("UPDATE " . TABLE_TEMPLATE_CONFIG . " SET set_function='image' WHERE template_configuration_group_id = " . $template_options_group_id . " AND template_configuration_title LIKE '%Upload%'");
