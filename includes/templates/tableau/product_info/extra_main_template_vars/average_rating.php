<?php
// 2P added BOF - Average Product Rating
$reviews_average_rating_query = "select avg(reviews_rating) as average_rating from " . TABLE_REVIEWS . " r, "
                                                   . TABLE_REVIEWS_DESCRIPTION . " rd
                   where r.products_id = '" . (int)$_GET['products_id'] . "'
                   and r.reviews_id = rd.reviews_id
                   and rd.languages_id = '" . (int)$_SESSION['languages_id'] . "'" .
                   $review_status;

$reviews_average_rating = $db->Execute($reviews_average_rating_query);
// 2P added EOF - Average Product Rating