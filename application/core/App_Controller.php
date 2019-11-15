<?php 
//use App\Controllers\pjAppController;
//use App\Models\pjAppModel;
use Honeycrisp\Mail\Mailer;

class App_Controller extends CI_Controller
{
	protected $value;
	public $defaultStore 				= 'pjTicketBooking_Store';
	public 		$models 				= array();
	public 		$defaultLocale 			= 'frontend_locale_id';
	public 		$defaultFields 			= 'fields';
	public 		$defaultFieldsIndex 	= 'fields_index';
	public 		$ajax 					= FALSE;

	public 		$defaultLangMenu 		= 'pjTicketBooking_LangMenu';

	protected 	$option_arr 			= array();
	protected 	$options 			= array();
    protected 	$optionArr 				= 'option_arr';
	protected 	$locale_arr 			= 'locale_arr';
	protected   $data					 = array();
	protected	$payPalConfig			= array();
	protected 	$mailer;

	protected $request      = array();
	protected $response     = array();
	protected $active;

	protected $startDate;
	protected $endDate;
	protected $sql;
	protected $fromDate;
	protected $toDate;
	protected $optionDateFormat;
	protected $date;
	protected $hasDate;
	protected $fromTimestamp;
	protected $endTimestamp;
	protected $timestamp;
	protected $grid;
	protected $eventDate = null;
	protected $eventTime = null;
	protected $eventDatetimeTimestamp = null;
	protected $userId;
	protected $message = array();
	protected $mapId;
	protected $mapName;
	protected $mapPath;
	protected $mapContent;
	protected $firstName;
	protected $lastName;
	protected $phone;

	const HTTP_CONTINUE = 100;
    const HTTP_SWITCHING_PROTOCOLS = 101;
    const HTTP_PROCESSING = 102;            // RFC2518
    const HTTP_EARLY_HINTS = 103;           // RFC8297
    const HTTP_OK = 200;
    const HTTP_CREATED = 201;
    const HTTP_ACCEPTED = 202;
    const HTTP_NON_AUTHORITATIVE_INFORMATION = 203;
    const HTTP_NO_CONTENT = 204;
    const HTTP_RESET_CONTENT = 205;
    const HTTP_PARTIAL_CONTENT = 206;
    const HTTP_MULTI_STATUS = 207;          // RFC4918
    const HTTP_ALREADY_REPORTED = 208;      // RFC5842
    const HTTP_IM_USED = 226;               // RFC3229
    const HTTP_MULTIPLE_CHOICES = 300;
    const HTTP_MOVED_PERMANENTLY = 301;
    const HTTP_FOUND = 302;
    const HTTP_SEE_OTHER = 303;
    const HTTP_NOT_MODIFIED = 304;
    const HTTP_USE_PROXY = 305;
    const HTTP_RESERVED = 306;
    const HTTP_TEMPORARY_REDIRECT = 307;
    const HTTP_PERMANENTLY_REDIRECT = 308;  // RFC7238
    const HTTP_BAD_REQUEST = 400;
    const HTTP_UNAUTHORIZED = 401;
    const HTTP_PAYMENT_REQUIRED = 402;
    const HTTP_FORBIDDEN = 403;
    const HTTP_NOT_FOUND = 404;
    const HTTP_METHOD_NOT_ALLOWED = 405;
    const HTTP_NOT_ACCEPTABLE = 406;
    const HTTP_PROXY_AUTHENTICATION_REQUIRED = 407;
    const HTTP_REQUEST_TIMEOUT = 408;
    const HTTP_CONFLICT = 409;
    const HTTP_GONE = 410;
    const HTTP_LENGTH_REQUIRED = 411;
    const HTTP_PRECONDITION_FAILED = 412;
    const HTTP_REQUEST_ENTITY_TOO_LARGE = 413;
    const HTTP_REQUEST_URI_TOO_LONG = 414;
    const HTTP_UNSUPPORTED_MEDIA_TYPE = 415;
    const HTTP_REQUESTED_RANGE_NOT_SATISFIABLE = 416;
    const HTTP_EXPECTATION_FAILED = 417;
    const HTTP_I_AM_A_TEAPOT = 418;                                               // RFC2324
    const HTTP_MISDIRECTED_REQUEST = 421;                                         // RFC7540
    const HTTP_UNPROCESSABLE_ENTITY = 422;                                        // RFC4918
    const HTTP_LOCKED = 423;                                                      // RFC4918
    const HTTP_FAILED_DEPENDENCY = 424;                                           // RFC4918

