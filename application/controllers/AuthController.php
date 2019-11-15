<?php defined('BASEPATH') OR exit('No direct script access allowed');

//require APPPATH . '/libraries/REST_Controller.php';
/**
 * Class Auth
 * @property Ion_auth|Ion_auth_model $ion_auth        The ION Auth spark
 * @property CI_Form_validation      $form_validation The form validation library
 */
class AuthController extends App_Controller
{
	private $tables = array();
	private $customerRoleId;
	private $customerRole = array();
	private $additionalData = array();
	private $code;
	private $user;
	private $password;
	private $identity;
	private $hasChange = null;
	public function __construct()
	{
		parent::__construct();
		
		$this->load->database();
		$this->load->library(array('ion_auth', 'form_validation'));
		$this->load->helper(array('url', 'language'));
		$this->load->library('session');
		$this->form_validation->set_error_delimiters($this->config->item('error_start_delimiter', 'ion_auth'), $this->config->item('error_end_delimiter', 'ion_auth'));

		$this->lang->load('auth');

		$this->tables = $this->config->item('tables', 'ion_auth');
		
	}

	public function setCode($code) {
		$this->code = $code;
		return $this;
	}
	public function setUser($user) {
		$this->user = $user;
		return $this;
	}
	public function setPassword($password) {
		$this->password = $password;
		return $this;
	}
	public function setIdentity($identity) {
		$this->identity = $identity;
		return $this;
	}
	/**
	 * Redirect if needed, otherwise display the user list
	 */
	// public function index()
	// {
	// 	echo 'd';
	// 	print_r($this->session->userdata('loggedIn'));
	// 	exit;
	// 	if (!$this->ion_auth->logged_in())
	// 	{
	// 		// redirect them to the login page
	// 		//redirect('auth/login', 'refresh');
	// 		return $this->output
	// 					->set_content_type('application/json')
	// 					->set_status_header(200)
	// 					->set_output(json_encode(array(
	// 							'text' => 'Open login modal',
	// 							'type' => 'danger'
	// 					)));
	// 	}

	// 	else
	// 	{
	// 		// set the flash data error message if there is one
	// 		$this->data['message'] = (validation_errors()) ? validation_errors() : $this->session->flashdata('message');

	// 		//list the users
	// 		$this->data['users'] = $this->ion_auth->users()->result();
	// 		foreach ($this->data['users'] as $k => $user)
	// 		{
	// 			$this->data['users'][$k]->groups = $this->ion_auth->get_users_groups($user->id)->result();
	// 		}

	// 		$this->_render_page('auth' . DIRECTORY_SEPARATOR . 'index', $this->data);
	// 	}
	// }
	/**
	 * Create a new user
	 */

