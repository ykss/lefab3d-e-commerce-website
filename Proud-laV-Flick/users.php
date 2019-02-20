<?php
/**
 * @package admin
 * @copyright Copyright 2003-2018 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce<br />
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: Zen4All Thu Nov 15 22:35:14 2018 +0100 Modified in v1.5.6 $
 */
require('includes/application_top.php');

// Check if session has timed out
if (!isset($_SESSION['admin_id'])) {
  zen_redirect(zen_href_link(FILENAME_LOGIN, '', 'SSL'));
}

// make a note of the current user - they can't delete themselves (by accident) or change their own status
$currentUser = $_SESSION['admin_id'];

// determine whether an action has been requested
if (isset($_POST['action']) && in_array($_POST['action'], array('insert', 'update', 'reset'))) {
  $action = $_POST['action'];
} elseif (isset($_GET['action']) && in_array($_GET['action'], array('add', 'edit', 'password', 'delete', 'delete_confirm'))) {
  $action = $_GET['action'];
} else {
  $action = '';
}

// if needed, check that a valid user id has been passed
if (($action == 'update' || $action == 'reset') && isset($_POST['user'])) {
  $user = $_POST['user'];
} elseif (($action == 'edit' || $action == 'password' || $action == 'delete' || $action == 'delete_confirm') && $_GET['user']) {
  $user = $_GET['user'];
} elseif (($action == 'delete' || $action == 'delete_confirm') && isset($_POST['user'])) {
  $user = $_POST['user'];
} elseif (in_array($action, array('edit', 'password', 'delete', 'delete_confirm', 'update', 'reset'))) {
  $messageStack->add_session(ERROR_NO_USER_DEFINED, 'error');
  zen_redirect(zen_href_link(FILENAME_USERS));
}

// act upon any specific action specified
switch ($action) {
  case 'add': // display unpopulated form for adding a new user
    $formAction = 'insert';
    $profilesList = array_merge(array(array('id' => 0, 'text' => TEXT_CHOOSE_PROFILE)), zen_get_profiles());
    break;
  case 'edit': // display populated form for editing existing user
    $formAction = 'update';
    $profilesList = array_merge(array(array('id' => 0, 'text' => TEXT_CHOOSE_PROFILE)), zen_get_profiles());
    break;
  case 'password': // display unpopulated form for resetting existing user's password
    $formAction = 'reset';
    break;
  case 'delete_confirm': // remove existing user from database
    if (isset($_POST['user'])) {
      zen_delete_user($_POST['user']);
    }
    break;
  case 'insert': // insert new user into database. Post data is prep'd for db in the first function call
    $errors = zen_insert_user($_POST['name'], $_POST['email'], $_POST['password'], $_POST['confirm'], $_POST['profile']);
    if (sizeof($errors) > 0) {
      foreach ($errors as $error) {
        $messageStack->add($error, 'error');
      }
      $action = 'add';
      $formAction = 'insert';
      $profilesList = array_merge(array(array('id' => 0, 'text' => TEXT_CHOOSE_PROFILE)), zen_get_profiles());
    } else {
      $action = '';
      $messageStack->add(SUCCESS_NEW_USER_ADDED, 'success');
    }
    break;
  case 'update': // update existing user's details in database. Post data is prep'd for db in the first function call
    $errors = zen_update_user($_POST['name'], $_POST['email'], $_POST['id'], $_POST['profile']);
    if (sizeof($errors) > 0) {
      foreach ($errors as $error) {
        $messageStack->add($error, 'error');
      }
      $action = 'edit';
      $formAction = 'update';
      $profilesList = array_merge(array(array('id' => 0, 'text' => TEXT_CHOOSE_PROFILE)), zen_get_profiles());
    } else {
      $action = '';
      $messageStack->add(SUCCESS_USER_DETAILS_UPDATED, 'success');
    }
    break;
  case 'reset': // reset existing user's password in database. Post data is prep'd for db in the first function call
    $errors = zen_reset_password($_POST['user'], $_POST['password'], $_POST['confirm']);
    if (sizeof($errors) > 0) {
      foreach ($errors as $error) {
        $messageStack->add($error, 'error');
      }
      $action = 'password';
      $formAction = 'reset';
    } else {
      $action = '';
      $messageStack->add(SUCCESS_PASSWORD_UPDATED, 'success');
    }
    break;
  default: // no action, simply drop through and display existing users
}

