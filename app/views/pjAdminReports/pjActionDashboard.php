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
	?>
	
	<?php
	pjUtil::printNotice(__('infoMailQueueTitle', true), __('infoMailQueueBody', true)); 
    ?>

<div class="wrapper" id="page-wrapper">
    <div class="container" id="content" tabindex="-1">
        <div class="row">
            <div class="metr">
                <a id="reportTypeButton" data-reportType="BY_DAY_PER_USER" style="cursor: pointer" class="metrostyle metrostylelarge  toometro getBookingReports" href="javascript:void(0);">
                    <span class="fa fa-ticket" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                    <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:120px">Reports By Day per user</span>
                </a>
                
                <a data-reportType="FOR_THE_DAY" style="cursor: pointer" class="metrostyle metrostylelarge  toometro getBookingReports" href="javascript:void(0);">
                    <span class="fa fa-ticket" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                    <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:120px">Reports (For the day)</span>
                </a>
                <a data-reportType="CASH_REGISTER" style="cursor: pointer" class="metrostyle metrostylelarge  toometro getBookingReports" href="javascript:void(0);">
                    <span class="fa fa-ticket" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                    <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:120px">Cash Register</span>
                </a>
              
                <a data-reportType="OPERATIONS" style="cursor: pointer" class="metrostyle metrostylelarge  toometro getBookingReports"href="javascript:void(0);">
                    <span class="fa fa-ticket" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                    <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:120px">Operations</span>
                </a>
                
            </div>

            <div class="metr">
                <a data-reportType="ORDERS" style="cursor: pointer" class="metrostyle metrostylelarge  toometro getBookingReports" href="javascript:void(0);">
                    <span class="fa fa-ticket" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                    <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:120px">orders</span>
                </a>
                <a data-reportType="TICKETS" style="cursor: pointer" class="metrostyle metrostylelarge  toometro getBookingReports" href="javascript:void(0);">
                    <span class="fa fa-ticket" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                    <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:120px">Tickets</span>
                </a>
                <a data-reportType="TICKET_ENTRANCE_VALIDATION" style="cursor: pointer" class="metrostyle metrostylelarge  toometro getBookingReports" href="javascript:void(0);">
                    <span class="fa fa-ticket" style="font-size: 2em; color: white; padding-left: 0.3em; margin-top: 3px ;float:left"></span>
                    <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:120px">Tickets(Entrance Validation)</span>
                </a>
                <a data-reportType="filterData" data-toggle="collapse" href="#filter" role="button" aria-expanded="false" aria-controls="filter" style="cursor: pointer" class="metrostyle metrostylelarge  toometro"href="<?php echo $_SERVER['PHP_SELF']; ?>?controller=pjAdminReports&action=pjActionBookings">
                    <span style="color: white; float: left; margin-top: 35px; margin-left: 10px;margin-right:120px">Filter Data</span>
                </a>
               
                
            </div>
        </div> 
        <div class="row collapse by-day-per-user" id="filter">
                        <div class="col-md-12 mt-5">
                            <form id="filterForm">
                                <div class="form-row">
                                    <div id="users" class="form-group col-sm-3 col-6">
                                        <select id="userId" name="filterData[userId]" data-filter="make" class="filter-make filter form-control users">
                                            <option value="">Select User</option>
                                        </select>
                                    </div>
                                    <input type="hidden" id="reportType" name="filterData[reportType]">
                                    <div class="form-group col-sm-3 col-6">
                                        <input name="filterData[startDate]" id="startDate" type="text" placeholder="Start date" aria-label="First name" class="form-control start-date">
                                    </div>
                                    <div class="form-group col-sm-3 col-6">
                                        <input name="filterData[endDate]" id="endDate" type="text" placeholder="End date" aria-label="Last name" class="form-control end-date">
                                    </div>
                                    <div class="form-group col-sm-3 col-6">
                                        <button type="submit" class="btn btn-primary" data-method="getDate" data-target="#putDate">Filter Data</button>
                                        <button type="button" class="btn btn-primary resetFilter">Reset Filter</button>
                                        <input type="button" class="btn btn-primary" value="Print" id='print' />
                                    </div>
                                    <!-- <div style='margin-top: 20px;'>
        <div style='float: left;'>
            <input type="button" value="Export to Excel" id='excelExport' />
        </div>
        <div style='margin-left: 10px; float: left;'>
            <input type="button" value="Export to CSV" id='csvExport' />
        </div>
        <div style='margin-left: 10px; float: left;'>
            <input type="button" value="Export to PDF" id='pdfExport' />
        </div>
    </div> -->
                                </div>
                            </form>
                        </div>
                    </div>
        <div class="row">
            <div id="dataTable" class="col-md-12 jqxdatatable">
            
            
            </div>

            
          
        </div>
        
    </div>
</div>
<?php
}
?>
<script>
    const API_URL = '<?php echo PJ_INSTALL_URL;?>api/v1';
    
    </script>
    