    /**
     * @deprecated
     */
    const HTTP_RESERVED_FOR_WEBDAV_ADVANCED_COLLECTIONS_EXPIRED_PROPOSAL = 425;   // RFC2817
    const HTTP_TOO_EARLY = 425;                                                   // RFC-ietf-httpbis-replay-04
    const HTTP_UPGRADE_REQUIRED = 426;                                            // RFC2817
    const HTTP_PRECONDITION_REQUIRED = 428;                                       // RFC6585
    const HTTP_TOO_MANY_REQUESTS = 429;                                           // RFC6585
    const HTTP_REQUEST_HEADER_FIELDS_TOO_LARGE = 431;                             // RFC6585
    const HTTP_UNAVAILABLE_FOR_LEGAL_REASONS = 451;
    const HTTP_INTERNAL_SERVER_ERROR = 500;
    const HTTP_NOT_IMPLEMENTED = 501;
    const HTTP_BAD_GATEWAY = 502;
    const HTTP_SERVICE_UNAVAILABLE = 503;
    const HTTP_GATEWAY_TIMEOUT = 504;
    const HTTP_VERSION_NOT_SUPPORTED = 505;
    const HTTP_VARIANT_ALSO_NEGOTIATES_EXPERIMENTAL = 506;                        // RFC2295
    const HTTP_INSUFFICIENT_STORAGE = 507;                                        // RFC4918
    const HTTP_LOOP_DETECTED = 508;                                               // RFC5842
    const HTTP_NOT_EXTENDED = 510;                                                // RFC2774
    const HTTP_NETWORK_AUTHENTICATION_REQUIRED = 511;                             // RFC6585
    const HTTP_NOT_CHANGED = 512;                             // RFC6585
    const HTTP_INVALID_RESET_PASSWORD_LINK = 513;                             // RFC6585

    

