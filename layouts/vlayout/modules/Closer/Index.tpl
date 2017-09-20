{strip}
    <style>
        th,
        td{
            border-right: 1px solid #ccc;
        }
    </style>
    <div class="listViewPageDiv">
        <div class="listViewContentDiv" id="listViewContents">
            <div class="closerHeading" style="text-align: center; padding: 20px 0px;">
                <h1>Closers</h1>
            </div>
            <div class="listViewEntriesDiv contents-bottomscroll" style="width: 30%; display: inline-block; overflow-x: scroll!important;">
                <div class="bottomscroll-div" style="width: auto;">
                <table class="table table-bordered listViewEntriesTable">
                    <thead>
                    <tr class="listViewHeaders">
                        <th nowrap><a class="listViewHeaderValues">First Name</a></th>
                        <th nowrap><a class="listViewHeaderValues">Last Name</a></th>
                        <th nowrap><a class="listViewHeaderValues">Company</a></th>
                    </tr>
                    </thead>
                    {if !empty($CLOSERS)}
                        <tbody>
                        {foreach item=closer from=$CLOSERS}
                            <tr class="listViewEntries" data-id="{$closer['leadid']}"
                                data-recordurl="index.php?module=Leads&view=Detail&record={$closer['leadid']}">
                                <td class="listViewEntryValue medium" nowrap><a
                                            href="index.php?module=Leads&view=Detail&record={$closer['leadid']}">{$closer['firstname']}</a>
                                </td>
                                <td class="listViewEntryValue medium" nowrap><a
                                            href="index.php?module=Leads&view=Detail&record={$closer['leadid']}">{$closer['lastname']}</a>
                                </td>
                                <td class="listViewEntryValue medium" nowrap><a>{$closer['company']}</a></td>
                            </tr>
                        {/foreach}
                        </tbody>
                    {/if}
                </table>
            </div>
                </div>
            <div class="listViewEntriesDiv contents-bottomscroll" style="width: 70%; display: inline-block;">
                <div class="bottomscroll-div" style="width: auto;">
                    <table class="table table-bordered listViewEntriesTable">
                        <thead>
                        <tr class="listViewHeaders">
                            <th nowrap><a class="listViewHeaderValues">Lead Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">Fail Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">Assigned To</a></th>
                            <th nowrap><a class="listViewHeaderValues">Primary Phone</a></th>
                            <th nowrap><a class="listViewHeaderValues">Primary Email</a></th>
                            <th nowrap><a class="listViewHeaderValues">Designation</a></th>
                            <th nowrap><a class="listViewHeaderValues">Industry Type</a></th>
                            <th nowrap><a class="listViewHeaderValues">Annual Revenue</a></th>
                            <th nowrap><a class="listViewHeaderValues">Lead Source</a></th>
                            <th nowrap><a class="listViewHeaderValues">Bank Statements</a></th>
                            <th nowrap><a class="listViewHeaderValues">Email Opt Out</a></th>
                            <th nowrap><a class="listViewHeaderValues">Home Phone</a></th>
                            <th nowrap><a class="listViewHeaderValues">Fax</a></th>
                            <th nowrap><a class="listViewHeaderValues">Date of Birth</a></th>
                            <th nowrap><a class="listViewHeaderValues">Social Security</a></th>
                            <th nowrap><a class="listViewHeaderValues">Modified Time</a></th>
                            <th nowrap><a class="listViewHeaderValues">Website</a></th>
                            <th nowrap><a class="listViewHeaderValues">Disposed (For Development)</a></th>
                            <th nowrap><a class="listViewHeaderValues">Percentage of Ownership</a></th>
                            <th nowrap><a class="listViewHeaderValues">Second Owner First Name</a></th>
                            <th nowrap><a class="listViewHeaderValues">Second Owner Last Name</a></th>
                            <th nowrap><a class="listViewHeaderValues">Second Owner Date of Birth</a></th>
                            <th nowrap><a class="listViewHeaderValues">Second Owner Home Phone Number</a></th>
                            <th nowrap><a class="listViewHeaderValues">Second Owner Email Address</a></th>
                            <th nowrap><a class="listViewHeaderValues">Second Owner Office Phone Number</a></th>
                            <th nowrap><a class="listViewHeaderValues">Second Owner Add Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">Second Owner SSN</a></th>
                            <th nowrap><a class="listViewHeaderValues">Second Owner Percentage of Ownership</a></th>
                            <th nowrap><a class="listViewHeaderValues">Average Monthly Deposit</a></th>
                            <th nowrap><a class="listViewHeaderValues">Used of Funds</a></th>
                            <th nowrap><a class="listViewHeaderValues">Amount Needed</a></th>
                            <th nowrap><a class="listViewHeaderValues">Existing Funding Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">MCA Business Type</a></th>
                            <th nowrap><a class="listViewHeaderValues">Legal Business Name</a></th>
                            <th nowrap><a class="listViewHeaderValues">When Funds are needed</a></th>
                            <th nowrap><a class="listViewHeaderValues">Business Start Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">DBA Name</a></th>
                            <th nowrap><a class="listViewHeaderValues">State of Incorporation</a></th>
                            <th nowrap><a class="listViewHeaderValues">Time in Business</a></th>
                            <th nowrap><a class="listViewHeaderValues">Tax ID Number</a></th>
                            <th nowrap><a class="listViewHeaderValues">Assigned LE - Name</a></th>
                            <th nowrap><a class="listViewHeaderValues">Assigned LE - Email</a></th>
                            <th nowrap><a class="listViewHeaderValues">Street</a></th>
                            <th nowrap><a class="listViewHeaderValues">State</a></th>
                            <th nowrap><a class="listViewHeaderValues">City</a></th>
                            <th nowrap><a class="listViewHeaderValues">Postal Code</a></th>
                            <th nowrap><a class="listViewHeaderValues">Owner Home Street</a></th>
                            <th nowrap><a class="listViewHeaderValues">Owner State Address</a></th>
                            <th nowrap><a class="listViewHeaderValues">Owner City</a></th>
                            <th nowrap><a class="listViewHeaderValues">Owner Address Postal Code</a></th>
                            <th nowrap><a class="listViewHeaderValues">Second Owner Home Street</a></th>
                            <th nowrap><a class="listViewHeaderValues">Second Owner State Address</a></th>
                            <th nowrap><a class="listViewHeaderValues">Second Owner City</a></th>
                            <th nowrap><a class="listViewHeaderValues">Second Owner Address Postal Code</a></th>
                            <th nowrap><a class="listViewHeaderValues">Monthly Deposit</a></th>
                            <th nowrap><a class="listViewHeaderValues">Frequency of Deposits</a></th>
                            <th nowrap><a class="listViewHeaderValues">Average Transaction Volume</a></th>
                            <th nowrap><a class="listViewHeaderValues">Credit</a></th>
                            <th nowrap><a class="listViewHeaderValues">Negative Days</a></th>
                            <th nowrap><a class="listViewHeaderValues">Business Type</a></th>
                            <th nowrap><a class="listViewHeaderValues">Current Loans Out</a></th>
                            <th nowrap><a class="listViewHeaderValues">Viable for Syndication</a></th>
                            <th nowrap><a class="listViewHeaderValues">Average Daily Funds</a></th>
                            <th nowrap><a class="listViewHeaderValues">Comment for Syndication</a></th>
                            <th nowrap><a class="listViewHeaderValues">PreUW Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">CFG</a></th>
                            <th nowrap><a class="listViewHeaderValues">CFG Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">CFG Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">CFG Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">CFG Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">CFG Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">CFG - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">CFG - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">CFG Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">PAR</a></th>
                            <th nowrap><a class="listViewHeaderValues">PAR Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">PAR Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">PAR Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">PAR Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">PAR Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">PAR - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">PAR - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">PAR Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">FORA</a></th>
                            <th nowrap><a class="listViewHeaderValues">FORA Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">FORA Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">FORA Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">FORA Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">FORA Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">FORA - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">FORA - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">FORA Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">Forward Fin</a></th>
                            <th nowrap><a class="listViewHeaderValues">Forward Fin Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">Forward Fin Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">Forward Fin Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">Forward Fin Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">Forward Fin Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">Forward Fin - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">Forward Fin - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">Forward Fin Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">Accord</a></th>
                            <th nowrap><a class="listViewHeaderValues">Accord Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">Accord Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">Accord Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">Accord Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">Accord Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">Accord - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">Accord - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">Accord Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">YS</a></th>
                            <th nowrap><a class="listViewHeaderValues">YS Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">YS Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">YS Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">YS Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">YS Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">YS - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">YS - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">YS Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">Discount</a></th>
                            <th nowrap><a class="listViewHeaderValues">Discount Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">Discount Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">Discount Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">Discount Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">Discount Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">Discount - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">Discount - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">Discount Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">6th Ave</a></th>
                            <th nowrap><a class="listViewHeaderValues">6th Ave Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">6th Ave Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">6th Ave Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">6th Ave Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">6th Ave Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">6th Ave - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">6th Ave - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">6th Ave Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">Midnight</a></th>
                            <th nowrap><a class="listViewHeaderValues">Midnight Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">Midnight Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">Midnight Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">Midnight Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">Midnight Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">Midnight - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">Midnight - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">Midnight Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">Everlasting</a></th>
                            <th nowrap><a class="listViewHeaderValues">Everlasting Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">Everlasting Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">Everlasting Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">Everlasting Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">Everlasting Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">Everlasting - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">Everlasting - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">Everlasting Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">Knight</a></th>
                            <th nowrap><a class="listViewHeaderValues">Knight Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">Knight Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">Knight Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">Knight Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">Knight Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">Knight - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">Knight - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">Knight Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">QuarterSpot</a></th>
                            <th nowrap><a class="listViewHeaderValues">QuarterSpot Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">QuarterSpot Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">QuarterSpot Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">QuarterSpot Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">QuarterSpot Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">QuarterSpot - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">QuarterSpot - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">QuarterSpot Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">Fundworks</a></th>
                            <th nowrap><a class="listViewHeaderValues">Fundworks Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">Fundworks Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">Fundworks Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">Fundworks Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">Fundworks Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">Fundworks - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">Fundworks - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">Fundworks Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">TVT</a></th>
                            <th nowrap><a class="listViewHeaderValues">TVT Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">TVT Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">TVT Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">TVT Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">TVT Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">TVT - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">TVT - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">TVT Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">Misc Funder</a></th>
                            <th nowrap><a class="listViewHeaderValues">Misc Funder Disposition</a></th>
                            <th nowrap><a class="listViewHeaderValues">Misc Funder Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">Misc Funder Max Term</a></th>
                            <th nowrap><a class="listViewHeaderValues">Misc Funder Notes</a></th>
                            <th nowrap><a class="listViewHeaderValues">Misc Funder Offer Status</a></th>
                            <th nowrap><a class="listViewHeaderValues">Misc Funder Max Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">Misc Funder - BuyRates</a></th>
                            <th nowrap><a class="listViewHeaderValues">Misc Funder - Stips</a></th>
                            <th nowrap><a class="listViewHeaderValues">Document Collector</a></th>
                            <th nowrap><a class="listViewHeaderValues">Other Stipulations</a></th>
                            <th nowrap><a class="listViewHeaderValues">Send Contract</a></th>
                            <th nowrap><a class="listViewHeaderValues">Received Signed Contract</a></th>
                            <th nowrap><a class="listViewHeaderValues">Get Signed Contrac</a></th>
                            <th nowrap><a class="listViewHeaderValues">Received Void Cheque</a></th>
                            <th nowrap><a class="listViewHeaderValues">Get Void Cheque</a></th>
                            <th nowrap><a class="listViewHeaderValues">Received Driver License</a></th>
                            <th nowrap><a class="listViewHeaderValues">Get Driver License</a></th>
                            <th nowrap><a class="listViewHeaderValues">Received Other Stipulations</a></th>
                            <th nowrap><a class="listViewHeaderValues">Get Other Stipulations</a></th>
                            <th nowrap><a class="listViewHeaderValues">Funding Amount</a></th>
                            <th nowrap><a class="listViewHeaderValues">Avenew Commission</a></th>
                            <th nowrap><a class="listViewHeaderValues">Funding Start Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">ISO Commission</a></th>
                            <th nowrap><a class="listViewHeaderValues">Funding End Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">Earliest Renewal Date</a></th>
                            <th nowrap><a class="listViewHeaderValues">Description</a></th>
                            <th nowrap><a class="listViewHeaderValues">CH Created By</a></th>
                            <th nowrap><a class="listViewHeaderValues">CH Date Modified</a></th>
                            <th nowrap><a class="listViewHeaderValues">CH Last Activity By</a></th>
                            <th nowrap><a class="listViewHeaderValues">CH Last Modified By</a></th>
                        </tr>
                        </thead>
                        {if !empty($CLOSERS)}
                            <tbody>
                            {foreach item=closer from=$CLOSERS}
                                <tr class="listViewEntries" data-id="{$closer['leadid']}"
                                    data-recordurl="index.php?module=Leads&view=Detail&record={$closer['leadid']}">
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_847']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_851']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap>
                                        <a>{$closer['first_name']} {$closer['last_name']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['phone']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['email']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['designation']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['industry']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['annualrevenue']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['leadsource']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_843']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['emailoptout']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_881']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['fax']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_879']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_877']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['modifiedtime']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a></a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1279']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_985']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1437']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1439']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1445']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1447']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1443']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1449']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1451']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1455']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1457']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_757']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_759']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_981']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_841']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_987']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_887']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_761']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_895']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_889']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_891']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_753']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_893']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1409']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1411']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['lane']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['state']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['city']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['code']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1415']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1421']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1423']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1417']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1425']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1429']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1433']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1427']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_787']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_977']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_795']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_973']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_791']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_993']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_799']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_807']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_789']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_809']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_975']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_911']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1045']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1075']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1133']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1157']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1181']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1345']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1347']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1271']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_905']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1003']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1071']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1129']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1153']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1177']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1373']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1375']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1267']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_903']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1001']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1069']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1127']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1151']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1175']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1349']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1351']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1149']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_923']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1039']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1085']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1147']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1171']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1199']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1377']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1379']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1287']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_909']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1063']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1067']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1149']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1173']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1201']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1353']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1355']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1289']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_907']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1009']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1073']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1131']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1155']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1179']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1381']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1383']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1269']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_913']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1051']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1055']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1135']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1203']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1183']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1357']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1359']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1273']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_919']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1027']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1081']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1143']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1167']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1195']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1385']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1387']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1285']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1291']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1293']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1295']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1297']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1299']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1301']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1361']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1363']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1307']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_921']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1033']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1083']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1145']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1169']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1197']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1393']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1391']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1283']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_915']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1015']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1077']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1139']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1207']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1189']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1365']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1367']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1277']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_925']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1057']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1061']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1137']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1205']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1187']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1395']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1397']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1275']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1309']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1311']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1313']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1315']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1317']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1319']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1369']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1371']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1325']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_917']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1021']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1079']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1141']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1165']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1191']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1403']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1405']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1281']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1327']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1333']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1329']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1337']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1331']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1343']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1335']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1399']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1401']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1459']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1471']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1461']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1473']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1463']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1475']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1465']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1477']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1467']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1479']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1469']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_811']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1095']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_813']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1097']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_815']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_1099']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_817']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['description']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_861']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_863']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_865']}</a></td>
                                    <td class="listViewEntryValue medium" nowrap><a>{$closer['cf_867']}</a></td>
                                </tr>
                            {/foreach}
                            </tbody>
                        {/if}
                    </table>
                    {if empty($CLOSERS)}
                        <table class="emptyRecordsDiv">
                            <tbody>
                            <tr>
                                <td>No Closer found.</td>
                            </tr>
                            </tbody>
                        </table>
                    {/if}
                </div>
            </div>
        </div>
    </div>
{/strip}