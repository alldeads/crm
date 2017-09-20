{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*
********************************************************************************/
-->*}

{strip}
    <div class='container-fluid editViewContainer'>
    <form class="form-horizontal recordEditView" id="EditView" name="EditView" method="post" action="index.php"
          enctype="multipart/form-data">
    {assign var=WIDTHTYPE value=$USER_MODEL->get('rowheight')}
    {if !empty($PICKIST_DEPENDENCY_DATASOURCE)}
        <input type="hidden" name="picklistDependency"
               value='{Vtiger_Util_Helper::toSafeHTML($PICKIST_DEPENDENCY_DATASOURCE)}'/>
    {/if}
    {assign var=QUALIFIED_MODULE_NAME value={$MODULE}}
    {assign var=IS_PARENT_EXISTS value=strpos($MODULE,":")}
    {if $IS_PARENT_EXISTS}
        {assign var=SPLITTED_MODULE value=":"|explode:$MODULE}
        <input type="hidden" name="module" value="{$SPLITTED_MODULE[1]}"/>
        <input type="hidden" name="parent" value="{$SPLITTED_MODULE[0]}"/>
    {else}
        <input type="hidden" name="module" value="{$MODULE}"/>
    {/if}
    <input type="hidden" name="action" value="Save"/>
    <input type="hidden" name="record" value="{$RECORD_ID}"/>
    <input type="hidden" name="defaultCallDuration" value="{$USER_MODEL->get('callduration')}"/>
    <input type="hidden" name="defaultOtherEventDuration" value="{$USER_MODEL->get('othereventduration')}"/>
    {if $IS_RELATION_OPERATION }
        <input type="hidden" name="sourceModule" value="{$SOURCE_MODULE}"/>
        <input type="hidden" name="sourceRecord" value="{$SOURCE_RECORD}"/>
        <input type="hidden" name="relationOperation" value="{$IS_RELATION_OPERATION}"/>
    {/if}
    <div class="contentHeader row-fluid">
        {assign var=SINGLE_MODULE_NAME value='SINGLE_'|cat:$MODULE}
        {if $RECORD_ID neq ''}
            <h3 class="span8 textOverflowEllipsis"
                title="{vtranslate('LBL_EDITING', $MODULE)} {vtranslate($SINGLE_MODULE_NAME, $MODULE)} {$RECORD_STRUCTURE_MODEL->getRecordName()}">{vtranslate('LBL_EDITING', $MODULE)} {vtranslate($SINGLE_MODULE_NAME, $MODULE)}
                - {$RECORD_STRUCTURE_MODEL->getRecordName()}</h3>
        {else}
            <h3 class="span8 textOverflowEllipsis">{vtranslate('LBL_CREATING_NEW', $MODULE)} {vtranslate($SINGLE_MODULE_NAME, $MODULE)}</h3>
        {/if}
        <span class="pull-right">
            <div class="btn btn-success btn-fake-submit" style="display: none">Save</div>
            {if $RECORD_ID neq ''}
                <button class="btn btn-default btn-real-submit" type="submit" style="margin-right:5px;" data-toggle="modal" data-target=".mdlSendToFunder"><strong>{vtranslate('Send To Funder', $MODULE)}</strong></button>
            {/if}
            <button class="btn btn-success btn-real-submit" type="submit"><strong>{vtranslate('LBL_SAVE', $MODULE)}</strong></button>
            <a class="cancelLink" type="reset" onclick="javascript:window.history.back();">{vtranslate('LBL_CANCEL', $MODULE)}</a>
        </span>
    </div>
    {foreach key=BLOCK_LABEL item=BLOCK_FIELDS from=$RECORD_STRUCTURE name="EditViewBlockLevelLoop"}
        {if $BLOCK_FIELDS|@count lte 0}{continue}{/if}
        <table class="table table-bordered blockContainer showInlineTable equalSplit">
            <thead>
            <tr>
                <th class="blockHeader" colspan="4">{vtranslate($BLOCK_LABEL, $MODULE)}</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                {assign var=COUNTER value=0}
                {foreach key=FIELD_NAME item=FIELD_MODEL from=$BLOCK_FIELDS name=blockfields}

                {assign var="isReferenceField" value=$FIELD_MODEL->getFieldDataType()}
                {if $FIELD_MODEL->get('uitype') eq "20" or $FIELD_MODEL->get('uitype') eq "19"}
                {if $COUNTER eq '1'}
                <td class="{$WIDTHTYPE}"></td>
                <td class="{$WIDTHTYPE}"></td>
            </tr>
            <tr>
                {assign var=COUNTER value=0}
                {/if}
                {/if}
                {if $COUNTER eq 2}
            </tr>
            <tr>
                {assign var=COUNTER value=1}
                {else}
                {assign var=COUNTER value=$COUNTER+1}
                {/if}
                <td class="fieldLabel {$WIDTHTYPE}">
                    {if $isReferenceField neq "reference"}<label class="muted pull-right marginRight10px">{/if}
                        {if $FIELD_MODEL->isMandatory() eq true && $isReferenceField neq "reference"}
                            <span class="redColor">*</span>
                        {/if}
                        {if $isReferenceField eq "reference"}
                            {assign var="REFERENCE_LIST" value=$FIELD_MODEL->getReferenceList()}
                            {assign var="REFERENCE_LIST_COUNT" value=count($REFERENCE_LIST)}
                            {if $REFERENCE_LIST_COUNT > 1}
                                {assign var="DISPLAYID" value=$FIELD_MODEL->get('fieldvalue')}
                                {assign var="REFERENCED_MODULE_STRUCT" value=$FIELD_MODEL->getUITypeModel()->getReferenceModule($DISPLAYID)}
                                {if !empty($REFERENCED_MODULE_STRUCT)}
                                    {assign var="REFERENCED_MODULE_NAME" value=$REFERENCED_MODULE_STRUCT->get('name')}
                                {/if}
                                <span class="pull-right">
                                    {if $FIELD_MODEL->isMandatory() eq true}<span class="redColor">*</span>{/if}
                                    <select id="{$MODULE}_editView_fieldName_{$FIELD_MODEL->getName()}_dropDown"
                                            class="chzn-select referenceModulesList streched" style="width:160px;">
                                        <optgroup>
                                            {foreach key=index item=value from=$REFERENCE_LIST}
                                                <option value="{$value}" {if $value eq $REFERENCED_MODULE_NAME} selected {/if}>{vtranslate($value, $MODULE)}</option>
                                            {/foreach}
                                        </optgroup>
                                    </select>
                                </span>
                            {else}
                                <label class="muted pull-right marginRight10px">{if $FIELD_MODEL->isMandatory() eq true}
                                        <span class="redColor">*</span>
                                    {/if}{vtranslate($FIELD_MODEL->get('label'), $MODULE)}</label>
                            {/if}
                        {else if $FIELD_MODEL->get('uitype') eq "83"}
                            {include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getTemplateName(),$MODULE) COUNTER=$COUNTER MODULE=$MODULE}
                        {else}
                            {vtranslate($FIELD_MODEL->get('label'), $MODULE)}
                        {/if}
                        {if $isReferenceField neq "reference"}</label>{/if}
                </td>
                {if $FIELD_MODEL->get('uitype') neq "83"}
                    <td class="fieldValue {$WIDTHTYPE}" {if $FIELD_MODEL->get('uitype') eq '19' or $FIELD_MODEL->get('uitype') eq '20'} colspan="3" {assign var=COUNTER value=$COUNTER+1} {/if}>
                        <div class="row-fluid">
                        <span class="span10">
                            {include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getTemplateName(),$MODULE) BLOCK_FIELDS=$BLOCK_FIELDS}
                        </span>
                        </div>
                    </td>
                {/if}
                {if $BLOCK_FIELDS|@count eq 1 and $FIELD_MODEL->get('uitype') neq "19" and $FIELD_MODEL->get('uitype') neq "20" and $FIELD_MODEL->get('uitype') neq "30" and $FIELD_MODEL->get('name') neq "recurringtype"}
                    <td class="{$WIDTHTYPE}"></td>
                    <td class="{$WIDTHTYPE}"></td>
                {/if}
                {if $MODULE eq 'Events' && $BLOCK_LABEL eq 'LBL_EVENT_INFORMATION' && $smarty.foreach.blockfields.last }
                    {include file=vtemplate_path('uitypes/FollowUp.tpl',$MODULE) COUNTER=$COUNTER}
                {/if}
                {/foreach}
                {* adding additional column for odd number of fields in a block *}
                {if $BLOCK_FIELDS|@end eq true and $BLOCK_FIELDS|@count neq 1 and $COUNTER eq 1}
                    <td class="fieldLabel {$WIDTHTYPE}"></td>
                    <td class="{$WIDTHTYPE}"></td>
                {/if}
            </tr>
            </tbody>
        </table>
        <br/>
    {/foreach}

    <script type="text/javascript">
        $(document).ready(function () {

            /* Follower Panel */
            var followers = [
                'cf_1501',
                'cf_1505',
                'cf_1507'
            ];

            var assignto = $( "[name=assigned_user_id]" );

            $.each( followers, function ( index, el ) {
                var value = $( "#Leads_editView_fieldName_" + el ).val();
                $( "#Leads_editView_fieldName_" + el ).hide();
                assignto.clone().prop( "name", el ).insertAfter( "#Leads_editView_fieldName_" + el );
                $( "[name="+ el +"]" ).val( value );
            } );
            /* End of follower panel
             * Edited By: T-Rex
             *
             * Send details to panel */
            var selectorFields = [
                'cf_1515', /* Avenew Disposition */
                'cf_1525', /* Avenew Offer Status */
                'cf_1133', /* CFG Disposition */
                'cf_1129', /* PAR Disposition */
                'cf_1271', /* CFG Offer Status */
                'cf_1267', /* PAR Offer Status */
                'cf_1127', /* FORA Disposition */
                'cf_1147', /* Forward Fin Disposition */
                'cf_1265', /* FORA Offer Status */
                'cf_1287', /* FORA Fin Offer Status */
                'cf_1149', /* Accord Disposition */
                'cf_1131', /* YS Disposition */
                'cf_1289', /* Accord Offer Status */
                'cf_1269', /* YS Offer Status */
                'cf_1135', /* Discount Disposition */
                'cf_1143', /* 6th Ave Disposition */
                'cf_1273', /* Discount Offer Status */
                'cf_1285', /* 6th Ave Offer Status */
                'cf_1297', /* Midnight Disposition */
                'cf_1145', /* Everlasting Disposition */
                'cf_1307', /* Midnight Offer Status */
                'cf_1283', /* Everlasting Offer Status */
                'cf_1139', /* Knight Disposition */
                'cf_1137', /* QuarterSpot Disposition */
                'cf_1277', /* Knight Offer Status */
                'cf_1275', /* QuarterSpot Offer Status */
                'cf_1315', /* Fundworks Disposition */
                'cf_1325', /* Fundwork Offer Status */
                'cf_1333', /* YES Funder Disposition */
                'cf_1343', /* YES Funder Offer Status */
                'cf_1535', /* Snap Advance Disposition */
                'cf_1545'  /* Snap Advance Offer Status */
            ];

            var checkBoxes = [
                '#Leads_editView_fieldName_cf_911', /* CFG */
                '#Leads_editView_fieldName_cf_905', /* PAR */
                '#Leads_editView_fieldName_cf_903', /* FORA */
                '#Leads_editView_fieldName_cf_923', /* Forward Fn */
                '#Leads_editView_fieldName_cf_909', /* Accord */
                '#Leads_editView_fieldName_cf_913', /* Discount */
                '#Leads_editView_fieldName_cf_919', /* 6th Ave */
                '#Leads_editView_fieldName_cf_1291', /* Midnight */
                '#Leads_editView_fieldName_cf_921', /* Everlasting */
                '#Leads_editView_fieldName_cf_915', /* Knight */
                '#Leads_editView_fieldName_cf_925', /* QuarterSpot */
                '#Leads_editView_fieldName_cf_1509', /* AveNew */
                '#Leads_editView_fieldName_cf_1327',  /* Yes */
                '#Leads_editView_fieldName_cf_1529',  /* Snap Advance */
                '#Leads_editView_fieldName_cf_1555',   /* World Global */
                '#Leads_editView_fieldName_cf_907'   /* YS */
            ];

            /* Wait for the elements to be load then add border color accordingly */
            $( window ).load( function () {
                $.each( checkBoxes, function ( index, elem ) {
                    borderColor( elem, $( elem ).parent().parent().parent().prev().text() );
                } );
            } );

            /* Wait for the elements to be load then change option color accordingly */
            $( window ).load( function () {
                $.each( selectorFields, function ( index, elem ) {
                    changeOptionColor( $( "[name=" + elem + "]" ), $( "[name=" + elem + "]" ).find(":selected").text() );
                } );
            } );

            /* Detect the select fields if its changed then change option color accordingly */
            $.each( selectorFields, function ( index, elem ) {
                $( "[name=" + elem + "]" ).on( "change", function () {
                    changeOptionColor( $( this ), $( this ).find(":selected").text() );
                } );
            } );

            /* Detect the check boxes if its checked then add border color accordingly */
            $.each( checkBoxes, function ( index, elem ) {
                $( elem ).on( "click", function () {
                    borderColor( elem, $( elem ).parent().parent().parent().prev().text() );
                } );
            } );

            /* Border Color in each checked funder */
            function borderColor ( element, value ) {
                var fields = $( "td:contains("+ value +")" );
                if ( $( element ).is(':checked') ) {
                    $.each( fields, function ( index, elem ) {
                        if ( index == 0 ) {
                            $( elem ).attr( "style", "border-top: 1px solid red;border-left: 1px solid red;" );
                            $( elem ).next().attr( "style", "border-top: 1px solid red;border-right: 1px solid red;" );
                        } else if ( index < 8 ) {
                            $( elem ).attr( "style", "border-left: 1px solid red;" );
                            $( elem ).next().attr( "style", "border-right: 1px solid red;" );
                        } else {
                            $( elem ).attr( "style", "border-left: 1px solid red;border-bottom:1px solid red;" );
                            $( elem ).next().attr( "style", "border-right: 1px solid red;border-bottom:1px solid red;" );
                        }
                    } );
                } else {
                    $.each( fields, function ( index, elem ) {
                        $( elem ).removeAttr( "style" );
                        $( elem ).next().removeAttr( "style" );
                    } );
                }
            }

            /* Change option color */
            function changeOptionColor ( element, value ) {
                $( element ).next( "div" ).hide();
                switch( value ) {
                    case "Accepted":
                        $( element ).attr( "style", "background-color:green; color:white;" );
                        break;
                    case "Declined":
                        if ( $( element ).children('option').length > 3 ) {
                            $( element ).attr( "style", "background-color:red; color:white;" );
                            break;
                        }
                        $( element ).attr( "style", "background-color:purple; color:white;" );
                        break;
                    case "Offer Made":
                        $( element ).attr( "style", "background-color:yellow; color:black;" );
                        break;
                    case "Expired":
                        $( element ).attr( "style", "background-color:#ff9800; color:white;" );
                        break;
                    case "Hold":
                        $( element ).attr( "style", "background-color:#2196f3; color:white;" );
                        break;
                    default:
                        $( element ).removeAttr( "style" );
                }
            }
            /* End of Send details to panel
            *  Edited By: T-Rex*/

            function isPhoneNumber(value) {
                return value.match(/\d/g).length === 11;
            }

            function isNumber(value) {
                return !isNaN(value);
            }

            var requiredFieldsForPreUnderwriting = [
                'Leads_editView_fieldName_company', /* Company */
                'Leads_s', /* Status */
                'Leads_editView_fieldName_phone', /* Primary Phone */
                'Leads_editView_fieldName_annualrevenue', /* Annual Revenue */
                'Leads_editView_fieldName_cf_877', /* Social Security */
                'Leads_editView_fieldName_cf_985', /* Percentage Ownership */
                'Leads_b', /* MCA Business Type */
                'Leads_editView_fieldName_cf_893', /* Tax Id Number */
                'Leads_editView_fieldName_cf_759', /* Use of Funds */
                'Leads_editView_fieldName_lastname', /* Lastname */
                'Leads_editView_fieldName_cf_981', /* Amount Needed */
                'Leads_editView_fieldName_cf_879', /* Birth Date */
                'Leads_editView_fieldName_cf_895', /* Business Start Date */
                'Leads_editView_fieldName_cf_1415', /* Owner Home Street */
                'Leads_editView_fieldName_cf_1421', /* Owner State Address */
                'Leads_editView_fieldName_cf_1423', /* Owner City */
                'Leads_editView_fieldName_cf_1417', /* Owner Address Postal Code */
                'Leads_editView_fieldName_lane', /* Street */
                'Leads_editView_fieldName_city', /* City */
                'Leads_editView_fieldName_code', /* Postal Code */
                'Leads_editView_fieldName_state', /* State */
                'Leads_editView_fieldName_cf_887', /* LegalBusiness Name */
                'Leads_editView_fieldName_email' /* Primary Email */
            ];

            $("[name=cf_847]").on('change', function () {
                var thisElem = $(this);
                var val = thisElem.val();
                $(".btn-real-submit").show();
                $(".btn-fake-submit").hide();
                if (val == "Verified for Underwriting") {
                    checkForError(thisElem);
                    $(".btn-real-submit").hide();
                    $(".btn-fake-submit").show();
                }
            });

            $('.contentHeader .btn-fake-submit').on('click', function (e) {
                e.preventDefault();
                var status = $('[name=cf_847]').val();
                if (status == "Verified for Underwriting") {
                    var error = checkForError();
                    if (!error) {
                        $(".btn-real-submit").click();
                    }
                }
            });

            function checkForError(param = '') {
                var hasError = false;
                $.each(requiredFieldsForPreUnderwriting, function (index, el) {
                    var elem = $('#' + el);
                    var elembordered = elem;

                    if (el == 'Leads_s') {
                        elem = $("[name=cf_847]");
                        elembordered = elem.next();
                    }
                    if (el == 'Leads_b') {
                        elem = $("[name=cf_987]");
                        elembordered = elem.next();
                    }

                    var elemtext = elem.parents("td").prev().text();

                    var elemVal = elem.val();
                    if (elemVal == '' || elemVal === undefined) {
                        elembordered.attr('style', 'border: 1px solid red !important;');
                        hasError = true;

                        if ($("." + el).length == 0) {
                            var notification = {
                                text: elemtext + " is required.",
                                type: 'error',
                                delay: '4000',
                                addclass: el
                            };
                            Vtiger_Helper_Js.showPnotify(notification);
                        }
                    } else {
                        elembordered.attr('style', 'border: 1px solid #ccc !important;');
                    }

                    if (el == 'Leads_editView_fieldName_phone' && (elemVal != '' || elemVal !== undefined)) {
                        if (elemVal.match(/[^$,.\d]/)) {
                            var newElemVal = elemVal.replace(/\D/g, '');
                            elem.val(newElemVal);
                        }
                    }
                    if (el == 'Leads_editView_fieldName_cf_981' && (elemVal != '' || elemVal !== undefined)) {
                        var newElemVal = elemVal.replace(/\D/g, '');
                        if (elemVal.indexOf('K') != -1) {
                            if (newElemVal < 10) {
                                elem.attr('style', 'border: 1px solid red !important;');
                                hasError = true;
                            }
                        }
                        if (elemVal.indexOf('M') != -1) {
                            if (newElemVal > 10) {
                                elem.attr('style', 'border: 1px solid red !important;');
                                hasError = true;
                            }
                        }
                    }
                });

                return hasError;

            }

            /* Appends * for requried fields for Verified for uderwriting */
            $.each(requiredFieldsForPreUnderwriting, function (index, el) {
                var elem = $('#' + el);

                if (el == 'Leads_s') {
                    elem = $("[name=cf_847]");
                }
                if (el == 'Leads_b') {
                    elem = $("[name=cf_987]");
                }

                var elemlabel = elem.parents("td").prev().find("label");
                var elemtext = elemlabel.text();

                if(elemlabel.find("span.redColor").length == 0) {
                    elemlabel.html('<span class="redColor">*</span>' + elemtext);
                    elemlabel.addClass("text-right");
                }

            });

        });
    </script>
{/strip}