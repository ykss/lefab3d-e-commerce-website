<?php
/**
 * Module Template
 *
 * @package templateSystem
 * @copyright Copyright 2003-2005 Zen Cart Development Team
 * @copyright Portions Copyright 2003 osCommerce
 * @license http://www.zen-cart.com/license/2_0.txt GNU Public License V2.0
 * @version $Id: tpl_modules_order_totals.php 3 2012-07-08 21:11:34Z numinix $
 */
?>
<?php 
/**
 * Displays order-totals modules' output
 */
  for ($i=0; $i< $size; $i++) { 
?>
<tr id="<?php echo str_replace('_', '', $GLOBALS[$class]->code); ?>" class="otModule">
  <td class="lineTitle larger"><?php echo $GLOBALS[$class]->output[$i]['title']; ?></td>
  <td class="totalBox larger"><?php echo $GLOBALS[$class]->output[$i]['text']; ?></td>
</tr>
<?php 
  } 
?>