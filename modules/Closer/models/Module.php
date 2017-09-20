<?php
/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

class Closer_Module_Model extends Vtiger_Module_Model {

    /**
     * Function to get all the closer
     * @return <Array> - List of Vtiger_Record_Model or Module Specific Record Model instances
     */
    public function getClosers() {
        $db = PearDatabase::getInstance();

        $currentUserModel = Users_Record_Model::getCurrentUserModel();
        $query = 'SELECT * FROM vtiger_crmentity INNER JOIN vtiger_leaddetails ON vtiger_leaddetails.leadid = vtiger_crmentity.crmid INNER JOIN vtiger_leadscf ON vtiger_leadscf.leadid = vtiger_crmentity.crmid  INNER JOIN vtiger_users ON vtiger_users.id = vtiger_crmentity.smownerid INNER JOIN vtiger_leadaddress ON vtiger_leadaddress.leadaddressid=vtiger_crmentity.crmid WHERE setype=\'Leads\' AND vtiger_crmentity.deleted=0 AND vtiger_leaddetails.converted=0 AND vtiger_leadscf.cf_1087=? AND vtiger_crmentity.smownerid!=?';
        $params = array($currentUserModel->id, $currentUserModel->id);
        $result = $db->pquery($query, $params);
        $noOfRows = $db->num_rows($result);

        $closers = array();
        for($i=0; $i<$noOfRows; ++$i) {
            $row = $db->query_result_rowdata($result, $i);
            $row['cf_847'] = $row['cf_847'] == 'Failed' ? 'Declined' : $row['cf_847'];
            $closers[] = $row;
        }
        return $closers;
    }
}