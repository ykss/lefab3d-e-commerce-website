<section id="map-reviews">
	<h3><?php echo TITLE_REVIEWS; ?></h3>
	<div class="review-container">
		<?php if ($reviews->fields['count'] > 0 ) { ?>
			<div class="overallRating">
				<span class="overall-rating-label"><?php echo TEXT_OVERALL_RATINGS; ?></span>
				<span class="stars">
				<?php 
				//$reviewAverage = getAverageForProductTab((int)$_GET['products_id']);
				
				global $db;		
				$products_idset = (int)zen_get_prid($_GET['products_id']);
				$reviewAveragetemp = $db->Execute('SELECT AVG( reviews_rating ) AS average FROM ' . TABLE_REVIEWS . ' WHERE products_id =' . $products_idset);
				$reviewAverage= $reviewAveragetemp->fields['average'] ? round($reviewAveragetemp->fields['average']) : 0;
				
				switch ($reviewAverage) {
								case 0:
								$loadstarrating = zen_image(DIR_WS_TEMPLATE . 'images/stars_0.gif', 'Star Rating');
								break;
								case 1:
								$loadstarrating = zen_image(DIR_WS_TEMPLATE . 'images/stars_1.gif', 'Star Rating');
								break;
								case 2:
								$loadstarrating = zen_image(DIR_WS_TEMPLATE . 'images/stars_2.gif', 'Star Rating');
								break;
								case 3:
								$loadstarrating = zen_image(DIR_WS_TEMPLATE . 'images/stars_3.gif', 'Star Rating');
								break;
								case 4:
								$loadstarrating = zen_image(DIR_WS_TEMPLATE . 'images/stars_4.gif', 'Star Rating');
								break;
								case 5:
								$loadstarrating = zen_image(DIR_WS_TEMPLATE . 'images/stars_5.gif', 'Star Rating');
								break;
								default:
								$loadstarrating = '';
								break;
										}
				
				
				
				//echo"rv=$reviewAverage";
				
				//for($i=1; $i<=5; $i++) {
				 if($reviewAverage) {
				    ?>
				    <span class="on"><?php echo $loadstarrating; ?></span>
				    <?php 
				  } else {
				    ?>
				    <span class="off"></span>
				    <?php 
				  }
				//}
				?>
				</span>
			</div>
			<div class="review-buttons">
				<?php if ($reviews->fields['count'] > 2) { ?>
				<a href="<?php echo zen_href_link(FILENAME_PRODUCT_REVIEWS, zen_get_all_get_params()); ?>" class="read-review">Read More Reviews</a>
				<?php } ?>
				<a href="<?php echo zen_href_link(FILENAME_PRODUCT_REVIEWS_WRITE, 'products_id=' . (int)$_GET['products_id']);?>" class="writeAReview">Write a Review</a>
			</div>
			
			<?php
			
			
	$products_id = (int)zen_get_prid($_GET['products_id']);
	$review_status = " and r.status = 1";

  $reviews_query_raw = "SELECT r.reviews_id, rd.reviews_text as reviews_text, r.reviews_rating, r.date_added, r.customers_name
                        FROM " . TABLE_REVIEWS . " r, " . TABLE_REVIEWS_DESCRIPTION . " rd
                        WHERE r.products_id = :productsID
                        AND r.reviews_id = rd.reviews_id
                        AND rd.languages_id = :languagesID " . $review_status . "
                        ORDER BY r.date_added desc
                        LIMIT 3
                        ";

  $reviews_query_raw = $db->bindVars($reviews_query_raw, ':productsID', $products_id, 'integer');
  $reviews_query_raw = $db->bindVars($reviews_query_raw, ':languagesID', $_SESSION['languages_id'], 'integer');
  $reviews = $db->Execute($reviews_query_raw);
  $reviewsArray = array();
  while (!$reviews->EOF) {
  	$reviewsArray[] = array('id'=>$reviews->fields['reviews_id'],
  	                        'customersName'=>$reviews->fields['customers_name'],
  	                        'dateAdded'=>$reviews->fields['date_added'],
  	                        'reviewsText'=>$reviews->fields['reviews_text'],
                            'reviewsTitle'=>$reviews->fields['reviews_title'],
  	                        'reviewsRating'=>$reviews->fields['reviews_rating']);
    $reviews->MoveNext();
  }
	
			
			?>
			
			<ul class="reviewsList">
				<?php foreach($reviewsArray as $review) {
				
				//echo $review['reviewsRating'];
				?>
				<li>
						<div class="client-stars">
							<?php 
    					//for($i=1; $i<=5; $i++) {
    					  if($review['reviewsRating']) {
						  
						  switch ($review['reviewsRating']) {
								case 0:
								$loadstarrating2 = zen_image(DIR_WS_TEMPLATE . 'images/stars_0.gif', 'Star Rating');
								break;
								case 1:
								$loadstarrating2 = zen_image(DIR_WS_TEMPLATE . 'images/stars_1.gif', 'Star Rating');
								break;
								case 2:
								$loadstarrating2 = zen_image(DIR_WS_TEMPLATE . 'images/stars_2.gif', 'Star Rating');
								break;
								case 3:
								$loadstarrating2 = zen_image(DIR_WS_TEMPLATE . 'images/stars_3.gif', 'Star Rating');
								break;
								case 4:
								$loadstarrating2 = zen_image(DIR_WS_TEMPLATE . 'images/stars_4.gif', 'Star Rating');
								break;
								case 5:
								$loadstarrating2 = zen_image(DIR_WS_TEMPLATE . 'images/stars_5.gif', 'Star Rating');
								break;
								default:
								$loadstarrating2 = '';
								break;
										}
						  
						  
						  
						  
						  
    					    ?>
    					    <span class="on"><?php echo $loadstarrating2; ?></span>
    					    <?php 
    					  } else {
    					    ?>
    					    <span class="off"></span>
    					    <?php 
    					  }
    					//}
    					?>
						</div>
						
						<div class="review-user-details">
							<span class="review-author"><?php echo TEXT_BY_2; ?> <?php echo $review['customersName'];?></span>
							<span class="review-date"><?php echo date('F d, Y', strtotime($review['dateAdded']))?></span>
						</div>
						<div class="review-comment">
							<?php echo $review['reviewsText'];?>
						</div>
				</li>
				<?php }?>
			</ul>
			<!--
			<div class="write-review-wrapper bottom">
				<a href="<?php echo zen_href_link(FILENAME_PRODUCT_REVIEWS, zen_get_all_get_params()); ?>" class="read-review">Read Reviews</a>
				<a href="<?php echo zen_href_link(FILENAME_PRODUCT_REVIEWS_WRITE, 'products_id=' . (int)$_GET['products_id']);?>" class="writeAReview">Write a Review</a>
				<div class="clearBoth"></div>
			</div> -->
		<?php } else { ?>
			<div class="write-review-wrapper no-reviews bottom">
				<?php echo TEXT_BE_THE_FIRST; ?>
				<a href="<?php echo zen_href_link(FILENAME_PRODUCT_REVIEWS_WRITE, 'products_id=' . (int)$_GET['products_id']);?>" class="writeAReview"><?php echo TEXT_WRITE_REVIEWS; ?></a>
			</div>
		<?php } ?>
	</div>
</section>