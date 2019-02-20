<?php
$db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = '2.2.1' WHERE configuration_key = 'CSS_JS_LOADER_VERSION' LIMIT 1;");