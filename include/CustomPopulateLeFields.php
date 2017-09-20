<?php
/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************/
require_once("include/utils/utils.php");

function populateFields($entityData){
    global $adb, $log;

    $entity_id = vtws_getIdComponents($entityData->getId());
    $entity_id = $entity_id[1];

    $assign_id = vtws_getIdComponents($entityData->get('assigned_user_id'));
    $assign_id = $assign_id[1];
    $log->debug("Entering into function populateFields(".$entity_id.").");

        $result = $adb->pquery("select * from vtiger_users where id=?",
        array($assign_id));

    $fullname_LE = $result->fields['5'] . ' ' . $result->fields['6'];
    $email_LE    = $result->fields['email1'];
    $verification_date = date('y-m-d');

    $adb->pquery("UPDATE vtiger_leadscf SET cf_1087=?, cf_1409=?, cf_1491=?, cf_1411=? WHERE leadid=?",array($assign_id, $fullname_LE, $verification_date, $email_LE,$entity_id));
    $log->debug("Exit from function populateFields(".$entity_id.")");
}

?>
