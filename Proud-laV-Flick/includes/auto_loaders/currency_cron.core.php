<?php
/**
 * @package admin
 * @copyright Copyright 2003-2016 Zen Cart Development Team
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: Author: DrByte  Sat Oct 17 20:09:58 2015 -0400 New in v1.5.5 $
 */
if (!defined('USE_PCONNECT')) define('USE_PCONNECT', 'false');
/**
 * autoloader array for admin currency_cron.php
 */
  $autoLoadConfig[0][] = array('autoType'=>'require',
                               'loadFile'=> DIR_FS_CATALOG . DIR_WS_INCLUDES .  'version.php');
  $autoLoadConfig[0][] = array('autoType'=>'class',
                               'loadFile'=>'class.base.php');
  $autoLoadConfig[0][] = array('autoType'=>'class',
                               'loadFile'=>'class.notifier.php');
  $autoLoadConfig[0][] = array('autoType'=>'classInstantiate',
                               'className'=>'notifier',
                               'objectName'=>'zco_notifier');
  $autoLoadConfig[0][] = array('autoType'=>'class',
                               'loadFile'=>'sniffer.php');
  $autoLoadConfig[0][] = array('autoType'=>'class',
                               'loadFile'=>'logger.php',
                               'classPath'=>DIR_WS_CLASSES);
  $autoLoadConfig[0][] = array('autoType'=>'class',
                               'loadFile'=>'object_info.php',
                               'classPath'=>DIR_WS_CLASSES);
  $autoLoadConfig[10][] = array('autoType'=>'init_script',
                                'loadFile'=> 'init_file_db_names.php');
  $autoLoadConfig[10][] = array('autoType'=>'init_script',
                                'loadFile'=>'init_database.php');
  $autoLoadConfig[20][] = array('autoType'=>'init_script',
                                'loadFile'=> 'init_db_config_read.php');
  $autoLoadConfig[30][] = array('autoType'=>'classInstantiate',
                                'className'=>'sniffer',
                                'objectName'=>'sniffer');
  $autoLoadConfig[40][] = array('autoType'=>'init_script',
                                'loadFile'=> 'init_general_funcs.php');
  $autoLoadConfig[60][] = array('autoType'=>'require',
                                'loadFile'=> DIR_FS_CATALOG . DIR_WS_FUNCTIONS . 'sessions.php');
  $autoLoadConfig[70][] = array('autoType'=>'init_script',
                                'loadFile'=> 'init_languages.php');
  $autoLoadConfig[90][] = array('autoType'=>'require',
                                 'loadFile'=> DIR_WS_FUNCTIONS . 'localization.php');
  $autoLoadConfig[120][] = array('autoType'=>'init_script',
                                 'loadFile'=> 'init_special_funcs.php');
//   $autoLoadConfig[140][] = array('autoType'=>'init_script',
//                                  'loadFile'=> 'init_errors.php');
  $autoLoadConfig[170][] = array('autoType'=>'init_script',
                                 'loadFile'=> 'init_admin_history.php');

  $autoLoadConfig[1][] = array('autoType'=>'class',
                               'loadFile'=>'class.admin.zcObserverLogEventListener.php',
                               'classPath'=>DIR_WS_CLASSES);
  $autoLoadConfig[40][] = array('autoType'=>'classInstantiate',
                               'className'=>'zcObserverLogEventListener',
                               'objectName'=>'zcObserverLogEventListener');

