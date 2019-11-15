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
		$bodies_text = str_replace("{SIZE}", ini_get('post_max_size'), @$bodies[$_GET['err']]);
		pjUtil::printNotice(@$titles[$_GET['err']], $bodies_text);
	}
	
	?>
	<div class="ui-tabs ui-widget ui-widget-content ui-corner-all b10">
		<ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all">
			<li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active"><a href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminArtists&amp;action=pjActionIndex"><?php __('menuArtist'); ?></a></li>
			<!-- <li class="ui-state-default ui-corner-top"><a href="<?php //echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminArtists&amp;action=pjActionExport"><?php //__('lblExport'); ?></a></li> -->
		</ul>
	</div>
	<?php
	pjUtil::printNotice(__('infoArtistTitle', true, false), __('infoArtistDesc', true, false)); 
	?>
	<div class="b10">
		<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="get" class="float_left r5">
			<input type="hidden" name="controller" value="pjAdminArtists" />
			<input type="hidden" name="action" value="pjActionCreate" />
			<input type="submit" class="pj-button" value="<?php __('btnAdd'); ?>" />
		</form>
		<form action="" method="get" class="float_left pj-form frm-filter">
			<input type="text" name="q" class="pj-form-field pj-form-field-search w150" placeholder="<?php __('btnSearch', false, true); ?>" />
		</form>
		<?php
		$filter = __('filter', true);
		?>
		<div class="float_right t5">
			<a href="#" class="pj-button btn-all"><?php __('lblAll'); ?></a>
			<a href="#" class="pj-button btn-filter btn-status" data-column="status" data-value="T"><?php echo $filter['active']; ?></a>
			<a href="#" class="pj-button btn-filter btn-status" data-column="status" data-value="F"><?php echo $filter['inactive']; ?></a>
		</div>
		<br class="clear_both" />
	</div>

	<div id="grid"></div>
	<script type="text/javascript">
	<?php
	$_yesno_arr = __('_yesno', true, false); 
	?>
	
	var myLabel = myLabel || {};
	myLabel.image = "<?php __('lblImage', false, true); ?>";
	myLabel.title = "<?php __('lblTitle', false, true); ?>";
	myLabel.created = "<?php __('lblDuration', false, true); ?>";
	myLabel.delete_selected = "<?php __('delete_selected', false, true); ?>";
	myLabel.delete_confirmation = "<?php __('delete_confirmation', false, true); ?>";
	myLabel.active = "<?php __('lblActive', false, true); ?>";
	myLabel.inactive = "<?php __('lblInactive', false, true); ?>";
	myLabel.status = "<?php __('lblStatus', false, true); ?>";
	</script>
	<?php
}
?>