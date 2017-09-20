<?php
/*+**********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.1
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ************************************************************************************/

class Closer_Index_View extends Vtiger_Index_View {

    function process (Vtiger_Request $request) {
        $viewer = $this->getViewer ($request);
        $moduleName = $request->getModule();
        //$viewer->assign('HOME_PAGES', Home_Page_Model::getAll());
        //$viewer->assign('HOME_PAGE_WIDGETS', Home_Widget_Model::getAll());

        $moduleModel = Closer_Module_Model::getInstance($moduleName);
        $closers = $moduleModel::getClosers();

        $viewer->assign('MODULE', $moduleName);
        $viewer->assign('CLOSERS', $closers);

        $viewer->view('Index.tpl', $moduleName);
    }
}