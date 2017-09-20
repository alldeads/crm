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
    {foreach key=BLOCK_LABEL_KEY item=FIELD_MODEL_LIST from=$RECORD_STRUCTURE}
        {assign var=BLOCK value=$BLOCK_LIST[$BLOCK_LABEL_KEY]}
        {if $BLOCK eq null or $FIELD_MODEL_LIST|@count lte 0}{continue}{/if}
        {assign var=IS_HIDDEN value=$BLOCK->isHidden()}
        {assign var=WIDTHTYPE value=$USER_MODEL->get('rowheight')}
		<input type=hidden name="timeFormatOptions" data-value='{$DAY_STARTS}' />
		<table class="table table-bordered equalSplit detailview-table">
			<thead>
			<tr>
				<th class="blockHeader" colspan="4">
					<img class="cursorPointer alignMiddle blockToggle {if !($IS_HIDDEN)} hide {/if} "  src="{vimage_path('arrowRight.png')}" data-mode="hide" data-id={$BLOCK_LIST[$BLOCK_LABEL_KEY]->get('id')}>
					<img class="cursorPointer alignMiddle blockToggle {if ($IS_HIDDEN)} hide {/if}"  src="{vimage_path('arrowDown.png')}" data-mode="show" data-id={$BLOCK_LIST[$BLOCK_LABEL_KEY]->get('id')}>
					&nbsp;&nbsp;{vtranslate({$BLOCK_LABEL_KEY},{$MODULE_NAME})}
				</th>
			</tr>
			</thead>
			<tbody {if $IS_HIDDEN} class="hide" {/if}>
            {assign var=COUNTER value=0}
			<tr>
                {foreach item=FIELD_MODEL key=FIELD_NAME from=$FIELD_MODEL_LIST}
                {if !$FIELD_MODEL->isViewableInDetailView()}
                    {continue}
                {/if}
                {if $FIELD_MODEL->get('uitype') eq "83"}
                {foreach item=tax key=count from=$TAXCLASS_DETAILS}
                {if $tax.check_value eq 1}
                {if $COUNTER eq 2}
			</tr><tr>
                {assign var="COUNTER" value=1}
                {else}
                {assign var="COUNTER" value=$COUNTER+1}
                {/if}
				<td class="fieldLabel {$WIDTHTYPE}">
					<label class='muted pull-right marginRight10px'>{vtranslate($tax.taxlabel, $MODULE)}(%)</label>
				</td>
				<td class="fieldValue {$WIDTHTYPE}">
						 <span class="value">
							 {$tax.percentage}
						 </span>
				</td>
                {/if}
                {/foreach}
                {else if $FIELD_MODEL->get('uitype') eq "69" || $FIELD_MODEL->get('uitype') eq "105"}
                {if $COUNTER neq 0}
                {if $COUNTER eq 2}
			</tr><tr>
                {assign var=COUNTER value=0}
                {/if}
                {/if}
				<td class="fieldLabel {$WIDTHTYPE}"><label class="muted pull-right marginRight10px">{vtranslate({$FIELD_MODEL->get('label')},{$MODULE_NAME})}</label></td>
				<td class="fieldValue {$WIDTHTYPE}">
					<div id="imageContainer" width="300" height="200">
                        {foreach key=ITER item=IMAGE_INFO from=$IMAGE_DETAILS}
                            {if !empty($IMAGE_INFO.path) && !empty({$IMAGE_INFO.orgname})}
								<img src="{$IMAGE_INFO.path}_{$IMAGE_INFO.orgname}" width="300" height="200">
                            {/if}
                        {/foreach}
					</div>
				</td>
                {assign var=COUNTER value=$COUNTER+1}
                {else}
                {if $FIELD_MODEL->get('uitype') eq "20" or $FIELD_MODEL->get('uitype') eq "19"}
                {if $COUNTER eq '1'}
				<td class="{$WIDTHTYPE}"></td><td class="{$WIDTHTYPE}"></td></tr><tr>
                {assign var=COUNTER value=0}
                {/if}
                {/if}
                {if $COUNTER eq 2}
			</tr><tr>
                {assign var=COUNTER value=1}
                {else}
                {assign var=COUNTER value=$COUNTER+1}
                {/if}
				<td class="fieldLabel {$WIDTHTYPE}" id="{$MODULE_NAME}_detailView_fieldLabel_{$FIELD_MODEL->getName()}" {if $FIELD_MODEL->getName() eq 'description' or $FIELD_MODEL->get('uitype') eq '69'} style='width:8%'{/if}>
					<label class="muted pull-right marginRight10px">
                        {vtranslate({$FIELD_MODEL->get('label')},{$MODULE_NAME})}
                        {if ($FIELD_MODEL->get('uitype') eq '72') && ($FIELD_MODEL->getName() eq 'unit_price')}
							({$BASE_CURRENCY_SYMBOL})
                        {/if}
					</label>
				</td>
				<td class="fieldValue {$WIDTHTYPE}" id="{$MODULE_NAME}_detailView_fieldValue_{$FIELD_MODEL->getName()}" {if $FIELD_MODEL->get('uitype') eq '19' or $FIELD_MODEL->get('uitype') eq '20'} colspan="3" {assign var=COUNTER value=$COUNTER+1} {/if}>
					 <span class="value" data-field-type="{$FIELD_MODEL->getFieldDataType()}" {if $FIELD_MODEL->get('uitype') eq '19' or $FIELD_MODEL->get('uitype') eq '20' or $FIELD_MODEL->get('uitype') eq '21'} style="white-space:normal;" {/if}>
                        {include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getDetailViewTemplateName(),$MODULE_NAME) FIELD_MODEL=$FIELD_MODEL USER_MODEL=$USER_MODEL MODULE=$MODULE_NAME RECORD=$RECORD}
					 </span>
                    {if $IS_AJAX_ENABLED && $FIELD_MODEL->isEditable() eq 'true' && ($FIELD_MODEL->getFieldDataType()!=Vtiger_Field_Model::REFERENCE_TYPE) && $FIELD_MODEL->isAjaxEditable() eq 'true'}
						<span class="hide edit">
							 {include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getTemplateName(),$MODULE_NAME) FIELD_MODEL=$FIELD_MODEL USER_MODEL=$USER_MODEL MODULE=$MODULE_NAME}
                            {if $FIELD_MODEL->getFieldDataType() eq 'multipicklist'}
								<input type="hidden" class="fieldname" value='{$FIELD_MODEL->get('name')}[]' data-prev-value='{$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'))}' />
                             {else}
                                 <input type="hidden" class="fieldname" value='{$FIELD_MODEL->get('name')}' data-prev-value='{Vtiger_Util_Helper::toSafeHTML($FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue')))}' />
                            {/if}
						 </span>
                    {/if}
				</td>
                {/if}

                {if $FIELD_MODEL_LIST|@count eq 1 and $FIELD_MODEL->get('uitype') neq "19" and $FIELD_MODEL->get('uitype') neq "20" and $FIELD_MODEL->get('uitype') neq "30" and $FIELD_MODEL->get('name') neq "recurringtype" and $FIELD_MODEL->get('uitype') neq "69" and $FIELD_MODEL->get('uitype') neq "105"}
					<td class="fieldLabel {$WIDTHTYPE}"></td><td class="{$WIDTHTYPE}"></td>
                {/if}
                {/foreach}
                {* adding additional column for odd number of fields in a block *}
                {if $FIELD_MODEL_LIST|@end eq true and $FIELD_MODEL_LIST|@count neq 1 and $COUNTER eq 1}
					<td class="fieldLabel {$WIDTHTYPE}"></td><td class="{$WIDTHTYPE}"></td>
                {/if}
			</tr>
			</tbody>
		</table>
		<br>
    {/foreach}

	<script type="text/javascript">
        $(document).ready(function () {
            /* Disable edit status */
            $( '[name=cf_847]' ).attr('disabled',true);

            /*Hide Follower Panel*/
			$( '#Leads_detailView_fieldLabel_cf_1501' ).parent().parent().parent().hide();

			/* Send details panel */
            var selectorFields = [
                '#Leads_detailView_fieldValue_cf_1515', /* Avenew Disposition */
                '#Leads_detailView_fieldValue_cf_1525', /* Avenew Offer Status */
                '#Leads_detailView_fieldValue_cf_1133', /* CFG Disposition */
                '#Leads_detailView_fieldValue_cf_1129', /* PAR Disposition */
                '#Leads_detailView_fieldValue_cf_1271', /* CFG Offer Status */
                '#Leads_detailView_fieldValue_cf_1267', /* PAR Offer Status */
                '#Leads_detailView_fieldValue_cf_1127', /* FORA Disposition */
                '#Leads_detailView_fieldValue_cf_1147', /* Forward Fin Disposition */
                '#Leads_detailView_fieldValue_cf_1265', /* FORA Offer Status */
                '#Leads_detailView_fieldValue_cf_1287', /* FORA Fin Offer Status */
                '#Leads_detailView_fieldValue_cf_1149', /* Accord Disposition */
                '#Leads_detailView_fieldValue_cf_1131', /* YS Disposition */
                '#Leads_detailView_fieldValue_cf_1289', /* Accord Offer Status */
                '#Leads_detailView_fieldValue_cf_1269', /* YS Offer Status */
                '#Leads_detailView_fieldValue_cf_1135', /* Discount Disposition */
                '#Leads_detailView_fieldValue_cf_1143', /* 6th Ave Disposition */
                '#Leads_detailView_fieldValue_cf_1273', /* Discount Offer Status */
                '#Leads_detailView_fieldValue_cf_1285', /* 6th Ave Offer Status */
                '#Leads_detailView_fieldValue_cf_1297', /* Midnight Disposition */
                '#Leads_detailView_fieldValue_cf_1145', /* Everlasting Disposition */
                '#Leads_detailView_fieldValue_cf_1307', /* Midnight Offer Status */
                '#Leads_detailView_fieldValue_cf_1283', /* Everlasting Offer Status */
                '#Leads_detailView_fieldValue_cf_1139', /* Knight Disposition */
                '#Leads_detailView_fieldValue_cf_1137', /* QuarterSpot Disposition */
                '#Leads_detailView_fieldValue_cf_1277', /* Knight Offer Status */
                '#Leads_detailView_fieldValue_cf_1275', /* QuarterSpot Offer Status */
                '#Leads_detailView_fieldValue_cf_1315', /* Fundworks Disposition */
                '#Leads_detailView_fieldValue_cf_1325', /* Fundwork Offer Status */
                '#Leads_detailView_fieldValue_cf_1333', /* YES Funder Disposition */
                '#Leads_detailView_fieldValue_cf_1343', /* YES Funder Offer Status */
                '#Leads_detailView_fieldValue_cf_1535', /* Snap Advance Disposition */
                '#Leads_detailView_fieldValue_cf_1545'  /* Snap Advance Offer Status */
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

            /* Wait for the elements to be load then change option color accordingly */
            $( window ).load( function () {
                $.each(selectorFields, function (index, elem) {
                    changeOptionColor(elem, $(elem).find("span.value").text().trim());
                } );
            } );


            /* Detect the select fields if its changed then change option color accordingly */
            $.each( selectorFields, function ( index, elem ) {
                $( "[name=" + elem.split("fieldValue_")[1] + "]" ).on( "change", function () {
                    changeOptionColor( elem, $( "[name=" + elem.split("fieldValue_")[1] + "]" ).find(":selected").text() );
                } );
            } );

            /* Remove the color when focus */
            $.each( selectorFields, function ( index, elem ) {
                $( "[name=" + elem.split("fieldValue_")[1] + "]" ).on( "focus", function () {
                    $( elem ).removeAttr( "style" );
                } );
            } );

            /* Detect the check boxes if its checked then add border color accordingly */
            $.each( checkBoxes, function ( index, elem ) {
                $( elem ).on( "click", function () {
                    borderColor( elem, $( elem ).parent().parent().prev().text() );
                } );
            } );

            /* Change option color */
            function changeOptionColor ( element, value ) {
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
			/* End of send details to panel
			 * Edited By: T-rex */

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

        } );
	</script>
{/strip}