	public function getCustomerRole() {
		$this->customerRole = $this->db->get_where($this->tables['groups'], array('is_customer' => $this->config->item('is_customer', 'ion_auth')), 1)->row();
		return $this;
	}
	public function setCustomerRoleId($customerRoleId) {
		$this->customerRoleId = $customerRoleId;
		return $this;
	}
	public function setAdditionalData($additionalData) {
		$this->additionalData = $additionalData;
		return $this;
	}
	public function register()
	{
		if ($this->input->server('REQUEST_METHOD') == 'POST') {
			$this->getCustomerRole();
			if($this->customerRole) {
				$this->setCustomerRoleId($this->customerRole->id);
			}
		
			$tables = $this->config->item('tables', 'ion_auth');
			$identity_column = 'email';
	
			//$this->form_validation->set_rules('first_name', $this->lang->line('create_user_validation_fname_label'), 'trim|required');
			//$this->form_validation->set_rules('last_name', $this->lang->line('create_user_validation_lname_label'), 'trim|required');
			$this->form_validation->set_rules('email', $this->lang->line('create_user_validation_identity_label'), 'trim|required|is_unique[' . $tables['users'] . '.' . $identity_column . ']');
			//$this->form_validation->set_rules('email', $this->lang->line('create_user_validation_email_label'), 'trim|required|valid_email|is_unique[' . $tables['users'] . '.email]|matches[confirm_email]');
	
			//$this->form_validation->set_rules('confirm_email', $this->lang->line('create_user_validation_confirm_email_label'), 'trim|required|valid_email');
			//$this->form_validation->set_rules('password', $this->lang->line('create_user_validation_password_label'), 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[password_confirm]');
			//$this->form_validation->set_rules('password_confirm', $this->lang->line('create_user_validation_password_confirm_label'), 'required');
	
			if ($this->form_validation->run() === TRUE)
			{
				$email 		= strtolower($this->input->post('email'));
				$identity 	= strtolower($this->input->post('email'));//($identity_column === 'email') ? $email : $this->input->post('identity');
				$password 	= $this->input->post('password');
	
				$this->additionalData = array(
					'first_name' => $this->input->post('first_name'),
					'last_name' => $this->input->post('last_name'),
					'phone' => $this->input->post('phone'),
					'tk_cbs_roles_id' => $this->customerRoleId,
				);
	
				$this->setAdditionalData($this->additionalData);
			}
			if ($this->form_validation->run() === TRUE && $this->ion_auth->register($identity, $password, $email, $this->additionalData))
			{
				$user = $this->ion_auth->where('email', $identity)->users()->row();
				return $this->output
							->set_content_type('application/json')
							->set_status_header(200)
							->set_output(json_encode(array(
									'data' => $user,
									'loggedIn' => $this->session->userdata('user_id'),
									'errors' => [],
									'message' => 'User has been successfully created',
									'status' => 200,
									'formValidation' => true
							)));
			} else {
				$validation_errors = (validation_errors() ? validation_errors() : ($this->ion_auth->errors() ? $this->ion_auth->errors() : $this->session->flashdata('message')));
				$validation_errors = explode('.', strip_tags($validation_errors));
				$errors = array();
				if(count($validation_errors) >0) {
					foreach($validation_errors as $error) {
						$errors[] = trim(preg_replace('/\s\s+/', ' ', $error));
					}
				}
				$err = array_pop($errors);
				return $this->output
							->set_content_type('application/json')
							->set_status_header(200)
							->set_output(json_encode(array(
									'data' => null,
									'loggedIn' => 0,
									'errors' => $errors,
									'message' => implode('|', $errors),
									'status' => 200,
									'formValidation' => false
							)));
			}
		} else {
			return $this->output
			->set_content_type('application/json')
			->set_status_header(200)
			->set_output(json_encode(array(
					'data' => null,
					'loggedIn' => 0,
					'errors' => null,
					'message' => '405 Method Not Allowed',
					'status' => 200,
					'formValidation' => false
			)));
		}
		
	}
	public function index() {
		echo $this->session->userdata('abc');
	}
	/**
	 * Log the user in
	 */
	public function login()
	{
		if ($this->input->server('REQUEST_METHOD') == 'POST') {

			$this->form_validation->set_rules('email', str_replace(':', '', $this->lang->line('login_identity_label')), 'required');
			$this->form_validation->set_rules('password', str_replace(':', '', $this->lang->line('login_password_label')), 'required');
	
			
			if ($this->form_validation->run() === TRUE)
			{
				$remember = (bool)$this->input->post('remember');
				if ($this->ion_auth->login($this->input->post('email'), $this->input->post('password'), $remember))
				{
					$user = $this->ion_auth->where('email', $this->input->post('email'))->users()->row();
					return $this->output
							->set_content_type('application/json')
							->set_status_header(200)
							->set_output(json_encode(array(
									'data' => $user,
									'loggedIn' => $this->session->userdata('user_id'),
									'errors' => null,
									'message' => 'Successfully logged in',
									'status' => 200,
									'formValidation' => true
							)));
				} else {
					$invalidCredentialsErrors = $this->ion_auth->errors();
					return $this->output
							->set_content_type('application/json')
							->set_status_header(200)
							->set_output(json_encode(array(
									'data' => null,
									'loggedIn' => 0,
									'errors' => $invalidCredentialsErrors,
									'message' => $invalidCredentialsErrors,
									'status' => 200,
									'formValidation' => true
							)));
				}
			} else {
				$validation_errors = (validation_errors() ? validation_errors() : ($this->ion_auth->errors() ? $this->ion_auth->errors() : $this->session->flashdata('message')));
				$validation_errors = explode('.', strip_tags($validation_errors));
				return $this->output
						->set_content_type('application/json')
						->set_status_header(200)
						->set_output(json_encode(array(
								'data' => null,
								'loggedIn' => 0,
								'errors' => array(
									'identity' 		=> $validation_errors[0], 
									'password' 		=> $validation_errors[1], 
								),
								'message' => 'You have entered invalid credentials',
								'status' => 200,
								'formValidation' => false
						)));
			}
		} else {
			return $this->output
						->set_content_type('application/json')
						->set_status_header(200)
						->set_output(json_encode(array(
						'data' => [],
						'loggedIn' => 0,
						'errors' => null,
						'message' => '405 Method Not Allowed',
						'status' => 200,
						'formValidation' => false
			)));
		}

		
	}

