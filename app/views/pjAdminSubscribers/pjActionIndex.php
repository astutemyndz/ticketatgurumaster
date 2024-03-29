<?php
if (isset($tpl['status']))
{
	$status = __('status', true);
	switch ($tpl['status'])
	{
		case 2:
			pjUtil::printNotice(NULL, $status[2]);
			break;
	}
} else {
	if (isset($_GET['err']))
	{
		$titles = __('error_titles', true);
		$bodies = __('error_bodies', true);
		pjUtil::printNotice(@$titles[$_GET['err']], @$bodies[$_GET['err']]);
	}
	
	$jqDateFormat = pjUtil::jqDateFormat($tpl['option_arr']['o_date_format']);
	?>
	<div class="ui-tabs ui-widget ui-widget-content ui-corner-all b10">
		<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
			<li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminSubscribers&amp;action=pjActionIndex"><?php __('menuSubscribers'); ?></a></li>
			<li class="ui-state-default ui-corner-top"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminSubscribers&amp;action=pjActionImport"><?php __('lblImport'); ?></a></li>
		</ul>
	</div>
	<?php pjUtil::printNotice(__('infoSubscribersTitle', true), __('infoSubscribersDesc', true));?>
	<div class="b10">
		<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="get" class="float_left pj-form r10">
			<input type="hidden" name="controller" value="pjAdminSubscribers" />
			<input type="hidden" name="action" value="pjActionCreate" />
			<input type="submit" class="pj-button" value="<?php __('btnAddSubscriber'); ?>" />
		</form>
		<form action="" method="get" class="float_left pj-form frm-filter">
			<input type="text" name="q" class="pj-form-field pj-form-field-search w150" placeholder="<?php __('btnSearch'); ?>" />
			<button type="button" class="pj-button pj-button-detailed"><span class="pj-button-detailed-arrow"></span></button>
		</form>
		<?php
		$filter = __('filter', true);
		$subscribed_arr = __('subscribed_arr', true);
		?>
		<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="get" class="float_right pj-form l10" target="_blank">
			<input type="hidden" name="controller" value="pjAdminSubscribers" />
			<input type="hidden" name="action" value="pjActionExportAllSubscribers" />
			<input type="submit" class="pj-button" value="<?php __('lblExportAll'); ?>" />
		</form>
		<div class="float_right t5">
			<a href="#" class="pj-button btn-all"><?php __('lblAll');?></a>
			<a href="#" class="pj-button btn-filter btn-status<?php echo isset($_GET['subscribed']) ? ($_GET['subscribed'] == 'T' ? ' pj-button-active' : null) : null;?>" data-column="subscribed" data-value="T"><?php echo $subscribed_arr['T']; ?></a>
			<a href="#" class="pj-button btn-filter btn-status<?php echo isset($_GET['subscribed']) ? ($_GET['subscribed'] == 'F' ? ' pj-button-active' : null) : null;?>" data-column="subscribed" data-value="F"><?php echo $subscribed_arr['F']; ?></a>
		</div>
		<br class="clear_both" />
	</div>

	<div class="pj-form-filter-advanced" style="display: none">
		<span class="pj-menu-list-arrow"></span>
		<form action="" method="get" class="form pj-form pj-form-search frm-filter-advanced">
			<div class="float_left w350">
				<p>
					<label class="title120"><?php __('lblFirstName'); ?></label>
					<input type="text" name="first_name" id="first_name" class="pj-form-field w200" />
				</p>
				<p>
					<label class="title120"><?php __('lblLastName'); ?></label>
					<input type="text" name="last_name" id="last_name" class="pj-form-field w200" />
				</p>
				<p>
					<label class="title120"><?php __('lblEmail'); ?></label>
					<input type="text" name="email" id="email" class="pj-form-field w200" />
				</p>
				<p>
					<label class="title120"><?php __('lblAge'); ?></label>
					<label class="content float_left r3"><?php __('lblFrom');?></label>
					<input type="text" name="age_from" id="age_from" class="pj-form-field w70 block float_left" />
					<label class="content float_left r3 l3"><?php __('lblTo');?></label>
					<input type="text" name="age_to" id="age_to" class="pj-form-field w70 block float_left" />
				</p>
				
			</div>
			<div class="float_right w350">
				<p>
					<label class="title120"><?php __('lblGroup'); ?></label>
					<select name="group_id" id="group_id" class="pj-form-field w200">
						<option value="">-- <?php __('lblChoose'); ?> --</option>
						<?php
						foreach ($tpl['group_arr'] as $v)
						{
							?><option value="<?php echo $v['id']; ?>"<?php echo isset($_GET['group_id']) ? ($_GET['group_id'] == $v['id'] ? ' selected="selected"' : null) : null;?>><?php echo stripslashes($v['group_title']); ?></option><?php
						}
						?>
					</select>
				</p>
				<p>
					<label class="title120"><?php __('lblStatus'); ?></label>
					<span class="inline_block">
						<select name="subscribed" id="subscribed" class="pj-form-field required w200">
							<option value="">-- <?php __('lblChoose'); ?>--</option>
							<?php
							foreach ($subscribed_arr as $k => $v)
							{
								?><option value="<?php echo $k; ?>"><?php echo $v; ?></option><?php
							}
							?>
						</select>
					</span>
				</p>
				<p>
					<label class="title120"><?php __('lblGender'); ?></label>
					<span class="inline_block">
						<select name="gender" id="gender" class="pj-form-field w200">
							<option value="">-- <?php __('lblChoose'); ?>--</option>
							<?php
							foreach (__('genderarr', true) as $k => $v)
							{
								?><option value="<?php echo $k; ?>"><?php echo $v; ?></option><?php
							}
							?>
						</select>
					</span>
				</p>
			</div>
			<br class="clear_both" />
			<p>
				<label class="title120"><?php __('lblDateSubscribed'); ?></label>
				<label class="content float_left r3"><?php __('lblFrom');?></label>
				<span class="inline_block float_left">
					<span class="pj-form-field-custom pj-form-field-custom-after">
						<input type="text" name="subscribed_from" id="subscribed_from" class="pj-form-field pointer w80 datepick-search" readonly="readonly" rel="1" rev="<?php echo $jqDateFormat; ?>" value="" />
						<span class="pj-form-field-after"><abbr class="pj-form-field-icon-date"></abbr></span>
					</span>
				</span>
				<label class="content float_left r3 l3"><?php __('lblTo');?></label>
				<span class="inline_block float_left">
					<span class="pj-form-field-custom pj-form-field-custom-after">
						<input type="text" name="subscribed_to" id="subscribed_to" class="pj-form-field pointer w80 datepick-search" readonly="readonly" rel="<?php echo $week_start; ?>" rev="<?php echo $jqDateFormat; ?>" value="" />
						<span class="pj-form-field-after"><abbr class="pj-form-field-icon-date"></abbr></span>
					</span>
				</span>
				
			</p>
			<p>
				<label class="title120"><?php __('lblCountry'); ?></label>
				<select name="country_id" id="country_id" class="pj-form-field w286">
					<option value="">-- <?php __('lblChoose'); ?> --</option>
					<?php
					foreach ($tpl['country_arr'] as $v)
					{
						?><option value="<?php echo $v['id']; ?>"><?php echo stripslashes($v['country_title']); ?></option><?php
					}
					?>
				</select>
			</p>
			<p>
				<label class="title120">&nbsp;</label>
				<input type="submit" value="<?php __('btnSearch'); ?>" class="pj-button" />
				<input type="reset" value="<?php __('btnCancel'); ?>" class="pj-button" />
			</p>
		</form>
	</div>

	<div id="grid"></div>
	
	<div id="dialogSend" title="<?php __('lblSendMessage'); ?>" style="display:none">
		<div class="form pj-form">
			<p><?php __('lblPrompSelectMessage');?></p>
			<p>
				<?php
				if(!empty($tpl['message_arr']))
				{ 
					?>
					<label class="title120"><?php __('lblMessage'); ?></label>
					<select name="message_id" id="message_id" class="pj-form-field w300">
						<option value="">-- <?php __('lblChoose'); ?> --</option>
						<?php
						foreach ($tpl['message_arr'] as $v)
						{
							?><option value="<?php echo $v['id']; ?>"><?php echo stripslashes($v['subject']); ?></option><?php
						}
						?>
					</select>
					<?php
				}else{
					?>
					<label class="content"><?php __('lblNoMessageFound');?> <a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminMessages&amp;action=pjActionCreate"><?php __('lblAddAMessage');?></a></label>
					<?php
				} 
				?>
			</p>
		</div>
	</div>
	<div id="dialogSendResult" title="<?php __('lblSendMessage'); ?>" style="display:none">
		<div class="form pj-form">
			<p id="result_message"></p>
		</div>
	</div>
	<div id="dialogAddGroup" title="<?php __('lblAssignToGroup'); ?>" style="display:none">
		<div class="form pj-form">
			<p><?php __('lblAddGroupText');?></p>
			<p>
				<label class="title120"><?php __('lblGroup'); ?></label>
				<select id="add_group_id" name="group_id[]" class="pj-form-field w300 required" data-placeholder="--<?php __('lblChoose'); ?>--" multiple="multiple">
					<?php
					foreach ($tpl['group_arr'] as $k => $v)
					{
						?><option value="<?php echo $v['id']; ?>"><?php echo $v['group_title']; ?></option><?php
					}
					?>
				</select>
			</p>
			<p>
				<label class="title120"><?php __('lblRemoveFromCurrentGroup');?></label>
				<label class="content">
					<input type="checkbox" name="remove" id="remove" value="1" />
				</label>
			</p>
		</div>
	</div>
	
	<script type="text/javascript">
		var pjGrid = pjGrid || {};
		pjGrid.roleId = <?php echo (int) $_SESSION[$controller->defaultUser]['role_id']; ?>;
		pjGrid.queryString = "";
		<?php
		if (isset($_GET['group_id']) && (int) $_GET['group_id'] > 0)
		{
			?>pjGrid.queryString += "&group_id=<?php echo (int) $_GET['group_id']; ?>";<?php
		}
		if (isset($_GET['subscribed']) && in_array($_GET['subscribed'], array('T', 'F')))
		{
			?>pjGrid.queryString += "&subscribed=<?php echo $_GET['subscribed']; ?>";<?php
		}
		?>
		var myLabel = myLabel || {};
		myLabel.install_url = "<?php echo PJ_INSTALL_URL; ?>";
		myLabel.name_email = "<?php __('lblNameEmail'); ?>";
		myLabel.total_sent = "<?php __('lblTotalSent'); ?>";
		myLabel.last_sent = "<?php __('lblLastSent'); ?>";
		myLabel.group = "<?php __('lblGroup'); ?>";
		myLabel.subscribed = "<?php __('lblSubscribed'); ?>";
		myLabel.subscribed = "<?php echo $subscribed_arr['T']; ?>";
		myLabel.unsubscribed = "<?php echo $subscribed_arr['F']; ?>";
		myLabel.exported = "<?php __('lblExport'); ?>";
		myLabel.exported_selected = "<?php __('lblExportSelected'); ?>";
		myLabel.exported_all = "<?php __('lblExportAll'); ?>";
		myLabel.add_to_group = "<?php __('lblAddToGroup'); ?>";
		myLabel.send_message = "<?php __('lblSendMessageMenu'); ?>";
		myLabel.delete_selected = "<?php __('pj_delete_selected'); ?>";
		myLabel.delete_confirmation = "<?php __('gridActionSubscriber'); ?>";
		myLabel.status = "<?php __('lblStatus'); ?>";

		myLabel.send_progress = "<?php __('lblSendProgress'); ?>";
		myLabel.sent_ok = "<?php __('lblSentOK'); ?>";
		myLabel.sent_error = "<?php __('lblSentError'); ?>";
	</script>
	<?php
}
?>