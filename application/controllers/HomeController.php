<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class HomeController extends App_Controller {

    protected 	$option_arr 			= array();
    protected 	$optionArr 				= 'option_arr';
    protected 	$locale_arr 			= 'locale_arr';
    function __construct() {
        parent::__construct();
        $this->load->model('common_model');
        
      // $this->load->library('session');
    }
   
    public function index()	{
        $this->load->view('frontend/layout/head');
        $this->load->view('frontend/layout/header');
        $this->load->view('frontend/pages/home/index');
		$this->load->view('frontend/layout/footer');
    }
    public function gallery()	{
        $this->load->view('frontend/layout/head');
        $this->load->view('frontend/layout/header');
        $this->load->view('frontend/pages/gallery/index');
		$this->load->view('frontend/layout/footer');
    }
    public function sponsors()	{
        $this->load->view('frontend/layout/head');
        $this->load->view('frontend/layout/header');
        $this->load->view('frontend/pages/sponsors/index');
		$this->load->view('frontend/layout/footer');
    }

	public function ajaxcity(){ 
		$country_id = $this->input->post('country_id');
		$this->db->select('*');
		$this->db->from('tk_cities');
		$this->db->where(array('countryID' => $country_id));
		$this->db->order_by("cityName", "asc"); 	
		$data['ajax_city'] = $this->db->get()->result();
		$this->load->view('frontend/pages/ajax_city',$data);
	}
	public function location(){
		if(!empty($this->input->post())){
			$country=$this->input->post('country_list');
			$city=$this->input->post('city');
		}
		
        $country_cookie= array(
           'name'   => 'set_country_id',
           'value'  => $country,
           'expire' => '3600',
       );
       $this->input->set_cookie($country_cookie);
       
        $city_cookie= array(
           'name'   => 'set_city_id',
           'value'  => $city,
           'expire' => '3600',
       );
       $this->input->set_cookie($city_cookie);
			/*$this->session->set_userdata('location_country',$country);
			$this->session->set_userdata('location_city',$city);	*/
		redirect($_SERVER['HTTP_REFERER']);
	}
    
}