	/**
	 * Log the user out
	 */
	public function logout()
	{

		if ($this->input->server('REQUEST_METHOD') == 'POST') {
			$identity = $this->config->item('identity', 'ion_auth');
			if (substr(CI_VERSION, 0, 1) == '2')
			{
				$this->session->unset_userdata(array($identity => '', 'id' => '', 'user_id' => '', 'user_type' => '', 'loggedIn' => '', 'old_last_login' => '', 'last_check' => ''));
			}
			else
			{
				$this->session->unset_userdata(array($identity, 'id', 'user_id','user_type', 'last_check', 'old_last_login', 'loggedIn', 'identity'));
			}
			return $this->output
						->set_content_type('application/json')
						->set_status_header(200)
						->set_output(json_encode(array(
								'message' => 'Logout has been successfully',
								'status' => 200,
								
						)));
		}
		return $this->output
			->set_content_type('application/json')
			->set_status_header(200)
			->set_output(json_encode(array(
					'message' => '405 Method Not Allowed',
					'status' => 200,
			)));
	}


	public function test() {
		$this->session->set_userdata('abc', 1);
		echo $this->session->userdata('abc');
		
	}

	public function pjAuthForm() {
		if ($this->ion_auth->logged_in())
		{
		  redirect('account');
		}
		$this->data['page_heading'] = "Login Form";
		$this->load->view('frontend/layout/head', $this->data);
		$this->load->view('frontend/layout/header');
		$this->load->view('frontend/pages/auth/index');
		$this->load->view('frontend/layout/footer');
	}
	public function pjAccount() {

		$this->data['page_heading'] = "My Account";
		$this->load->view('frontend/layout/head');
		$this->load->view('frontend/layout/header',$this->data);
		$this->load->view('frontend/pages/account/index',$this->data);
		$this->load->view('frontend/layout/footer');
	}

	public function emptySession() {
		$this->session->sess_destroy();
	}

