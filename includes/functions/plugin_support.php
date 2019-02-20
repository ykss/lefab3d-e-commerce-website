<?php
/**
 * plugin_support.php
 *
 * @package functions
 * @copyright Copyright 2003-2018 Zen Cart Development Team
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: Drbyte Tue Sep 11 12:44:51 2018 -0400 Modified in v1.5.6 $
 */
/**
 * Functions to support plugin usage
 */

/*
 * Developers in offline environments may want to change the ENABLE_VERSION_CHECKING default
 */
if (!defined('ENABLE_PLUGIN_VERSION_CHECKING')) define('ENABLE_PLUGIN_VERSION_CHECKING', true);
/*
 * If plugin-checking is failing but you want to debug it further, you could change the value of the LOG_VERSIONCHECK_FAILURES constant:
 */
if (!defined('LOG_PLUGIN_VERSIONCHECK_FAILURES')) define('LOG_PLUGIN_VERSIONCHECK_FAILURES', false);

/*
 * Check for updated version of a plugin
 * Arguments:
 *   $plugin_file_id = the fileid number for the plugin as hosted on the zen-cart.com plugins library
 *   $version_string_to_compare = the version that I have now on my own server (will be checked against the one on the ZC server)
 * If the "version string" passed to this function evaluates (see strcmp) to a value less-then-or-equal-to the one on the ZC server, FALSE will be returned.
 * If the "version string" on the ZC server is greater than the version string passed to this function, this function will return an array with up-to-date information. The [link] value is the plugin page at zen-cart.com
 * If no plugin_file_id is passed, or if no result is found, then FALSE will be returned.
 *
 * USAGE:
 *   if (IS_ADMIN_FLAG) {
 *     $new_version_details = plugin_version_check_for_updates(999999999, 'some_string');
 *     if ($new_version_details !== FALSE) {
 *       $message = '<span class="alert">' . ' - NOTE: A NEW VERSION OF THIS PLUGIN IS AVAILABLE. <a href="' . $new_version_details['link'] . '" target="_blank">[Details]</a>' . '</span>';
 *     }
 *   }
 */
function plugin_version_check_for_updates($plugin_file_id = 0, $version_string_to_compare = '', $strict_zc_version_compare = false)
{
    // for v1.5.5f and newer

    if ($plugin_file_id === 0) return false;

    if (false === ENABLE_PLUGIN_VERSION_CHECKING) return false;

    $new_version_available = false;
    $versionServer = new VersionServer();
    $data = json_decode($versionServer->getPluginVersion($plugin_file_id), true);

    if (null === $data || isset($data['error'])) {
        if (!empty(LOG_PLUGIN_VERSIONCHECK_FAILURES)) error_log('CURL error checking plugin versions: ' . print_r($data['error'], true));
        return false;
    }

    if (!is_array($data)) $data = json_decode($data, true);

    if (strcmp($data[0]['latest_plugin_version'], $version_string_to_compare) > 0) $new_version_available = true;

    // check whether present ZC version is compatible with the latest available plugin version
    if (!defined('PLUGIN_VERSION_CHECK_MATCHING_OVERRIDE') || empty(PLUGIN_VERSION_CHECK_MATCHING_OVERRIDE)) {
        $zc_version = PROJECT_VERSION_MAJOR . '.' . preg_replace('/[^0-9.]/', '', PROJECT_VERSION_MINOR);
        if ($strict_zc_version_compare) $zc_version = PROJECT_VERSION_MAJOR . '.' . PROJECT_VERSION_MINOR;
        if (!in_array('v' . $zc_version, $data[0]['zcversions'], false)) $new_version_available = false;
    }

    return $new_version_available ? $data[0] : false;
}