    /**
     * Status codes translation table.
     *
     * The list of codes is complete according to the
     * {@link https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml Hypertext Transfer Protocol (HTTP) Status Code Registry}
     * (last updated 2016-03-01).
     *
     * Unless otherwise noted, the status code is defined in RFC2616.
     *
     * @var array
     */
    public static $statusTexts = [
        100 => 'Continue',
        101 => 'Switching Protocols',
        102 => 'Processing',            // RFC2518
        103 => 'Early Hints',
        200 => 'OK',
        201 => 'Created',
        202 => 'Accepted',
        203 => 'Non-Authoritative Information',
        204 => 'No Content',
        205 => 'Reset Content',
        206 => 'Partial Content',
        207 => 'Multi-Status',          // RFC4918
        208 => 'Already Reported',      // RFC5842
        226 => 'IM Used',               // RFC3229
        300 => 'Multiple Choices',
        301 => 'Moved Permanently',
        302 => 'Found',
        303 => 'See Other',
        304 => 'Not Modified',
        305 => 'Use Proxy',
        307 => 'Temporary Redirect',
        308 => 'Permanent Redirect',    // RFC7238
        400 => 'Bad Request',
        401 => 'Unauthorized',
        402 => 'Payment Required',
        403 => 'Forbidden',
        404 => 'Not Found',
        405 => 'Method Not Allowed',
        406 => 'Not Acceptable',
        407 => 'Proxy Authentication Required',
        408 => 'Request Timeout',
        409 => 'Conflict',
        410 => 'Gone',
        411 => 'Length Required',
        412 => 'Precondition Failed',
        413 => 'Payload Too Large',
        414 => 'URI Too Long',
        415 => 'Unsupported Media Type',
        416 => 'Range Not Satisfiable',
        417 => 'Expectation Failed',
        418 => 'I\'m a teapot',                                               // RFC2324
        421 => 'Misdirected Request',                                         // RFC7540
        422 => 'Unprocessable Entity',                                        // RFC4918
        423 => 'Locked',                                                      // RFC4918
        424 => 'Failed Dependency',                                           // RFC4918
        425 => 'Too Early',                                                   // RFC-ietf-httpbis-replay-04
        426 => 'Upgrade Required',                                            // RFC2817
        428 => 'Precondition Required',                                       // RFC6585
        429 => 'Too Many Requests',                                           // RFC6585
        431 => 'Request Header Fields Too Large',                             // RFC6585
        451 => 'Unavailable For Legal Reasons',                               // RFC7725
        500 => 'Internal Server Error',
        501 => 'Not Implemented',
        502 => 'Bad Gateway',
        503 => 'Service Unavailable',
        504 => 'Gateway Timeout',
        505 => 'HTTP Version Not Supported',
        506 => 'Variant Also Negotiates',                                     // RFC2295
        507 => 'Insufficient Storage',                                        // RFC4918
        508 => 'Loop Detected',                                               // RFC5842
        510 => 'Not Extended',                                                // RFC2774
		511 => 'Network Authentication Required',
		512 => 'Not Changed',                    // RFC6585
		513 => 'Reset Password Link is Invalid!'                            // RFC6585
    ];
	public function setGrid($grid) {
		$this->grid = $grid;
		return $this;
	}
	public function setMessage(array $message) {
		foreach($message as $key => $value){
			$this->message[$key] = $message[$key];
		}
    	return $this;
	}
	public function __construct()
    {
		parent::__construct();
		$this->pjActionLoad();
		$this->beforeFilter();
		$this->afterFilter();
		$this->createMailerInstance();
		$this->setServerConfiguration();
	}
	// Create an Instance of Mailer Class;
	protected function createMailerInstance() {
		$this->mailer =  new Mailer();
	}
	// Get SMTP HOST
	protected function getSMTPHost() {
		return ($this->option_arr['o_smtp_host']) ? $this->option_arr['o_smtp_host'] : '';
	}
	// Get SMTP USER
	protected function getSMTPUser() {
		return ($this->option_arr['o_smtp_user']) ? $this->option_arr['o_smtp_user'] : '';
	}
	// Get SMTP PASS
	protected function getSMTPPass() {
		return ($this->option_arr['o_smtp_pass']) ? $this->option_arr['o_smtp_pass'] : '';
	}
	// Get SMTP POST
	protected function getSMTPPort() {
		return ($this->option_arr['o_smtp_port']) ? $this->option_arr['o_smtp_port'] : '';
	}
	// Email account for email notifications
	protected function getSMTPEmailAddress() {
		return ($this->option_arr['o_email_address']) ? $this->option_arr['o_email_address'] : '';
	}
	// Email account for email notifications
	// protected function getLoggedInUserEmail()) {
	// 	return ($this->option_arr['email']) ? $this->option_arr['o_email_address'] : '';
	// }
	
	// Server Configuration
	protected function setServerConfiguration() {
		//App::dd($this->mailer);
		$this->mailer->setSMTPDebug(2);
		$this->mailer->isSMTP();
		$this->mailer->setHost($this->getSMTPHost());
		$this->mailer->setSMTPAuth(true);
		$this->mailer->setUsername($this->getSMTPUser());
		$this->mailer->setPassword($this->getSMTPPass());
		$this->mailer->setSMTPSecure('tls');
		$this->mailer->setPort($this->getSMTPPort());
		$this->mailer->setFrom($this->getSMTPEmailAddress(), 'Ticket At Guru');
	}
	public function __setter($value) {
        $this->value = $value;
        return $this;
    }
    public function __getter() {
        return $this->value;
	}
	public function setOptionArray($options) {
		$this->option_arr = $options;
		return $this;
	}
	private function setSetOptionArrayInSession() {
		$OptionModel = pjOptionModel::factory();
		///$this->option_arr = ;
		$this->setOptionArray($OptionModel->getPairs($this->getForeignId()));
		$this->setSession($this->optionArr, $this->option_arr);
		$this->setTime();
	}
	protected function beforeFilter() {
		$this->setSetOptionArrayInSession();
		if (!$this->hasSession($this->defaultLocale)) {
			$locale_arr = pjLocaleModel::factory()->where('is_default', 1)->limit(1)->findAll()->getData();
			if (count($locale_arr) === 1) {
				$this->setLocaleId($locale_arr[0]['id']);
			}
		}
		$this->loadSetFields();
	}

