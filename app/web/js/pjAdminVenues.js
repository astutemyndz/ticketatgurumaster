var jQuery_1_8_2 = jQuery_1_8_2 || $.noConflict();
(function ($, undefined) {
	$(function () {
		"use strict";
		// ############## Site Map Code ####################
		// let txtRow = document.querySelector('#txtRow');
		// let txtColumn = document.querySelector('#txtColumn');
		// let btnApply = document.querySelector('#btnApply');
		// let divRoom = document.querySelector('.room');
		// let ulContextMenu = document.querySelector('ul.context-menu');
		// let chkFillWithTable = document.querySelector('#chkFillWithTable');
		// let txtSeatCapacity = document.querySelector('#txtSeatCapacity');
		// let ddlSeatType = document.querySelector('#ddlSeatType');

		// let divControlPanel = document.querySelector('div.ctrl-panel');

		// let lisContextMenu = ulContextMenu.querySelectorAll('li');
		// let liInsertRowBefore = lisContextMenu.item(0);
		// let liInsertRowAfter = lisContextMenu.item(1);
		// let liInsertColumnToLeft = lisContextMenu.item(2);
		// let liInsertColumnToRight = lisContextMenu.item(3);
		// let liDeleteRow = lisContextMenu.item(4);
		// let liDeleteColumn = lisContextMenu.item(5);
		// let liAddOrDeleteTable = lisContextMenu.item(6);

		// let ulSeatMenu = document.querySelector('ul.seat-menu');
		// let lisSeatMenu = ulSeatMenu.querySelectorAll('li');
		// let liMarkAsFree = lisSeatMenu.item(1);
		// let liMarkAsRed = lisSeatMenu.item(2);
		// let liMarkAsGold = lisSeatMenu.item(3);
		// let liMarkAsBlocked = lisSeatMenu.item(4);

		// let ulTableMenu = document.querySelector('ul.table-menu');
		// let lisTableMenu = ulTableMenu.querySelectorAll('li');
		// let liExtendCapacity = lisTableMenu.item(0);
		// let liMarkAllAsFree = lisTableMenu.item(1);
		// let liMarkAllAsRed = lisTableMenu.item(2);
		// let liMarkAllAsGold = lisTableMenu.item(3);
		// let liMarkAllAsBlocked = lisTableMenu.item(4);

		// let btnZoomIn = document.querySelector('#btnZoomIn');
		// let btnZoomOut = document.querySelector('#btnZoomOut');

		// let btnMoveUp = document.querySelector('#btnMoveUp');
		// let btnMoveDown = document.querySelector('#btnMoveDown');
		// let btnMoveLeft = document.querySelector('#btnMoveLeft');
		// let btnMoveRight = document.querySelector('#btnMoveRight');

		// let btnReset = document.querySelector('#btnReset');
		// let btnShowHide = document.querySelector('#btnShowHide');
		// let btnPreview = document.querySelector('#btnPreview');

		// let scaleFactor = 1;
		// let translationAlongX = 0;
		// let translationAlongY = 0;

		// let noOfRows, noOfColumns;
		// document.body.onclick = function () {
		// 	$([ulContextMenu, ulSeatMenu, ulTableMenu]).hide();
		// };
		
		// btnPreview.onclick = function () {
		
		// 	let cells = document.querySelectorAll('.cell');
		// 	let rows = document.querySelectorAll('.row');
		
		// 	if (this.innerText == 'Preview') {
		// 		this.innerText = 'Test Mode';
		// 		[...cells, ...rows].forEach(e => e.style.border = 0);
		// 	}
		// 	else {
		// 		this.innerText = 'Preview';
		// 		[...cells, ...rows].forEach(e => e.style.removeProperty('border'));
		// 	}
		
		
		// };
		
		// btnShowHide.onclick = function () {
		// 	$(divControlPanel).toggle();
		// };
		
		// btnReset.onclick = function () {
		// 	scaleFactor = 1;
		// 	translationAlongX = 0;
		// 	translationAlongY = 0;
		// 	divRoom.style.transform = `matrix(${scaleFactor}, 0, 0, ${scaleFactor}, ${translationAlongX}, ${translationAlongY})`;
		// };
		
		// btnZoomIn.onclick = function () {
		// 	scaleFactor += 0.1;
		// 	divRoom.style.transform = `matrix(${scaleFactor}, 0, 0, ${scaleFactor}, ${translationAlongX}, ${translationAlongY})`;
		// };
		
		// btnZoomOut.onclick = function () {
		// 	scaleFactor -= 0.1;
		// 	divRoom.style.transform = `matrix(${scaleFactor}, 0, 0, ${scaleFactor}, ${translationAlongX}, ${translationAlongY})`;
		// };
		
		// btnMoveUp.onclick = function () {
		// 	translationAlongY -= 10;
		// 	divRoom.style.transform = `matrix(${scaleFactor}, 0, 0, ${scaleFactor}, ${translationAlongX}, ${translationAlongY})`;
		// };
		
		// btnMoveDown.onclick = function () {
		// 	translationAlongY += 10;
		// 	divRoom.style.transform = `matrix(${scaleFactor}, 0, 0, ${scaleFactor}, ${translationAlongX}, ${translationAlongY})`;
		// };
		
		// btnMoveLeft.onclick = function () {
		// 	translationAlongX -= 10;
		// 	divRoom.style.transform = `matrix(${scaleFactor}, 0, 0, ${scaleFactor}, ${translationAlongX}, ${translationAlongY})`;
		// };
		
		// btnMoveRight.onclick = function () {
		// 	translationAlongX += 10;
		// 	divRoom.style.transform = `matrix(${scaleFactor}, 0, 0, ${scaleFactor}, ${translationAlongX}, ${translationAlongY})`;
		// };
		
		// chkFillWithTable.onclick = function () {
		
		// 	if (this.checked) {
		// 		txtSeatCapacity.readOnly = false;
		// 		ddlSeatType.disabled = false;
		// 	}
		// 	else {
		// 		txtSeatCapacity.readOnly = true;
		// 		ddlSeatType.disabled = true;
		// 	}
		
		// };
		
		// btnApply.onclick = function () {
		
		// 	noOfRows = +txtRow.value;
		// 	noOfColumns = +txtColumn.value;
		
		// 	divRoom.innerHTML = '';
		
		// 	for (let i = 1; i <= noOfRows; i++) {
		// 		let $divRow = $(`<div class='row'></div>`);
		// 		populateRowWithCells($divRow);
		// 		$(divRoom).append($divRow);
		// 	}
		
		// 	if (chkFillWithTable.checked) {
		
		// 		let capacity = txtSeatCapacity.value;
		// 		let type = ddlSeatType.value;
		// 		let rows = divRoom.querySelectorAll('.row');
		
		// 		for (let r of rows) {
		// 			let cells = r.querySelectorAll('.cell');
		
		// 			for (let c of cells) {
		// 				let $table = createTable(capacity, type.toLowerCase());
		// 				$(c).append($table);
		// 			}
		// 		}
		
		// 	}
		
		
		// };
		
		// liInsertRowBefore.onclick = function (e) {
		// 	let divCellActingUpon = ulContextMenu['acting-upon'];
		// 	let divRowActingUpon = divCellActingUpon.parentElement;
		// 	let $divRow = $(`<div class='row'></div>`);
		// 	populateRowWithCells($divRow);
		// 	$divRow.insertBefore(divRowActingUpon);
		// 	noOfRows++;
		// 	$(ulContextMenu).hide();
		// 	e.stopPropagation();
		// };
		
		// liInsertRowAfter.onclick = function (e) {
		// 	let divCellActingUpon = ulContextMenu['acting-upon'];
		// 	let divRowActingUpon = divCellActingUpon.parentElement;
		// 	let $divRow = $(`<div class='row'></div>`);
		// 	populateRowWithCells($divRow);
		// 	$divRow.insertAfter(divRowActingUpon);
		// 	noOfRows++;
		// 	$(ulContextMenu).hide();
		// 	e.stopPropagation();
		// };
		
		// liInsertColumnToLeft.onclick = function (e) {
		// 	let divCellActingUpon = ulContextMenu['acting-upon'];
		// 	let indexOfCell = $(divCellActingUpon).index();
		// 	addColumnAtIndex(indexOfCell, true);
		// 	noOfColumns++;
		// 	$(ulContextMenu).hide();
		// 	e.stopPropagation();
		// };
		
		// liInsertColumnToRight.onclick = function (e) {
		// 	let divCellActingUpon = ulContextMenu['acting-upon'];
		// 	let indexOfCell = $(divCellActingUpon).index();
		// 	addColumnAtIndex(indexOfCell, false);
		// 	noOfColumns++;
		// 	$(ulContextMenu).hide();
		// 	e.stopPropagation();
		// };
		
		// liDeleteRow.onclick = function (e) {
		// 	let divCellActingUpon = ulContextMenu['acting-upon'];
		// 	let divRowActingUpon = divCellActingUpon.parentElement;
		// 	$(divRowActingUpon).remove();
		// 	noOfRows--;
		// 	$(ulContextMenu).hide();
		// 	e.stopPropagation();
		// };
		
		// liDeleteColumn.onclick = function (e) {
		
		// 	let divCellActingUpon = ulContextMenu['acting-upon'];
		// 	let index = $(divCellActingUpon).index();
		
		// 	let rows = divRoom.querySelectorAll('.row');
		
		// 	for (let i = 0; i < rows.length; i++) {
		// 		let row = rows.item(i);
		// 		let cells = row.querySelectorAll('.cell');
		// 		let cell = cells.item(index);
		// 		$(cell).remove();
		// 	}
		
		
		// 	noOfColumns--;
		// 	$(ulContextMenu).hide();
		// 	e.stopPropagation();
		// };
		
		// liAddOrDeleteTable.onclick = function (e) {
		
		// 	let divCellActingUpon = ulContextMenu['acting-upon'];
		// 	let divTable = divCellActingUpon.querySelector('.table');
		
		// 	if (divTable) {
		// 		$(divTable).remove();
		// 	}
		// 	else {
		// 		let capacity = prompt('Enter table capacity');
		// 		let $table = createTable(capacity, 'free');
		// 		$(divCellActingUpon).append($table);
		// 	}
		
		// 	$(ulContextMenu).hide();
		// 	e.stopPropagation();
		// };
		
		// function populateRowWithCells($divRow) {
		// 	for (let j = 1; j <= noOfColumns; j++) {
		// 		let $divCell = $(`<div class='cell'></div>`);
		// 		$divRow.append($divCell);
		// 		$divCell.click(cell_Click);
		// 	}
		// }
		
		// function addColumnAtIndex(index, left) {
		
		// 	let rows = divRoom.querySelectorAll('.row');
		
		// 	for (let i = 0; i < rows.length; i++) {
		// 		let row = rows.item(i);
		// 		let cells = row.querySelectorAll('.cell');
		// 		let cellToTarget = cells.item(index);
		// 		let $cell = $(`<div class='cell'></div>`);
		// 		$cell.click(cell_Click);
		// 		if (left) $cell.insertBefore(cellToTarget);
		// 		else $cell.insertAfter(cellToTarget);
		// 	}
		
		// }
		
		// function cell_Click(e) {
		
		// 	$([ulSeatMenu, ulTableMenu]).hide();
		
		// 	let table = this.querySelector('.table');
		
		// 	if (table) {
		// 		liAddOrDeleteTable.innerText = 'Delete table';
		// 	}
		// 	else {
		// 		liAddOrDeleteTable.innerText = 'Insert table';
		// 	}
		
		// 	ulContextMenu['acting-upon'] = this;
		// 	ulContextMenu.style.top = e.clientY + 'px';
		// 	ulContextMenu.style.left = e.clientX + 'px';
		// 	$(ulContextMenu).show();
		// 	e.stopPropagation();
		
		// }
		
		// function seat_Click(e) {
		
		// 	$([ulContextMenu, ulTableMenu]).hide();
		
		// 	ulSeatMenu['acting-upon'] = this;
		// 	ulSeatMenu.style.top = e.clientY + 'px';
		// 	ulSeatMenu.style.left = e.clientX + 'px';
		// 	$(ulSeatMenu).show();
		
		// 	e.stopPropagation();
		
		// }
		
		// function table_Click(e) {
		// 	$([ulContextMenu, ulSeatMenu]).hide();
		// 	ulTableMenu['acting-upon'] = this;
		// 	ulTableMenu.style.top = e.clientY + 'px';
		// 	ulTableMenu.style.left = e.clientX + 'px';
		// 	$(ulTableMenu).show();
		// 	e.stopPropagation();
		// }
		
		// function createSeat(type) {
		// 	let $seat = $(`<div class='seat s-${type}'></div>`);
		// 	$seat[0]['type'] = type;
		// 	$seat.click(seat_Click);
		// 	return $seat;
		// }
		
		// function createTable(capacity, type) {
		
		// 	let tableTemplate = `<div class='table'>
		// 							<div class='block'></div>
		// 						 </div>`;
		
		// 	let $table = $(tableTemplate);
		// 	$table.click(table_Click);
		// 	$table[0]['capacity'] = capacity;
		
		// 	for (let i = 1; i <= capacity; i++) {
		// 		let $seat = createSeat(type);
		// 		$table.append($seat);
		// 	}
		
		// 	return $table;
		// }
		
		// function changeSeatType(seat, type) {
		// 	seat['type'] = type;
		// 	$(seat).attr('class', '').addClass(['seat', `s-${type}`]);
		// }
		
		// liMarkAsRed.onclick = function (e) {
		// 	let seat = ulSeatMenu['acting-upon'];
		// 	changeSeatType(seat, 'red');
		// 	$(ulSeatMenu).hide();
		// 	e.stopPropagation();
		// }
		
		// liMarkAsGold.onclick = function (e) {
		// 	let seat = ulSeatMenu['acting-upon'];
		// 	changeSeatType(seat, 'gold');
		// 	$(ulSeatMenu).hide();
		// 	e.stopPropagation();
		// }
		
		// liMarkAsBlocked.onclick = function (e) {
		// 	let seat = ulSeatMenu['acting-upon'];
		// 	changeSeatType(seat, 'blocked');
		// 	$(ulSeatMenu).hide();
		// 	e.stopPropagation();
		// }
		
		// liMarkAsFree.onclick = function (e) {
		// 	let seat = ulSeatMenu['acting-upon'];
		// 	changeSeatType(seat, 'free');
		// 	$(ulSeatMenu).hide();
		// 	e.stopPropagation();
		// }
		
		// liExtendCapacity.onclick = function (e) {
		
		// 	let extendBy = + prompt('Extend table capacity by');
		// 	let table = ulTableMenu['acting-upon'];
		
		// 	for (let i = 1; i <= extendBy; i++) {
		// 		let $seat = createSeat();
		// 		$(table).append($seat);
		// 	}
		
		// 	table.capacity = +table.capacity + extendBy;
		
		// 	$(ulTableMenu).hide();
		// 	e.stopPropagation();
		// }
		
		// liMarkAllAsFree.onclick = function (e) {
		
		// 	let table = ulTableMenu['acting-upon'];
		// 	let seats = table.querySelectorAll('.seat');
		
		// 	seats.forEach(s => changeSeatType(s, 'free'));
		
		// 	$(ulTableMenu).hide();
		// 	e.stopPropagation();
		// };
		
		// liMarkAllAsRed.onclick = function (e) {
		
		// 	let table = ulTableMenu['acting-upon'];
		// 	let seats = table.querySelectorAll('.seat');
		
		// 	seats.forEach(s => changeSeatType(s, 'red'));
		
		// 	$(ulTableMenu).hide();
		// 	e.stopPropagation();
		// };
		
		// liMarkAllAsGold.onclick = function (e) {
		
		// 	let table = ulTableMenu['acting-upon'];
		// 	let seats = table.querySelectorAll('.seat');
		
		// 	seats.forEach(s => changeSeatType(s, 'gold'));
		
		// 	$(ulTableMenu).hide();
		// 	e.stopPropagation();
		// };
		
		// liMarkAllAsBlocked.onclick = function (e) {
		
		// 	let table = ulTableMenu['acting-upon'];
		// 	let seats = table.querySelectorAll('.seat');
		
		// 	seats.forEach(s => changeSeatType(s, 'blocked'));
		
		// 	$(ulTableMenu).hide();
		// 	e.stopPropagation();
		// };
		// ############## Site Map Code ####################


		let mapHolder = document.querySelector('#mapHolder');

		if (mapHolder) {
			mapHolder.style.removeProperty('width');
			mapHolder.style.removeProperty('height');
			mapHolder.style.cursor = 'pointer';
		}

		var $frmCreateVenue = $("#frmCreateVenue"),
			$frmUpdateVenue = $("#frmUpdateVenue"),
			$frmUpdateSector = $('#frmUpdateSector'),
			$dialogUpdate = $("#dialogUpdate"),
			$dialogDel = $("#dialogDelete"),
			$dialogHotspot = $("#dialogHotspot"),
			$boxMap = $("#boxMap"),
			datagrid = ($.fn.datagrid !== undefined),
			validate = ($.fn.validate !== undefined),
			hotspot_width = 3,
			hotspot_height = 2,
			vOpts = {
				rules: {
					seat_number: {
						required: function () {
							if ($('#seats_count').val() != '') {
								var result = false;
								$('.number-field').each(function (i, ele) {
									if ($(ele).val() == '') {
										result = true;
									}
								});
								return result;
							} else {
								return false;
							}
						}
					}
				},
				messages: {
					number_of_seats: {
						required: myLabel.seats_required
					},
					seat_number: {
						required: myLabel.seat_numbers_required
					},
					seats_count: {
						positiveNumber: myLabel.seat_count_greater_zero
					}
				},
				errorPlacement: function (error, element) {
					error.insertAfter(element.parent());
				},
				onkeyup: false,
				errorClass: "err",
				wrapper: "em",
				ignore: '',
				invalidHandler: function (event, validator) {
					$(".pj-multilang-wrap").each(function (index) {
						if ($(this).attr('data-index') == myLabel.localeId) {
							$(this).css('display', 'block');
						} else {
							$(this).css('display', 'none');
						}
					});
					$(".pj-form-langbar-item").each(function (index) {
						if ($(this).attr('data-index') == myLabel.localeId) {
							$(this).addClass('pj-form-langbar-item-active');
						} else {
							$(this).removeClass('pj-form-langbar-item-active');
						}
					});
				},
				submitHandler: function (form) {

					var post_arr = new Array();
					var chunk_arr = new Array();
					var loop = 0;

					console.log(form);

					function setBeforeSave(i) {
						var post_data = chunk_arr[i].join("&");
						$.post("admin.php?controller=pjAdminVenues&action=pjActionBeforeSave", post_data, callback);
					}

					function callback() {
						loop++;
						if (loop < chunk_arr.length) {
							setBeforeSave.call(null, [loop]);
						} else {
							form.submit();
						}
					}

					if ($("input[type='radio']:checked").val() == 'T') {
						form.submit();
					}
					else {

						var max_post_fields = 100;

						if (parseInt($('#seats_count').val(), 10) > max_post_fields) {

							$('.number-field').each(function (index) {
								post_arr.push($(this).serialize());
								$(this).attr('name', "");
							});
							while (post_arr.length > 0) {
								chunk_arr.push(post_arr.splice(0, max_post_fields));
							}
							if (chunk_arr.length > 0) {
								setBeforeSave.call(null, [loop]);
							}
						} else {
							form.submit();

						}
					}


					console.log(post_arr);
					console.log(chunk_arr);

					return false;
				}
			};
		if ($frmCreateVenue.length > 0 || $frmUpdateVenue.length > 0) {
			$.validator.addMethod('positiveNumber',
				function (value) {
					return Number(value) > 0;
				},
				myLabel.seat_count_greater_zero);
		}


		function collisionDetect(o) {
			var i, pos, horizontalMatch, verticalMatch, collision = false;
			$("#mapHolder").children("span").each(function (i) {
				pos = getPositions(this);
				//console.log('width:'+pos[0],'height:'+pos[1]);
				horizontalMatch = comparePositions([o.left, o.left + o.width], pos[0]);
				verticalMatch = comparePositions([o.top, o.top + o.height], pos[1]);
				if (horizontalMatch && verticalMatch) {
					collision = true;
					return false;
				}
			});
			if (collision) {
				return true;
			}
			return false;
		}

		function getPositions(box) {
			var $box = $(box);
			var pos = $box.position();
			var width = $box.width();
			var height = $box.height();
			return [[pos.left, pos.left + width], [pos.top, pos.top + height]];
		}

		function comparePositions(p1, p2) {
			var x1 = p1[0] < p2[0] ? p1 : p2;
			var x2 = p1[0] < p2[0] ? p2 : p1;
			return x1[1] > x2[0] || x1[0] === x2[0] ? true : false;
		}

		function updateElem(event, ui) {
			var $this = $(this),
				rel = $this.attr("rel"),
				$hidden = $("#" + rel),
				val = $hidden.val().split("|");
			$hidden.val([val[0], parseInt($this.width(), 10), parseInt($this.height(), 10), ui.position.left, ui.position.top, $this.text(), val[6], val[7]].join("|"));
		}

		function getMax() {
			var tmp, index = 0;
			$("span.empty").each(function (i) {
				if (!isNaN(Number(this.title))) {
					tmp = Number(this.title);
				} else {
					tmp = parseInt($(this).attr("rel").split("_")[1], 10);
				}
				if (tmp > index) {
					index = tmp;
				}
			});
			return index;
		}

		function GetZoomFactor() {
			var factor = 1;
			if (document.body.getBoundingClientRect) {
				// rect is only in physical pixel size in IE before version 8 
				var rect = document.body.getBoundingClientRect();
				var physicalW = rect.right - rect.left;
				var logicalW = document.body.offsetWidth;

				// the zoom level is always an integer percent value
				factor = Math.round((physicalW / logicalW) * 100) / 100;
			}
			return factor;
		}

		if ($frmCreateVenue.length > 0 && validate) {
			var validator = $frmCreateVenue.submit(function () {
				if ($('#hiddenHolder').length > 0) {
					if ($("#hiddenHolder :input").length > 0) {
						$('#number_of_seats').val('1');
					} else {
						$('#number_of_seats').val('');
					}
				}
				if ($("input[type='radio']:checked").val() == 'T') {
					$('#number_of_seats').addClass('required');
					$('#seats_count').removeClass('required positiveNumber');
				}
				if ($("input[type='radio']:checked").val() == 'F') {
					$('#number_of_seats').removeClass('required');
					$('#seats_count').addClass('required positiveNumber');
				}
			}).validate(vOpts);
		}
		if ($frmUpdateVenue.length > 0) {
			var validator = $frmUpdateVenue.submit(function () {
				if ($('#hiddenHolder').length > 0) {
					if ($("#hiddenHolder :input").length > 0) {
						$('#number_of_seats').val('1');
					} else {
						$('#number_of_seats').val('');
					}
				}
				if ($("input[type='radio']:checked").val() == 'T') {
					$('#number_of_seats').addClass('required');
					$('#seats_count').removeClass('required positiveNumber');
				}
				if ($("input[type='radio']:checked").val() == 'F') {
					$('#number_of_seats').removeClass('required');
					$('#seats_count').addClass('required positiveNumber');
				}
			}).validate(vOpts);

			var offset = $("#map").offset(),
				dragOpts = {
					containment: "parent",
					stop: function (event, ui) {
						updateElem.apply(this, [event, ui]);
					}
				};

			$("span.empty").draggable(dragOpts).resizable({
				resize: function (e, ui) {
					var height = $(this).height();
					$(this).css("line-height", height + "px");
				},
				stop: function (e, ui) {
					var height = $(this).height();
					$(this).css("line-height", height + "px");
					updateElem.apply(this, [e, ui]);
				}
			}).bind("click", function (e) {
				$dialogUpdate.data('rel', $(this).attr("rel")).dialog("open");
				$(this).siblings(".rect").removeClass("rect-selected").end().addClass("rect-selected");
			});

			// CODE BY ANIK BANERJEE ==============================================

			let startX, startY, endX, endY;

			if (mapHolder) {

				mapHolder.addEventListener('pointerdown', function (e) {
					startX = e.clientX;
					startY = e.clientY;
					mapHolder.style.cursor = 'move';
				});

				mapHolder.addEventListener('pointerup', function (e) {
					mapHolder.style.cursor = 'pointer';
				});
			}


			$('#mapHolder').click(function (e) {

				endX = e.clientX;
				endY = e.clientY;

				if (startX != endX || startY != endY) return;


				var px = $('.bsMapHolder').scrollLeft();
				var $this = $(this),
					index = getMax(),
					w = hotspot_width,
					h = hotspot_height;

				var t = Math.ceil(e.pageY - offset.top - (parseInt(hotspot_height / 2, 10)));
				var l = Math.ceil(e.pageX - offset.left - (parseInt(hotspot_width / 2, 10)) + px);

				let transform = getComputedStyle(this).transform;
				let tMatrix = new DOMMatrix(transform);
				let dWidth = (tMatrix.m11 - 1) * this.clientWidth;
				let dHeight = (tMatrix.m22 - 1) * this.clientHeight;

				t = (((t + (dHeight / 2) - tMatrix.m42) / tMatrix.m22));
				l = (((l + (dWidth / 2) - tMatrix.m41) / tMatrix.m11) - 1);

				var o = { top: t, left: l, width: w, height: h };

				if (!collisionDetect(o)) {

					index++;

					let $span = $("<span>", {
						css: {
							"top": t + "px",
							"left": l + "px",
							"width": w + "px",
							"height": h + "px",
							"line-height": h + "px",
							"position": "absolute",
						},
						html: '<span class="bsInnerRect" data-name="hidden_' + index + '">' + index + '</span>',
						rel: "hidden_" + index,
						title: index
					}).addClass("rect empty new").draggable(dragOpts).resizable({
						resize: function (e, ui) {
							var height = $(this).height();
							$(this).css("line-height", height + "px");
						},
						stop: function (e, ui) {
							var height = $(this).height();
							$(this).css("line-height", height + "px");
							updateElem.apply(this, [e, ui]);
						}
					}).bind("click", function (e) {
						$dialogUpdate.data('rel', $(this).attr("rel")).dialog("open");
						$(this).siblings(".rect").removeClass("rect-selected").end().addClass("rect-selected");
						e.stopPropagation();
					}).appendTo($this);

					$("<input>", {
						type: "hidden",
						name: "seats_new[]",
						id: "hidden_" + index
					}).val(['x', w, h, l, t, index, '1', '1'].join("|")).appendTo($("#hiddenHolder"));

				} else {
					if (window.console && window.console.log) {
					}
				}
			});

			// CODE BY ANIK BANERJEE ==============================================

			if ($dialogHotspot.length > 0) {
				$dialogHotspot.dialog({
					autoOpen: false,
					resizable: false,
					draggable: false,
					modal: true,
					buttons: (function () {
						var buttons = {};
						buttons[tbApp.locale.button.set] = function () {
							hotspot_width = 3;//parseInt($('#hotspot_width').val(), 10);
							hotspot_height = 2;//parseInt($('#hotspot_height').val(), 10);
							$dialogHotspot.dialog('close');
						};
						return buttons;
					})()
				});
			}

			if ($dialogDel.length > 0) {
				$dialogDel.dialog({
					autoOpen: false,
					resizable: false,
					draggable: false,
					modal: true,
					buttons: (function () {
						var buttons = {};
						buttons[tbApp.locale.button.delete] = function () {
							$.ajax({
								type: "POST",
								data: {
									id: $(this).data('lang')
								},
								url: "admin.php?controller=pjAdminVenues&action=pjActionDeleteMap",
								success: function (data) {
									if (data != '100') {
										$boxMap.html(data);
										$('#seats_count').parent().parent().css('display', 'block');
										$('#number_of_seats').remove();
									}
								}
							});
							$dialogDel.dialog('close');
						};
						buttons[tbApp.locale.button.cancel] = function () {
							$dialogDel.dialog('close');
						};

						return buttons;
					})()
				});
			}

			if ($dialogUpdate.length > 0) {
				var seat_id = null;
				$dialogUpdate.dialog({
					autoOpen: false,
					resizable: false,
					draggable: false,
					modal: true,
					width: 440,
					open: function () {
						var rel = $(this).data("rel"),
							arr = $("#" + rel).val().split("|");
						$("#seat_name").val(arr[5]);
						$("#seat_seats").val(arr[6]);
						seat_id = arr[0];
					},
					close: function () {
						$("#seat_name, #seat_seats").val("");

					},
					buttons: (function () {
						var buttons = {};
						buttons[tbApp.locale.button.save] = function () {
							var rel = $(this).data("rel"),
								pName = $("#seat_name").val(),
								pSeats = parseInt($("#seat_seats").val(), 10),
								pHidden = $("#" + rel, $frmUpdateVenue).val();
							if (pSeats > 0) {
								var a = pHidden.split("|");
								var $rect_inner = $(".bsInnerRect[data-name='" + rel + "']", $frmUpdateVenue);
								$rect_inner.text(pName);
								$("#rbInner_" + rel).text(pName);
								$("#" + rel).val([seat_id, a[1], a[2], a[3], a[4], pName, pSeats].join("|"));

								$("#seat_seats").removeClass('error');
								$(this).dialog('close');
							} else {
								$("#seat_seats").addClass('error');
							}
						};
						buttons[tbApp.locale.button.delete] = function () {
							var rel = $(this).data('rel');
							$("#" + rel, $("#hiddenHolder")).remove();
							$(".rect-selected[rel='" + rel + "']", $("#mapHolder")).remove();

							$(this).dialog('close');
						};
						buttons[tbApp.locale.button.cancel] = function () {
							$dialogUpdate.dialog('close');
						};

						return buttons;
					})()
				});
			}
		}

		function formatMap(val, obj) {
			return val != null ? myLabel.yes : myLabel.no;
		}

		if ($("#grid").length > 0 && datagrid) {

			var $grid = $("#grid").datagrid({
				buttons: [{ type: "edit", url: "admin.php?controller=pjAdminVenues&action=pjActionUpdate&id={:id}" },
				{ type: "delete", url: "admin.php?controller=pjAdminVenues&action=pjActionDeleteVenue&id={:id}" }
				],
				columns: [{ text: myLabel.name, type: "text", sortable: true, editable: false, width: 280 },
				{ text: myLabel.map, type: "text", sortable: false, editable: false, renderer: formatMap, width: 100 },
				{ text: myLabel.seats, type: "text", sortable: true, editable: false, width: 120 },
				{
					text: myLabel.status, type: "select", sortable: true, editable: true, width: 90, options: [
						{ label: myLabel.active, value: "T" },
						{ label: myLabel.inactive, value: "F" }
					], applyClass: "pj-status"
				}],
				dataUrl: "admin.php?controller=pjAdminVenues&action=pjActionGetVenue",
				dataType: "json",
				fields: ['name', 'map_path', 'seats_count', 'status'],
				paginator: {
					actions: [
						{ text: myLabel.delete_selected, url: "admin.php?controller=pjAdminVenues&action=pjActionDeleteVenueBulk", render: true, confirmation: myLabel.delete_confirmation },
						{ text: myLabel.revert_status, url: "admin.php?controller=pjAdminVenues&action=pjActionStatusVenue", render: true },
						{ text: myLabel.exported, url: "admin.php?controller=pjAdminVenues&action=pjActionExportVenue", ajax: false }
					],
					gotoPage: true,
					paginate: true,
					total: true,
					rowCount: true
				},
				saveUrl: "admin.php?controller=pjAdminVenues&action=pjActionSaveVenue&id={:id}",
				select: {
					field: "id",
					name: "record[]"
				}
			});
		}

		function loadSeatNumber() {
			var number_of_seats = parseInt($('#seats_count').val(), 10),
				i = 1,
				existing_number = $('#tbSeatNumber > input').length,
				tmp = 1;
			if (number_of_seats == 0) {
				$('#tbSeatNumber').siblings().eq(0).html(myLabel.seat_numbers_1);
				$('#tbSeatNumber').parent().siblings().html('');
			} else {
				$('#tbSeatNumber').siblings().eq(0).html(myLabel.seat_numbers_2);
				$('#tbSeatNumber').parent().siblings().eq(0).html(myLabel.seat_numbers);
			}

			if (existing_number == 0) {
				$('#tbSeatNumber').html("");
			}
			if (existing_number < number_of_seats && existing_number > 0) {
				tmp = existing_number + 1;
			}
			if (existing_number > number_of_seats) {
				$('.number-field').each(function (i, ele) {
					var index = parseInt($(ele).attr('data-index'), 10)
					if (index > number_of_seats) {
						$(this).remove();
					}
				});
			} else {
				if (existing_number != number_of_seats) {
					for (i = tmp; i <= number_of_seats; i++) {
						$('#tbSeatNumber').append('<input type="text" name="number[new_' + i + ']" value="' + i + '" class="pj-form-field w80 number-field" data-index="' + i + '" />');
					}
				}
			}
			$('.pj-loader').hide();
		}

		if ($frmUpdateSector.length > 0 && validate) {
			$frmUpdateSector.validate({
				errorPlacement: function (error, element) {
					error.insertAfter(element);
				},
				onkeyup: false,
				errorClass: "err",
				wrapper: "em",
				submitHandler: function (form) {
					var valid = true;
					$('.pj-seat-field').each(function (i, el) {
						var value = parseInt($(this).val(), 10);
						if (value > 0) {
							$(this).removeClass('error');
						} else {
							valid = false;
							$(this).addClass('error');
						}
					});
					if (valid == true) {
						form.submit();
					}
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
			$grid.datagrid("load", "admin.php?controller=pjAdminVenues&action=pjActionGetVenue", "name", "ASC", content.page, content.rowCount);
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
			$grid.datagrid("load", "admin.php?controller=pjAdminVenues&action=pjActionGetVenue", "name", "ASC", content.page, content.rowCount);
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
			$.post("admin.php?controller=pjAdminVenues&action=pjActionSetActive", {
				id: $(this).closest("tr").data("object")['id']
			}).done(function (data) {
				$grid.datagrid("load", "admin.php?controller=pjAdminVenues&action=pjActionGetVenue");
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
			$grid.datagrid("load", "admin.php?controller=pjAdminVenues&action=pjActionGetVenue", "name", "ASC", content.page, content.rowCount);
			return false;
		}).on("click", ".pj-delete-map", function (e) {
			$dialogDel.data('lang', $(this).attr('lang')).dialog('open');
		}).on("click", "#pj_delete_seat", function (e) {
			var rel = $(this).attr('data-rel');
			$("#" + rel, $("#hiddenHolder")).remove();
			$(".rect-selected[rel='" + rel + "']", $("#mapHolder")).remove();
			$(this).css('display', 'none');
		}).on("click", "input:radio[name=use_seats_map]", function (e) {
			if ($(this).val() == 'T') {
				
				$('.tbUseMapYes').css('display', 'block');
				$('.tbUseMapNo').css('display', 'none');
				$('#seats_map').addClass('required');
				$('#seats_count').removeClass('required');
				$('.tbHotpotSize').css('display', 'block');
				
			} else {
				
				$('.tbUseMapYes').css('display', 'none');
				$('.tbUseMapNo').css('display', 'block');
				$('#seats_count').addClass('required');
				$('#seats_map').removeClass('required');
				$('.tbHotpotSize').css('display', 'none');
			}
		}).on("keyup", "#seats_count", function (e) {
			var key = e.charCode || e.keyCode || 0;
			if (key == 8 ||
				key == 13 ||
				key == 46 ||
				key == 110 ||
				key == 190 ||
				(key >= 35 && key <= 40) ||
				(key >= 48 && key <= 57) ||
				(key >= 96 && key <= 105)) {
				$('.pj-loader').show();
				delay(function () {
					loadSeatNumber();
				}, 2000);
			}
		}).on("click", ".tbHotpotSize", function (e) {
			if (e && e.preventDefault) {
				e.preventDefault();
			}
			$dialogHotspot.dialog('open');
		});

		var delay = (function () {
			var timer = 0;
			return function (callback, ms) {
				clearTimeout(timer);
				timer = setTimeout(callback, ms);
			};
		})();
	});
})(jQuery_1_8_2);