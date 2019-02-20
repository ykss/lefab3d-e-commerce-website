<script type="text/javascript">
<!--//
  // Highslide License Number: 264efa01be644d62dc3c964eb2bf93a7
	hs.graphicsDir = '<?php echo DIR_WS_TEMPLATE . DIR_WS_IMAGES; ?>highslide/graphics/';
	hs.align = 'center';
	hs.transitions = [<?php echo HIGHSLIDE_TRANSITIONS; ?>]; // 'expand', 'crossfade'
	hs.outlineType = '<?php echo HIGHSLIDE_OUTLINETYPE; ?>'; // 'rounded-white' or 'glossy-dark'
	hs.fadeInOut = <?php echo HIGHSLIDE_FADE;?>; // true or false
	hs.showCredits = false;
  //hs.wrapperClassName : 'highslide-wrapper', // 'highslide-wrapper', 'controls-in-heading'
	//hs.dimmingOpacity = 0.75;

	// Add the controlbar
	hs.addSlideshow({
		//slideshowGroup: 'group1',
		interval: <?php echo (int)HIGHSLIDE_GALLERY_INTERVAL;?>, // integer
		repeat: <?php echo HIGHSLIDE_GALLERY_REPEAT; ?>, // true or false
		useControls: <?php echo HIGHSLIDE_GALLERY_CONTROLS; ?>, // true or false
		fixedControls: 'fit',
		overlayOptions: {
			opacity: .75,
			position: '<?php echo HIGHSLIDE_GALLERY_CONTROLS_POSITION; ?>', // 'bottom center', 'top center'
			hideOnMouseOut: true
		}
	});
  
  <?php 
  if (HIGHSLIDE_CUSTOM_CONFIGURATION != '') {
    echo html_entity_decode(HIGHSLIDE_CUSTOM_CONFIGURATION) . "\n";
  } 
  ?>
//-->
</script>
