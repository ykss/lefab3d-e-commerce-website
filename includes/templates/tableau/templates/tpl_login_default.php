<?php
/**
 * Page Template
 *
 * @package templateSystem
 * @copyright Copyright 2003-2007 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_login_default.php 5926 2007-02-28 18:15:39Z drbyte $
 */
?>
<div class="headerWrapper">
	<h1 id="loginDefaultHeading"><?php echo HEADING_TITLE; ?></h1>
</div>
<div class="centerColumn" id="loginDefault">

<?php if ($messageStack->size('login') > 0) echo $messageStack->output('login'); ?>


<?php if ( USE_SPLIT_LOGIN_MODE == 'True' || $ec_button_enabled) { ?>
<!--BOF PPEC split login- DO NOT REMOVE-->
<div class="split-mode">
    <div id="login" class="back">

      <fieldset>
          <h2><?php echo HEADING_RETURNING_CUSTOMER_SPLIT; ?></h2>
          <!--<div class="information" id="info-returning-customers"><?php echo TEXT_RETURNING_CUSTOMER_SPLIT; ?></div>-->

          <?php echo zen_draw_form('login', zen_href_link(FILENAME_LOGIN, 'action=process', 'SSL')); ?>
              <label class="inputLabel" for="login-email-address"><?php echo ENTRY_EMAIL_ADDRESS; ?></label>
              <?php echo zen_draw_input_field('email_address', '', 'size="18" id="login-email-address"'); ?>
              <br class="clearBoth" />

              <label class="inputLabel" for="login-password"><?php echo ENTRY_PASSWORD; ?></label>
              <?php echo zen_draw_password_field('password', '', 'size="18" id="login-password"'); ?>
              <?php echo zen_draw_hidden_field('securityToken', $_SESSION['securityToken']); ?>
              <br class="clearBoth" />

              <div class="buttonRow back"><?php echo zen_image_submit(BUTTON_IMAGE_LOGIN, BUTTON_LOGIN_ALT); ?></div>
              <div class="buttonRow back important"><?php echo '<a href="' . zen_href_link(FILENAME_PASSWORD_FORGOTTEN, '', 'SSL') . '">' . TEXT_PASSWORD_FORGOTTEN . '</a>'; ?></div>
            
              <?php if (IMAGE_USE_CSS_BUTTONS == 'True') { ?>
                  <p>hi</p>
              <?php } ?>
              

          </form>
      </fieldset>
    </div>

    <div id="register" class="forward">
        <fieldset>
            <h2><?php echo HEADING_NEW_CUSTOMER_SPLIT; ?></h2>
            <div class="information"><?php echo TEXT_NEW_CUSTOMER_POST_INTRODUCTION_SPLIT; ?></div>

            <?php echo zen_draw_form('create', zen_href_link(FILENAME_CREATE_ACCOUNT, '', 'SSL')); ?>
                <div class="buttonRow back" id="register-button"><?php echo zen_image_submit(BUTTON_IMAGE_CREATE_ACCOUNT, BUTTON_CREATE_ACCOUNT_ALT); ?></div>
            </form>
        </fieldset>
    </div>
</div>
<!--EOF PPEC split login- DO NOT REMOVE-->

<?php } else { ?>
  <!--BOF normal login-->

    <div class="no-split-mode">
        <div id="login">
            <fieldset>
                <h2><?php echo HEADING_RETURNING_CUSTOMER; ?></h2>
                <!--<div class="information" id="info-returning-customers"><?php echo TEXT_RETURNING_CUSTOMER_SPLIT; ?></div>-->

                <?php echo zen_draw_form('login', zen_href_link(FILENAME_LOGIN, 'action=process', 'SSL')); ?>
                    <label class="inputLabel" for="login-email-address"><?php echo ENTRY_EMAIL_ADDRESS; ?></label>
                    <?php echo zen_draw_input_field('email_address', '', 'size="18" id="login-email-address"'); ?>
                    <br class="clearBoth" />

                    <label class="inputLabel" for="login-password"><?php echo ENTRY_PASSWORD; ?></label>
                    <?php echo zen_draw_password_field('password', '', 'size="18" id="login-password"'); ?>
                    <?php echo zen_draw_hidden_field('securityToken', $_SESSION['securityToken']); ?>
                    <br class="clearBoth" />

                    <div class="buttonRow back"><?php echo zen_image_submit(BUTTON_IMAGE_LOGIN, BUTTON_LOGIN_ALT); ?></div>
                    <div class="buttonRow back important"><?php echo '<a href="' . zen_href_link(FILENAME_PASSWORD_FORGOTTEN, '', 'SSL') . '">' . TEXT_PASSWORD_FORGOTTEN . '</a>'; ?></div>
                    
                </form>
            </fieldset>
        </div>

        <div id="register">

            <fieldset>
                <h2><?php echo HEADING_NEW_CUSTOMER; ?></h2>
                <?php echo zen_draw_form('create_account', zen_href_link(FILENAME_CREATE_ACCOUNT, '', 'SSL'), 'post', 'onsubmit="return check_form(create_account);"') . zen_draw_hidden_field('action', 'process') . zen_draw_hidden_field('email_pref_html', 'email_format'); ?>
                    <div class="information"><?php echo TEXT_NEW_CUSTOMER_INTRODUCTION; ?></div>

                    <?php require($template->get_template_dir('tpl_modules_create_account.php',DIR_WS_TEMPLATE, $current_page_base,'templates'). '/tpl_modules_create_account.php'); ?>
                    <div class="buttonRow"><?php echo zen_image_submit(BUTTON_IMAGE_SUBMIT, BUTTON_SUBMIT_ALT); ?></div>
                </form>
            </fieldset>

        </div>
    </div>
<!--EOF normal login-->
<?php } ?>
</div>