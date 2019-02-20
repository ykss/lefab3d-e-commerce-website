<?php
  if (!function_exists('nmx_check_field')) {
    function nmx_check_field($tableName,$columnName){
      //Getting table fields through mysql built in function, passing db name and table name
      $tableFields = mysql_list_fields(DB_DATABASE, $tableName);

      //loop to traverse tableFields result set
      for($i=0;$i<mysql_num_fields($tableFields);$i++) {
        //Using mysql_field_name function to compare with column name passed. If they are same function returns 1
        if(mysql_field_name($tableFields, $i)==$columnName) return true;
      } //end of loop
      return false;
    } //end of function
  }