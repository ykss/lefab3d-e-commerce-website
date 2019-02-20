<?php
/**
 * @package admin
 * @copyright Copyright 2003-2011 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: template_select.php 19294 2011-07-28 18:15:46Z drbyte $
 */

  require('includes/application_top.php');

  $template_select = "SELECT template_dir FROM " . TABLE_TEMPLATE_SELECT . "";
  $template_select_execute = $db->Execute($template_select);
  $template_select_dir = $template_select_execute->fields["template_dir"];
  
  // Select the configuration group that corollates with the current selected template.
  
  $configuration_group_select = "SELECT template_configuration_group_id FROM " . TABLE_TEMPLATE_CONFIG_GROUP . " WHERE template_configuration_group_title = '" . $template_select_dir . "' AND visible = 1";
  $configuration_group_execute = $db->Execute($configuration_group_select);
  $configuration_group_id = $configuration_group_execute->fields["template_configuration_group_id"];
  
  $action = (isset($_GET['action']) ? $_GET['action'] : '');
  if (zen_not_null($action)) {
  	
    switch ($action) {
      case 'save':
        $sql = "update " . TABLE_TEMPLATE_SELECT . " set template_dir = :tpl:";
        $sql = $db->bindVars($sql, ':tpl:', $_POST['template_field'], 'string');
        $db->Execute($sql);
      break;
    }
  }

  $template_select = "SELECT template_dir FROM " . TABLE_TEMPLATE_SELECT . "";
  $template_select_execute = $db->Execute($template_select);
  $template_select_dir = $template_select_execute->fields["template_dir"];
  
  // Select the configuration group that corollates with the current selected template.
  
  $configuration_group_select = "SELECT template_configuration_group_id FROM " . TABLE_TEMPLATE_CONFIG_GROUP . " WHERE template_configuration_group_title = '" . $template_select_dir . "' AND visible = 1";
  $configuration_group_execute = $db->Execute($configuration_group_select);
  $configuration_group_id = $configuration_group_execute->fields["template_configuration_group_id"];
  
// get an array of template info
  $dir = @dir(DIR_FS_CATALOG_TEMPLATES);
  if (!$dir) die('DIR_FS_CATALOG_TEMPLATES NOT SET');
  while ($file = $dir->read()) {
    if (is_dir(DIR_FS_CATALOG_TEMPLATES . $file) && strtoupper($file) != 'CVS' && $file != 'template_default') {
      if (file_exists(DIR_FS_CATALOG_TEMPLATES . $file . '/template_info.php')) {
        require(DIR_FS_CATALOG_TEMPLATES . $file . '/template_info.php');
        $template_info[$file] = array('name' => $template_name,
                                      'version' => $template_version,
                                      'author' => $template_author,
                                      'description' => $template_description,
                                      'screenshot' => $template_screenshot,
                                      'custom' => $template_custom);
      }
    }
  }
  $dir->close();
?>
<!doctype html public "-//W3C//DTD HTML 4.01 Transitional//EN">
<html <?php echo HTML_PARAMS; ?>>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=<?php echo CHARSET; ?>">
<title><?php echo TITLE; ?></title>
<link rel="stylesheet" type="text/css" href="includes/stylesheet.css">
<link rel="stylesheet" type="text/css" href="includes/css/template_selection.css">
<link rel="stylesheet" type="text/css" href="includes/cssjsmenuhover.css" media="all" id="hoverJS">
<link rel="stylesheet" type="text/css" href="includes/javascript/fancybox/jquery.fancybox.css" media="all">
<link href='//fonts.googleapis.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" media="screen" type="text/css" href="includes/template_configuration/colorpicker.css" />
<script language="javascript" src="includes/javascript/jquery-1.10.2.js"></script>
<script language="javascript" src="includes/javascript/jquery-migrate-1.2.1.min.js"></script>
<script language="javascript" src="includes/javascript/jqueryui-1.10.4.js"></script>
<script language="javascript" src="includes/javascript/fancybox/jquery.fancybox.js"></script>
<script language="javascript" src="includes/javascript/jquery_fancybox.js"></script>
<script language="javascript" src="includes/javascript/template-configuration.js"></script>
<script language="javascript" src="includes/javascript/main.js"></script>
<script language="javascript" src="includes/template_configuration/colorpicker.js"></script>
<script language="javascript" src="includes/template_configuration/plugins.js"></script>
<script language="javascript" src="includes/menu.js"></script>
<script language="javascript" src="includes/general.js"></script>
<script type="text/javascript">
  <!--
  function init()
  {
    cssjsmenu('navbar');
    if (document.getElementById)
    {
      var kill = document.getElementById('hoverJS');
      kill.disabled = true;
    }
  }
  // -->
</script>
</head>
<body onLoad="init()">
<!-- header //-->
<?php require(DIR_WS_INCLUDES . 'header.php'); ?>

<h1><?php echo HEADING_TITLE; ?></h1>