	protected function afterFilter()
	{		
		$locale_arr = pjLocaleModel::factory()->select('t1.*, t2.file, t2.title')
			->join('pjLocaleLanguage', 't2.iso=t1.language_iso', 'left')
			->where('t2.file IS NOT NULL')
			->orderBy('t1.sort ASC')->findAll()->getData();
		$this->setSession($this->locale_arr, $locale_arr);
	}
	
	protected function pjActionLoad()
	{
		//ob_start();
		//header("Content-Type: text/javascript; charset=utf-8");
		/*
		$terms_conditions = pjMultiLangModel::factory()->select('t1.*')
			->where('t1.model','pjOption')
			->where('t1.locale', $this->getLocaleId())
			->where('t1.field', 'o_terms')
			->limit(0, 1)
			->findAll()->getData();
		$this->set('terms_conditions', $terms_conditions[0]['content']);
		*/
		if($this->getSession('locale') && $this->getSession('locale') > 0)
		{
			$this->setSession($this->defaultLocale, (int) $this->getSession('locale'));
			$this->setSession($this->defaultLangMenu, 'hide');
			//$this->loadSetFields(true);
		} else {
			$locale_arr = pjLocaleModel::factory()->where('is_default', 1)->limit(1)->findAll()->getData();
			if (count($locale_arr) === 1)
			{
				$this->setSession($this->defaultLocale, $locale_arr[0]['id']);
			}
			$this->setSession($this->defaultLangMenu, 'show');
			//$this->setSession($this->pjActionSeatsAjaxResponse, []);
		}
	}

	public function getLocaleId() {
		return ($this->hasSession($this->defaultLocale)) && (int) $this->getSession($this->defaultLocale) > 0 ? (int) $this->getSession($this->defaultLocale) : false;
	}
	public function setLocaleId($locale_id) {
		$this->setSession($this->defaultLocale, (int) $locale_id);
	}
	protected function get($key)
	{
		if ($this->has($key))
		{
			return $this->input->get($key);
		}
		return false;
	}
	protected function post($key)
	{
		if ($this->has($key))
		{
			return $this->input->post($key);
		}
		return false;
	}

	protected function setCookie($array = array(), $XSSFilter  = TRUE)
	{
		$this->input->cookie($array, $XSSFilter); // with XSS filter
		return $this;
	}

	
	
	protected function has($key)
	{
		return (!empty($key) && $key !== NULL);
	}


	protected function getSession($key)
	{
		return $this->session->userdata($key);
	}
	
	protected function hasSession($key)
	{
		if($this->getSession($key)) {
			return true;
		}
		return false;
	}
	
	protected function setSession($key, $value)
	{
		$this->session->set_userdata($key, $value);
		return $this;
	}
	protected function unsetSession($key) {
		if($this->hasSession($key)) {
			return $this->session->unset_userdata($key);
		}
		return false;
	}

	public function isXHR()
    {
       
        return @$_SERVER['HTTP_X_REQUESTED_WITH'] === 'XMLHttpRequest';
    }
	public function getForeignId()
    {
    	return 1;
	}
	public function setAjax($value)
    {
        
        $this->ajax = (bool) $value;
        return $this;
    }
	public function getShowsInGrid($arr)
	{
		$show_arr = array();
		$time_arr = array();
		$all_show_arr = array();
		foreach($arr as $v)
		{
			$_time = date('H:00', strtotime($v['date_time']));
			$time = date('H:i', strtotime($v['date_time']));
			if(empty($show_arr))
			{
				$show_arr[$v['event_id']][] = $time;
				$all_show_arr[$v['event_id']][] = $v['date_time'];
			}else{
				if(array_key_exists($v['event_id'], $show_arr))
				{
					if(!in_array($time, $show_arr[$v['event_id']]))
					{
						$show_arr[$v['event_id']][] = $time;
					}
					if(!in_array($v['date_time'], $all_show_arr[$v['event_id']]))
					{
						$all_show_arr[$v['event_id']][] = $v['date_time'];
					}
				}else{
					$show_arr[$v['event_id']][] = $time;
					$all_show_arr[$v['event_id']][] = $v['date_time'];
				}
			}
			if(empty($time_arr))
			{
				$time_arr[] = $_time;
			}else{
				if(!in_array($_time, $time_arr))
				{
					$time_arr[] = $_time;
				}
			}
		}
			
		$time = array();
		foreach ($time_arr as $key => $val) {
			$time[$key] = $val[0];
		}
		array_multisort($time, SORT_ASC, $time_arr);
		
		return compact("show_arr", 'time_arr', 'all_show_arr');
	}
	public static function setTimezone($timezone="UTC")
    {
    	if (in_array(version_compare(phpversion(), '5.1.0'), array(0,1)))
		{
			date_default_timezone_set($timezone);
		} else {
			$safe_mode = ini_get('safe_mode');
			if ($safe_mode)
			{
				putenv("TZ=".$timezone);
			}
		}
    }

