<?php

class Leads_Apdf_View extends Vtiger_Edit_View{

    public function process(Vtiger_Request $request) {

        $moduleName = $request->getModule();
        $recordId = $request->get('record');
        $recordModel = $this->record;
        $recordModel = $this->record?$this->record:Vtiger_Record_Model::getInstanceById($recordId, $moduleName);

        if(!$recordModel){
            if (!empty($recordId)) {
                $recordModel = Vtiger_Record_Model::getInstanceById($recordId, $moduleName);
            } else {
                $recordModel = Vtiger_Record_Model::getCleanInstance($moduleName);
            }
        }

        $this->generatePDF($request,$moduleName,$recordModel);
    }
    public function generatePDF($request,$moduleName,$recordModel){
        require('libraries/fpdf/fpdm/fpdm.php');
        $viewer = $this->getViewer($request);
        $oldmask = umask(0);
        $recordModel->getDisplayableValues();
        $fields = array(
            'legal_company'=>str_replace( "&#039;", "'",$recordModel->getDisplayableValues()['company']),//iconv('UTF-8', 'windows-1252', html_entity_decode($recordModel->getDisplayableValues()['cf_889'])),
            'dba' => str_replace("&#039;","'",$recordModel->getDisplayableValues()['cf_889']),
            'date_business_start'=> $recordModel->getDisplayableValues()['cf_895'],
            'federal_tax'=>$recordModel->getDisplayableValues()['cf_893'],
            'company_website'=>strip_tags($recordModel->getDisplayableValues()['website']),
            'le_corporation'=>($recordModel->getDisplayableValues()['cf_987']=='Corporation'?'/':''),
            'le_solepropriet'=>($recordModel->getDisplayableValues()['cf_987']=='Sole Proprietorship'?'/':''),
            'le_llc'=>($recordModel->getDisplayableValues()['cf_987']=='LLC'?'/':''),
            'le_other'=>($recordModel->getDisplayableValues()['cf_987']==''?'/':''),
            'le_other_txt'=>'',
            'le_partnership'=>($recordModel->getDisplayableValues()['cf_987']=='Partnership'?'/':''),
            'le_llp'=>($recordModel->getDisplayableValues()['cf_987']=='LLP'?'/':''),
            'industry_products'=>$recordModel->getDisplayableValues()['cf_845'],
            'state_inc'=>$recordModel->getDisplayableValues()['cf_891'],
            'city'=>$recordModel->getDisplayableValues()['city'],
            'phone_number'=>$this->formatphone($recordModel->getDisplayableValues()['phone']),
            'zip'=>$recordModel->getDisplayableValues()['code'],
            'state'=>$recordModel->getDisplayableValues()['state'],
            'company_physical_addr'=>$recordModel->getDisplayableValues()['lane'],//.' '.$recordModel->getDisplayableValues()['city'],
            'gross_anual_revenue'=>($recordModel->getDisplayableValues()['annualrevenue']>0?'$'.$recordModel->getDisplayableValues()['annualrevenue']:''),
            'avg_daily_bnk_bal'=>($recordModel->getDisplayableValues()['cf_789']>0?'$'.$recordModel->getDisplayableValues()['cf_789']:''),
            'request_funding_amt'=>($recordModel->getDisplayableValues()['cf_981']>0?'$'.$recordModel->getDisplayableValues()['cf_981']:''),
            'use_of_proceeds'=>$recordModel->getDisplayableValues()['cf_759'],
            'monthly_payment_rent'=>($recordModel->getDisplayableValues()['cf_757']>0?'$'.$recordModel->getDisplayableValues()['cf_757']:''),
            'landlord_name'=>'',
            'landlord_phone'=>'',
            'compny_own'=>'',
            'compny_rent'=>'',
            'compny_outsand_busi_fund_yes'=>'',
            'compny_outsand_busi_fund_no'=>'',
            'company1'=>'',
            'balance1'=>'',
            'company2'=>'',
            'balance2'=>'',
            'company3'=>'',
            'balance3'=>'',
            'fullname1'=>($recordModel->getDisplayableValues()['firstname']!='' && $recordModel->getDisplayableValues()['lastname'] != ''?$recordModel->getDisplayableValues()['firstname'].' '.$recordModel->getDisplayableValues()['lastname']:$recordModel->getDisplayableValues()['firstname'].' '.$recordModel->getDisplayableValues()['lastname'] ),
            'fullname2'=>($recordModel->getDisplayableValues()['cf_1437']!='' && $recordModel->getDisplayableValues()['cf_1439'] != ''?$recordModel->getDisplayableValues()['cf_1437'].' '.$recordModel->getDisplayableValues()['cf_1439']:$recordModel->getDisplayableValues()['cf_1437'].' '.$recordModel->getDisplayableValues()['cf_1439'] ),
            'ownership_share1'=>($recordModel->getDisplayableValues()['cf_985'] !=''?$recordModel->getDisplayableValues()['cf_985'].'%':''),
            'ownership_share2'=>($recordModel->getDisplayableValues()['cf_1457'] !=''?$recordModel->getDisplayableValues()['cf_1457'].'%':''),
            'yrs_as_owner1'=>$recordModel->getDisplayableValues()['cf_753'],
            'yrs_as_owner2'=>$recordModel->getDisplayableValues()['cf_753'],
            'email1'=>strip_tags($recordModel->getDisplayableValues()['email']),
            'email2'=>strip_tags($recordModel->getDisplayableValues()['cf_1443']),
            'home_phone1'=>$recordModel->getDisplayableValues()['cf_881'],
            'cell_phone1'=>$recordModel->getDisplayableValues()['mobile'],
            'cell_phone2'=>$recordModel->getDisplayableValues()['cf_1449'],
            'ssn1'=>$recordModel->getDisplayableValues()['cf_877'],
            'ssn2'=>$recordModel->getDisplayableValues()['cf_1455'],
            'datebirth1'=>$recordModel->getDisplayableValues()['cf_879'],
            'datebirth2'=>$recordModel->getDisplayableValues()['cf_1445'],
            'home_addr1'=>$recordModel->getDisplayableValues()['cf_1415'].', '.$recordModel->getDisplayableValues()['cf_1423'].' '.$recordModel->getDisplayableValues()['cf_1421'].' '.$recordModel->getDisplayableValues()['cf_1417'],
            'home_addr2'=>$recordModel->getDisplayableValues()['cf_1425'].', '.$recordModel->getDisplayableValues()['cf_1433'].' '.$recordModel->getDisplayableValues()['cf_1429'].' '.$recordModel->getDisplayableValues()['cf_1427'],
            'hemail'=>strip_tags($recordModel->getDisplayableValues()['email']),
            'hphone'=>$this->formatphone($recordModel->getDisplayableValues()['phone']),
            'hfax'=>$recordModel->getDisplayableValues()['fax'],
            'home_phone2'=>$this->formatphone($recordModel->getDisplayableValues()['cf_1447'])
        );
        //$viewer->assign('var1','test');$recordModel->getDisplayableValues()['firstname']
        //$viewer->assign('records',$recordModel->getDisplayableValues());

        $pdf = new FPDM('storage/ave_e.pdf');
        $pdf->Load($fields, false); // second parameter: false if field values are in ISO-8859-1, true if UTF-8
        $pdf->Merge();
        ob_clean();
        ob_flush();
        $pdf->Output("","avefund.pdf");
        chmod("avefund.pdf",0755);
        $file = 'avefund.pdf';
        header('Content-type: application/pdf');
        header('Content-Disposition: inline; filename="' . $file . '"');
        header('Content-Transfer-Encoding: binary');
        header('Accept-Ranges: bytes');
        @readfile($file);
        exit();
    }
    public function formatphone($number){
        if(strlen($number)>10){
            if(  preg_match( '/^(\d{'.(strlen($number)-10).'})(\d{3})(\d{3})(\d{4})$/', $number,  $matches ) )
            {
                $result = $matches[1] . '-' .$matches[2] . '-' . $matches[3]. '-' . $matches[4];
            }
        }else if(strlen($number)<=9) {
            if(  preg_match( '/^(\d{'.(strlen($number)-7).'})(\d{3})(\d{4})$/', $number,  $matches ) )
            {
                $result = $matches[1] . '-' .$matches[2] . '-' . $matches[3];
            }
        }else if(strlen($number)==10){
            if(  preg_match( '/^(\d{3})(\d{3})(\d{4})$/', $number,  $matches ) )
            {
                $result = $matches[1] . '-' .$matches[2] . '-' . $matches[3];
            }
        }
        /*if(  preg_match( '/^(\d{3})(\d{3})(\d{4})$/', $number,  $matches ) )///^\+\d(\d{3})(\d{3})(\d{4})$/
        {
            $result = $matches[1] . '-' .$matches[2] . '-' . $matches[3];
        }*/
        return $result;
    }
}
