<?php
/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************/

class Leads_StatusWidget_View extends Vtiger_Index_View {

    function __construct()
    {
        parent::__construct();
        $this->exposeMethod('showLeadStatuses');
        $this->exposeMethod('showLeadSources');
    }

    function preProcess(Vtiger_Request $request) {
        return true;
    }

    function postProcess(Vtiger_Request $request) {
        return true;
    }

    function process(Vtiger_Request $request) {
        $mode = $request->get('mode');
        if(!empty($mode)) {
            $this->invokeExposedMethod($mode, $request);
            return;
        }
    }

    /*
	 * Function to show all the lead statuses
	 */
    function showLeadStatuses(Vtiger_Request $request) {
        $viewer = $this->getViewer($request);
        $moduleName = $request->getModule();

        $moduleModel = Leads_Module_Model::getInstance($moduleName);
        $leadStatuses = $moduleModel::getLeadStatuses();

        $viewer->assign('MODULE', $moduleName);
        $viewer->assign('STATUSES', $leadStatuses);

        echo $viewer->view('StatusNamesList.tpl', $moduleName, true);
    }

    /*
	 * Function to show all the lead sources
	 */
    function showLeadSources(Vtiger_Request $request) {
        $viewer = $this->getViewer($request);
        $moduleName = $request->getModule();

        $moduleModel = Leads_Module_Model::getInstance($moduleName);
        $leadSources = $moduleModel::getLeadSources();

        $viewer->assign('MODULE', $moduleName);
        $viewer->assign('SOURCES', $leadSources);

        echo $viewer->view('SourcesNamesList.tpl', $moduleName, true);
    }
}