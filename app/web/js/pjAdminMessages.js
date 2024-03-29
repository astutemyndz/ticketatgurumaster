var jQuery_1_8_2 = jQuery_1_8_2 || $.noConflict();
(function ($, undefined) {
	$(function () {
		var $frmCreateMessage = $("#frmCreateMessage"),
			$frmUpdateMessage = $("#frmUpdateMessage"),
			$frmSendMessage = $("#frmSendMessage"),
			$frmSendTest = $("#frmSendTest"),
			$dialogSendResult = $("#dialogSendResult"),
			$send_in_batches_container = $('#send_in_batches_container'),
			$total_subscribers = $('#total_subscribers'),
			$total_subscribers_container = $('#total_subscribers_container'),
			validate = ($.fn.validate !== undefined),
			chosen = ($.fn.chosen !== undefined),
			datagrid = ($.fn.datagrid !== undefined),
			$tabs = $("#tabs"),
			tOpt = {
				select: function (event, ui) {
					$(":input[name='tab_id']").val(ui.panel.id);
				}
			};
		
		if ($tabs.length > 0 && tabs) {
			$tabs.tabs(tOpt);
		}
		
		if ($frmSendMessage.length > 0 && validate) 
		{
			$('.send-on-container').css('display', 'none');
			$send_in_batches_container.css('display', 'none');
			
			if (chosen) {
				$("#message_id").chosen();
				$("#group_id").chosen();
			}
			$(".field-int").spinner({
				min: 0
			});
			
			$('#send_now').click(function(e){
				$('.send-on-container').css('display', 'none');
			});
			$('#send_later').click(function(e){
				$('.send-on-container').css('display', 'block');
			});
			
			$('#no_in_batches').click(function(e){
				$send_in_batches_container.css('display', 'none');
			});
			$('#yes_in_batches').click(function(e){
				$send_in_batches_container.css('display', 'block');
			});
			$('#message_id').change(function(e){
				var message_id = $(this).val();
				if(message_id == '')
				{
					$('.pj-edit-icon').attr("href", "javascript:void(0);");
					$('.pj-preview-icon').attr("href", "javascript:void(0);");
					$('.pj-preview-icon').removeAttr('target');
				}else{
					$(this).valid();
					$('.pj-edit-icon').attr("href", "admin.php?controller=pjAdminMessages&action=pjActionUpdate&id=" + message_id);
					$('.pj-preview-icon').attr("href", "admin.php?controller=pjAdminMessages&action=pjActionPreview&id=" + message_id);
					$('.pj-preview-icon').attr('target', '_blank');
				}
				
			});
			$('#group_id').change(function(e){
				if($(this).val() != '')
				{
					$(this).valid();
				}
				getNumberOfSubscribers($(this).val());
			});
			
			function getNumberOfSubscribers(group_id)
			{
				if(group_id == null)
				{
					$total_subscribers.html('&nbsp;');
					$total_subscribers_container.css('display', 'none');
				}else{
					$.ajax({
						type: "GET",
						dataType: 'html',
						url: "admin.php?controller=pjAdminMessages&action=pjActionGetSubscribers&group_id=" + group_id,
						success: function (res) {
							$total_subscribers.html(res);
							$total_subscribers_container.css('display', 'block');
						}
					});
				}
			}
			
			getNumberOfSubscribers($('#group_id').val());
			
			$frmSendMessage.validate({
				errorPlacement: function (error, element) {
					error.insertAfter(element.parent());
				},
				onkeyup: false,
				errorClass: "err",
				wrapper: "em",
				ignore: ''
			});
		}
		
		if ($frmCreateMessage.length > 0 && validate) {
			
			$frmCreateMessage.validate({
				rules: {
					"files[]":{
						extension: "doc|docx|xls|xlsx|ppt|pdf|csv|zip|rar|png|jpg|jpeg|gif"
					}
				},
				messages: {
					"files[]":{
						extension: myLabel.allowed_ext
					}
				},
				errorPlacement: function (error, element) {
					error.insertAfter(element.parent());
				},
				onkeyup: false,
				errorClass: "err",
				wrapper: "em",
				ignore: ''
			});
			
		}
		if ($frmUpdateMessage.length > 0 && validate) {
			$frmUpdateMessage.validate({
				rules: {
					"files[]":{
						extension: "doc|docx|xls|xlsx|ppt|pdf|csv|zip|rar|png|jpg|jpeg|gif"
					}
				},
				messages: {
					"files[]":{
						extension: myLabel.allowed_ext
					}
				},
				errorPlacement: function (error, element) {
					error.insertAfter(element.parent());
				},
				onkeyup: false,
				errorClass: "err",
				wrapper: "em",
				ignore: ''
			});
		}
		
		if ($frmCreateMessage.length > 0 && validate) {
			
			$frmCreateMessage.validate({
				rules: {
					"files[]":{
						extension: "doc|docx|xls|xlsx|ppt|pdf|csv|zip|rar|png|jpg|jpeg|gif"
					}
				},
				messages: {
					"files[]":{
						extension: myLabel.allowed_ext
					}
				},
				errorPlacement: function (error, element) {
					error.insertAfter(element.parent());
				},
				onkeyup: false,
				errorClass: "err",
				wrapper: "em",
				ignore: ''
			});
			
		}
		
		if ($frmCreateMessage.length > 0 || $frmUpdateMessage.length > 0) {
			tinymce.init({
				document_base_url : myLabel.install_url,
				relative_urls : false,
				remove_script_host : false,
		    	selector: "textarea#tinymce_message",
		    	theme: "modern",
		    	width: 740,
		    	plugins: [
			         "advlist autolink link image lists charmap print preview hr anchor pagebreak",
			         "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime nonbreaking",
			         "save table contextmenu directionality emoticons paste textcolor"
			         ],
		        toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons"
			});
		}
		
		if ($("#grid").length > 0 && datagrid) 
		{
			function onBeforeShow (obj) {
				return true;
			}
			function formatTotalSent(str, obj){
				return '<a href="admin.php?controller=pjAdminQueues&action=pjActionIndex">'+str+'</a>';
			}
			var $grid = $("#grid").datagrid({
				buttons: [{type: "edit",  url: "admin.php?controller=pjAdminMessages&action=pjActionUpdate&id={:id}"},
				          {type: "delete", url: "admin.php?controller=pjAdminMessages&action=pjActionDeleteMessage&id={:id}", beforeShow: onBeforeShow},
				          {type: "send",  url: "admin.php?controller=pjAdminMessages&action=pjActionSend&id={:id}"},
				          {type: "menu", url: "#", text: myLabel.more, items:[
                                  {text: myLabel.send_test, url: "admin.php?controller=pjAdminMessages&action=pjActionSendTest&id={:id}"},
                                  {text: myLabel.preview, url: "admin.php?controller=pjAdminMessages&action=pjActionPreview&id={:id}", target: '_blank'},
                                  {text: myLabel.duplicate, url: "admin.php?controller=pjAdminMessages&action=pjActionDuplicate&id={:id}"}
				          ]}],
						  
				columns: [{text: myLabel.id, type: "text", sortable: true, editable: false, width: 30},
				          {text: myLabel.subject, type: "text", sortable: true, editable: true, width: 200},
				          {text: myLabel.total_sent, type: "text", sortable: true, editable: false, align: 'center', width: 80, renderer: formatTotalSent},
				          {text: myLabel.last_sent, type: "text", sortable: false, editable: false, width: 130},
				          {text: myLabel.status, type: "select", sortable: true, editable: true, width: 90, options: [
				                                                                                     {label: myLabel.active, value: "T"}, 
				                                                                                     {label: myLabel.inactive, value: "F"}
				                                                                                     ], applyClass: "pj-status"}],
				dataUrl: "admin.php?controller=pjAdminMessages&action=pjActionGetMessage",
				dataType: "json",
				fields: ['id', 'subject', 'total_sent', 'last_sent', 'status'],
				paginator: {
					actions: [
					   {text: myLabel.delete_selected, url: "admin.php?controller=pjAdminMessages&action=pjActionDeleteMessageBulk", render: true, confirmation: myLabel.delete_confirmation},
					   {text: myLabel.revert_status, url: "admin.php?controller=pjAdminMessages&action=pjActionStatusMessage", render: true},
					   {text: myLabel.exported, url: "admin.php?controller=pjAdminMessages&action=pjActionExportMessage", ajax: false}
					],
					gotoPage: true,
					paginate: true,
					total: true,
					rowCount: true
				},
				saveUrl: "admin.php?controller=pjAdminMessages&action=pjActionSaveMessage&id={:id}",
				select: {
					field: "id",
					name: "record[]"
				}
			});
		}
		
		if ($dialogSendResult.length > 0) 
		{
			$dialogSendResult.dialog({
				autoOpen: false,
				resizable: false,
				draggable: false,
				height:150,
				width: 480,
				modal: true,
				
				buttons: {
					'OK': function() {
						$(this).dialog('close');
					}
				}
			});
		}
		
		if ($frmSendTest.length > 0 && validate) {
			
			$frmSendTest.validate({
				errorPlacement: function (error, element) {
					error.insertAfter(element.parent());
				},
				onkeyup: false,
				errorClass: "err",
				wrapper: "em",
				ignore: ''
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
			$grid.datagrid("load", "admin.php?controller=pjAdminMessages&action=pjActionGetMessage", "created", "DESC", content.page, content.rowCount);
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
			$grid.datagrid("load", "admin.php?controller=pjAdminMessages&action=pjActionGetMessage", "created", "DESC", content.page, content.rowCount);
			return false;
		}).on("click", ".pj-status-1", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			return false;
		}).on("click", ".pj-status-0", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			$.post("admin.php?controller=pjAdminMessages&action=pjActionSetActive", {
				id: $(this).closest("tr").data("object")['id']
			}).done(function (data) {
				$grid.datagrid("load", "admin.php?controller=pjAdminMessages&action=pjActionGetMessage");
			});
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
			$grid.datagrid("load", "admin.php?controller=pjAdminMessages&action=pjActionGetMessage", "created", "DESC", content.page, content.rowCount);
			return false;
		}).on("click", ".pj-form-field-icon-date", function (e) {
			var $dp = $(this).parent().siblings("input[type='text']");
			if ($dp.hasClass("hasDatepicker")) {
				$dp.datepicker("show");
			} else {
				$dp.trigger("focusin").datepicker("show");
			}
		}).on("focusin", ".datepick", function (e) {
			var $this = $(this),
				custom = {},
				o = {
					firstDay: $this.attr("rel"),
					dateFormat: $this.attr("rev"),
					timeFormat: $this.attr("lang"),
					stepMinute: 5,
					minDate: 0
			};
			$this.not('.hasDatepicker').datetimepicker($.extend(o, custom));
		}).on("click", ".pj-save-message", function (e) {
			tinyMCE.triggerSave();
		}).on("click", ".pj-delete-file", function (e) {
			e.preventDefault();
			var file_id = $(this).attr('rev'),
				$this = $(this);
			$("#dialogDeleteFile").dialog({
				autoOpen: false,
				resizable: false,
				draggable: false,
				height:150,
				modal: true,
				
				buttons: {
					'Delete': function() {
						$.ajax({
							type: "POST",
							data: {
								id: file_id
							},
							dataType: 'json',
							url: "admin.php?controller=pjAdminMessages&action=pjActionDeleteFile",
							success: function (res) {
								if(res.status == 1){
									$this.parent().remove();
								}
							}
						});
						$(this).dialog('close');			
					},
					'Cancel': function() {
						$(this).dialog('close');
					}
				}
			});
			$("#dialogDeleteFile").dialog('open');
		}).on("click", "ul.pj-menu-list > li > a", function (e) {
			var href = $(this).attr('href');
			
			if(href.indexOf('pjActionSendTest') != -1)
			{
				e.preventDefault();
				$('#email').val('');
				$("#dialogSend").dialog({
					autoOpen: false,
					resizable: false,
					draggable: false,
					modal: true,
					width: 480,
					buttons: {
						'Send': function() {
							
							if($frmSendTest.valid())
							{
								$('#result_message').html(myLabel.send_progress);
								
								$.ajax({
									type: "POST",
									data: {
										email: $('#email').val()
									},
									dataType: 'json',
									url: href,
									success: function (res) {
										if(res.code == 200)
										{
											$('#result_message').html(myLabel.sent_ok);
										}else{
											$('#result_message').html(myLabel.sent_error);
										}
									}
								});
								$(this).dialog('close');
								$dialogSendResult.dialog('open');
							}
						},
						'Cancel': function() {
							$(this).dialog('close');
						}
					}
				});
				$("#dialogSend").dialog('open');
			}
			if(href.indexOf('pjActionDuplicate') != -1)
			{
				e.preventDefault();
				
				$("#dialogDuplicate").dialog({
					autoOpen: false,
					resizable: false,
					draggable: false,
					modal: true,
					width: 480,
					buttons: {
						'Yes': function() {
							$.ajax({
								type: "GET",
								dataType: 'json',
								url: href,
								success: function (res) {
									if(res.code == 200)
									{
										$grid.datagrid("load", "admin.php?controller=pjAdminMessages&action=pjActionGetMessage");
									}
									$("#dialogDuplicate").dialog('close');
								}
							});
						},
						'No': function() {
							$(this).dialog('close');
						}
					}
				});
				$("#dialogDuplicate").dialog('open');
			}
		}).on("click", ".pj-save-and-send", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			$frmUpdateMessage.find("input[name='send']").val(1);
			$frmUpdateMessage.submit();
		});
	});
})(jQuery_1_8_2);