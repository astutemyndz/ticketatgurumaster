<?php
defined('BASEPATH') OR exit('No direct script access allowed');
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Allow-Headers: Origin, Methods, Content-Type");
use Illuminate\Http\Response;
class ApiController extends App_Controller {

    private $marks;
    
    private $reportType;  
    private $filterData = array();
    private $showArr;
    private $eventArr;
    private $timesArr;
    private $showTimes;
    private $query;
    private $filter = false;
    private $location;
    private $daterange;
    private $eventType;

    public function __construct() {
        parent::__construct();
    }
    
    public function setLocation($location) {
        $this->location = $location;
        return $this;
    }
    public function setDaterange($daterange) {
        $this->daterange = $daterange;
        return $this;
    }
    public function setFilter($filter) {
        $this->filter = $filter;
        return $this;
    }
    public function setOptions($options) {
        $this->options = $options;
        return $this;
    }
    

    public function setFilterData($data) {
        $this->filterData = $data;
        return $this;
    }
    /*
    public function isAjaxRequest() {
        if ($this->input->is_ajax_request()) {
            return true;
        }
         return false;
    }
    public function isPost() {
        if ($this->input->server('REQUEST_METHOD') == 'POST') {
            return true;
        }
        return false;
    }
    */
    public function setQuery($query) {
        $this->query = $query;
        return $this;
    }

    public function filterEvent() {

    }

    public function setEventType($eventType) {
        $this->eventType = $eventType;
        return $this;
    }
    public function marks() {
        $this->marks = $this->db->get('tk_cbs_marks')->result_array();
        header('Access-Control-Allow-Origin: *');
        if($this->marks) {
            $this->response = array(
                'data' => $this->marks,
                'status' => 200,
                'message' => 'NOT NULL'
            );
        } else {
            $this->response = array(
                'data' => [],
                'status' => 404,
                'message' => 'HTTP_NOT_FOUND'
            );
        }
        pjAppController::jsonResponse($this->response);
    }

    /**
     * @desc List of users
     */
    public function users($active = true) {
        $this->setActive($active);
        if($this->active) {
            $users = pjUserModel::factory()
                        ->where('t1.is_active', $this->active)
                        ->orderBy('t1.id ASC, t1.`id` ASC')
                        ->findAll()
                        ->getData();
        } else {
            $users = pjUserModel::factory()
                        ->orderBy('t1.id ASC, t1.`id` ASC')
                        ->findAll()
                        ->getData();
        }
        
		if(count($users) > 0){
			$this->response = array(
				'data' => $users,
                'status' => 200,
                'message' => 'NOT NULL'
			);
		} else {
			$this->response = array(
				'data' => [],
                'status' => 200,
                'message' => 'HTTP_NOT_FOUND'
			);
		}
		pjAppController::jsonResponse($this->response);
    }

    public function reports() {
        $this->setRequest($_REQUEST);
        if(!empty($this->request['reportType']) || isset($this->request['reportType'])) {
            $this->setReportType($this->request['reportType']);
        }
        if(!empty($this->request['filterData']) || isset($this->request['filterData'])) {
            $this->setFilterData($this->request['filterData']);
        }

        if($this->filterData) {
            foreach($this->filterData as $key => $value) {
                $this->options[$key] = $value;
            }
            $this->setReportType($this->filterData['reportType']);
        }
      
        if($this->reportType) {
            if($this->reportType === 'BY_DAY_PER_USER' || $this->reportType === 'OPERATIONS' || $this->reportType === 'ORDERS' || $this->reportType === 'CASH_REGISTER' || $this->reportType === 'FOR_THE_DAY') {
                $this->response = array(
                    'data' => $this->getBookingsReports($this->options),
                    'status' => 200,
                    'message' => 'NOT NULL',
                    'reportType' => $this->reportType
                );
            } else if($this->reportType === 'TICKETS') {
                $this->response = array(
                    'data' => $this->getTicketsReports($this->options),
                    'status' => 200,
                    'message' => 'NOT NULL',
                    'reportType' => $this->reportType
                );
            } else {
                $this->response = array(
                    'data' => $this->getBookingsReports($this->options),
                    'status' => 200,
                    'message' => 'NOT NULL',
                    'reportType' => $this->reportType
                );
            }
            
            
        }
        pjAppController::jsonResponse($this->response);
		
	}

	public function setReportType($reportType) {
		$this->reportType = $reportType;
		return $this;
	}