	public static function setMySQLServerTime($offset="-0:00")
    {
		pjAppModel::factory()->prepare("SET SESSION time_zone = :offset;")->exec(compact('offset'));
		pjAppModel::factory()->prepare("SET SESSION group_concat_max_len = 100000;")->exec();
    }
    
	public function setTime()
	{
		if (isset($this->option_arr['o_timezone']))
		{
			$offset = $this->option_arr['o_timezone'] / 3600;
			if ($offset > 0)
			{
				$offset = "-".$offset;
			} elseif ($offset < 0) {
				$offset = "+".abs($offset);
			} elseif ($offset === 0) {
				$offset = "+0";
			}
	
			self::setTimezone('Etc/GMT' . $offset);
			if (strpos($offset, '-') !== false)
			{
				$offset = str_replace('-', '+', $offset);
			} elseif (strpos($offset, '+') !== false) {
				$offset = str_replace('+', '-', $offset);
			}
			self::setMySQLServerTime($offset . ":00");
		}
	}
	
	
	
	protected function loadSetFields($force = FALSE, $locale_id = NULL, $fields = NULL)
	{
		if (is_null($locale_id))
		{
			$locale_id = $this->getLocaleId();
		}
		
		if (is_null($fields))
		{
			$fields = $this->defaultFields;
		}
	
		$registry = pjRegistry::getInstance();
		if ($force
				|| !$this->hasSession($this->defaultFieldsIndex)
				|| $this->getSession($this->defaultFieldsIndex) != $this->option_arr['o_fields_index']
				|| !$this->hasSession($fields))
		{
			
			$this->setFields($locale_id);
		
			# Update session
			if ($this->hasSession('fields'))
			{
				// echo "<pre>";
				// print_r($locale_id);
				// exit;
				$this->setSession($fields, $this->getSession('fields'));
			}
			$this->setSession($this->defaultFieldsIndex, $this->option_arr['o_fields_index']);
		}
	
		if ($this->hasSession($fields))
		{
			# Load fields from session
			$registry->set('fields', $this->getSession($fields));
		}
		
		return TRUE;
	}
	/*
	public function isCountryReady()
    {
    	return $this->isAdmin();
    }
    
	public function isOneAdminReady()
    {
    	return $this->isAdmin();
    }
    
    public function isInvoiceReady()
    {
    	return $this->isAdmin() || $this->isEditor();
    }
	
    
    
    
	public function isEditor()
    {
    	return $this->getRoleId() == 2;
    }
    
    
    */
    public function setFields($locale)
    {
    	if($this->hasSession('lang_show_id') && (int) $this->getSession('lang_show_id') == 1)
		{
			$fields = pjMultiLangModel::factory()
				->select('CONCAT(t1.content, CONCAT(":", t2.id, ":")) AS content, t2.key')
				->join('pjField', "t2.id=t1.foreign_id", 'inner')
				->where('t1.locale', $locale)
				->where('t1.model', 'pjField')
				->where('t1.field', 'title')
				->findAll()
				->getDataPair('key', 'content');
		}else{
			$fields = pjMultiLangModel::factory()
				->select('t1.content, t2.key')
				->join('pjField', "t2.id=t1.foreign_id", 'inner')
				->where('t1.locale', $locale)
				->where('t1.model', 'pjField')
				->where('t1.field', 'title')
				->findAll()
				->getDataPair('key', 'content');
		}  
		$registry = pjRegistry::getInstance();
		$tmp = array();
		if ($registry->is('fields'))
		{
			$tmp = $registry->get('fields');
		}
		$arrays = array();
		foreach ($fields as $key => $value)
		{
			if (strpos($key, '_ARRAY_') !== false)
			{
				list($prefix, $suffix) = explode("_ARRAY_", $key);
				if (!isset($arrays[$prefix]))
				{
					$arrays[$prefix] = array();
				}
				$arrays[$prefix][$suffix] = $value;
			}
		}
		require PJ_CONFIG_PATH . 'settings.inc.php';
		$fields = array_merge($tmp, $fields, $settings, $arrays);
		$registry->set('fields', $fields);
	}
	/**
	 * Format Number
	 *
	 * Returns the supplied number with commas and a decimal point.
	 *
	 * @param	float
	 * @return	string
	 */
	public function format_number($n = '')
	{
		return ($n === '') ? '' : number_format( (float) $n, 2, '.', ',');
	}
	public function setRequest(array $request) 
	{
		foreach($request as $key => $value){
			$this->request[$key] = $request[$key];
		}
    	return $this;
	}
	
