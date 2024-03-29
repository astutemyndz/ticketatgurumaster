var jQuery_1_8_2 = jQuery_1_8_2 || $.noConflict();
(function ($, undefined) {
	$(function () {
		var datagrid = ($.fn.datagrid !== undefined);
		
		if ($("#grid").length > 0 && datagrid) 
		{
			function onBeforeShow (obj) {
				return true;
			}
			var $grid = $("#grid").datagrid({
				buttons: [
				          {type: "delete", url: "admin.php?controller=pjAdminQueues&action=pjActionDeleteQueue&id={:id}", beforeShow: onBeforeShow}
				          ],
						  
				columns: [{text: myLabel.message, type: "text", sortable: true, editable: false, width: 210},
				          {text: myLabel.email, type: "text", sortable: true, editable: false, width: 190},
				          {text: myLabel.date_sent, type: "text", sortable: true, editable: false, width: 125 },
				          {text: myLabel.status, type: "select", sortable: true, editable: false, width: 100, options: [
				                                                                                     {label: myLabel.inprogress, value: "inprogress"}, 
				                                                                                     {label: myLabel.completed, value: "completed"}
				                                                                                     ], applyClass: "pj-status"}],
				dataUrl: "admin.php?controller=pjAdminQueues&action=pjActionGetQueue" + pjGrid.queryString,
				dataType: "json",
				fields: ['subject', 'email', 'date_sent', 'status'],
				paginator: {
					actions: [
					   {text: myLabel.delete_selected, url: "admin.php?controller=pjAdminQueues&action=pjActionDeleteQueueBulk", render: true, confirmation: myLabel.delete_confirmation}
					],
					gotoPage: true,
					paginate: true,
					total: true,
					rowCount: true
				},
				saveUrl: "admin.php?controller=pjAdminQueues&action=pjActionSaveQueue&id={:id}",
				select: {
					field: "id",
					name: "record[]"
				}
			});
		}
		
		$(document).on("click", ".btn-all", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			$(this).addClass("pj-button-active").siblings(".pj-button").removeClass("pj-button-active");
			var content = $grid.datagrid("option", "content"),
				cache = $grid.datagrid("option", "cache");
			$.extend(cache, {
				status: "",
				q: ""
			});
			$grid.datagrid("option", "cache", cache);
			$grid.datagrid("load", "admin.php?controller=pjAdminQueues&action=pjActionGetQueue", "date_sent", "DESC", content.page, content.rowCount);
			return false;
		}).on("click", ".btn-filter", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $this = $(this),
				content = $grid.datagrid("option", "content"),
				cache = $grid.datagrid("option", "cache"),
				obj = {};
			$this.addClass("pj-button-active").siblings(".pj-button").removeClass("pj-button-active");
			obj.status = "";
			obj[$this.data("column")] = $this.data("value");
			$.extend(cache, obj);
			$grid.datagrid("option", "cache", cache);
			$grid.datagrid("load", "admin.php?controller=pjAdminQueues&action=pjActionGetQueue", "date_sent", "DESC", content.page, content.rowCount);
			return false;
		}).on("submit", ".frm-filter", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			var $this = $(this),
				content = $grid.datagrid("option", "content"),
				cache = $grid.datagrid("option", "cache");
			$.extend(cache, {
				q: $this.find("input[name='q']").val()
			});
			$grid.datagrid("option", "cache", cache);
			$grid.datagrid("load", "admin.php?controller=pjAdminQueues&action=pjActionGetQueue", "date_sent", "DESC", content.page, content.rowCount);
			return false;
		});
	});
})(jQuery_1_8_2);