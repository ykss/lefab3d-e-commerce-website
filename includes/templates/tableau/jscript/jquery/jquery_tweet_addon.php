<script type="text/javascript">
jQuery(function(){
	jQuery(".tweet").tweet({
		avatar_size: 0,
		count: 1,
		modpath: 'twitter/',
		username: "<?php echo TABLEAU_TWITTER_HANDLE; ?>",
		loading_text: " ",
		refresh_interval: 60,
	});
});
</script>