<div style="display: none;" id="configuration-wrapper"></div>

<ul class="template-selection-wrapper" id="exit">

<?php
	
	// Set Up Active Template To Be First
	
	foreach($template_info as $key => $template_select_val) {
	
		$template_select_img = DIR_WS_CATALOG_TEMPLATE . $key . '/images/' . $template_select_val['screenshot'];
	
		if ($template_select_dir == $key) {
		
			$configuration_file = DIR_TMP_CONFIG . FILENAME_TEMPLATE_CONFIGURATION;
			
			if (zen_not_null($action) && zen_not_null($_POST['template_field'])) {
			  switch ($action) {
			    case 'save':
			      echo '<li class="message-success"><strong>' . $template_select_val['name'] . '</strong> ' . 'was successfully activated!</li>';
			      break;
			  }
			}
?>

			

			<li>
				<div class="template-img active-wrapper">
					<?php echo zen_image($template_select_img, $key, 699); ?>
					<div class="template-img-hover">
						<div class="hover-content">
							<h2>
								<?php echo $template_select_val['name']; ?>
								(Active)
							</h2>
							<div class="button-wrapper">
								<?php 
									if ($template_select_val['custom'] == 'true') { 
										if (file_exists($configuration_file)) {
							  ?>
							  			<a href="#configuration-wrapper"><button type="button" class="customize" id="configure-<?php echo $key; ?>">Configure</button></a>
							  <?php 	
										}	
							  		} 
							  ?>
									<a href="#<?php echo $key; ?>" class="fancybox"><button class="more-info" type="button">Details</button></a>
								
							</div>
						</div>				
					</div>
				</div>
				<div style="display: none;">
					<div id="<?php echo $key; ?>" class="modal-wrapper">
						<div class="left-col">
							<div class="image-wrapper">
								<?php echo zen_image($template_select_img, $key, 699); ?>
							</div>
						</div>
						<div class="right-col">
							<h2><?php echo $template_select_val['name']; ?></h2>
							<ul class="template-info">
								<li>
									<h4 class="section-title">Template Author:</h4>
									<div class="section-content">
										<?php echo $template_select_val['author']; ?>
									</div>
								</li>
								<li>
									<h4 class="section-title">Template Directory:</h4> 
									<div class="section-content">
										<?php echo $key; ?>
									</div>
								</li>
								<li>
									<h4 class="section-title">Template Description:</h4> 
									<div class="section-content">
										<?php echo $template_select_val['description']; ?>
									</div>
								</li>
							</ul>	
						</div>
						<div class="clearBoth"></div>
					</div>
				</div>
				<div style="display: none;" class="configuration_content">
					<?php
			
						if (file_exists($configuration_file)) {
							
							require($configuration_file);
							
						}
					
					?>
				</div>
			</li>
<?php
		}
	}
	
	// Call All Other Templates
	
	foreach($template_info as $key => $template_select_val) {
	
		$template_select_img = DIR_WS_CATALOG_TEMPLATE . $key . '/images/' . $template_select_val['screenshot'];
		
		if ($template_select_dir != $key) {
?>

		<li>
			<div class="template-img">
				<?php echo zen_image($template_select_img, $key, 699); ?>
				<div class="template-img-hover">
					<div class="hover-content">
						<h2>
							<?php echo $template_select_val['name']; ?>
						</h2>
						<div class="button-wrapper">	
							<?php echo zen_draw_form('activetemplate', FILENAME_TEMPLATE_SELECT, 'action=save'); ?>
							<?php echo zen_draw_hidden_field('template_field', $key); ?>
							<button class="activate" type="submit">Activate</button>
							<a href="#<?php echo $key; ?>" class="fancybox"><button class="more-info" type="button">Details</button></a>
							</form>
						</div>
					</div>
				</div>
			</div>
			
			<div style="display: none;">
				<div id="<?php echo $key; ?>" class="modal-wrapper">
					<div class="left-col">
						<div class="image-wrapper">
							<?php echo zen_image($template_select_img, $key, 699); ?>
						</div>
					</div>
					<div class="right-col">
						<h2>
								<?php echo $template_select_val['name']; ?>
						</h2>
						<ul class="template-info">
							<li>
								<h4 class="section-title">Template Author:</h4>
								<div class="section-content">
									<?php echo $template_select_val['author']; ?>
								</div>
							</li>
							<li>
								<h4 class="section-title">Template Directory:</h4> 
								<div class="section-content">
									<?php echo $key; ?>
								</div>
							</li>
							<li>
								<h4 class="section-title">Template Description:</h4> 
								<div class="section-content">
									<?php echo $template_select_val['description']; ?>
								</div>
							</li>
						</ul>	
					</div>
					<div class="clearBoth"></div>
				</div>
			</div>
		</li>
		
<?php	
		}
	}
?>
</ul>
<div class="clearBoth"></div>

<!-- footer //-->
<?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
<!-- footer_eof //-->
<br>
</body>
</html>

<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
