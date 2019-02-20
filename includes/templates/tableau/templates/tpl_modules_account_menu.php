<div id="mobile-account-menu">
	<div id="account-menu-header">
		<div class="account-menu-txt back">Account Menu</div><div class="account-menu-icon forward">&#xe004;</div>
		<div class="clearBoth"></div>
	</div>
</div>

<ul id="account-menu" class="list">
	<li class="account-history first-link"><?php echo ' <a href="' . zen_href_link(FILENAME_ACCOUNT_HISTORY, '', 'SSL') . '">' . MY_ACCOUNT_ORDER_HISTORY . '</a>'; ?></li>
		<li class="contact-info"><?php echo ' <a href="' . zen_href_link(FILENAME_ACCOUNT_EDIT, '', 'SSL') . '">' . MY_ACCOUNT_INFORMATION . '</a>'; ?></li>
		<li class="address-book"><?php echo ' <a href="' . zen_href_link(FILENAME_ADDRESS_BOOK, '', 'SSL') . '">' . MY_ACCOUNT_ADDRESS_BOOK . '</a>'; ?></li>
		<li class="communications"><?php echo ' <a href="' . zen_href_link(FILENAME_ACCOUNT_NEWSLETTERS, '', 'SSL') . '">' . EMAIL_NOTIFICATIONS_NEWSLETTERS . '</a>'; ?></li>
		<li class="change-password last-link"><?php echo ' <a href="' . zen_href_link(FILENAME_ACCOUNT_PASSWORD, '', 'SSL') . '">' . MY_ACCOUNT_PASSWORD . '</a>'; ?></li>
</ul>

<div class="clearBoth"></div>