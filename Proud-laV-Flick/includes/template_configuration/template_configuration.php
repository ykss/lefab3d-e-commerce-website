<h2><?php echo $template_select_val['name'] . ' ' . 'Configuration'; ?></h2>
<div class="icon"><a href="#exit"><img src="images/exit.png"></a></div>

<?php 
        
        //file upload
        $allowedExts = array("gif", "jpeg", "jpg", "png");
        $temp = explode(".", $_FILES["file"]["name"]);
        $extension = end($temp);

        if ((($_FILES["file"]["type"] == "image/gif")
        || ($_FILES["file"]["type"] == "image/jpeg")
        || ($_FILES["file"]["type"] == "image/jpg")
        || ($_FILES["file"]["type"] == "image/pjpeg")
        || ($_FILES["file"]["type"] == "image/x-png")
        || ($_FILES["file"]["type"] == "image/png"))
        && ($_FILES["file"]["size"] < 20000)
        && in_array($extension, $allowedExts)) {
          if ($_FILES["file"]["error"] > 0) {
            $messageStack->add("Return Code: " . $_FILES["file"]["error"], 'error');
          } else {
            if (file_exists(DIR_WS_CATALOG_TEMPLATE . $key . '/images/' . $_FILES["file"]["name"])) {
              $messageStack->add($_FILES["file"]["name"] . " already exists. ", 'error');
            } else {
              move_uploaded_file($_FILES["file"]["tmp_name"],
              DIR_WS_CATALOG_TEMPLATE . $key . '/images/' . $_FILES["file"]["name"]);
              $messageStack->add($_FILES["file"]["name"] . " Uploaded ", 'success');
            }
          }
        } else {
          $messageStack->add($_FILES["file"]["name"] . " Invalid file ", 'error');
        }
		
	// Select the options that are tied to the selected configuration group.
	// Once selected order them by what tab they are supposed to be in.
	
	$configuration_options_select = "SELECT template_configuration_id, template_configuration_title, template_configuration_tab, template_configuration_tab_section, template_configuration_key, template_configuration_value, template_configuration_description, template_configuration_group_id, set_function
		FROM " . TABLE_TEMPLATE_CONFIG . " 
		WHERE template_configuration_group_id = '" . $configuration_group_id . "' 
		ORDER BY sort_order ASC, template_configuration_tab ASC, template_configuration_tab_section ASC";
	$configuration_options_execute = $db->Execute($configuration_options_select);
	
	// Set up Tabs
	$tabs = array();
	if ($configuration_options_execute->RecordCount() > 0) {		
		while (!$configuration_options_execute->EOF) {
			
			if (!array_key_exists($configuration_options_execute->fields['template_configuration_tab'], $tabs) && $configuration_options_execute->fields['template_configuration_tab'] != '') {
			
				// Create a new tab
				$tabs[$configuration_options_execute->fields['template_configuration_tab']] = array('options' => array());
			}
			
			if ($configuration_options_execute->fields['template_configuration_tab'] == '') $configuration_options_execute->fields['template_configuration_tab'] = 'Global';
			
			// Set up tab section as secondary key and set up tab options
			$tabs[$configuration_options_execute->fields['template_configuration_tab']][$configuration_options_execute->fields['template_configuration_tab_section']][] = array(
				'id' => $configuration_options_execute->fields['template_configuration_id'], 
				'title' => $configuration_options_execute->fields['template_configuration_title'], 
				'template_key' => $configuration_options_execute->fields['template_configuration_key'], 
				'value' => $configuration_options_execute->fields['template_configuration_value'], 
				'description' => $configuration_options_execute->fields['template_configuration_description'],
				'group_id' => $configuration_options_execute->fields['template_configuration_group_id'],
				'set_function' => $configuration_options_execute->fields['set_function']
			);
			
			$configuration_options_execute->MoveNext();
		
		}
	}	
        ?>

<?php
	// Start form for configuration options
	echo zen_draw_form('updatetemplate', FILENAME_TEMPLATE_SELECT, 'action=updatetemplate', 'post' ,'enctype="multipart/form-data" id="updata-temp-form"'); 
