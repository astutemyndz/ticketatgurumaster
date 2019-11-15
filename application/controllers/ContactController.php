<?php
defined('BASEPATH') OR exit('No direct script access allowed');
use Honeycrisp\Mail\Exception\MailException;
use Honeycrisp\Mail\Mailer;


class ContactController extends App_Controller {

    public $defaultStore = 'pjTicketBooking_Store';
    private $name;
    private $emailAddress;
    private $phoneNumber;

	function __construct() {
        parent::__construct();
        $this->isCart = (count($this->cart->contents()) > 0) ? true : false;
    }
    public function pjActionGetLocale() {
		return ($this->getSession($this->defaultLocale)) && (int) $this->getSession($this->defaultLocale) > 0 ? (int) $this->getSession($this->defaultLocale) : FALSE;
	}
   
    /**
     * List of cart items or Cart page
     * @return view
     */
    
    public function index()	{
        /*
        $pjCmsModel = pjCmsModel::factory();
		$pjCmsModel->join('pjMultiLang', "t2.model='pjCms' AND t2.foreign_id=t1.id AND t2.field='cms_title' AND t2.locale='".$this->getLocaleId()."'", 'left outer');
		$pjCmsModel->join('pjMultiLang', "t3.model='pjCms' AND t3.foreign_id=t1.id AND t3.field='cms_description' AND t3.locale='".$this->getLocaleId()."'", 'left outer');
		$pjCmsModel->join('pjMultiLang', "t4.model='pjCms' AND t4.foreign_id=t1.id AND t4.field='cms_meta_title' AND t4.locale='".$this->getLocaleId()."'", 'left outer');
		$pjCmsModel->where('t1.status', 'T');
        $this->data['contact_us'] = $pjCmsModel
							->select("t1.id, t1.page_name, t1.created, t1.status, t2.content as title, t3.content as description, t4.content as cms_meta_title")
							->orderBy("t1.id desc")
							->find(6)
                            ->getData();
        $this->data['title'] 		= $this->data['contact_us']['cms_meta_title'];
        $this->data['page_heading'] 		= $this->data['contact_us']['title'];
        */
        $this->load->view('frontend/layout/head', $this->data);
		$this->load->view('frontend/layout/inner_page_header');
		$this->load->view('frontend/pages/contact/contact_us');
		$this->load->view('frontend/layout/footer');
    }
    public function about_us()	{
        $pjCmsModel = pjCmsModel::factory();
		$pjCmsModel->join('pjMultiLang', "t2.model='pjCms' AND t2.foreign_id=t1.id AND t2.field='cms_title' AND t2.locale='".$this->getLocaleId()."'", 'left outer');
		$pjCmsModel->join('pjMultiLang', "t3.model='pjCms' AND t3.foreign_id=t1.id AND t3.field='cms_description' AND t3.locale='".$this->getLocaleId()."'", 'left outer');
		$pjCmsModel->join('pjMultiLang', "t4.model='pjCms' AND t4.foreign_id=t1.id AND t4.field='cms_meta_title' AND t4.locale='".$this->getLocaleId()."'", 'left outer');
		$pjCmsModel->where('t1.status', 'T');
        $this->data['about_us'] = $pjCmsModel
							->select("t1.id, t1.page_name, t1.created, t1.status, t2.content as title, t3.content as description, t4.content as cms_meta_title")
							->orderBy("t1.id desc")
							->find(4)
                            ->getData();
        $pjVideoModel = pjVideoModel::factory();
                            $pjVideoModel->join('pjMultiLang', "t2.model='pjVideo' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer');
                            $pjVideoModel->where('t1.id', 1);
        $this->data['video']  = $pjVideoModel
                                    ->select(" t1.id, t1.video_path, t1.mime_type, t1.created, t1.status, t2.content as name")
                                    ->orderBy("t1.id desc")
                                    ->find(1)
                                    ->getData();
        // echo "<pre>"; print_r($this->data['about_us']);

        $this->data['title'] 		= $this->data['about_us']['cms_meta_title'];
        $this->data['page_heading'] 		= $this->data['about_us']['page_name'];
        $this->load->view('frontend/layout/head', $this->data);
		$this->load->view('frontend/layout/header');
		$this->load->view('frontend/pages/contact/about_us');
		$this->load->view('frontend/layout/footer');
    }
    public function terms_conditions()	{
        $pjCmsModel = pjCmsModel::factory();
		$pjCmsModel->join('pjMultiLang', "t2.model='pjCms' AND t2.foreign_id=t1.id AND t2.field='cms_title' AND t2.locale='".$this->getLocaleId()."'", 'left outer');
		$pjCmsModel->join('pjMultiLang', "t3.model='pjCms' AND t3.foreign_id=t1.id AND t3.field='cms_description' AND t3.locale='".$this->getLocaleId()."'", 'left outer');
		$pjCmsModel->join('pjMultiLang', "t4.model='pjCms' AND t4.foreign_id=t1.id AND t4.field='cms_meta_title' AND t4.locale='".$this->getLocaleId()."'", 'left outer');
		$pjCmsModel->where('t1.status', 'T');
        $this->data['terms_conditions'] = $pjCmsModel
							->select("t1.id, t1.page_name, t1.created, t1.status, t2.content as title, t3.content as description, t4.content as cms_meta_title")
							->orderBy("t1.id desc")
							->find(1)
                            ->getData();
        // echo "<pre>"; print_r($this->data['terms_conditions']);
        $this->data['title'] 		= $this->data['terms_conditions']['cms_meta_title'];
        $this->data['page_heading'] 		= $this->data['terms_conditions']['title'];
        $this->load->view('frontend/layout/head', $this->data);
		$this->load->view('frontend/layout/header');
		$this->load->view('frontend/pages/contact/terms_conditions');
		$this->load->view('frontend/layout/footer');
    }
    public function privacy_policy()	{
        $pjCmsModel = pjCmsModel::factory();
		$pjCmsModel->join('pjMultiLang', "t2.model='pjCms' AND t2.foreign_id=t1.id AND t2.field='cms_title' AND t2.locale='".$this->getLocaleId()."'", 'left outer');
		$pjCmsModel->join('pjMultiLang', "t3.model='pjCms' AND t3.foreign_id=t1.id AND t3.field='cms_description' AND t3.locale='".$this->getLocaleId()."'", 'left outer');
		$pjCmsModel->join('pjMultiLang', "t4.model='pjCms' AND t4.foreign_id=t1.id AND t4.field='cms_meta_title' AND t4.locale='".$this->getLocaleId()."'", 'left outer');
		$pjCmsModel->where('t1.status', 'T');
        $this->data['privacy_policy'] = $pjCmsModel
							->select("t1.id, t1.page_name, t1.created, t1.status, t2.content as title, t3.content as description, t4.content as cms_meta_title")
							->orderBy("t1.id desc")
							->find(5)
                            ->getData();
        // echo "<pre>"; print_r($this->data['terms_conditions']);
        $this->data['title'] 		= $this->data['privacy_policy']['cms_meta_title'];
        $this->data['page_heading'] 		= $this->data['privacy_policy']['title'];
        $this->load->view('frontend/layout/head', $this->data);
		$this->load->view('frontend/layout/header');
		$this->load->view('frontend/pages/contact/privacy_policy');
		$this->load->view('frontend/layout/footer');
    }

    public function setPhoneNumber($phoneNumber) {
        $this->phoneNumber = $phoneNumber;
        return $this;
    }
    public function setEmailAddress($emailAddress) {
        $this->emailAddress = $emailAddress;
        return $this;
    }
    public function setName($name) {
        $this->name = $name;
        return $this;
    }

    public function submitContactForm() {
        if($this->isAjaxRequest()) {
            $this->setRequest($_REQUEST);

            if(!empty($this->request) && is_array($this->request)) {

                if(!empty($this->request['name']) && isset($this->request['name'])) {
                    $this->setName($this->request['name']);
                }
                if(!empty($this->request['emailAddress']) && isset($this->request['emailAddress'])) {
                    $this->setEmailAddress($this->request['emailAddress']);
                }
                if(!empty($this->request['phoneNumber']) && isset($this->request['phoneNumber'])) {
                    $this->setPhoneNumber($this->request['phoneNumber']);
                }
                $mailer = new Mailer();
                $mailer->isSMTP();
                $mailer->setHost('smtp.mailtrap.io');
                $mailer->setSMTPAuth(true);
                $mailer->setUsername('f56d0696931ad0');
                $mailer->setPassword('a47d3fed4ffdac');
                $mailer->setSMTPSecure('tls');
                $mailer->setPort(465);
        
                $mailer->setFrom($this->getSMTPEmailAddress(), 'Ticket At Guru');
                $mailer->addAddress($this->loggedInUserEmail, $this->loggedInUserEmail); // Name is optional
                $mailer->addReplyTo($mailer->From, $mailer->FromName);
        
                $mailer->isHTML(true);                                  // Set email format to HTML
                $mailer->Subject = 'Contact form submissions';
                $mailer->Body    = 'Your booking has been successfully <b>Confirmed</b>. Please download your attachment file.';


            }
        }
        
    }
    
    
	
}
