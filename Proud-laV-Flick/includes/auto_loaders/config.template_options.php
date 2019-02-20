<?php
if (!defined('IS_ADMIN_FLAG')) {
  die('Illegal Access');
} 

$autoLoadConfig[998][] = array(
  'autoType' => 'init_script',
  'loadFile' => 'init_template_options.php'
);