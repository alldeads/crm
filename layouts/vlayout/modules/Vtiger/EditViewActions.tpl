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
	<div class="row-fluid">
		<div class="pull-right">
            {if $RECORD_ID neq ''}
				<button class="btn btn-default btn-real-submit pull-right" type="button"  data-toggle="modal" data-target=".mdlSendToFunder"><strong>{vtranslate('Send To Funder', $MODULE)}</strong></button>
            {/if}
			<button class="btn btn-success" type="submit"><strong>{vtranslate('LBL_SAVE', $MODULE)}</strong></button>
			<a class="cancelLink" type="reset" onclick="javascript:window.history.back();">{vtranslate('LBL_CANCEL', $MODULE)}</a>
		</div>
		<div class="clearfix"></div>
	</div>
	<br>
	</form>
    {if $RECORD_ID neq ''}
		<div class="modal fade mdlSendToFunder" role="dialog" style="top:70%;display:none">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Send To Funder</h4>
					</div>
					<form id="sendToFunder">
						<div class="modal-body">
							<div class="form-group pull-right">
								<label for="file"><b>Files:</b></label>
                                {if !empty($USER_ATTACHMENTS)}
									<select class="form-control" name="file[]"  multiple="multiple" id="file">
                                        {foreach key=BLOCK_LABEL item=BLOCK_FIELDS from=$USER_ATTACHMENTS }
                                            {foreach key=LABEL item=DATA from=$BLOCK_FIELDS }
                                                {if $LABEL eq 'filelocation'}
													<option value="{$DATA}">
                                                        {elseif $LABEL eq 'filename'}
                                                        {$DATA}</option>
                                                {/if}
                                            {/foreach}
                                        {/foreach}
									</select>
                                {else}
									<p>No available files !</p>
                                {/if}
							</div>
							<div class="form-group">
								<input type="hidden" id="company" name="company">
								<input type="hidden" id="ownername" name="ownername">
								<input type="hidden" id="phone" name="phone">
								<input type="hidden" id="email" name="email">
								<input type="hidden" id="amtRqstd" name="amtRqstd">
								<input type="hidden" id="monthlyDeposit" name="monthlyDeposit">
								<input type="hidden" id="aveMonthlyDeposit" name="aveMonthlyDeposit">
								<input type="hidden" id="useOfFunds" name="useOfFunds">
								<input type="hidden" id="existingLoan" name="existingLoan">
								<input type="hidden" id="notes" name="notes">
								<input type="hidden" id="existingFundingNotes" name="existingFundingNotes">
								<label for="recipient"><b>Recipient:</b></label>
								<select class="form-control" name="recipient[]"  multiple="multiple" id="recipient">
									<optgroup label="Accord"></<optgroup><option value="underwriting@accordbf.com" selected>Mike Ballases</option><option value="kdinh@accordbusinessfunding.com">Kevin Dinh</option></optgroup>
									<optgroup label="CFGMS"></<optgroup><option value="pbalint@cfgms.com">Paul Ballint</option></optgroup>
									<optgroup label="Discount"></<optgroup><option value="Brookie@discountmerchantfunding.com">Brooke Aiello</option><option value="gerald@discountmerchantfunding.com">Gerald</option></optgroup>
									<optgroup label="Everlasting"></<optgroup><option value="iso@everlastingcapital.com">ISO</option><option value="bperry@everlastingcapital.com">Perry</option><option value="bwhite@everlastingcapital.com">White</option></optgroup>
									<optgroup label="Fora"></<optgroup><option value="DMaher@forafinancial.com">Daniel Maher</option></optgroup>
									<optgroup label="Forward"></<optgroup><option value="jcapadanno@forwardfinancing.com">Jill Capadano</option><option value="submissions@forwardfinancing.com">Submissions</option></optgroup>
									<optgroup label="Knight"></<optgroup><option value="David.Caro@knightcapitalfunding.com">David Caro</option></optgroup>
									<optgroup label="Quarter Spot"></<optgroup><option value="submissions@quarterspot.com">Submissions</option></optgroup>
									<optgroup label="Snap Advances"></<optgroup><option value="pharvey@snapadvances.com">Peter Harvey</option><option value="submissions@snapadvances.com">Submissions</option></optgroup>
									<optgroup label="WBL"></<optgroup><option value="cpepe@worldbusinesslenders.com">Chris Pepe</option><option value="wholesale@wbl.com">Wholesale</option></optgroup>
									<optgroup label="Yellow Stone"></<optgroup><option value="jschiff@yellowstonecapllc.com">Jamie Sciff</option></optgroup>
									<optgroup label="Yes Lender"></<optgroup><option value="bretd@yeslender.com">Bret</option><option value="deals@yeslender.com">Deals</option><option value="gregc@yeslender.com">Greg</option><option value="lane.kelly@yeslender.com">Kelly</option></optgroup>
									<optgroup label="6th Ave"></<optgroup><option value="jarett.zackman@6thavecap.com">Jarett Zackman</option><option value="submissions@6thavenuecapital.com">Submissions</option></optgroup>
                                    <optgroup label="Test"><option value="michele@avenewfunding.com">Michele</option><option value="pfernandez@channelgrowth.com">Pearl</option><option value="rflores@channelgrowth.com">Rex</option><option value="wendy@avenewfunding.com">Wendy</option></<optgroup>
								</select>
							</div>

						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-default" >Send</button>
						</div>
					</form>
				</div>
			</div>
		</div>
    {/if}

	</div>
	<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<script type="text/javascript">
		var run = {
			'initEvents' : function () {
				this.sendFunderEmail();
			},

            'validateEmailData' : function ( params ) {
				$.ajax({
					type:"POST",
					url: "index.php?module=Leads&view=SendToAFunder&record={$RECORD_ID}",
					data: params,
					cache: false,
					success: function ( html ) {
						toastr.info( "Email sent !" );
					}
				});
            },

			'sendFunderEmail' : function () {
			    var self = this;
                $( "#sendToFunder" ).on( "submit", function ( ev ) {
                    ev.preventDefault();
                    $("#company").val( $("#Leads_editView_fieldName_company").val() );
                    $("#ownername").val( $("[name=salutationtype]").find(":selected").val() + $("[name=firstname]").val() + ' ' + $("[name=lastname]").val()  );
                    $("#phone").val( $("#Leads_editView_fieldName_phone").val() );
                    $("#email").val( $("#Leads_editView_fieldName_email").val() );
                    $("#amtRqstd").val( $("#Leads_editView_fieldName_cf_981").val() );
                    $("#monthlyDeposit").val( $("#Leads_editView_fieldName_cf_787").val() );
                    $("#aveMonthlyDeposit").val( $("#Leads_editView_fieldName_cf_757").val() );
                    $("#useOfFunds").val( $("#Leads_editView_fieldName_cf_759").val() );
                    $("#existingLoan").val( $("#Leads_editView_fieldName_cf_799").val() );
                    $("#notes").val( $("#Leads_editView_fieldName_cf_831").text() );
                    $("#existingFundingNotes").val( $("#Leads_editView_fieldName_cf_841").val() );
                    var params = $( this ).serialize();
                    self.validateEmailData( params );
                    $(".mdlSendToFunder").modal('toggle');
                } );
			}

		};

        $(document).ready(function () {
			run.initEvents();
        } );
	</script>
{/strip}