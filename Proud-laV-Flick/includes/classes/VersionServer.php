<?php
/**
 * @package admin
 * @copyright Copyright 2003-2018 Zen Cart Development Team
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: mc12345678 Tue Aug 28 21:18:16 2018 -0400 Modified in v1.5.6 $
 */

class VersionServer
{
    protected $projectVersionServer = 'https://ping.zen-cart.com/zcversioncheck';
    protected $pluginVersionServer = 'https://ping.zen-cart.com/plugincheck';

    public function __construct()
    {
        if (defined('PROJECT_VERSIONSERVER_URL')) {
            $this->projectVersionServer = PROJECT_VERSIONSERVER_URL;
        }
        if (defined('PLUGIN_VERSIONSERVER_URL')) {
            $this->pluginVersionServer = PLUGIN_VERSIONSERVER_URL;
        }
    }

    public function getZcVersioninfo()
    {
        return $this->buildCurrentInfo();
    }

    public function getProjectVersion()
    {
        $currentInfo = $this->getZcVersioninfo();
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->projectVersionServer);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($currentInfo));
        curl_setopt($ch, CURLOPT_VERBOSE, 0);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_TIMEOUT, 9);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 9);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_USERAGENT, 'Core Version Check ' . HTTP_SERVER);
        $response = curl_exec($ch);
        $error = curl_error($ch);
        $errno = curl_errno($ch);
        if ($errno > 0) {
            return $this->formatCurlError($errno, $error);
        }
        return json_decode($response, true);

    }

    public function getPluginVersion($id)
    {
        $currentInfo = $this->getZcVersioninfo();
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $this->pluginVersionServer . '/' . (int)$id);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query($currentInfo));
        curl_setopt($ch, CURLOPT_VERBOSE, 0);
        curl_setopt($ch, CURLOPT_HEADER, false);
        curl_setopt($ch, CURLOPT_TIMEOUT, 9);
        curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 9);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_USERAGENT, 'Plugin Version Check [' . (int)$id . '] ' . HTTP_SERVER);
        $response = curl_exec($ch);
        $error = curl_error($ch);
        $errno = curl_errno($ch);
        if ($errno > 0) {
            return $this->formatCurlError($errno, $error);
        }
        return $response;

    }

    public function isProjectCurrent($newVersionInfo)
    {
        if (trim($newVersionInfo['versionMajor']) > PROJECT_VERSION_MAJOR) {
            return false;
        }
        if (trim($newVersionInfo['versionMinor']) > PROJECT_VERSION_MINOR) {
            return false;
        }
        return true;
    }

    public function hasProjectPatches($newVersionInfo)
    {
        $result = 0;
        if (isset($newVersionInfo['versionPatch1']) && trim($newVersionInfo['versionPatch1']) > (int)PROJECT_VERSION_PATCH1) {
            $result++;
        }
        if (isset($newVersionInfo['versionPatch2']) && trim($newVersionInfo['versionPatch2']) > (int)PROJECT_VERSION_PATCH2) {
            $result++;
            $result++;
        }
        return $result;
    }

    protected function buildCurrentInfo()
    {
        $systemInfo = json_encode(zen_get_system_information(true), true);

        $moduleInfo = json_encode($this->getModuleInfo(), true);

        $country_iso = $this->getCountryIso();

        $results = array('currentVersionMajor' => PROJECT_VERSION_MAJOR, 'currentVersionMinor' => PROJECT_VERSION_MINOR,
                         'httpServer' => HTTP_SERVER, 'httpsServer' => HTTPS_SERVER, 'storeCountry' => $country_iso,
                         'systemInfo' => $systemInfo, 'moduleInfo' => $moduleInfo);
        return $results;
    }

    protected function getModuleinfo()
    {
        $modules = array(
            'MODULE_PAYMENT_INSTALLED' => MODULE_PAYMENT_INSTALLED,
            'MODULE_SHIPPING_INSTALLED' => MODULE_SHIPPING_INSTALLED,
            'MODULE_ORDER_TOTAL_INSTALLED' => MODULE_ORDER_TOTAL_INSTALLED,
            );

        return $modules;
    }

    protected function getCountryIso()
    {
        global $db;
        $result = $db->Execute('SELECT countries_iso_code_3 FROM ' . TABLE_COUNTRIES . ' WHERE countries_id = ' . (int) STORE_COUNTRY);
        if ($result->RecordCount()) return $result->fields['countries_iso_code_3'];

        return '';
    }

    protected function formatCurlError($errorno, $error)
    {
        return json_encode(array('error' => $error . '[' . $errorno . ']'));
    }
}