	public function setActive($active) 
	{
		$this->active = $active;
		return $this;
	}

	public function setStartDate($startDate) 
	{
		$this->startDate = $startDate;
		return $this;
	}

	public function setEndDate($endDate) 
	{
		$this->endDate = $endDate;
		return $this;
	}
	public function setResponse($response) {
        $this->response = $response;
        return $this;
    }
    public function getResponse() {
        return $this->response;
    }
    public function sendResponse() {
        $this->response->send();
	}
	public function setDate($date) {
        $this->date = $date;
        return $this;
	}
	public function setHasDate($date) {
        $this->hasDate = $date;
        return $this;
	}
	public function setFromDate($date) {
        $this->fromDate = $date;
		return $this;
	}
	public function setToDate($date) {
        $this->toDate = $date;
        return $this;
	}
	public function setTimestamp($timestamp) {
        $this->timestamp = $timestamp;
        return $this;
	}
	public function setFromTimestamp($fromTimestamp) {
        $this->fromTimestamp = $fromTimestamp;
        return $this;
	}
	public function setEndTimestamp($endTimestamp) {
        $this->endTimestamp = $endTimestamp;
        return $this;
	}
	public function optionDateFormat() {
		if(!empty($this->option_arr) && is_array($this->option_arr)) {
			if(array_key_exists('o_date_format', $this->o_date_format) && in_array('o_date_format', $this->option_arr)) {
				$this->optionDateFormat = $this->option_arr['o_date_format'];
			}
		}

		return $this->optionDateFormat;
	}

	public function setEventDate($date) {
		$this->eventDate = $date;
		return $this;
	}
	public function setEventTime($time) {
		$this->eventTime = $time;
		return $this;
	}
	public function setEventDatetimeTimestamp($timestamp) {
		$this->eventDatetimeTimestamp = $timestamp;
		return $this;
	}
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
	public function setUserId($userId) {
        $this->userId = $userId;
        return $this;
    }
    
    public function getRequest() {
        return $this->request;
	}
	protected function _get_csrf_nonce()
	{
		$this->load->helper('string');
		$key   = random_string('alnum', 8);
		$value = random_string('alnum', 20);
		return array($key => $value);
	}
	protected function _valid_csrf_nonce()
	{
		return TRUE;
	}

	protected function show_404($page = '', $log_error = TRUE)
	{
		$_error =& load_class('Exceptions', 'core');
		$CI =& get_instance();
        $CI->load->view('application/views/errors/html/show_404_view');
        echo $CI->output->get_output();
		exit(4); // EXIT_UNKNOWN_FILE
	}

	public function setMapPath($mapPath) {
		$this->mapPath = $mapPath;
		return $this;
	}
	public function setMapContent($mapContent) {
		$this->mapContent = $mapContent;
		return $this;
	}
	public function setMapName($mapName) {
		$this->mapName = $mapName;
		return $this;
	}
	public function setMapId($mapId) {
		$this->mapId = $mapId;
		return $this;
	}

	public function setFirstName($firstName) {
		$this->firstName = $firstName;
		return $this;
	}
	public function setLastName($lastName) {
		$this->lastName = $lastName;
		return $this;
	}
	public function setPhoneNumber($phone) {
		$this->phone = $phone;
		return $this;
	}

}