<?php
class clearNDCObserver extends base 
{
	function clearNDCObserver()
	{
		global $zco_notifier;
		$zco_notifier->attach($this, array('NOTIFY_HEADER_CLEAR_NUMINIX_DISK_CACHE'));
	}
	
	function update(&$class, $eventID, $paramsArray) 
	{
		global $nmx_disk_cache;
		if (is_object($nmx_disk_cache)) $nmx_disk_cache->clearCache();
	}
}
// eof