// we'll always display a list of the available users
$userList = zen_get_users();
?>
<!doctype html>
<html <?php echo HTML_PARAMS; ?>>
  <head>
    <meta charset="<?php echo CHARSET; ?>">
    <title><?php echo TITLE; ?></title>
    <link rel="stylesheet" href="includes/stylesheet.css">
    <link rel="stylesheet" href="includes/cssjsmenuhover.css" media="all" id="hoverJS">
    <link rel="stylesheet" href="includes/admin_access.css">
    <script src="includes/menu.js"></script>
    <script src="includes/general.js"></script>
    <script>
      function init() {
          cssjsmenu('navbar');
          if (document.getElementById) {
              var kill = document.getElementById('hoverJS');
              kill.disabled = true;
          }
      }
    </script>
  </head>
  <body onload="init()">
    <!-- header //-->
    <?php require(DIR_WS_INCLUDES . 'header.php'); ?>
    <!-- header_eof //-->

    <!-- body //-->
    <div class="container-fluid" id="pageWrapper">

      <h1><?php echo HEADING_TITLE ?></h1>
      <?php if ($action == 'edit' || $action == 'add' || $action == 'password') { ?>
        <?php echo zen_draw_form('users', FILENAME_USERS); ?>
        <?php if (isset($formAction)) echo zen_draw_hidden_field('action', $formAction) ?>
      <?php } ?>
      <?php if ($action == 'edit' || $action == 'password') echo zen_draw_hidden_field('user', $user) ?>
      <table class="table table-striped">
        <thead>
          <tr class="headingRow">
            <th class="id"><?php echo TEXT_ID ?></th>
            <th class="name"><?php echo TEXT_NAME ?></th>
            <th class="email"><?php echo TEXT_EMAIL ?></th>
            <th class="profile"><?php echo TEXT_PROFILE ?></th>
            <?php if ($action == 'add' || $action == 'password') { ?>
              <th class="password"><?php echo TEXT_PASSWORD ?></th>
              <th class="password"><?php echo TEXT_CONFIRM_PASSWORD ?></th>
            <?php } ?>
            <th class="actions">&nbsp;</th>
          </tr>
        </thead>
        <tbody>
            <?php if ($action == 'add') { ?>
            <tr>
              <td class="id">&nbsp;</td>
              <td class="name"><?php echo zen_draw_input_field('name', isset($_POST['name']) ? $_POST['name'] : '', 'class="form-control field"', true, 'text', true) ?></td>
              <td class="email"><?php echo zen_draw_input_field('email', isset($_POST['email']) ? $_POST['email'] : '', 'class="form-control field"', true, 'email', true) ?></td>
              <td class="profile"><?php echo zen_draw_pull_down_menu('profile', $profilesList, isset($_POST['profile']) ? $_POST['profile'] : 0, 'class="form-control"') ?></td>
              <td class="password"><?php echo zen_draw_input_field('password', isset($_POST['password']) ? $_POST['password'] : '', ' class="form-control field"', true, 'password'); ?></td>
              <td class="confirm"><?php echo zen_draw_input_field('confirm', isset($_POST['confirm']) ? $_POST['confirm'] : '', ' class="form-control field"', false, 'password'); ?></td>
              <td class="actions"><button type="submit" class="btn btn-primary"><?php echo IMAGE_INSERT; ?></button> <a href="<?php echo zen_href_link(FILENAME_USERS) ?>" class="btn btn-default" role="button"><?php echo IMAGE_CANCEL; ?></a></td>
            </tr>
          <?php } ?>
          <?php if (sizeof($userList) > 0) { ?>
            <?php foreach ($userList as $userDetails) { ?>
              <tr>
                  <?php if (($action == 'edit' || $action == 'password') && $user == $userDetails['id']) { ?>
                  <td class="id"><?php echo $userDetails['id'] ?><?php echo zen_draw_hidden_field('id', $userDetails['id']) ?></td>
                <?php } else { ?>
                  <td class="id"><?php echo $userDetails['id'] ?></td>
                <?php } ?>
                <?php if ($action == 'edit' && $user == $userDetails['id']) { ?>
                  <td class="name"><?php echo zen_draw_input_field('name', $userDetails['name'], 'class="form-control field"') ?></td>
                  <td class="email"><?php echo zen_draw_input_field('email', $userDetails['email'], 'class="form-control field"', false, 'email') ?></td>
                <?php } else { ?>
                  <td class="name"><?php echo $userDetails['name'] ?></td>
                  <td class="email"><?php echo $userDetails['email'] ?></td>
                <?php } ?>
                <?php if ($action == 'edit' && $user == $userDetails['id'] && $user != $currentUser) { ?>
                  <td class="profile"><?php echo zen_draw_pull_down_menu('profile', $profilesList, $userDetails['profile'], 'class="form-control"') ?></td>
                <?php } else { ?>
                  <td class="profile"><?php echo $userDetails['profileName'] ?></td>
                <?php } ?>
                <?php if ($action == 'password' && $user == $userDetails['id']) { ?>
                  <td class="password"><?php echo zen_draw_input_field('password', '', 'class="form-control field"', false, 'password', true) ?></td>
                  <td class="confirm"><?php echo zen_draw_input_field('confirm', '', 'class="form-control field"', false, 'password', true) ?></td>
                <?php } elseif ($action == 'add' || $action == 'password') { ?>
                  <td class="password">&nbsp;</td>
                  <td class="confirm">&nbsp;</td>
                <?php } ?>
                <?php if ($action == 'edit' || $action == 'password') { ?>
                  <?php if ($user == $userDetails['id']) { ?>
                    <td class="actions">
                      <button type="submit" class="btn btn-primary"><?php echo IMAGE_UPDATE; ?></button> <a href="<?php echo zen_href_link(FILENAME_USERS) ?>" class="btn btn-default" role="button"><?php echo IMAGE_CANCEL; ?></a>
                    </td>
                  <?php } else { ?>
                    <td class="actions">&nbsp;</td>
                  <?php } ?>
                <?php } elseif ($action != 'add') { ?>
                  <td class="actions">
                      <?php if ($action != 'delete') { ?>
                      <a href="<?php echo zen_href_link(FILENAME_USERS, 'action=edit&user=' . $userDetails['id']) ?>" class="btn btn-primary" role="button"><?php echo IMAGE_EDIT; ?></a> <a href="<?php echo zen_href_link(FILENAME_USERS, 'action=password&user=' . $userDetails['id']) ?>" class="btn btn-primary"><?php echo IMAGE_RESET_PWD; ?></a>
                    <?php } ?>
                    <?php
                    if ($userDetails['id'] != $currentUser) {

                      $btn_class = '';
                      if ($action == 'delete' && $userDetails['id'] == $user) {
                        $btn_class = 'btn btn-danger';
                      } else if ($action != 'delete') {
                        $btn_class = 'btn btn-warning';
                      }
                      ?>
                      <?php echo zen_draw_form('delete_user', FILENAME_USERS, 'action=' . ($action == 'delete' ? 'delete_confirm' : 'delete')); ?>
                      <?php echo zen_draw_hidden_field('user', $userDetails['id']); ?>
                      <?php echo ($action == 'delete' && $userDetails['id'] == $user ? TEXT_CONFIRM_DELETE : '') . ($btn_class == '' ? '' : '<button class="' . $btn_class . '">' . IMAGE_DELETE . '</button>') ?>
                      <?php if ($action == 'delete' && $userDetails['id'] == $user) { ?>
                        <a href="<?php echo zen_href_link(FILENAME_USERS) ?>" class="btn btn-default" role="button"><?php echo IMAGE_CANCEL; ?></a>
                      <?php } ?>
                      <?php echo '</form>'; ?>
                    <?php } ?>
                  </td>
                </tr>
                <?php
              }
            }
          } else {
            ?>
            <tr>
              <td colspan="5"><?php echo TEXT_NO_USERS_FOUND ?></td>
            </tr>
          <?php } ?>
        </tbody>
        <tfoot>
            <?php if ($action != 'add' && $action != 'edit' && $action != 'password') { ?>
            <tr>
              <td colspan="5"><a href="<?php echo zen_href_link(FILENAME_USERS, 'action=add'); ?>" class="btn btn-primary" role="button"><?php echo IMAGE_ADD_USER; ?></a></td>
            </tr>
          <?php } ?>
        </tfoot>
      </table>
    </div>
    <!-- body_eof //-->

    <!-- footer //-->
    <?php require(DIR_WS_INCLUDES . 'footer.php'); ?>
    <!-- footer_eof //-->

  </body>
</html>
<?php require(DIR_WS_INCLUDES . 'application_bottom.php'); ?>
