<?php
/**
 * tpl_modules_checkout_address_book.php
 *
 * @package templateSystem
 * @copyright Copyright 2003-2009 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_modules_checkout_address_book.php 3 2012-07-08 21:11:34Z numinix $
 */
?>
<?php
/**
 * require code to get address book details
 */
  require(DIR_WS_MODULES . zen_get_module_directory('checkout_address_book.php'));
?>

<?php
  $top_addresses_start_after = 0;
  if (zen_count_customer_address_book_entries() > MAX_ADDRESS_BOOK_ENTRIES) {
    $num_addresses = $addresses->RecordCount();
    $top_addresses_start_after = $num_addresses - MAX_ADDRESS_BOOK_ENTRIES; // if 10 addresses, and 5 maximum, only show last 5 addresses
  }
  $counter = 0;
  while (!$addresses->EOF) {
    $counter++; // begin counting
    if ($counter > $top_addresses_start_after) {
      echo '<div class="addressEntry">';
      if ($addresses->fields['address_book_id'] == $_SESSION['sendto']) {
        echo '      <div id="defaultSelected" class="moduleRowSelected">' . "\n";
      } else {
        echo '      <div class="moduleRow">' . "\n";
      }
?>
        <div class="back addressRadio"><?php echo zen_draw_radio_field('address', $addresses->fields['address_book_id'], ($addresses->fields['address_book_id'] == $_SESSION['sendto']), 'id="name-' . $addresses->fields['address_book_id'] . '"'); ?></div>
        <div class="back"><label for="name-<?php echo $addresses->fields['address_book_id']; ?>" class="addressTitle"><?php echo ($addresses->fields['address_title'] != '' ? zen_output_string_protected($addresses->fields['address_title']) : zen_output_string_protected($addresses->fields['firstname'] . ' ' . $addresses->fields['lastname'])); ?></label></div>
      </div>
      <br class="clearBoth" />
      <?php if ($addresses->fields['telephone'] != '') $address_telephone = '<br />' . $addresses->fields['telephone']; ?>
      <address><?php echo zen_address_format(zen_get_address_format_id($addresses->fields['country_id']), $addresses->fields, true, ' ', '<br />') . $address_telephone; ?></address>
      </div>
<?php
    }
    $addresses->MoveNext();
  }
?>