	/**
	 * Forgot password API
	 */
	//Working code for this example is in the example Auth controller in the github repo
    public function forgot_password()
    {
		if ($this->isPost()) 
		{
			$this->form_validation->set_rules('email', 'Email Address', 'required');
			if ($this->form_validation->run() == false) {
				//setup the input
				$this->data['email'] = array(
					'name' => 'email',
					'id'   => 'email',
				);
				//set any errors and display the form
				//$this->data['message'] = (validation_errors()) ? validation_errors() : '';
				$this->setMessage(array('message' => (validation_errors()) ? validation_errors() : []));
				$this->setResponse(array(
					'formValidation' => false,
					'status'    => array(
						'code' => App_Controller::HTTP_BAD_REQUEST,
						'text' => App_Controller::$statusTexts[400],
					),
					'message'   => strip_tags($this->message['message'])
				));
			  } else {
				//run the forgotten password method to email an activation code to the user
				$forgotten = $this->ion_auth->forgotten_password($this->input->post('email'));
				if ($forgotten) { //if there were no errors
					 //$this->data['message'] = $this->ion_auth->messages();
					$this->setMessage(array('message' => strip_tags($this->ion_auth->messages())));
				  	$this->setResponse(array(
						'formValidation' => true,
						'status'    => array(
							'code' => App_Controller::HTTP_OK,
							'text' => App_Controller::$statusTexts[200],
						),
						'message'   => $this->message['message']
					));
				} else {
				  //$this->data['message'] = $this->ion_auth->errors();
				  //$this->setMessage(array('message' => strip_tags($this->ion_auth->errors())));
				  $this->setResponse(array(
						'formValidation' => true,
						'status'    => array(
							'code' => App_Controller::HTTP_BAD_GATEWAY,
							'text' => App_Controller::$statusTexts[502],
						),
						'message'   => 'User account does not exists! Unable to sent email the Reset Password link'
				   ));
				}
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
	
	
	//reset password - final step for forgotten password
	public function render_reset_password($code = NULL) {
		if(!$this->isPost()) {
			if (!$code)
			{
				$this->show_404();
			}
			$user = $this->ion_auth->forgotten_password_check($code);
			if ($user)
        	{
				$this->data['min_password_length'] = $this->config->item('min_password_length', 'ion_auth');
				$this->data['new_password'] = array(
					'class' => 'form-control',
					'name' => 'new_password',
					'id'   => 'new_password',
				'type' => 'password',
					'pattern' => '^.{'.$this->data['min_password_length'].'}.*$'
				);
				$this->data['new_password_confirm'] = array(
					'class' => 'form-control',
					'name' => 'new_confirm',
					'id'   => 'new_confirm',
					'type' => 'password',
					'pattern' => '^.{'.$this->data['min_password_length'].'}.*$'
				);
				$this->data['user_id'] = array(
					'name'  => 'user_id',
					'id'    => 'user_id',
					'type'  => 'hidden',
					'value' => $user->id
				);
				$this->data['code'] = array(
					'name'  => 'code',
					'id'    => 'code',
					'type'  => 'hidden',
					'value' => $code
				);
				$this->data['csrf_token'] = $this->_get_csrf_nonce();
				//$this->data['code'] = $code;

			//render
				$this->load->view('frontend/layout/head');
				$this->load->view('frontend/layout/header');
				$this->load->view('frontend/pages/auth/reset_password_view', $this->data);
				$this->load->view('frontend/layout/footer');
        	} else {
				$this->session->set_flashdata('message', $this->ion_auth->errors());
				redirect("forgot_password", 'refresh');
			}
		} 
	}
    public function change_password()
    {
		if ($this->isPost()) 
		{
			$this->setRequest($_REQUEST);

			if(!empty($this->request) && is_array($this->request)) 
			{
				if(!empty($this->request['code']) && array_key_exists('code', $this->request)) {
					$this->setCode($this->request['code']);
				}
				if(!empty($this->request['user_id']) && array_key_exists('user_id', $this->request)) {
					$this->setUserId($this->request['user_id']);
				}
				if(!empty($this->request['new_password']) && array_key_exists('new_password', $this->request)) {
					$this->setPassword($this->request['new_password']);
				}

				$this->form_validation->set_rules('new_password', 'New Password', 'required|min_length[' . $this->config->item('min_password_length', 'ion_auth') . ']|max_length[' . $this->config->item('max_password_length', 'ion_auth') . ']|matches[new_confirm]');
				$this->form_validation->set_rules('new_confirm', 'Confirm New Password', 'required');

				if ($this->form_validation->run() == false) 
				{
					$this->setMessage(array('message' => (validation_errors()) ? validation_errors() : []));
					$this->setResponse(array(
						'formValidation' => false,
						'status'    => array(
							'code' => App_Controller::HTTP_BAD_REQUEST,
							'text' => App_Controller::$statusTexts[400],
						),
						'message'   => $this->message['message']
					));
				} else {
					// echo $this->code;
					// exit;
					if($this->code) {
						$this->setUser($this->ion_auth->forgotten_password_check($this->code));
						// echo "<pre>";
						// print_r($this->user);
						// exit;
						if($this->user) 
						{
							if ($this->_valid_csrf_nonce() === FALSE || $this->user->id != $this->userId)
							{
								//$this->ion_auth->clear_forgotten_password_code($this->code);
								//show_error($this->lang->line('error_csrf'));
								//show_error('This form post did not pass our security checks.');
								$this->setMessage(array('message' => strip_tags($this->lang->line('error_csrf'))));
								$this->setResponse(array(
									'formValidation' => true,
									'status'    => array(
										'code' => App_Controller::HTTP_OK,
										'text' => App_Controller::$statusTexts[200],
									),
									'message'   => $this->message['message'],
									'valid_csrf_nonce' => FALSE
								));
								// back to reset form page
							} else {
								$this->setIdentity($this->user->{$this->config->item('identity', 'ion_auth')});
								$this->hasChange = $this->ion_auth->reset_password($this->identity, $this->password);
								
								if ($this->hasChange)
								{
									//if the password was successfully changed
									$this->session->set_flashdata('message', $this->ion_auth->messages());
									$this->setMessage(array('message' => strip_tags($this->ion_auth->messages())));
									$this->logout();
									$this->setResponse(array(
										'formValidation' => true,
										'status'    => array(
											'code' => App_Controller::HTTP_OK,
											'text' => App_Controller::$statusTexts[200],
										),
										'message'   => $this->message['message'],
										'valid_csrf_nonce' => TRUE
									));
									// back to login page
								} else {
									$this->setMessage(array('message' => strip_tags($this->ion_auth->errors())));
									//redirect('reset_password/' . $this->code, 'refresh');
									$this->setResponse(array(
										'code' => $this->code,
										'formValidation' => true,
										'status'    => array(
											'code' => App_Controller::HTTP_NOT_CHANGED,
											'text' => App_Controller::$statusTexts[512],
										),
										'message'   => $this->message['message'],
										'valid_csrf_nonce' => TRUE
									));
									// back to reset password page
								}
							}
						} else {
							$this->setResponse(array(
								'data' => [],
								'formValidation' => true,
								'status'    => array(
									'code' => App_Controller::HTTP_OK,
									'text' => App_Controller::$statusTexts[200],
								),
								'message'   => App_Controller::$statusTexts[200]
							));
						}
						
					} else {
						$this->setResponse(array(
							'formValidation' => true,
							'status'    => array(	
								'code' => App_Controller::HTTP_INVALID_RESET_PASSWORD_LINK,
								'text' => App_Controller::$statusTexts[513],
							),
							'message'   => App_Controller::$statusTexts[513]
						));
					}
					
				}
			}
		}
		pjAppController::jsonResponse($this->response);
	}


	/**
      * @desc User 
      *@author Rakesh Maity 
      */
      public function getUser() {
		if(!$this->isPost()) {
		  $this->setUserId(($this->uri->segment(4)) ? $this->uri->segment(4) : '');

		  if($this->userId) {
			  $this->setUser(pjCustomerModel::factory()->find($this->userId)->getData());
		  }

		  if($this->user) {
				$this->setResponse(array(
					'data' => $this->user,
					'status'    => array(	
						'code' => App_Controller::HTTP_OK,
						'text' => App_Controller::$statusTexts[200],
					)
				));
		  } else {
			$this->setResponse(array(
				'data' => [],
				'status'    => array(	
					'code' => App_Controller::HTTP_OK,
					'text' => App_Controller::$statusTexts[200],
					'message' => 'User does not registered'
				)
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

	public function updateUser() {
		// Update user
		if($this->isPost()) {
			$this->setRequest($_REQUEST);
			if(!empty($this->request) && is_array($this->request)) 
			{
				if(!empty($this->request['id']) && array_key_exists('id', $this->request)) {
					$this->setUserId($this->request['id']);
				}
				if(!empty($this->request['first_name']) && array_key_exists('first_name', $this->request)) {
					$this->setFirstName($this->request['first_name']);
				}
				if(!empty($this->request['last_name']) && array_key_exists('last_name', $this->request)) {
					$this->setLastName($this->request['last_name']);
				}
				if(!empty($this->request['phone']) && array_key_exists('phone', $this->request)) {
					$this->setPhoneNumber($this->request['phone']);
				}
	
				if($this->firstName) {
					$this->data['first_name'] = $this->firstName;
				}
				if($this->lastName) {
					$this->data['last_name'] = $this->lastName;
				}
				if($this->phone) {
					$this->data['phone'] = $this->phone;
				}
	
				//$this->setUserId(($this->uri->segment(4)) ? $this->uri->segment(4) : '');
				if(!$this->userId) {
					$this->setResponse(array(
						'status'    => array(
							'code' => App_Controller::HTTP_OK,
							'text' => App_Controller::$statusTexts[200],
						),
						'message'   => 'Please provide id parameter'
				));
				}
				if(!$this->data['first_name']) {
					$this->setResponse(array(
						'status'    => array(
							'code' => App_Controller::HTTP_OK,
							'text' => App_Controller::$statusTexts[200],
						),
						'message'   => 'Please provide first_name parameter'
				));
				}
				if(!$this->data['last_name']) {
					$this->setResponse(array(
						'status'    => array(
							'code' => App_Controller::HTTP_OK,
							'text' => App_Controller::$statusTexts[200],
						),
						'message'   => 'Please provide last_name parameter'
				));
				}
				if(!$this->data['phone']) {
					$this->setResponse(array(
						'status'    => array(
							'code' => App_Controller::HTTP_OK,
							'text' => App_Controller::$statusTexts[200],
						),
						'message'   => 'Please provide phone parameter'
				));
				}
				$isUpdate = pjCustomerModel::factory()->where('id', $this->userId)->limit(1)->modifyAll($this->data);
				if($isUpdate) {
					$this->setUser(pjCustomerModel::factory()->find($this->userId)->getData());
					$this->setResponse(array(
						'data' => $this->user,
						'status'    => array(
							'code' => App_Controller::HTTP_OK,
							'text' => App_Controller::$statusTexts[200],
						),
						'message'   => 'Your profile has been successfully updated'
					));
				} else {
					$this->setResponse(array(
						'data' =>  [],
						'status'    => array(
							'code' => App_Controller::HTTP_OK,
							'text' => App_Controller::$statusTexts[200],
						),
						'message'   => 'Your profile  cannot be updated at this time'
					));
				}
				
	
			} else {
				$this->setResponse(array(
					'status'    => array(
						'code' => App_Controller::HTTP_OK,
						'text' => App_Controller::$statusTexts[200],
					),
					'message'   => 'Please provide three param first_name, last_name, phone'
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
}
