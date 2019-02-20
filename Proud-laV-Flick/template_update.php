<?php

	//require('includes/configure.php');
	//ini_set('include_path', DIR_FS_CATALOG . PATH_SEPARATOR . ini_get('include_path'));
	chdir(DIR_FS_CATALOG);
	require_once('includes/application_top.php');
	header('HTTP/1.1 200 OK');
	header('Content-type: text/plain');

		foreach($_POST as $temp_cfg_id => $temp_cfg_val){
			$template_query = "UPDATE ".TABLE_TEMPLATE_CONFIG." SET template_configuration_value='".$temp_cfg_val."' WHERE template_configuration_id=".(int)$temp_cfg_id;
			$db->Execute($template_query);
		}

	foreach ($_POST['template_config'] as $template_cfg_id => $template_cfg_value) {	        
		$sql = "UPDATE " . TABLE_TEMPLATE_CONFIG . " SET template_configuration_value = '" .  zen_db_input($template_cfg_value) . "' WHERE template_configuration_id = '" . (int)$template_cfg_id . "'";
		$db->Execute($sql);
	}

	if (isset($_FILES)) {
		// get current selected template
		$template_select = "SELECT template_dir FROM " . TABLE_TEMPLATE_SELECT . "";
		$template_select_execute = $db->Execute($template_select);
		$template_select_dir = $template_select_execute->fields["template_dir"];		

		$uploaded_filenames = array();
		foreach ($_FILES as $file_key=>$file) {
			if ($file['name'] != '') {
				$file['name'] = str_replace(' ', '', $file['name']); // remove blank spaces out of file name
				$target_Path = DIR_FS_CATALOG_TEMPLATES .$template_select_dir."/images/";
				if (is_writeable($target_Path)) {
					$target_Path = $target_Path.basename( $file['name'] );
					move_uploaded_file( $file['tmp_name'], $target_Path );
					$db->Execute("UPDATE " . TABLE_TEMPLATE_CONFIG . " SET template_configuration_value = '" .  zen_db_input($file['name']) . "' WHERE template_configuration_id = '" . (int)$file_key . "'");
				}
				// return array of uploaded file names for image reload
				$uploaded_filenames[$file_key] = DIR_WS_CATALOG_TEMPLATE . $template_select_dir."/images/" . $file['name'];
			}
		}
		// Encode data to be returned in JSON format
		$uploaded_filenames = json_encode($uploaded_filenames);
		// send to browser
		print $uploaded_filenames; 
	}

	require_once('includes/application_bottom.php');
