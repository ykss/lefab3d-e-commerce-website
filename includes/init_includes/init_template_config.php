<?php
/**
 * read the template configuration settings from the db
 */

if (!defined('IS_ADMIN_FLAG')) {
  die('Illegal Access');
}

$template_configuration_group = $db->Execute("SELECT * FROM ".TABLE_TEMPLATE_CONFIG_GROUP);
while(!$template_configuration_group->EOF){
        $template_configuration = $db->Execute('SELECT * FROM ' . TABLE_TEMPLATE_CONFIG." WHERE template_configuration_group_id=".$template_configuration_group->fields['template_configuration_group_id']);

        while (!$template_configuration->EOF) {
          /**
         * dynamic define based on info read from DB
         * @ignore
         */
          define(strtoupper($template_configuration_group->fields['template_configuration_group_title']."_".$template_configuration->fields['template_configuration_key']), $template_configuration->fields['template_configuration_value']);
          $template_configuration->movenext();
        }
    $template_configuration_group->MoveNext();
}