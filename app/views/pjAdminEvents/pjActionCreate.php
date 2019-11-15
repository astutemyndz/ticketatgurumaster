<?php
$week_start = isset($tpl['option_arr']['o_week_start']) && in_array((int) $tpl['option_arr']['o_week_start'], range(0,6)) ? (int) $tpl['option_arr']['o_week_start'] : 0;
$jqDateFormat = pjUtil::jqDateFormat($tpl['option_arr']['o_date_format']);
$jqTimeFormat = pjUtil::jqTimeFormat($tpl['option_arr']['o_time_format']);
$index = 'new_' . rand(1, 999999);
//$date_time = !empty($tpl['arr']['duration']) ?  pjUtil::formatDate(date('Y-m-d', strtotime($tpl['arr']['duration'])), 'Y-m-d', $tpl['option_arr']['o_date_format']) . ' ' . pjUtil::formatTime(date('H:i:s', strtotime($tpl['arr']['duration'])), 'H:i:s', $tpl['option_arr']['o_time_format']) : '';

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
	?>
	<div class="ui-tabs ui-widget ui-widget-content ui-corner-all b10">
		<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
			<li class="ui-state-default ui-corner-top"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminEvents&amp;action=pjActionIndex"><?php __('menuEvents'); ?></a></li>
			<li class="ui-state-default ui-corner-top"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminEvents&amp;action=pjActionExport"><?php __('lblExport'); ?></a></li>
		</ul>
	</div>
	<form action="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminEvents&amp;action=pjActionCreate" method="post" id="frmCreateEvent" class="pj-form form" enctype="multipart/form-data">
		<input type="hidden" name="event_create" value="1" />
		<input type="hidden" id="index_arr" name="index_arr" value="" />
		<input type="hidden" id="remove_arr" name="remove_arr" value="" />
		<?php
		pjUtil::printNotice(__('infoAddEventTitle', true), __('infoAddEventDesc', true)); 
		?>
		<?php if ((int) $tpl['option_arr']['o_multi_lang'] === 1 && count($tpl['lp_arr']) > 1) : ?>
		<div class="multilang"></div>
		<?php endif; ?>
		<div class="clear_both">
		<p>
				<label class="title">Slug</label>
				<span class="inline_block">
					<input type="text" name="slug" id="slug" class="pj-form-field" />
				</span>
			</p>
			<?php
			foreach ($tpl['lp_arr'] as $v)
			{
				?>
				<p class="pj-multilang-wrap" data-index="<?php echo $v['id']; ?>" style="display: <?php echo (int) $v['is_default'] === 0 ? 'none' : NULL; ?>">
					<label class="title"><?php __('lblTitle'); ?></label>
					<span class="inline_block">
						<input type="text" id="i18n_title_<?php echo $v['id'];?>" name="i18n[<?php echo $v['id']; ?>][title]" class="pj-form-field w300<?php echo (int) $v['is_default'] === 0 ? NULL : ' required'; ?>" lang="<?php echo $v['id']; ?>" />
						<?php if ((int) $tpl['option_arr']['o_multi_lang'] === 1 && count($tpl['lp_arr']) > 1) : ?>
						<span class="pj-multilang-input"><img src="<?php echo PJ_INSTALL_URL . PJ_FRAMEWORK_LIBS_PATH . 'pj/img/flags/' . $v['file']; ?>" alt="" /></span>
						<?php endif; ?>
					</span>
				</p>
				
				<?php
			}
			foreach ($tpl['lp_arr'] as $v)
			{
			?>
				<p class="pj-multilang-wrap" data-index="<?php echo $v['id']; ?>" style="display: <?php echo (int) $v['is_default'] === 0 ? 'none' : NULL; ?>">
					<label class="title"><?php __('lblSmallDescription'); ?></label>
					<span class="inline_block">
						<textarea id="i18n_small_description_<?php echo $v['id'];?>" name="i18n[<?php echo $v['id']; ?>][small_description]" class="mceEditor pj-form-field w500 h200<?php echo (int) $v['is_default'] === 0 ? NULL : ' required'; ?>"  lang="<?php echo $v['id']; ?>"></textarea>
						<?php if ((int) $tpl['option_arr']['o_multi_lang'] === 1 && count($tpl['lp_arr']) > 1) : ?>
						<span class="pj-multilang-input"><img src="<?php echo PJ_INSTALL_URL . PJ_FRAMEWORK_LIBS_PATH . 'pj/img/flags/' . $v['file']; ?>" alt="" /></span>
						<?php endif; ?>
					</span>
				</p>
				<p class="pj-multilang-wrap" data-index="<?php echo $v['id']; ?>" style="display: <?php echo (int) $v['is_default'] === 0 ? 'none' : NULL; ?>">
					<label class="title"><?php __('lblDescription'); ?></label>
					<span class="inline_block">
						<textarea id="i18n_description_<?php echo $v['id'];?>" name="i18n[<?php echo $v['id']; ?>][description]" class="mceEditor pj-form-field w500 h200<?php echo (int) $v['is_default'] === 0 ? NULL : ' required'; ?>"  lang="<?php echo $v['id']; ?>"></textarea>
						<?php if ((int) $tpl['option_arr']['o_multi_lang'] === 1 && count($tpl['lp_arr']) > 1) : ?>
						<span class="pj-multilang-input"><img src="<?php echo PJ_INSTALL_URL . PJ_FRAMEWORK_LIBS_PATH . 'pj/img/flags/' . $v['file']; ?>" alt="" /></span>
						<?php endif; ?>
					</span>
				</p>
				<?php
			} 
			?>
			
			<p>
				<label class="title"><?php __('lblImage'); ?></label>
				<span class="inline_block">
					<input type="file" name="event_img" id="event_img" class="pj-form-field w250" />
				</span>
			</p>
			<p>
				<label class="title"><?php __('lblDuration'); ?></label>
				<span class="inline_block">
					<input type="text" name="duration" id="duration" class="pj-form-field field-int w80" />&nbsp;<?php __('lblMinutes'); ?>
				</span>
			</p>
			<p>
			<label class="title"><?php __('lblEventType'); ?></label>
			<span class="inline_block overflow">
				<select id="type_event" name="type_event">
					<option value="1">Upcoming</option>		
					<option value="2">Just Announced</option>	
				</select>
			</span>
			</p>
			<p>
			<label class="title">Select Artist</label>
			<span class="inline_block overflow">
			
				<?php 	
				if(isset($tpl['artists']) && !empty($tpl['artists'])) { ?>
					<select class="js-example-basic-multiple" name="artist[]" multiple="multiple">
						<?php
						foreach($tpl['artists'] as $index => $artist)
						{ ?>
							<option value="<?php echo $artist['id']?>"><?php echo pjSanitize::html($artist['name']);?></option>
					<?php	}
						?>
					</select>	
				<?php		
				}
				?>
			</span>
			</p>	
			<p>
			<label class="title"><?php __('lblDateTime'); ?></label>
			<span class="block overflow">
				<span class="pj-form-field-custom pj-form-field-custom-after float_left r5">
					<input type="text" id="date_time_<?php echo $index;?>" name="date_time" value="" data-index="<?php echo $index;?>" class="pj-form-field pointer w130 datetimepick required pjCbShowTime" readonly="readonly" rel="<?php echo $week_start; ?>" rev="<?php echo $jqDateFormat; ?>" lang="<?php echo $jqTimeFormat; ?>"/>
					<span class="pj-form-field-after"><abbr class="pj-form-field-icon-date"></abbr></span>
				</span>
			</span>
			</p>				
		</div>
		<?php
		pjUtil::printNotice(__('infoEventPriceTitle', true), __('infoEventPriceDesc', true)); 
		?>
		<div id="multiple_prices">
			<div id="fd_size_list" class="fd-size-list">
				<?php
				$index = 'fd_' . rand(1, 999999); 
				?>
				<div class="fd-size-row" data-index="<?php echo $index;?>">
					<?php
					foreach ($tpl['lp_arr'] as $v)
					{
						?>
						<p class="pj-multilang-wrap" data-index="<?php echo $v['id']; ?>" style="display: <?php echo (int) $v['is_default'] === 0 ? 'none' : NULL; ?>">
							<label class="title fd-title-<?php echo $index;?>"><?php __('lblTicket'); ?> </label>
							<span class="inline_block">
								<input type="text" name="i18n[<?php echo $v['id']; ?>][price_name][<?php echo $index;?>]" class="pj-form-field float_left r3 w200<?php echo (int) $v['is_default'] === 0 ? NULL : ' fdRequired'; ?>" lang="<?php echo $v['id']; ?>"/>
								<?php if ((int) $tpl['option_arr']['o_multi_lang'] === 1 && count($tpl['lp_arr']) > 1) : ?>
								<span class="pj-multilang-input float_left r10"><img src="<?php echo PJ_INSTALL_URL . PJ_FRAMEWORK_LIBS_PATH . 'pj/img/flags/' . $v['file']; ?>" alt="" /></span>
								<?php endif;?>
							</span>
						</p>
						<?php
					}
					?>
				</div>
			</div>
			<p>
				<label class="title">&nbsp;</label>
				<input type="button" value="<?php __('btnAdd'); ?>" class="pj-button pj-add-size" />
			</p>
		</div>
		
		<p>
			<label class="title">&nbsp;</label>
			<input type="submit" value="<?php __('btnSave'); ?>" class="pj-button" />
			<input type="button" value="<?php __('btnCancel'); ?>" class="pj-button" onclick="window.location.href='<?php echo PJ_INSTALL_URL; ?>admin.php?controller=pjAdminEvents&action=pjActionIndex';" />
		</p>
	</form>
	
	<div id="fd_size_clone" style="display: none;">
		<div class="fd-size-row" data-index="{INDEX}">
			<?php
			foreach ($tpl['lp_arr'] as $v)
			{
				?>
				<p class="pj-multilang-wrap" data-index="<?php echo $v['id']; ?>" style="display: <?php echo (int) $v['is_default'] === 0 ? 'none' : NULL; ?>">
					<label class="title fd-title-{INDEX}">&nbsp;</label>
					<span class="inline_block">
						<input type="text" name="i18n[<?php echo $v['id']; ?>][price_name][{INDEX}]" class="pj-form-field float_left r3 w200<?php echo (int) $v['is_default'] === 0 ? NULL : ' fdRequired'; ?>" lang="<?php echo $v['id']; ?>"/>
						<?php if ((int) $tpl['option_arr']['o_multi_lang'] === 1 && count($tpl['lp_arr']) > 1) : ?>
						<span class="pj-multilang-input float_left r10"><img src="<?php echo PJ_INSTALL_URL . PJ_FRAMEWORK_LIBS_PATH . 'pj/img/flags/' . $v['file']; ?>" alt="" /></span>
						<?php endif;?>
					</span>
				</p>
				<?php
			}
			?>
			<div class="size-icons">
				<input type="button" value="<?php __('btnRemove'); ?>" class="pj-button pj-remove-size" />
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	var locale_array = new Array(); 
	var myLabel = myLabel || {};
	myLabel.field_required = "<?php __('tb_field_required'); ?>";
	myLabel.duration_greater_zero = "<?php __('lblDurationGreaterThanZero');?>";
	<?php
	foreach ($tpl['lp_arr'] as $v)
	{
		?>locale_array.push(<?php echo $v['id'];?>);<?php
	} 
	?>
	myLabel.locale_array = locale_array;
	myLabel.localeId = "<?php echo $controller->getLocaleId(); ?>";
	(function ($) {
		$(function() {
			$(".multilang").multilang({
				langs: <?php echo $tpl['locale_str']; ?>,
				flagPath: "<?php echo PJ_FRAMEWORK_LIBS_PATH; ?>pj/img/flags/",
				select: function (event, ui) {
					
				}
			});
		});
	})(jQuery_1_8_2);
	</script>
	<?php
}
?>