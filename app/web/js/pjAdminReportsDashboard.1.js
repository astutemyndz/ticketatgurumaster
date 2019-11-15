const THComponent = function(props) {
	return(`<th id="th_`+props.key+`">`+props.columnName+`</th>`);
}
const TDComponent = function(props) {
	return(`<td id="td_`+props.key+`">`+props.value+`</td>`);
}
const TRComponent = function(props) {
	const body = props.body;
	let tdsArray = [];
	Object.values(body).forEach(function(value, index) {
		//console.log(tdValue);
		tdsArray.push(TDComponent({value: value, key: index}));
	});
	return(`
		<tr>
			`+tdsArray.join('')+`
		</tr>
	`);
}
const TheadComponent = function(props) {
	//console.log(props);
	const thead = props.thead;
	let theadArray = [];
	if(thead) {
		thead.forEach(function(column, index) {
			theadArray.push(THComponent({columnName: column, key: index}));
			});
			return (`
				<thead>
					<tr>
					`+
					theadArray.join('')
					+`
					</tr>
		
				</thead>
			`);
	}
	
}
const TbodyComponent = function(props) {
	const tbody = props.tbody;
	
	let tbodyArray = [];
	
	tbody.forEach(function(body, index) {
		tbodyArray.push(TRComponent({body: body, key: index}));
	});
	
	if (typeof tbodyArray !== 'undefined' && tbodyArray.length > 0) {
		return (`
		<tbody>
			`+tbodyArray.join('')+`
		</tbody>
	`);
	} else {
		return(`
			<tbody><tr class="odd"><td valign="top" colspan="5" class="dataTables_empty">No matching records found</td></tr></tbody>
		`);
	}
	
}
const DataTableComponent = function(props) {
	return(`
		<table class="table dataTable">
			`+TheadComponent(props)+`
			`+TbodyComponent(props)+`
		</table>
	`);
}
var jQuery_1_8_2 = jQuery_1_8_2 || $.noConflict();
var state = {};
function setState(data) {
	this.state = data;
	return this;
}
const users = function () {
	// fetch data and update state
  
}
const UsersComponent = function(props) {
	let userArray = [];
	//const user = false;
	const users = props.users;
	if(users) {
		users.forEach(function(user, index) {
			userArray.push(UserComponent(user))
		})
	}
	return(`
			<select id="userId" name="filterData[userId]" data-filter="make" class="filter-make filter form-control users">
				<option value="">Select User</option>
				`+userArray.join('')+`
			</select>
	`);
}
const UserComponent = function(props) {
	return(`
		<option value="`+props.id+`">`+props.name+`</option>
	`);
}
function componentDidMount() {
    
	
 }