?>
<!-- BOF TABBED AREA -->
<div id="tabs">
	<ul>
<?php					
		// Tabs
		foreach($tabs as $tab => $tab_vals) {
            if($tab == 'Global') {
?>  
		          <li><a href="#<?php echo str_replace(' ', '', strtolower($tab)); ?>"><?php echo $tab; ?></a></li>
<?php
            }
		}
        foreach($tabs as $tab => $tab_vals) {
            if($tab == 'Header') {
?>  
                  <li><a href="#<?php echo str_replace(' ', '', strtolower($tab)); ?>"><?php echo $tab; ?></a></li>
<?php
            }
        }
        foreach($tabs as $tab => $tab_vals) {
            if($tab != 'Global' && $tab != 'Header' && $tab !='Footer') {
?>  
                  <li><a href="#<?php echo str_replace(' ', '', strtolower($tab)); ?>"><?php echo $tab; ?></a></li>
<?php
            }
        }
        foreach($tabs as $tab => $tab_vals) {
            if($tab == 'Footer') {
?>  
                  <li><a href="#<?php echo str_replace(' ', '', strtolower($tab)); ?>"><?php echo $tab; ?></a></li>
<?php
            }
        }
?>
	</ul>
<?php					
	foreach($tabs as $tab => $tab_section) {
?>
	<div id="<?php echo str_replace(' ', '', strtolower($tab)); ?>">
		<h3><?php echo $tab; ?></h3>
        <div class="message" style="display: none;"><div class="saved success-message">Your changes have been successfully changed</div></div>
<?php	

			// Tab Section
			foreach ($tab_section as $tab_section_name => $tab_vals) {
				
				if ($tab_section_name != 'options') {
					echo '<h4>'.$tab_section_name.'</h4>';
				}
				if(is_array($tab_vals)){
				// Tab Options
				foreach($tab_vals as $template_option) {
					if($template_option['title'] != 'Version') {
                                            echo '<div class="inputtext-area">';
                                                switch ($template_option['set_function']){
                                                    case 'image':
                                                        echo '<label>'.$template_option['title'].'</label>';
                                                        echo zen_draw_file_field($template_option['id'],$template_option['value']);
                                                        echo '<img style="float:right;" src="'.DIR_WS_CATALOG_TEMPLATE . $key . '/images/'.$template_option['value'].'"/>';
                                                        break;
                                                    case "file":
                                                        echo '<label>'.$template_option['title'].'</label>';
                                                        echo zen_draw_file_field($template_option['id'],$template_option['value']);
                                                        break;
                                                    case "color":
                                                        echo '<label>'.$template_option['title'].'</label>';
                                                        echo zen_draw_input_field("template_config[".$template_option['id']."]",$template_option['value'], "class=\"color-field\"");
                                                        break;
                                                    case "truefalse":
                                                        echo '<label>'.$template_option['title'].'</label>';
                                                        $pull_down_array = array(
                                                            array('id' => 'true',
                                                                    'text' => 'true'),
                                                            array('id' => 'false',
                                                                    'text' => 'false'),
                                                        );
                                                        echo zen_draw_pull_down_menu($template_option['id'],$pull_down_array,$template_option['value']);
                                                        break;
                                                    case "readonly":
                                                        echo '<label>'.$template_option['title'].'</label>';
                                                        echo zen_draw_input_field($template_option['id'],$template_option['value'], "readonly");
                                                    case "text":
                                                    default:
                                                        echo '<label>'.$template_option['title'].'</label>';
                                                        echo zen_draw_input_field($template_option['id'], $template_option['value']);
                                                        break;
                                                }
                                            echo '</div>';
                                        } else {
                                            echo $template_option['value'];
                                        }
					                   // END IF/ELSE VERSION
                                }
			}
			// END OPTIONS LOOP		
		}
	  // END SECTION LOOP
?>
	</div>
<?php
	}
	// END TAB LOOP
?>						
</div>
<!--EOF TABBED AREA-->
<div class="submit-btn-wrapper"><button type="submit" value="Save" id="config-save">Save All Changes</button></div>
</form>
<!--EOF FORM-->
