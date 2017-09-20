<?php

require_once("modules/Emails/mail.php");

class Leads_SendToAFunder_View extends Vtiger_Edit_View{

    public function process(Vtiger_Request $request) {
        $moduleName = $request->getModule();
        $recordId = $request->get('record');
        $recordModel = $this->record?$this->record:Vtiger_Record_Model::getInstanceById($recordId, $moduleName);

        if(!$recordModel){
            if ($recordId) {
                $recordModel = Vtiger_Record_Model::getInstanceById($recordId, $moduleName);
            } else {
                $recordModel = Vtiger_Record_Model::getCleanInstance($moduleName);
            }
        }

        $this->sendfunderEmail( $moduleName,$recordModel );

    }
    public function sendfunderEmail($moduleName,$recordModel){
        $currentUser = Users_Record_Model::getCurrentUserModel();
        $to_email = $_POST['recipient'];
        $from_name = $currentUser->get('user_name');
        $from_email = getUserEmailId('user_name',$from_name);
        $subject = $_POST['company'];
        $cc = 'chris@avenewfunding.com';
        $contents = "<p>Please consider this lead for funding.</p><br>
                     <p>Business Name:".$_POST['company']."</p>
                     <p>Owner Name:".$_POST['ownername']."</p>
                     <p>Owner Phone Number:". $_POST['phone'] ."</p>
                     <p>Owner Business Email: ". $_POST['email'] ."</p>
                     <p>Amount Requested:".$_POST['amtRqstd']."</p>
                     <p>Monthly Deposit:".$_POST['monthlyDeposit']."</p>
                     <p>Average Monthly Deposit:".$_POST['aveMonthlyDeposit']."</p>
                     <p>Use of Funds:".$_POST['useOfFunds']."</p>
                     <p>Existing Loans:".$_POST['existingLoan']."</p>
                     <p>Notes:".$_POST['notes']."</p>
                     <p>Existing Funding Notes:".$_POST['existingFundingNotes']."</p>";


        send_mail($moduleName, implode(',', $to_email), $from_name, $from_email, $subject, $contents, $cc, '', 'current', '', '', true);
    }
}
