<?php

if (!function_exists('nmx_check_field')) {

    function nmx_check_field($tableName, $columnName) {
        global $db;
        //Getting table fields through mysql built in function, passing db name and table name
        $tableFields = $db->metaColumns($tableName);

        $columnName = strtoupper($columnName);
        //loop to traverse tableFields result set
        foreach ($tableFields as $key => $value) {
            if ($key == $columnName) {
                return true;
            }
        }
        //end of loop
        return false;
    }

//end of function
}