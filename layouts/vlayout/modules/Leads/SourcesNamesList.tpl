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
<div class="recordNamesList">
	<div class="row-fluid">
		<div class="">
			<ul class="nav nav-list">
				{foreach item=source from=$SOURCES}
				<li>
					<a data-id={$source['leadid']} href='{$source['list_view_url']}' title="{$source['sourcename']}">{$source['sourcename']} ({$source['source']})</a>
				</li>
				{foreachelse}
					<li style="text-align:center">
						No Leads
					</li>
				{/foreach}

			</ul>
		</div>
	</div>
</div>
{/strip}
