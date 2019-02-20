<?php
  if (GOOGLE_PLUS_ONE_ENABLED == 'true') {
?>
  <div id="googlePlusOneButton">
    <g:plusone<?php echo build_google_plus_one_params(); ?>></g:plusone>
  </div>
<?php
  }
?>