<?php
if (!defined("ROOT_PATH"))
{
	header("HTTP/1.1 403 Forbidden");
	exit;
}
class pjAdminReports extends pjAdmin
{         
	       
	public function pjActionDashboard() {

        // $this->appendJs('chosen.jquery.js', PJ_THIRD_PARTY_PATH . 'chosen/');
		// $this->appendCss('chosen.css', PJ_THIRD_PARTY_PATH . 'chosen/');
		// $this->appendJs('jquery.datagrid.js', PJ_FRAMEWORK_LIBS_PATH . 'pj/js/');
		
		 $this->appendCss('pjAdminReportsDashboard.css');
		 $this->appendCss('datepicker.css');
		 

		 $this->appendCss('jquery.loading.css');
		 $this->appendJs('jquery.loading.js');
		 /*
		 $this->appendCss('datatables.min.css',PJ_THIRD_PARTY_PATH . 'datatable/');
		 $this->appendJs('datatables.min.js',PJ_THIRD_PARTY_PATH . 'datatable/');
		 */
		$this->appendCss('jqx.base.css',PJ_THIRD_PARTY_PATH . 'jqwidgets/css/');
		$this->appendCss('jqx.arctic.css',PJ_THIRD_PARTY_PATH . 'jqwidgets/css/');

		
		$this->appendJs('jqxcore.js',PJ_THIRD_PARTY_PATH . 'jqwidgets/js/');
		$this->appendJs('jqxbuttons.js',PJ_THIRD_PARTY_PATH . 'jqwidgets/js/');
		$this->appendJs('jqxscrollbar.js',PJ_THIRD_PARTY_PATH . 'jqwidgets/js/');
		$this->appendJs('jqxdatatable.js',PJ_THIRD_PARTY_PATH . 'jqwidgets/js/');
		$this->appendJs('jqxdata.js',PJ_THIRD_PARTY_PATH . 'jqwidgets/js/');
		$this->appendJs('jqxdata.export.js',PJ_THIRD_PARTY_PATH . 'jqwidgets/js/');
		$this->appendJs('demos.js',PJ_THIRD_PARTY_PATH . 'jqwidgets/js/');
		$this->appendJs('generatedata.js',PJ_THIRD_PARTY_PATH . 'jqwidgets/js/sampledata/');
		
		
		//$this->appendJs('demos.js',PJ_THIRD_PARTY_PATH . 'jqwidgets/js/');
		$this->appendJs('pjAdminReportsDashboard.js');
		 $this->appendJs('datepicker.js');
	}	
	

	
}
?>