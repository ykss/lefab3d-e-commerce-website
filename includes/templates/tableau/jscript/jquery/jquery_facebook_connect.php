<?php if (!isset($_SESSION['customer_id']) && FEC_FACEBOOK_CONNECT == 'true') { ?>
<script type="text/javascript"><!--//
jQuery(document).ready(function() {
  if (jQuery('#fb-root').length > 0) {
    window.fbAsyncInit = function() {
      FB.init({
        appId : "<?php echo FACEBOOK_OPEN_GRAPH_APPID; ?>",
        //session : <?php echo json_encode($facebook_session); ?>, // don't refetch the session when PHP already has it
        status : true, // check login status
        cookie : true, // enable cookies to allow the server to access the session
        xfbml : true // parse XFBML
      });

      // whenever the user logs in, we refresh the page
      FB.Event.subscribe("auth.login", function() {
        window.location.href = "<?php echo html_entity_decode(zen_href_link(FILENAME_QUICK_CHECKOUT, 'facebook_login=true', 'SSL')); ?>";
        //window.location.reload();
      });
    };
    
    (function() {
      var e = document.createElement("script");
      //e.src = document.location.protocol + "//connect.facebook.net/en_US/all.js#appId=<?php echo FACEBOOK_OPEN_GRAPH_APPID; ?>&amp;xfbml=1";
      e.src = document.location.protocol + "//connect.facebook.net/en_US/all.js";
      e.async = true;
      document.getElementById("fb-root").appendChild(e);
    }());
  }
});
//--></script>
<?php } ?>