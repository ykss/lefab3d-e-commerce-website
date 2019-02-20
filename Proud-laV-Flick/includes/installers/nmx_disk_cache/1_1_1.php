<?php
$db->Execute("UPDATE " . TABLE_CONFIGURATION . " SET configuration_value = '1.1.1' WHERE configuration_key = 'NMX_DISK_CACHE_VERSION' LIMIT 1;");
$messageStack->add('Updated Numinix Disk Cache to v1.1.1', 'success');