	private function getBookingsReports($options = array()) {
       
        if(!empty($options)) {
            $this->setOptions($options);
        }
        
        if($this->options) {
            if(isset($this->options['userId']) || !empty($this->request['userId']) && array_key_exists('userId', $this->options)) {
                $this->setUserId($this->options['userId']);
            }

            if(isset($this->options['startDate']) || !empty($this->request['startDate']) && array_key_exists('startDate', $this->options)) {
                $this->setStartDate($this->options['startDate']);
            } else {
                $this->setStartDate(date('Y-m-d'));
            }

            if(isset($this->options['endDate']) || !empty($this->request['endDate']) && array_key_exists('endDate', $this->options)) {
                $this->setEndDate($this->options['endDate']);
            } else {
                $this->setEndDate(date('Y-m-d'));
            }
            
            if($this->userId) {
                $this->sql .= 't5.id = '.$this->options['userId'].'';
            }
            if($this->startDate && $this->endDate && $this->userId) {
                $this->sql .= ' AND t1.created BETWEEN  "'.$this->startDate.'" AND "'.$this->endDate.'"';
            }
        
            if($this->sql) {
                return pjBookingModel::factory()
                    ->select('DISTINCT t1.uuid as orderId, t1.sub_total as subTotal,t1.total as total, t1.tax as tax, t1.deposit as deposit,t1.payment_method as paymentMethod, t1.status as bookingStatus,t1.date_time as bookingDateTime, t1.id as bookingId, t1.created as bookingDate, t1.txn_id as transactionId,  t2.content as eventTitle, t3.content as eventDescription, t5.id as userId, t5.name as userName, t5.last_login as lastLogin, t5.ip as userIP, t6.ticket_id as ticketId, t6.unit_price as ticketPrice')
                        ->join('pjMultiLang', "t2.model='pjEvent' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
                        ->join('pjMultiLang', "t3.model='pjEvent' AND t3.foreign_id=t1.id AND t3.field='description' AND t3.locale='".$this->getLocaleId()."'", 'left outer')
                        ->join('pjBookingUser', "t4.id_bookings = t1.id",'left outer')
                        ->join('pjUser', "t5.id = t4.id_users",'left outer')
                        ->join('pjBookingTicket', "t6.booking_id = t1.id",'left outer')
                        ->where($this->sql)
                        ->findAll()
                        ->getData();
            }
        }
        return pjBookingModel::factory()
        ->select('DISTINCT t1.uuid as orderId, t1.sub_total as subTotal,t1.total as total,t1.tax as tax, t1.deposit as deposit,t1.payment_method as paymentMethod, t1.status as bookingStatus,t1.date_time as bookingDateTime, t1.id as bookingId, t1.created as bookingDate, t1.txn_id as transactionId,  t2.content as eventTitle, t3.content as eventDescription, t5.id as userId, t5.name as userName, t5.last_login as lastLogin, t5.ip as userIP, t6.ticket_id as ticketId, t6.unit_price as ticketPrice')
                ->join('pjMultiLang', "t2.model='pjEvent' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
                ->join('pjMultiLang', "t3.model='pjEvent' AND t3.foreign_id=t1.id AND t3.field='description' AND t3.locale='".$this->getLocaleId()."'", 'left outer')
                ->join('pjBookingUser', "t4.id_bookings = t1.id",'left outer')
                ->join('pjUser', "t5.id = t4.id_users",'left outer')
                ->join('pjBookingTicket', "t6.booking_id = t1.id",'left outer')
                ->findAll()
                ->getData();
    }

    private function getTicketsReports($options = array()) {
        if(!empty($options)) {
            $this->setOptions($options);
        }
        
        if($this->options) {
            if(isset($this->options['userId']) || !empty($this->request['userId']) && array_key_exists('userId', $this->options)) {
                $this->setUserId($this->options['userId']);
            }
            if(isset($this->options['startDate']) || !empty($this->request['startDate']) && array_key_exists('startDate', $this->options)) {
                $this->setStartDate($this->options['startDate']);
            } else {
                $this->setStartDate(date('Y-m-d'));
            }
            if(isset($this->options['endDate']) || !empty($this->request['endDate']) && array_key_exists('endDate', $this->options)) {
                $this->setEndDate($this->options['endDate']);
            } else {
                $this->setEndDate(date('Y-m-d'));
            }
            if($this->userId) {
                $this->sql .= 't4.id = '.$this->options['userId'].'';
            }
            if($this->startDate && $this->endDate && $this->userId) {
                $this->sql .= ' AND t1.created BETWEEN  "'.$this->startDate.'" AND "'.$this->endDate.'"';
            }
            if($this->sql) {
                return pjBookingTicketModel::factory()
                    ->select('DISTINCT t1.ticket_id as ticketId, t1.booking_id as bookingId, t1.seat_id as seatId,t1.unit_price as ticketUnitPrice, t2.name as seatName, t4.id as userId, t4.name as userName, t4.last_login as lastLogin, t4.ip as userIP')
                    ->join('pjSeat', "t2.id = t1.seat_id",'left outer')
                    ->join('pjBookingUser', "t3.id_bookings = t1.booking_id",'left outer')
                    ->join('pjUser', "t4.id = t3.id_users",'left outer')
                    ->where($this->sql)
                    ->findAll()
                    ->getData();
            }
        }

        return pjBookingTicketModel::factory()
                ->select('DISTINCT t1.ticket_id as ticketId, t1.booking_id as bookingId, t1.seat_id as seatId,t1.unit_price as ticketUnitPrice, t2.name as seatName, t4.id as userId, t4.name as userName, t4.last_login as lastLogin, t4.ip as userIP')
                ->join('pjSeat', "t2.id = t1.seat_id",'left outer')
                ->join('pjBookingUser', "t3.id_bookings = t1.booking_id",'left outer')
                ->join('pjUser', "t4.id = t3.id_users",'left outer')
                ->findAll()
                ->getData();
                
    }
    
    public function reportByDayPerUser() {
        $this->setRequest($_REQUEST);
       
        if(!empty($this->request['filterData']) || isset($this->request['filterData'])) {
            $this->setFilterData($this->request['filterData']);
        }

        if($this->filterData) {
            foreach($this->filterData as $key => $value) {
                $this->options[$key] = $value;
            }
            $this->setReportType($this->filterData['reportType']);
        }
        $this->response = array(
            'data' => $this->_reportByDayPerUser($this->options),
            'status' => 200,
            'message' => 'NOT NULL',
            'reportType' => $this->reportType
        );
        
        pjAppController::jsonResponse($this->response);
		
	}
    private function _reportByDayPerUser($options = array()) {
       
        if(!empty($options)) {
            $this->setOptions($options);
        }
        
        if($this->options) {
            if(isset($this->options['userId']) || !empty($this->request['userId']) && array_key_exists('userId', $this->options)) {
                $this->setUserId($this->options['userId']);
            }

            if(isset($this->options['startDate']) || !empty($this->request['startDate']) && array_key_exists('startDate', $this->options)) {
                $this->setStartDate($this->options['startDate']);
            } else {
                $this->setStartDate(date('Y-m-d'));
            }

            if(isset($this->options['endDate']) || !empty($this->request['endDate']) && array_key_exists('endDate', $this->options)) {
                $this->setEndDate($this->options['endDate']);
            } else {
                $this->setEndDate(date('Y-m-d'));
            }
            
            if($this->userId) {
                $this->sql .= 't5.id = '.$this->options['userId'].'';
            }
            if($this->startDate && $this->endDate && $this->userId) {
                $this->sql .= ' AND t1.created BETWEEN  "'.$this->startDate.'" AND "'.$this->endDate.'"';
            }
        
            if($this->sql) {
                return pjBookingModel::factory()
                    ->select('DISTINCT t1.uuid as orderId, t1.sub_total as subTotal,t1.total as total, t1.tax as tax, t1.deposit as deposit,t1.payment_method as paymentMethod, t1.status as bookingStatus,t1.created as bookingDate, t1.txn_id as transactionId')
                        ->join('pjMultiLang', "t2.model='pjEvent' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
                        ->join('pjMultiLang', "t3.model='pjEvent' AND t3.foreign_id=t1.id AND t3.field='description' AND t3.locale='".$this->getLocaleId()."'", 'left outer')
                        ->join('pjBookingUser', "t4.id_bookings = t1.id",'left outer')
                        ->join('pjUser', "t5.id = t4.id_users",'left outer')
                        ->join('pjBookingTicket', "t6.booking_id = t1.id",'left outer')
                        ->where($this->sql)
                        ->findAll()
                        ->getData();
            }
        }
        return pjBookingModel::factory()
        ->select('DISTINCT t1.uuid as orderId, t1.sub_total as subTotal,t1.total as total, t1.tax as tax, t1.deposit as deposit,t1.payment_method as paymentMethod, t1.status as bookingStatus,t1.created as bookingDate, t1.txn_id as transactionId')
                ->join('pjMultiLang', "t2.model='pjEvent' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
                ->join('pjMultiLang', "t3.model='pjEvent' AND t3.foreign_id=t1.id AND t3.field='description' AND t3.locale='".$this->getLocaleId()."'", 'left outer')
                ->join('pjBookingUser', "t4.id_bookings = t1.id",'left outer')
                ->join('pjUser', "t5.id = t4.id_users",'left outer')
                ->join('pjBookingTicket', "t6.booking_id = t1.id",'left outer')
                ->findAll()
                ->getData();
    }
    ############################# 21.10.2019 ####################################
    private function pjShowDatesByEventId($id) {
		$pjShowModel = pjShowModel::factory();
		$show_arr = $pjShowModel
					->where('t1.event_id', $id)
					->where("t1.venue_id IN (SELECT TV.id FROM `".pjVenueModel::factory()->getTable()."` AS TV WHERE TV.status='T')")
					->orderBy("t1.date_time ASC")
					->findAll()
					->getData();
		// echo "<pre>"; print_r($show_arr);
		$grid = $this->getShowsInGrid($show_arr);
		$show_date_arr = array();
			foreach($show_arr as $v)
			{
				$date = date($this->option_arr['o_date_format'], strtotime($v['date_time']));
				if(strtotime($v['date_time']) > time() + $this->option_arr['o_booking_earlier'] * 60)
				{
					if(!in_array($date, $show_date_arr))
					{
						$show_date_arr[] = $date;
					}
				}
			}
		return $show_date_arr;
		
    }
    private function pjGetEventPrice($show_arr, $id) {
		$price = array();
		if(count($show_arr) > 0) {
			foreach ($show_arr as $value) {
				if($value['event_id'] == $id) {
					$price[] = $value['price'];
					//break;
				}
			}
		}
		return $price;
	}
    public function events()
	{
       
       // Get data event type wise
        if(!empty($this->uri->segment(4)) && $this->uri->segment(4) === 'type') {
            $this->setEventType((int)$this->uri->segment(5));
        }

       
        
        /*
        $firstDateOfCurrentWeek = date_create('this week')->format('Y-m-d');

        list($fYear, $fMonth, $fDay) =  explode("-", $firstDateOfCurrentWeek);
       
        $lastDateOfCurrentWeek = date_create('this week +4 days')->format('Y-m-d');
        list($lYear,$lMonth, $lDay) = explode("-", $lastDateOfCurrentWeek);

        $totalDaysFromFMonth = cal_days_in_month(CAL_GREGORIAN, $fMonth, $fYear);

        // Current date
        // $currentDateTimeOfCurrentWeek = date('Y-m-d H:i:s');
        // list($cDate, $cTime) = explode(" ", $currentDateTimeOfCurrentWeek);
        // list($yearOfCurrentMonth, $monthOfCurrentMonth, $dayOfCurrentMonth) = explode("-", $cDate);

        // 
        //$totalDaysOfCurrentMonth = cal_days_in_month(CAL_GREGORIAN, $monthOfCurrentMonth, $yearOfCurrentMonth);
        
        $datesArrayFromCurrentWeek = array();
        for($day = (int)$fDay; $day <= (int)$lDay; $day++) {
            $datesArrayFromCurrentWeek[] = $fYear.'-'.$fMonth.'-'.$day;
        }

        echo "<pre>";
        print_r($datesArrayFromCurrentWeek);
        exit;
       
        $filterDateArray = array();
        for($i = 0; $i < count($datesOfCurrentWeek); $i++) {
            if(strtotime($datesOfCurrentWeek[$i], $this->timestamp) >= strtotime($cDate, $this->timestamp)) {
                $filterDateArray[] = $datesOfCurrentWeek[$i];
            }
        }
      
        $this->setFromDate(reset($filterDateArray));
        $this->setToDate(end($filterDateArray));
        
            // echo $this->fromDate."<br>";
            // echo $this->toDate."<br>";
            // echo $totalDaysOfCurrentMonth."<br>";

       
        $fDateOfCurrentMonth = date_create('this month')->format('Y-m-d H:i:s');
        $lDateOfCurrentMonth = date_create('last day of this month')->format('Y-m-d H:i:s');


        
        list($fDateOfMonth, $fTimeOfMonth) = explode(" ", $fDateOfCurrentMonth);
        list($firstYearOfCurrentMonth, $firstMonthOfCurrentMonth, $firstDayOfCurrentMonth) = explode("-", $fDateOfMonth);
        
        //echo $dayOfCurrentMonth;
        //exit;
        list($lDateOfMonth, $lTimeOfMonth) = explode(" ", $lDateOfCurrentMonth);

        $crateNumberOfDatesOfCurrentMonthArray = array();
        for($day = 1; $day <= $totalDaysOfCurrentMonth; $day++) {
            $crateNumberOfDatesOfCurrentMonthArray[] = $firstYearOfCurrentMonth.'-'.$firstMonthOfCurrentMonth.'-'.$day;
        }
        
        // echo "<pre>";
        // print_r($crateNumberOfDatesOfCurrentMonthArray);

        $a = array();
        for($i = 0; $i < count($crateNumberOfDatesOfCurrentMonthArray); $i++) {
            if($crateNumberOfDatesOfCurrentMonthArray[$i] >= "2019-11-30") {
                $a[] = $crateNumberOfDatesOfCurrentMonthArray[$i];
            } 
        }
        // echo "<pre>";
        // print_r($a);
        exit;
        */
        $this->setTimestamp(time());
		$this->setFromTimestamp($this->timestamp);
        if(!empty($_GET['filter']))
		{
            $this->setFilter($_GET['filter']);
        }
        if(!empty($_GET['daterange']))
		{
            $this->setDaterange($_GET['daterange']);
        }
        if(!empty($_GET['location']))
		{
            $this->setLocation($_GET['location']);
        }
        /** From Date */
		// if(!empty($_GET['from']))
		// {
        //     $this->setFromDate(date($_GET['from']), $this->timestamp);
        // }
        /** To Date */
		// if(!empty($_GET['to']))
		// {
        //     $this->setToDate(date($_GET['to']), $this->timestamp);
        // }
        // if($this->fromDate && $this->toDate) {
        //     $this->setHasDate(true);
        // } 

		$pjEventModel       = pjEventModel::factory();
        $pjShowModel        = pjShowModel::factory();

        $this->showArr      = array();
        $this->eventArr     = array();
        $this->timesArr     = array();
        $this->showTimes    = array();
        
        // Is TRUE
        // if($this->hasDate) {
        //     $pjShowModel->where("(DATE_FORMAT(t1.date_time,'%Y-%m-%d') between '$this->fromDate' and '$this->toDate') AND (t1.venue_id IN (SELECT TV.id FROM `".pjVenueModel::factory()->getTable()."` AS TV WHERE TV.status='T') )");
        // } else {
        //     if(!$this->filter) {
        //         $pjShowModel->where("(DATE_FORMAT(t1.date_time,'%Y-%m-%d') >= DATE(NOW())) AND (t1.venue_id IN (SELECT TV.id FROM `".pjVenueModel::factory()->getTable()."` AS TV WHERE TV.status='T') )");
        //     }
        // }

        // if($this->filter) {
        //     echo 1;
        // } else {
        //     echo 0;
        // }
        ///exit;

        // Filter Data Or Search
        switch ($this->filter) {
            case ($this->daterange && $this->daterange == 'all'):
            $pjShowModel->where("(DATE_FORMAT(t1.date_time,'%Y-%m-%d') > DATE(NOW())) AND (t1.venue_id IN (SELECT TV.id FROM `".pjVenueModel::factory()->getTable()."` AS TV WHERE TV.status='T') )");
                break;
            case ($this->daterange && $this->daterange == 'this-month'):
                $pjShowModel->where("YEAR(DATE_FORMAT(t1.date_time,'%Y-%m-%d')) = YEAR(NOW()) AND MONTH(DATE_FORMAT(t1.date_time,'%Y-%m-%d'))=MONTH(NOW()) AND (t1.venue_id IN (SELECT TV.id FROM `".pjVenueModel::factory()->getTable()."` AS TV WHERE TV.status='T') )");
                break;
            case ($this->daterange && $this->daterange == 'this-weekend'):
                $pjShowModel->where("WEEKOFYEAR(DATE_FORMAT(t1.date_time,'%Y-%m-%d'))=WEEKOFYEAR(NOW()) AND (t1.venue_id IN (SELECT TV.id FROM `".pjVenueModel::factory()->getTable()."` AS TV WHERE TV.status='T') )");
                break;
            default:
                $pjShowModel->where("(DATE_FORMAT(t1.date_time,'%Y-%m-%d') > DATE(NOW())) AND (t1.venue_id IN (SELECT TV.id FROM `".pjVenueModel::factory()->getTable()."` AS TV WHERE TV.status='T') )");
                break;
        }
        
        $this->showArr = $pjShowModel->where("t1.venue_id IN (SELECT TV.id FROM `".pjVenueModel::factory()->getTable()."` AS TV WHERE TV.status='T')")
                                    ->orderBy("t1.date_time ASC")
                                    //->debug(true)
                                    ->findAll()
                                    ->getData();
		
                                    
        // echo "<pre>";
        // print_r($this->showArr);
        // exit;
	   
        if(!empty($this->showArr) && is_array($this->showArr)) {
            $this->setGrid($this->showArr);
        }        
        
        $showTimes = array();
        //echo strtotime(date('Y-m-d H:00')) + ($this->option_arr['o_booking_earlier'] * 60 )."</br>";
        if(!empty($this->grid) && is_array($this->grid)) 
        {
            foreach($this->grid as $show)
            {
                $date_time_iso  = $show['date_time'];
                $date_time_ts   = strtotime($show['date_time']);
                $showTime       = date($this->option_arr['o_time_format'], strtotime($date_time_iso));
                
                if($date_time_ts >= strtotime(date('Y-m-d H:00')) + ($this->option_arr['o_booking_earlier'] * 60 )) {
                    $showTimes[$show['event_id']]  = $showTime;
                } 
                
            }
        }
        
        if($this->eventType && ($this->eventType === 1 || $this->eventType === 2)) {
            $pjEventModel->where('event_type', $this->eventType);
        }
        // else {
        //     $this->setResponse(array(
        //         'status'    => App_Controller::HTTP_NOT_FOUND,
        //         'message'   => 'You have given a invalid even type, please follow the api documentations'
        //     ));
        //     pjAppController::jsonResponse($this->response);
        // }
        //$pjBookingModel = pjBookingModel::factory();
        $pjEventModel->join('pjMultiLang', "t2.model='pjEvent' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer');
        $pjEventModel->join('pjMultiLang', "t3.model='pjEvent' AND t3.foreign_id=t1.id AND t3.field='description' AND t3.locale='".$this->getLocaleId()."'", 'left outer');
        $pjEventModel->join('pjMultiLang', "t4.model='pjEvent' AND t4.foreign_id=t1.id AND t4.field='small_description' AND t4.locale='".$this->getLocaleId()."'", 'left outer');
        
        // Top Selling Items;
        if(!empty($this->uri->segment(4)) && $this->uri->segment(4) === 'bestselling') {
            $pjEventModel->join('pjBooking', "t5.event_id='t1.id'", 'left outer');
            $pjEventModel->select('t1.*, SUM(t5.quantity) AS TotalQuantity, t2.content as title, t3.content as description, t4.content as small_description');
            $pjEventModel->groupBy('t5.id');
            $pjEventModel->orderBy('SUM(t5.quantity) DESC');
         }
        // Get All Events
        if(is_array($showTimes) && !empty($showTimes)) {
            $eventIds = array();
            $eventIds = array_keys($showTimes);
            $this->eventArr = $pjEventModel->select('t1.*, t2.content as title, t3.content as description, t4.content as small_description')
                                            //->join('pjAssignArtistToEvent', 't5.id_events = t1.id', 'left outer')
                                            ->where('t1.status', 'T')
                                            ->whereIn('t1.id', $eventIds)
                                            ->findAll()
                                            ->getData();
        }
        //exit;
        $events = array();
		foreach($this->eventArr as $event) {
            $assignArtists = pjAssignArtistToEventModel::factory()
                            ->select('t2.id as artistId, t2.artist_image as artistImage, t3.content  as artistName')
                            ->join('pjArtists', 't2.id = t1.id_artists', 'left outer')
                            ->join('pjMultiLang', "t3.model='pjArtist' AND t3.foreign_id = t2.id AND t3.field='title' AND t3.locale='".$this->getLocaleId()."'", 'left outer')
                            ->where('t2.deleted_at', NULL)
                            ->where('t2.status', 'T')
                            ->where('id_events', $event['id'])
                            ->findAll()
                            ->getData();
           
            $this->setEventDatetimeTimestamp($event['date_time']);
            if(!empty($event['date_time'])) {
                $this->setEventDate(date($this->option_arr['o_date_format'], strtotime($event['date_time'])));
                $this->setEventTime(date($this->option_arr['o_time_format'], strtotime($this->eventDatetimeTimestamp)));
            }
            
			$events[] = array_merge($event,array(
                'date' => $this->eventDate,
                'time' => $this->eventTime,
                'explicitFormatDay' => date('jS', strtotime($event['date_time'])),
                'explicitFormatMonth' => date('M', strtotime($event['date_time'])),
                'artists' => $assignArtists
            )); 
        }
        
		$this->data['shows'] 	= (count($showTimes) > 0) ? $showTimes : [];
		$this->data['events'] 		= $events;
        
        if(!empty($this->data) && is_array($this->data)) {
            $this->setResponse(array(
                'data'      => $this->data,
                'status'    => App_Controller::HTTP_OK,
                'message'   => App_Controller::$statusTexts[200]
            ));
        } else {
            $this->setResponse(array(
                'data'      => [],
                'status'    => App_Controller::HTTP_NOT_FOUND,
                'message'   => App_Controller::$statusTexts[404]
            ));
        }
        
        pjAppController::jsonResponse($this->response);
	}
   
    public function sponsors() {
        $this->data = pjSponsorsModel::factory()
                        ->join('pjMultiLang', "t2.model='pjSponsor' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
                        ->where('t1.status', 'T')
                        ->where('t1.sponsor_year', date('Y'))
                        ->select(" t1.id, t1.sponsor_image,t1.sponsor_year, t1.created, t1.sponsor_link, t1.status, t2.content as name")
						->orderBy("t1.id desc")
						->findAll()
                        ->getData();
        if(!empty($this->data) && is_array($this->data)) {
            $this->setResponse(array(
                'data'      => $this->data,
                'status'    => App_Controller::HTTP_OK,
                'message'   => App_Controller::$statusTexts[200]
            ));
        } else {
            $this->setResponse(array(
                'data'      => [],
                'status'    => App_Controller::HTTP_NOT_FOUND,
                'message'   => App_Controller::$statusTexts[404]
            ));
        }
        
        pjAppController::jsonResponse($this->response);
    }
    public function gallery() {
        $this->data = pjImageGalleryModel::factory()
                            ->join('pjMultiLang', "t2.model='pjImageGallery' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
                            ->join('pjMultiLang', "t3.model='pjImageGallery' AND t3.foreign_id=t1.id AND t3.field='description' AND t3.locale='".$this->getLocaleId()."'", 'left outer')
                            ->where('t1.status', 'T')
							->select(" t1.id, t1.gallery_image, t1.created, t1.status, t2.content as title, t3.content as description")
							->orderBy("t1.id desc")
							->findAll()
                            ->getData();
        // $galleryArr = array();
        // if(is_array($galleries) && !empty($galleries)) {
        //     foreach($galleries as $gallery) {
        //         $galleryArr[] = array(
        //             'id' => $gallery['id'],
        //             'gallery_image' => $gallery['gallery_image'],
        //             'created' => $gallery['created'],
        //             'status' => $gallery['status'],
        //             'title' => $gallery['title'],
        //             'description' => $gallery['description'],
        //         );
        //     }
        // }
       
        if(!empty($this->data) && is_array($this->data)) {
            $this->setResponse(array(
                'data'      => $this->data,
                'status'    => App_Controller::HTTP_OK,
                'message'   => App_Controller::$statusTexts[200]
            ));
        } else {
            $this->setResponse(array(
                'data'      => [],
                'status'    => App_Controller::HTTP_NOT_FOUND,
                'message'   => App_Controller::$statusTexts[404]
            ));
        }
        
        pjAppController::jsonResponse($this->response);
    }
    ############################# 21.10.2019 ####################################
    
    
    public function autocompleteEventHandler()
	{
        $this->setTimestamp(time());
		$this->setFromTimestamp($this->timestamp);
		if(!empty($_GET['q']))
		{
            $this->setQuery($_GET['q']);
        }
		$pjEventModel       = pjEventModel::factory();
        $pjShowModel        = pjShowModel::factory();

        $this->showArr      = array();
        $this->eventArr     = array();
        $this->showTimes    = array();
       
        $pjShowModel->where("(DATE_FORMAT(t1.date_time,'%Y-%m-%d') >= DATE(NOW())) AND (t1.venue_id IN (SELECT TV.id FROM `".pjVenueModel::factory()->getTable()."` AS TV WHERE TV.status='T') )");
        $this->showArr = $pjShowModel->where("t1.venue_id IN (SELECT TV.id FROM `".pjVenueModel::factory()->getTable()."` AS TV WHERE TV.status='T')")
                                    ->orderBy("t1.date_time ASC")
                                    ->findAll()
                                    ->getData();
        if(!empty($this->showArr) && is_array($this->showArr)) {
            $this->setGrid($this->showArr);
        }        
        
        $showTimes = array();
        //echo strtotime(date('Y-m-d H:00')) + ($this->option_arr['o_booking_earlier'] * 60 )."</br>";
        if(!empty($this->grid) && is_array($this->grid)) 
        {
            foreach($this->grid as $show)
            {
                $date_time_iso  = $show['date_time'];
                $date_time_ts   = strtotime($show['date_time']);
                $showTime       = date($this->option_arr['o_time_format'], strtotime($date_time_iso));
                
                if($date_time_ts >= strtotime(date('Y-m-d H:00')) + ($this->option_arr['o_booking_earlier'] * 60 )) {
                    $showTimes[$show['event_id']]  = $showTime;
                } 
                
            }
        }

        ////////////
        if(!empty($this->showArr) && is_array($this->showArr)) {
            $this->setGrid($this->showArr);
        }        
        
        $showTimes = array();
        //echo strtotime(date('Y-m-d H:00')) + ($this->option_arr['o_booking_earlier'] * 60 )."</br>";
        if(!empty($this->grid) && is_array($this->grid)) 
        {
            foreach($this->grid as $show)
            {
                $date_time_iso  = $show['date_time'];
                $date_time_ts   = strtotime($show['date_time']);
                $showTime       = date($this->option_arr['o_time_format'], strtotime($date_time_iso));
                
                if($date_time_ts >= strtotime(date('Y-m-d H:00')) + ($this->option_arr['o_booking_earlier'] * 60 )) {
                    $showTimes[$show['event_id']]  = $showTime;
                } 
                
            }
        }
        ////////////
            
        
        
        
        if(is_array($showTimes) && !empty($showTimes)) {
            $eventIds = array();
            $eventIds = array_keys($showTimes);
            if($this->query) {
                $pjEventModel->where("t2.content LIKE '$this->query%'");
            }
            $this->eventArr = $pjEventModel->join('pjMultiLang', "t2.model='pjEvent' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
                                            ->join('pjMultiLang', "t3.model='pjEvent' AND t3.foreign_id=t1.id AND t3.field='description' AND t3.locale='".$this->getLocaleId()."'", 'left outer')
                                            ->join('pjMultiLang', "t4.model='pjEvent' AND t4.foreign_id=t1.id AND t4.field='small_description' AND t4.locale='".$this->getLocaleId()."'", 'left outer')
                                            ->select('t1.*, t2.content as title, t3.content as description, t4.content as small_description')
                                            ->where('status', 'T')
                                            ->whereIn('t1.id', $eventIds)
                                            ->findAll()
                                            ->getData();
        }
       
        $events = array();
		foreach($this->eventArr as $event) {
            $this->setEventDatetimeTimestamp($event['date_time']);
            if(!empty($event['date_time'])) {
                $this->setEventDate(date($this->option_arr['o_date_format'], strtotime($event['date_time'])));
                $this->setEventTime(date($this->option_arr['o_time_format'], strtotime($this->eventDatetimeTimestamp)));
            }
			$events[] = array_merge($event,array(
                'event_date' => $this->eventDate,
                'event_time' => $this->eventTime
            )); 
        }
        pjAppController::jsonResponse($events);
    }
    
    /**
     * @desc Seat Map API Integration
     * get data from client and save to database table in json format
     * 
     */
     public function venueCreated() {
        if($this->isPost()) {
                $this->setRequest($_REQUEST);
                if(!empty($this->request) && is_array($this->request)) {
                    if(!empty($this->request['mapId']) && array_key_exists('mapId', $this->request)) {
                        $this->setMapId($this->request['mapId']);
                    } 
                    // if(!empty($this->request['mapName']) && array_key_exists('mapName', $this->request)) {
                    //     $this->setMapName($this->request['mapName']);
                    // } 
                   

                    if(!empty($this->request['mapContent']) && array_key_exists('mapContent', $this->request)) {
                        $this->setMapContent($this->request['mapContent']);
                    }   
                    //Map ID
                    if($this->mapId) {
                        $this->data['map_id'] = $this->mapId;
                    } 
                  
                    // Map Content
                    if($this->mapContent) {
                        $this->data['map_content'] = $this->mapContent;
                    } 
                    // echo "<pre>";
                    // print_r($this->data);
                    // exit;
                    $isAffectedRow = false;
                    $venue =  pjVenueModel::factory()->where('map_id', $this->mapId)->findAll()->limit(1)->getData(); 
                    if(count($venue) > 0) {
                        $this->setMapPath($venue[0]['map_path']);
                        if ($_FILES['mapImage']) {
                            if($_FILES['mapImage']['error'] == 0) {
                                if(getimagesize($_FILES['mapImage']["tmp_name"]) != false) {
                                    if (is_writable('app/web/upload/venue')) {
                                        if (file_exists(PJ_INSTALL_PATH . $this->mapPath)) {
                                            @unlink(PJ_INSTALL_PATH . $this->mapPath);
                                        }
                                        $Image  =  new pjImage();
                                        if ($Image->getErrorCode() !== 200) {
                                            $Image->setAllowedTypes(array('image/png', 'image/gif', 'image/jpg', 'image/jpeg', 'image/pjpeg'));
                                            if ($Image->load($_FILES['mapImage'])) {
                                                $resp = $Image->isConvertPossible();
                                                if ($resp['status'] === true) {
                                                    $hash = md5(uniqid(rand(), true));
                                                    $image_path = PJ_UPLOAD_PATH . 'venue/' . $this->mapId . '_' . $hash . '.' . $Image->getExtension();
                                                    $Image->loadImage($_FILES['mapImage']["tmp_name"]);
                                                    $Image->saveImage($image_path);
                                                    $this->setMapPath($image_path);
                                                    
                                                }
                                            }
                                        }
                                    }else{
                                        $this->setResponse(array(
                                            'status'    => array(
                                                'code' => App_Controller::HTTP_OK,
                                                'text' => App_Controller::$statusTexts[200],
                                            ),
                                            'message'   => 'Directory app/web/upload/venue has no permissions to upload seat maps. Please set permissions to 777.'
                                        ));
                                    }
                                }else{
                                    $this->setResponse(array(
                                        'status'    => array(
                                            'code' => App_Controller::HTTP_OK,
                                            'text' => App_Controller::$statusTexts[200],
                                        ),
                                        'message'   => 'Image could not be uploaded because it is not image file. Please upload another image.'
                                    ));
                                }
                            }else if($_FILES['event_img']['error'] != 4){
                                $this->setResponse(array(
                                    'status'    => array(
                                        'code' => App_Controller::HTTP_OK,
                                        'text' => App_Controller::$statusTexts[200],
                                    ),
                                    'message'   => 'Image file is too big and was not uploaded.'
                                ));
                                
                            }
                        }
                        // Map Image
                        if($this->mapPath) {
                            $this->data['map_path'] = $this->mapPath;
                        }
                        pjVenueModel::factory()->where('map_id',$this->mapId)->eraseAll();
                        pjVenueModel::factory()->setAttributes($this->data)->insert()->getInsertId();
                        $isAffectedRow = true;
                    } else {
                        if ($_FILES['mapImage']) {
                            if($_FILES['mapImage']['error'] == 0) {
                                if(getimagesize($_FILES['mapImage']["tmp_name"]) != false) {
                                    if (is_writable('app/web/upload/venue')) {
                                       
                                        $Image  =  new pjImage();
                                        if ($Image->getErrorCode() !== 200) {
                                            $Image->setAllowedTypes(array('image/png', 'image/gif', 'image/jpg', 'image/jpeg', 'image/pjpeg'));
                                            if ($Image->load($_FILES['mapImage'])) {
                                                $resp = $Image->isConvertPossible();
                                                if ($resp['status'] === true) {
                                                    $hash = md5(uniqid(rand(), true));
                                                    $image_path = PJ_UPLOAD_PATH . 'venue/' . $this->mapId . '_' . $hash . '.' . $Image->getExtension();
                                                    $Image->loadImage($_FILES['mapImage']["tmp_name"]);
                                                    $Image->saveImage($image_path);
                                                    $this->setMapPath($image_path);
                                                    
                                                }
                                            }
                                        }
                                    }else{
                                        $this->setResponse(array(
                                            'status'    => array(
                                                'code' => App_Controller::HTTP_OK,
                                                'text' => App_Controller::$statusTexts[200],
                                            ),
                                            'message'   => 'Directory app/web/upload/venue has no permissions to upload seat maps. Please set permissions to 777.'
                                        ));
                                    }
                                }else{
                                    $this->setResponse(array(
                                        'status'    => array(
                                            'code' => App_Controller::HTTP_OK,
                                            'text' => App_Controller::$statusTexts[200],
                                        ),
                                        'message'   => 'Image could not be uploaded because it is not image file. Please upload another image.'
                                    ));
                                }
                            }else if($_FILES['event_img']['error'] != 4){
                                $this->setResponse(array(
                                    'status'    => array(
                                        'code' => App_Controller::HTTP_OK,
                                        'text' => App_Controller::$statusTexts[200],
                                    ),
                                    'message'   => 'Image file is too big and was not uploaded.'
                                ));
                                
                            }
                        }
                        // Map Image
                        if($this->mapPath) {
                            $this->data['map_path'] = $this->mapPath;
                        }
                        pjVenueModel::factory()->setAttributes($this->data)->insert()->getInsertId();
                        $isAffectedRow = true;
                    }
                   
                    
                   
                    $newVenue = array();
                    $newVenue = array(
                        'mapId' => $this->mapId,
                        'mapContent' => $this->mapContent,
                        'mapImage' => $this->mapPath,
                    );
                    if($isAffectedRow) {
                        $this->setResponse(array(
                            'data' => $newVenue,
                            'status'    => array(
                                'code' => App_Controller::HTTP_OK,
                                'text' => App_Controller::$statusTexts[200],
                            ),
                            'message'   => 'Venue is updated'
                        ));
                    } else {
                        $this->setResponse(array(
                            'data' =>[],
                            'status'    => array(
                                'code' => App_Controller::HTTP_OK,
                                'text' => App_Controller::$statusTexts[200],
                            ),
                            'message'   => 'Venue is not updated'
                        ));
                    }
                } else {
                    $this->setResponse(array(
                        'status'    => array(
                            'code' => App_Controller::HTTP_OK,
                            'text' => App_Controller::$statusTexts[200],
                        ),
                        'message'   => 'Please provide three param mapId, mapContent, mapImage'
                    ));
                }
          
        } else {
            $this->setResponse(array(
				'status'    => array(
					'code' => App_Controller::HTTP_METHOD_NOT_ALLOWED,
					'text' => App_Controller::$statusTexts[405],
				),
				'message'   => App_Controller::$statusTexts[405]
		   ));
        }
        pjAppController::jsonResponse($this->response);
     }
     // Get Venue
     public function getVenueByMapId() {
        if(!$this->isPost()) {
            $this->setMapId(($this->uri->segment(5)) ? $this->uri->segment(5) : '');
            if($this->mapId) {
                $venue =  pjVenueModel::factory()->where('map_id', $this->mapId)->findAll()->limit(1)->getData(); 
                    if(!empty($venue)) {
                        $this->setResponse(array(
                            'data' => $venue[0],
                            'status'    => array(
                                'code' => App_Controller::HTTP_OK,
                                'text' => App_Controller::$statusTexts[200],
                            ),
                        ));
                    }
            } else {
                $this->setResponse(array(
                    'status'    => array(
                        'code' => App_Controller::HTTP_OK,
                        'text' => App_Controller::$statusTexts[200],
                    ),
                    'message'   => 'Please provide mapId'
                ));
             }
        } else {
            $this->setResponse(array(
				'status'    => array(
					'code' => App_Controller::HTTP_METHOD_NOT_ALLOWED,
					'text' => App_Controller::$statusTexts[405],
				),
				'message'   => App_Controller::$statusTexts[405]
		   ));
        }
        pjAppController::jsonResponse($this->response);
     }

     // ################################### Seat Map API end here ##############################

     
    
}
?>
