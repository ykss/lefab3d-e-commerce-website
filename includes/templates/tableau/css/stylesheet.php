<style type="text/css">

	/* banner */
	.header--banner {
		background: <?php echo TABLEAU_FTR_TXT_COLOR; ?>;
	}

	/* middle */
	.header--middle {
		background-color: <?php echo TABLEAU_HEADER_BG_COLOR; ?>;
	}	

	#account-nav a,
	#account-nav span {
		color: <?php echo TABLEAU_HEADER_LINK_COLOR; ?>;
	}

	#account-nav a:hover {
		color: <?php echo TABLEAU_HEADER_LINK_HOVER_COLOR; ?>;
	}

	/* navigation */
	.header--navigation {
		background-color: <?php echo TABLEAU_HEADER_BG_COLOR; HEADER_BG_COLOR?>;
	}

	#nav-menu > li > a {
		color: <?php echo TABLEAU_HEADER_LINK_COLOR; ?>;
	}
                                
    #nav-menu > li > a:hover{
		color: <?php echo TABLEAU_HEADER_LINK_HOVER_COLOR; ?>;
	}

	#nav-menu > li:hover > a span,
	#nav-menu > li:focus > a span,
	#nav-menu > li:first-child:hover > a,
	#nav-menu > li:first-child:focus > a {
		background: url(<?php echo $template->get_template_dir('arrow_nav_hover_up.png', DIR_WS_TEMPLATE, $current_page_base,'images').'/arrow_nav_hover_up.png'; ?>) no-repeat center 36px;
	}

	#nav-menu > li:hover > a span,
	#nav-menu > li:focus > a span {
		color: <?php echo TABLEAU_HEADER_LINK_HOVER_COLOR; ?>;
		/*border-bottom: 3px solid <?php echo TABLEAU_FTR_TXT_COLOR; ?>;*/
	}
					
	/* drop */
	#nav-menu > li ul {
		background-color: <?php echo TABLEAU_DROP_DOWN_BG_COLOR; ?>;
		border-top: 3px solid <?php echo TABLEAU_FTR_TXT_COLOR; ?>;
	}

	.sub-menu li {
		background-color: <?php echo TABLEAU_DROP_DOWN_BG_COLOR; ?>;
	}
					
	/* arrow */
	#nav-menu > li .sub-menu:before {
		border-color: transparent transparent <?php echo TABLEAU_FTR_TXT_COLOR; ?> transparent;
	}

	#nav-menu ul a {
		color: <?php echo TABLEAU_DROP_DOWN_LINK_COLOR; ?>;
	}

	#nav-menu ul li:hover > a {
		background-color: <?php echo TABLEAU_DROP_DOWN_LINK_COLOR; ?>;
		color: <?php echo TABLEAU_DROP_DOWN_LINK_HOVER_COLOR; ?>;
	}

	#nav-menu ul .hasSub:hover > a:after {
		border-color: transparent transparent transparent <?php echo TABLEAU_FTR_TXT_COLOR; ?>
	}

	#search-wrapper input[type="text"],
	#search-wrapper input[type="text"]:focus {
		background: <?php echo TABLEAU_FTR_TXT_COLOR; ?>;
	}

	#search-wrapper button[type="submit"],
	#search-wrapper input[type="submit"] {
		background: transparent url(<?php echo $template->get_template_dir('arrow_nav_hover_up.png', DIR_WS_TEMPLATE, $current_page_base,'images').'/arrow_nav_hover_up.png'; ?>) 0 0 no-repeat;
	}

	#contentMainWrapper {
        background: <?php echo TABLEAU_BODY_BACKGROUND_COLOR; ?>;
        color: <?php echo TABLEAU_BODY_TEXT_COLOR; ?>;
	}
	
	#contentMainWrapper a{
        color: <?php echo TABLEAU_BODY_LINK_COLOR; ?>;
	}

	#contentMainWrapper a:hover{
        color: <?php echo TABLEAU_BODY_LINK_HOVER_COLOR; ?>;
	}

	/* Breadcrumb */
	#navBreadCrumb {
		border-bottom: 1px solid <?php echo TABLEAU_FTR_TXT_COLOR; ?>;
	}

	/* Header Titles */
	h1 {
	    color: <?php echo TABLEAU_BODY_HEADLINE_COLOR; ?>;
	}

	.product-listing h1 {
		border-bottom: 1px solid <?php echo TABLEAU_FTR_TXT_COLOR; ?>;
	}

	.social-links a {
		background: url(<?php echo $template->get_template_dir('ico_social_sprite.png', DIR_WS_TEMPLATE, $current_page_base,'images').'/ico_social_sprite.png'; ?>) no-repeat 0 0;
	}

	/* Footer */
	
	/* message */
	.footer--message {
		background: <?php echo TABLEAU_FTR_TXT_COLOR; ?>;
	}

	/* navigation + newsletter */
	.footer--navigation {
		background-color: <?php echo TABLEAU_FTR_BG_COLOR; ?>;
	}

	#newsletter-wrapper button[type="submit"] {
	    background: url(<?php echo $template->get_template_dir('bg_button_go.png', DIR_WS_TEMPLATE, $current_page_base,'images').'/bg_button_go.png'; ?>) no-repeat 2px 0 transparent;
	}

	#newsletter-wrapper a {
		color: <?php echo TABLEAU_FTR_TXT_COLOR; ?>;
	}

	.list-footer h5,
	.footer-content-container h5 {
		color: <?php echo TABLEAU_FTR_TXT_COLOR; ?>;
	}
			
	.list-footer a {
		color: <?php echo TABLEAU_FTR_LINK_COLOR; ?>;
	}

	.list-footer a:hover,
	.footer-content-container a:hover,
	#copyright-wrapper p a:hover {
		color: <?php echo TABLEAU_FTR_TXT_COLOR; ?>;
	}

	/* copyright-flags */
	.footer--copyright-flags {
		background: <?php echo TABLEAU_FTR_BG_COLOR; ?>;
	}

	#copyright-wrapper p,
	#copyright-wrapper p a {
		color: <?php echo TABLEAU_FTR_TXT_COLOR; ?>;
	}

	#copyright-wrapper p a {
		color: <?php echo TABLEAU_FTR_TXT_COLOR; ?>;
	}
	
	.content table th,
	.content table td,
	#ezPageDefault table th,
	#ezPageDefault table td {
		border-bottom: 1px solid <?php echo TABLEAU_FTR_TXT_COLOR; ?>;
	}

	.content table th,
	#ezPageDefault table th {
		color: <?php echo TABLEAU_FTR_TXT_COLOR; ?>;
	}
	
	.header--banner, .footer--message {
		background-color: <?php echo TABLEAU_BANNER_BG_COLOR; ?>;
	}

	.header--banner a, .header--banner span, .footer--message span {
		color: <?php echo TABLEAU_BANNER_TXT_COLOR; ?>;
	}

</style>
