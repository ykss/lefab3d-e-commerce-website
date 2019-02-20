<?php
/**
 * Page Template
 *
 * Loaded automatically by index.php?main_page=adress_book.<br />
 * Allows customer to manage entries in their address book
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_address_book_default.php 5369 2006-12-23 10:55:52Z drbyte $
 */
?>
<div class="centerColumn" id="addressBookDefault">

<h1 id="addressBookDefaultHeading"><?php echo HEADING_TITLE; ?></h1>

<?php require($template->get_template_dir('tpl_modules_account_menu.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_account_menu.php'); ?>


<?php if ($messageStack->size('addressbook') > 0) echo $messageStack->output('addressbook'); ?> 

<?php
/**
 * Used to loop thru and display address book entries
 */
  $addresscount = 0;
  foreach ($addressArray as $addresses) {
  $addresscount++;
?>

<div class="address-wrapper <?php if(($addresscount % 2) != 0) {?>first-address<?php } ?>">
	
	<div class="back address-left-col">
		<h3 class="addressBookDefaultName"><?php echo zen_output_string_protected($addresses['firstname'] . ' ' . $addresses['lastname']); ?><?php if ($addresses['address_book_id'] == $_SESSION['customer_default_address_id']) echo '&nbsp;<span class="primary-address">' . PRIMARY_ADDRESS . '</span>' ; ?></h3>
			
		<address><?php echo zen_address_format($addresses['format_id'], $addresses['address'], true, ' ', '<br />'); ?></address>
	</div>
	<div class="forward address-right-col">
		<?php echo '<a href="' . zen_href_link(FILENAME_ADDRESS_BOOK_PROCESS, 'edit=' . $addresses['address_book_id'], 'SSL') . '">'; ?><?php echo ADDRESS_BOOK_BUTTON_EDIT ?></a><br />
		
		<?php echo '<a href="' . zen_href_link(FILENAME_ADDRESS_BOOK_PROCESS, 'delete=' . $addresses['address_book_id'], 'SSL') . '">';?><?php echo ADDRESS_BOOK_BUTTON_DELETE ?></a>
		
		<?php if ($addresses['address_book_id'] != $_SESSION['customer_default_address_id']) {?>
			<br />
			<a href="<?php echo zen_href_link(FILENAME_ADDRESS_BOOK_PROCESS, 'action=setprimary&id=' . $addresses['address_book_id'], 'SSL');?>"><?php echo ADDRESS_BOOK_BUTTON_SET_PRIMARY ?></a>
		<?php }?>
	</div>
	<div class="clearBoth"></div>
</div><!--EOF .address-wrapper-->


<?php
  }
?>

<div class="clearBoth"></div>
<?php
  if (zen_count_customer_address_book_entries() < MAX_ADDRESS_BOOK_ENTRIES) {
?>
   
   <div class="add-address-btn desktop-view"><?php echo '<a href="' . zen_href_link(FILENAME_ADDRESS_BOOK_PROCESS, '', 'SSL') . '">' . zen_image_button(BUTTON_IMAGE_ADD_ADDRESS, BUTTON_ADD_ADDRESS_ALT) . '</a>'; ?></div>
<?php
  }
?>

<br class="clearBoth" />
</div>
