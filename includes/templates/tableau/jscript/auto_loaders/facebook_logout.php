<script type="text/javascript" src="http://connect.facebook.net/en_US/all.js"></script>
<script type="text/javascript"><!--//
  window.fbAsyncInit = function() {
    jQuery('html').append('<div id="fb-root"></div>');
    FB.init({ 
      appId: '<?php echo FACEBOOK_OPEN_GRAPH_APPID; ?>', 
      cookie:true, 
      status:true, 
      xfbml:true 
    });
    FB.getLoginStatus(handleSessionResponse);
  }
//handle a session response from any of the auth related calls
function handleSessionResponse(response) {

    //if we dont have a session (which means the user has been logged out, redirect the user)
    if (!response.authResponse) {
        return;
    }

    //if we do have a non-null response.session, call FB.logout(),
    //the JS method will log the user out of Facebook and remove any authorization cookies
    FB.logout(response.authResponse);
}

//--></script>