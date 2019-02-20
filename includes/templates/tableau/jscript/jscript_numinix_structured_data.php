<?php
if (!defined('FACEBOOK_OPEN_GRAPH_STATUS') || FACEBOOK_OPEN_GRAPH_STATUS != 'true') { 
  echo '<meta property="og:title" content="'.META_TAG_TITLE.'"/>' . "\n";
  echo '<meta property="og:site_name" content="'.STORE_NAME.'"/>' . "\n";
  echo '<meta property="author" content="'.STORE_NAME.'"/>' . "\n";
}	
?>