(function ($, undefined) {
	// $("#print").jqxButton({ width: 80 });
	// $("#print").click(function () {
	// 	var gridContent = $(".jqxdatatable").jqxDataTable('exportData', 'html');
	// 	var newWindow = window.open('', '', 'width=800, height=500'),
	// 	document = newWindow.document.open(),
	// 	pageContent =
	// 		'<!DOCTYPE html>' +
	// 		'<html>' +
	// 		'<head>' +
	// 		'<meta charset="utf-8" />' +
	// 		'<title>jQWidgets DataTable</title>' +
	// 		'</head>' +
	// 		'<body>' + gridContent + '</body></html>';
	// 	document.write(pageContent);
	// 	document.close();
	// 	newWindow.print();
	// });
	$(function () {
	
		// User Dropdown
		fetch(API_URL + '/users').then(function(response) {
			return response.json();
		}).then(function(data) {
			const users = data.data; //array
			//console.log(data);
			$('#users').html(UsersComponent({users:users}));
		})
		.catch(function(err) {
			console.log(err);
		});

		// Date range
		var $startDate = $('.start-date');
		var $endDate = $('.end-date');
  
		$startDate.datepicker({
		  autoHide: true,
		  
		});
		$endDate.datepicker({
		  autoHide: true,
		  startDate: $startDate.datepicker('getDate'),
		});
  
		$startDate.on('change', function () {
		  $endDate.datepicker('setStartDate', $startDate.datepicker('getDate'));
		});
		
	
		$('.jqxdatatable').loading();
		setTimeout(() => {
			$('#reportTypeButton').trigger('click');
			$('.jqxdatatable').loading('stop');	
		}, 2000);
		// Reset Filter Data

		$(document).on("click", ".resetFilter", function (e) {
			$("#filterForm").trigger("reset");
		});
		
		
		$(document).on("click", ".getBookingReports", function (e) {
			let reportType = $(this).attr('data-reportType');
			$reportType = $('#reportType');
			$reportType.val(reportType);
			let data = {
				reportType: reportType
			};
			var dataFields = [];
			var columns = [];
			var localData = [];
			$('.jqxdatatable').loading();
			fetch(API_URL + '/reports', {
				headers: {
					"Content-Type": 'application/x-www-form-urlencoded'
				},
				method: 'post',
				body: $.param(data)
			}).then(function (response) {
				return response.json();
			}).then(function (json) {
				let res = json;
				$('.jqxdatatable').loading('stop');

				let thead = [];
				let tbody = [];
				const bookings = res.data;

				const BY_DAY_PER_USER 			= 'BY_DAY_PER_USER';
				const FOR_THE_DAY 				= 'FOR_THE_DAY';
				const CASH_REGISTER 			= 'CASH_REGISTER';
				const OPERATIONS 				= 'OPERATIONS';
				const ORDERS 					= 'ORDERS';
				const TICKETS 					= 'TICKETS';
				const TICKET_ENTRANCE_VALIDATION = 'TICKET_ENTRANCE_VALIDATION';

				switch (reportType) {
					case BY_DAY_PER_USER:
						// thead = [
						// 	'UserName',
						// 	'TicketId',
						// 	'TicketPrice',
						// 	'EventName',
						// 	'ShowDateTime',
						// 	'BookingDate',
						// 	'BookingStatus'
						// ];
						dataFields = [
							{ name: 'UserName', type: 'string' },
							{ name: 'TicketId', type: 'string' },
							{ name: 'TicketPrice', type: 'string' },
							{ name: 'EventName', type: 'string' },
							{ name: 'ShowDateTime', type: 'string' },
							{ name: 'BookingDate', type: 'string' },
							{ name: 'BookingStatus', type: 'string' }
						];

						columns = [
							{ text: 'UserName', dataField: 'UserName'},
							{ text: 'TicketId', dataField: 'TicketId'},
							{ text: 'TicketPrice', dataField: 'TicketPrice'},
							{ text: 'EventName', dataField: 'EventName'},
							{ text: 'ShowDateTime', dataField: 'ShowDateTime'},
							{ text: 'BookingDate', dataField: 'BookingDate'},
							{ text: 'BookingStatus', dataField: 'BookingStatus'},
						  ]
		
						bookings.forEach(function(data, index) {
							localData.push({
								UserName		: data.userName,
								TicketId		: data.ticketId,
								TicketPrice		: data.ticketPrice,
								EventName		: data.eventTitle,
								ShowDateTime	: data.bookingDateTime,
								BookingDate		: data.bookingDate,
								BookingStatus	: data.bookingStatus,
							})
						});
					  break;
					case FOR_THE_DAY:
					  
					  break;
					case CASH_REGISTER:
					  
					  break;
					case OPERATIONS:
					  
					  break;
					case ORDERS:
						// thead = [
						// 	'OrderId',
						// 	'TransactionId',
						// 	'OrderDate',
						// 	'SubTotal',
						// 	'Total',
						// 	'Deposit',
						// 	'PaymentMethod',
						// 	'BookingStatus'
						// ];
						dataFields = [
							{ name: 'OrderId', type: 'string' },
							{ name: 'TransactionId', type: 'string' },
							{ name: 'OrderDate', type: 'string' },
							{ name: 'SubTotal', type: 'string' },
							{ name: 'Total', type: 'string' },
							{ name: 'Deposit', type: 'string' },
							{ name: 'PaymentMethod', type: 'string' },
							{ name: 'BookingStatus', type: 'string' },
						];
						columns = [
							{ text: 'OrderId', dataField: 'OrderId'},
							{ text: 'TransactionId', dataField: 'TransactionId'},
							{ text: 'OrderDate', dataField: 'OrderDate'},
							{ text: 'SubTotal', dataField: 'SubTotal'},
							{ text: 'Total', dataField: 'Total'},
							{ text: 'Deposit', dataField: 'Deposit'},
							{ text: 'PaymentMethod', dataField: 'PaymentMethod'},
							{ text: 'BookingStatus', dataField: 'BookingStatus'},
						  ]
						bookings.forEach(function(data, index) {
							localData.push({
								OrderId			: data.orderId,
								TransactionId	: data.transactionId,
								OrderDate		: data.bookingDate,
								SubTotal		: data.subTotal,
								Total			: data.total,
								Deposit			: data.deposit,
								PaymentMethod	: data.paymentMethod,
								BookingStatus	: data.bookingStatus,
							})
						});
					  break;  
					case TICKETS:
						// thead = [
						// 	'TicketId',
						// 	'TicketPrice',
						// 	'BookingId',
						// 	'UserName'
						// ];
		
						bookings.forEach(function(data, index) {
							localData.push({
								TicketId		: data.ticketId,
								TicketPrice		: data.ticketUnitPrice,
								BookingId		: data.bookingId, 	
								UserName		: data.userName,
							})
						});
						dataFields = [
							{ name: 'TicketId', type: 'string' },
							{ name: 'TicketPrice', type: 'string' },
							{ name: 'BookingId', type: 'string' },
							{ name: 'UserName', type: 'string' },
						];
						columns = [
							{ text: 'TicketId', dataField: 'TicketId'},
							{ text: 'TicketPrice', dataField: 'TicketPrice'},
							{ text: 'BookingId', dataField: 'BookingId'},
							{ text: 'UserName', dataField: 'UserName'},
						  ]
					break;
					case TICKET_ENTRANCE_VALIDATION:
						
					break;  
					
					default:
					  console.log('Sorry, we are out of ' + expr + '.');
				}
				
				
				// $('.bootstrapDataTable').html(DataTableComponent({
				// 	thead: thead,
				// 	tbody: tbody,
				// }));
				var source =
				{
					localData: localData,
					dataType: "array",
					dataFields: dataFields
					
				};
				var dataAdapter = new $.jqx.dataAdapter(source);
				$(".jqxdatatable").jqxDataTable({
					theme: 'arctic',
					pageable: true,
					pagerButtonsCount: 10,
					source: dataAdapter,
					columnsResize: false,
					columns: columns,
					sortable: true,
					altRows: true,
				});
				
				
				/*
				$("#excelExport").jqxButton();
				$("#csvExport").jqxButton();
				$("#pdfExport").jqxButton();
				$("#excelExport").click(function () {
					$(".jqxdatatable").jqxDataTable('exportData', 'xls');
				});
				$("#csvExport").click(function () {
					$(".jqxdatatable").jqxDataTable('exportData', 'csv');
				});
				$("#pdfExport").click(function () {
					$(".jqxdatatable").jqxDataTable('exportData', 'pdf');
				});
				*/
			}).catch(function(err){
				console.log(err);
			});
			
		
		});
	
		$(document).on("submit", "#filterForm", function (e) {
			event.preventDefault();
			$('.bootstrapDataTable').loading();
			fetch(API_URL + '/reports', {
				headers: {
					"Content-Type": 'application/x-www-form-urlencoded'
				},
				method: 'post',
				body: $(this).serialize()
			}).then(function (response) {
				return response.json();
			}).then(function (json) {
				let res = json;
				$('.bootstrapDataTable').loading('stop');

				let thead = [];
				let tbody = [];
				var dataFields = [];
				var columns = [];
				var localData = [];
				const bookings = res.data;
				const REPORT_TYPE = res.reportType;
				//console.log(REPORT_TYPE);
				const BY_DAY_PER_USER 			= 'BY_DAY_PER_USER';
				const FOR_THE_DAY 				= 'FOR_THE_DAY';
				const CASH_REGISTER 			= 'CASH_REGISTER';
				const OPERATIONS 				= 'OPERATIONS';
				const ORDERS 					= 'ORDERS';
				const TICKETS 					= 'TICKETS';
				const TICKET_ENTRANCE_VALIDATION = 'TICKET_ENTRANCE_VALIDATION';

				switch (REPORT_TYPE) {
					case BY_DAY_PER_USER:
						// thead = [
						// 	'UserName',
						// 	'TicketId',
						// 	'TicketPrice',
						// 	'EventName',
						// 	'ShowDateTime',
						// 	'BookingDate',
						// 	'BookingStatus'
						// ];
						dataFields = [
							{ name: 'UserName', type: 'string' },
							{ name: 'TicketId', type: 'string' },
							{ name: 'TicketPrice', type: 'string' },
							{ name: 'EventName', type: 'string' },
							{ name: 'ShowDateTime', type: 'string' },
							{ name: 'BookingDate', type: 'string' },
							{ name: 'BookingStatus', type: 'string' }
						];

						columns = [
							{ text: 'UserName', dataField: 'UserName'},
							{ text: 'TicketId', dataField: 'TicketId'},
							{ text: 'TicketPrice', dataField: 'TicketPrice'},
							{ text: 'EventName', dataField: 'EventName'},
							{ text: 'ShowDateTime', dataField: 'ShowDateTime'},
							{ text: 'BookingDate', dataField: 'BookingDate'},
							{ text: 'BookingStatus', dataField: 'BookingStatus'},
						  ]
		
						bookings.forEach(function(data, index) {
							localData.push({
								UserName		: data.userName,
								TicketId		: data.ticketId,
								TicketPrice		: data.ticketPrice,
								EventName		: data.eventTitle,
								ShowDateTime	: data.bookingDateTime,
								BookingDate		: data.bookingDate,
								BookingStatus	: data.bookingStatus,
							})
						});
					  break;
					case FOR_THE_DAY:
					  
					  break;
					case CASH_REGISTER:
					  
					  break;
					case OPERATIONS:
					  
					  break;
					case ORDERS:
						// thead = [
						// 	'OrderId',
						// 	'TransactionId',
						// 	'OrderDate',
						// 	'SubTotal',
						// 	'Total',
						// 	'Deposit',
						// 	'PaymentMethod',
						// 	'BookingStatus'
						// ];
						dataFields = [
							{ name: 'OrderId', type: 'string' },
							{ name: 'TransactionId', type: 'string' },
							{ name: 'OrderDate', type: 'string' },
							{ name: 'SubTotal', type: 'string' },
							{ name: 'Total', type: 'string' },
							{ name: 'Deposit', type: 'string' },
							{ name: 'PaymentMethod', type: 'string' },
							{ name: 'BookingStatus', type: 'string' },
						];
						columns = [
							{ text: 'OrderId', dataField: 'OrderId'},
							{ text: 'TransactionId', dataField: 'TransactionId'},
							{ text: 'OrderDate', dataField: 'OrderDate'},
							{ text: 'SubTotal', dataField: 'SubTotal'},
							{ text: 'Total', dataField: 'Total'},
							{ text: 'Deposit', dataField: 'Deposit'},
							{ text: 'PaymentMethod', dataField: 'PaymentMethod'},
							{ text: 'BookingStatus', dataField: 'BookingStatus'},
						  ]
						bookings.forEach(function(data, index) {
							localData.push({
								OrderId			: data.orderId,
								TransactionId	: data.transactionId,
								OrderDate		: data.bookingDate,
								SubTotal		: data.subTotal,
								Total			: data.total,
								Deposit			: data.deposit,
								PaymentMethod	: data.paymentMethod,
								BookingStatus	: data.bookingStatus,
							})
						});
					  break;  
					case TICKETS:
						// thead = [
						// 	'TicketId',
						// 	'TicketPrice',
						// 	'BookingId',
						// 	'UserName'
						// ];
		
						bookings.forEach(function(data, index) {
							localData.push({
								TicketId		: data.ticketId,
								TicketPrice		: data.ticketUnitPrice,
								BookingId		: data.bookingId, 	
								UserName		: data.userName,
							})
						});
						dataFields = [
							{ name: 'TicketId', type: 'string' },
							{ name: 'TicketPrice', type: 'string' },
							{ name: 'BookingId', type: 'string' },
							{ name: 'UserName', type: 'string' },
						];
						columns = [
							{ text: 'TicketId', dataField: 'TicketId'},
							{ text: 'TicketPrice', dataField: 'TicketPrice'},
							{ text: 'BookingId', dataField: 'BookingId'},
							{ text: 'UserName', dataField: 'UserName'},
						  ]
					break;
					case TICKET_ENTRANCE_VALIDATION:
						
					break;  
					
					default:
					  console.log('Sorry, we are out of ' + expr + '.');
				}
				
				
				// $('.bootstrapDataTable').html(DataTableComponent({
				// 	thead: thead,
				// 	tbody: tbody,
				// }));
				var source =
				{
					localData: localData,
					dataType: "array",
					dataFields: dataFields
					
				};
				var dataAdapter = new $.jqx.dataAdapter(source);
				$(".jqxdatatable").jqxDataTable({
					theme: 'arctic',
					pageable: true,
					pagerButtonsCount: 10,
					source: dataAdapter,
					columnsResize: true,
					columns: columns,
					sortable: true,
					altRows: true,
				});
			}).catch(function(err){
				console.log(err);
			});
			
		});
	
	});

	
})(jQuery_1_8_2);