<?php

use Illuminate\Http\Response;
use Illuminate\Models\TestModel;
use Illuminate\Models\UploadHandler;
require ROOT_PATH . 'src/Illuminate/Models/UploadHandler.php';

class pjAdminOptions extends pjAdmin
{
	private $id;

	public function setId($id) {
		$this->id = $id;
		return $this;
	}
	public function pjActionIndex()
	{
		$arr = pjOptionModel::factory()
			->where('t1.foreign_id', $this->getForeignId())
			->orderBy('t1.order ASC, t1.`key` ASC')
			->findAll()
			->getData();
		//App::dd($arr);
		$this->set('arr', $arr);
		
		$this->appendJs('jquery.tipsy.js', PJ_THIRD_PARTY_PATH . 'tipsy/');
		$this->appendCss('jquery.tipsy.css', PJ_THIRD_PARTY_PATH . 'tipsy/');
		$this->appendJs('pjAdminOptions.js');
		
	}
	
	
	public function pjActionUpdate()
	{
		$post_max_size = pjUtil::getPostMaxSize();
		if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_SERVER['CONTENT_LENGTH']) && (int) $_SERVER['CONTENT_LENGTH'] > $post_max_size)
		{
			pjUtil::redirect($_SERVER['PHP_SELF'] . "?controller=pjAdminOptions&action=pjActionTicket&err=AO07");
		}
		if (isset($_POST['options_update']))
		{
			$OptionModel = new pjOptionModel();
		
			foreach ($_POST as $key => $value)
			{
				if (preg_match('/value-(string|text|int|float|enum|bool|color)-(.*)/', $key) === 1)
				{
					list(, $type, $k) = explode("-", $key);
					if (!empty($k))
					{
						$OptionModel
							->reset()
							->where('foreign_id', $this->getForeignId())
							->where('`key`', $k)
							->limit(1)
							->modifyAll(array('value' => $value));
					}
				}
			}
			if (isset($_POST['i18n']))
			{
				pjMultiLangModel::factory()->updateMultiLang($_POST['i18n'], 1, 'pjOption', 'data');
			}
			
			if (isset($_FILES['ticket_img']))
			{
				if($_FILES['ticket_img']['error'] == 0)
				{
					if (is_writable('app/web/upload/tickets'))
					{
						$Image = new pjImage();
						if ($Image->getErrorCode() !== 200)
						{
							$Image->setAllowedTypes(array('image/png', 'image/gif', 'image/jpg', 'image/jpeg', 'image/pjpeg'));
							if ($Image->load($_FILES['ticket_img']))
							{
								$resp = $Image->isConvertPossible();
								if ($resp['status'] === true)
								{
									$hash = md5(uniqid(rand(), true));
									$image_path = PJ_UPLOAD_PATH . 'tickets/' . $hash . '.' . $Image->getExtension();
			
									$Image->loadImage();
									$Image->saveImage($image_path);
									$data = array();
										
									$OptionModel
										->reset()
										->where('foreign_id', $this->getForeignId())
										->where('`key`', 'o_ticket_image')
										->limit(1)
										->modifyAll(array('value' => $image_path));
								}
							}
						}
					}else{
						$err = 'AE12';
					}
				}else if($_FILES['ticket_img']['error'] != 4){
					$err = 'AE09';
				}
			}
			
			if (isset($_POST['next_action']))
			{
				switch ($_POST['next_action'])
				{
					case 'pjActionIndex':
						$err = 'AO01';
						break;
					case 'pjActionBooking':
						$err = 'AO02';
						break;
					case 'pjActionNotification':
						$err = 'AO03&tab_id=' . $_POST['tab_id'];
						break;
					case 'pjActionBookingForm':
						$err = 'AO04';
						break;
					case 'pjActionTicket':
						$err = 'AO05';
						break;
					case 'pjActionTerm':
						$err = 'AO06';
						break;
				}
			}
			pjUtil::redirect($_SERVER['PHP_SELF'] . "?controller=pjAdminOptions&action=" . @$_POST['next_action'] . "&err=$err");
		}
		
	}
	
	public function pjActionBooking()
	{
		$pjOptionModel = pjOptionModel::factory()
			->where('t1.foreign_id', $this->getForeignId())
			->orderBy('t1.order ASC')
			->findAll();
			
		$this->set('arr', $pjOptionModel->getData());
		$this->set('o_arr', $pjOptionModel->getDataPair('key'));
			
		$this->appendJs('pjAdminOptions.js');
		
	}
	
	public function pjActionBookingForm()
	{
		$arr = pjOptionModel::factory()
			->where('t1.foreign_id', $this->getForeignId())
			->orderBy('t1.order ASC')
			->findAll()
			->getData();
			
		$this->set('arr', $arr);
		$this->appendJs('pjAdminOptions.js');
		
	}
	
	public function pjActionTerm()
	{
		$arr = pjOptionModel::factory()
			->where('t1.foreign_id', $this->getForeignId())
			->orderBy('t1.order ASC')
			->findAll()
			->getData();
			
		$arr['i18n'] = pjMultiLangModel::factory()->getMultiLang(1, 'pjOption');

		$this->set('arr', $arr);
			
		$locale_arr = pjLocaleModel::factory()->select('t1.*, t2.file')
			->join('pjLocaleLanguage', 't2.iso=t1.language_iso', 'left')
			->where('t2.file IS NOT NULL')
			->orderBy('t1.sort ASC')->findAll()->getData();
			
		$lp_arr = array();
		foreach ($locale_arr as $item)
		{
			$lp_arr[$item['id']."_"] = $item['file'];
		}
		$this->set('lp_arr', $locale_arr);
		$this->set('locale_str', pjAppController::jsonEncode($lp_arr));
			
		$this->appendJs('jquery.multilang.js', PJ_FRAMEWORK_LIBS_PATH . 'pj/js/');
		$this->appendJs('jquery.tipsy.js', PJ_THIRD_PARTY_PATH . 'tipsy/');
		$this->appendCss('jquery.tipsy.css', PJ_THIRD_PARTY_PATH . 'tipsy/');
		$this->appendJs('pjAdminOptions.js');
				
		
	}
	
	public function pjActionTicket()
	{
		$arr = pjOptionModel::factory()
			->where('t1.foreign_id', $this->getForeignId())
			->orderBy('t1.order ASC')
			->findAll()
			->getData();

		$arr['i18n'] = pjMultiLangModel::factory()->getMultiLang(1, 'pjOption');

		$this->set('arr', $arr);

		$locale_arr = pjLocaleModel::factory()->select('t1.*, t2.file')
			->join('pjLocaleLanguage', 't2.iso=t1.language_iso', 'left')
			->where('t2.file IS NOT NULL')
			->orderBy('t1.sort ASC')->findAll()->getData();

		$lp_arr = array();
		foreach ($locale_arr as $item)
		{
			$lp_arr[$item['id']."_"] = $item['file'];
		}
		$this->set('lp_arr', $locale_arr);
		$this->set('locale_str', pjAppController::jsonEncode($lp_arr));

		$this->appendJs('jquery.multilang.js', PJ_FRAMEWORK_LIBS_PATH . 'pj/js/');
		$this->appendJs('jquery.tipsy.js', PJ_THIRD_PARTY_PATH . 'tipsy/');
		$this->appendCss('jquery.tipsy.css', PJ_THIRD_PARTY_PATH . 'tipsy/');
		$this->appendJs('pjAdminOptions.js');
	
		
	}
	
	public function pjActionNotification()
	{
		$arr = pjOptionModel::factory()
			->where('t1.foreign_id', $this->getForeignId())
			->orderBy('t1.order ASC')
			->findAll()
			->getData();
			
		$arr['i18n'] = pjMultiLangModel::factory()->getMultiLang(1, 'pjOption');

		$this->set('arr', $arr);
			
		$locale_arr = pjLocaleModel::factory()->select('t1.*, t2.file')
			->join('pjLocaleLanguage', 't2.iso=t1.language_iso', 'left')
			->where('t2.file IS NOT NULL')
			->orderBy('t1.sort ASC')->findAll()->getData();
			
		$lp_arr = array();
		foreach ($locale_arr as $item)
		{
			$lp_arr[$item['id']."_"] = $item['file'];
		}
		$this->set('lp_arr', $locale_arr);
		$this->set('locale_str', pjAppController::jsonEncode($lp_arr));
			
		$this->appendJs('jquery.multilang.js', PJ_FRAMEWORK_LIBS_PATH . 'pj/js/');
		$this->appendJs('jquery.tipsy.js', PJ_THIRD_PARTY_PATH . 'tipsy/');
		$this->appendCss('jquery.tipsy.css', PJ_THIRD_PARTY_PATH . 'tipsy/');
		$this->appendJs('tinymce.min.js', PJ_THIRD_PARTY_PATH . 'tinymce/');
		$this->appendJs('pjAdminOptions.js');
		
	}
	
	public function pjActionInstall()
	{
		$locale_arr = pjLocaleModel::factory()->select('t1.*, t2.title')
			->join('pjLocaleLanguage', 't2.iso=t1.language_iso', 'left outer')
			->orderBy('t1.sort ASC')->findAll()->getData();
		$this->set('locale_arr', $locale_arr);
				
		$this->appendJs('pjAdminOptions.js');
		
	}
		
	public function pjActionPreview()
	{
		$this->setLayout('pjActionEmpty');
	}
	

	public function pjActionDeleteTicket()
	{
		$this->setAjax(true);
	
		if ($this->isXHR())
		{
			$response = array();
	
			if(!empty($this->option_arr['o_ticket_image']))
			{
				@unlink(PJ_INSTALL_PATH . $this->option_arr['o_ticket_image']);
			}
			
			pjOptionModel::factory()
				->where('foreign_id', $this->getForeignId())
				->where('`key`', 'o_ticket_image')
				->limit(1)
				->modifyAll(array('value' => ":NULL"));

			$response['code'] = 200;
			
			pjAppController::jsonResponse($response);
		}
	}
	public function pjActionUpdateTheme()
	{
		$this->setAjax(true);
	
		if ($this->isXHR())
		{
			pjOptionModel::factory()
			->where('foreign_id', $this->getForeignId())
			->where('`key`', 'o_theme')
			->limit(1)
			->modifyAll(array('value' => 'theme1|theme2|theme3|theme4|theme5|theme6|theme7|theme8|theme9|theme10::theme' . $_GET['theme']));
	
		}
	}
	

	public function pjActionDocumentUpload() {
		$this->appendJs('tmpl.min.js', PJ_THIRD_PARTY_PATH . 'jquery_file_upload/js/');
		$this->appendJs('jquery.fileupload.js', PJ_THIRD_PARTY_PATH . 'jquery_file_upload/js/');
		$this->appendJs('jquery.fileupload-process.js', PJ_THIRD_PARTY_PATH . 'jquery_file_upload/js/');
		$this->appendJs('jquery.fileupload-validate.js', PJ_THIRD_PARTY_PATH . 'jquery_file_upload/js/');
		$this->appendJs('jquery.fileupload-ui.js', PJ_THIRD_PARTY_PATH . 'jquery_file_upload/js/');
		
		$this->appendCss('jquery.fileupload.css', PJ_THIRD_PARTY_PATH . 'jquery_file_upload/css/');
		$this->appendCss('jquery.fileupload-ui.css', PJ_THIRD_PARTY_PATH . 'jquery_file_upload/css/');

		$this->appendJs('pdf.js', PJ_THIRD_PARTY_PATH . 'pdfjs/build/');
		$this->appendJs('pjActionDocumentUpload.js');
		$this->appendJs('jquery.xdr-transport.js', PJ_THIRD_PARTY_PATH . 'jquery_file_upload/js/cors/');
	}
	public function getDocuments() {
		$pjDocumentModel = pjDocumentModel::factory()
									->findAll()
									->limit(1)
									->offset(1)
									->getData();
		return	$pjDocumentModel;
	}
	public function getDocument($id) {
		$pjDocumentModel = pjDocumentModel::factory()
									->where('t1.id', $id)
									->findAll()
									->limit(1)
									->offset(1)
									->getData();
		return $pjDocumentModel;
	}
	public function fileUploadEventHandler() {
		$isDelete = false;
		if ($_SERVER['REQUEST_METHOD'] === 'POST') {
			
			$this->options = array(
				'upload_dir' => PJ_UPLOAD_PATH.'documents/',
				'upload_url' => PJ_UPLOAD_PATH.'documents/',
				'image_file_types' => '/\.(gif|jpe?g|png|pdf)$/i',
			);

			$upload_handler = new UploadHandler($this->options);
			$this->response = $upload_handler->response;

			if(is_array($this->response) && array_key_exists('files', $this->response) && !empty($this->response)) {
				foreach($this->response['files'] as $res) {
					$this->data = array(
						'name' => $res->name,
						'size' => $res->size,
						'url' => $res->url,
						'deleteUrl' => $res->deleteUrl,
						'deleteType' => $res->deleteType
					);
				}
			}
			// Save to database
			$pjDocumentModel = pjDocumentModel::factory();
			$id = $pjDocumentModel->setAttributes($this->data)->insert()->getInsertId();
			$data = $this->getDocument($id);

			pjAppController::jsonResponse(
				array(
					'data' => array('files' => $data),
					'status' => 200,
					'message' => 'Document has been successfully uploaded'
				)
			);
		} else if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
			
			$this->options = array(
				'upload_dir' => PJ_UPLOAD_PATH.'documents/',
				'upload_url' => PJ_UPLOAD_PATH.'documents/',
				'image_file_types' => '/\.(gif|jpe?g|png|pdf)$/i',
			);
			$this->setRequest($_REQUEST);
			if(!empty($this->request['id']) || isset($this->request['id'])) {
				$this->setId($this->request['id']);
			}
			
			if($this->id) {
				$this->data = $this->getDocument($this->id);
				pjDocumentModel::factory()->where('id', $this->id)->eraseAll();
				$isDelete = true;
			}

			if($isDelete) {
				$upload_handler = new UploadHandler($this->options);
				if($upload_handler) {
					pjAppController::jsonResponse(
						array(
							'data' => $this->data,
							'message' => 'Your document has been successfully deleted',
							'status' => 200
						)
					);
				} else {
					pjAppController::jsonResponse(
						array(
							'message' => $upload_handler,
							'status' => 200
						)
					);
				}
				
			} else {
				pjAppController::jsonResponse(
					array(
						'message' => 'Something went to wrong!',
						'status' => 200
					)
				);
			}
		} else {
			if($this->getDocuments()) {
				$this->response = $this->getDocuments();
				if(is_array($this->response) && !empty($this->response)) {
					foreach($this->response as $res) {
						$this->data['files'][] = array(
							'id' => $res['id'],
							'name' => $res['name'],
							'size' => $res['size'],
							'url' => $res['url'],
							'deleteUrl' => $res['deleteUrl'],
							'deleteType' => $res['deleteType']
						);
					}
				}
				pjAppController::jsonResponse(
					array(
						'data' => $this->data,
						'status' => 200
					)
				);
			}
			pjAppController::jsonResponse(
				array(
					'data' => [],
					'status' => 200
				)
			);
			
		}
		exit;
	}
	/*
	public function fileDeleteEventHandler() {
		$isDelete = false;
		if ($_SERVER['REQUEST_METHOD'] === 'DELETE') {
			$this->options = array(
				'upload_dir' => PJ_UPLOAD_PATH.'documents/',
				'upload_url' => PJ_UPLOAD_PATH.'documents/',
				'image_file_types' => '/\.(gif|jpe?g|png|pdf)$/i',
			);
			$this->setRequest($_REQUEST);
			if(!empty($this->request['id']) || isset($this->request['id'])) {
				$this->setId($this->request['id']);
			}
			
			if($this->id) {
				$this->data = $this->getDocument($this->id);
				pjDocumentModel::factory()->where('id', $this->id)->eraseAll();
				$isDelete = true;
			}

			if($isDelete) {
				$upload_handler = new UploadHandler($this->options);
				if($upload_handler) {
					pjAppController::jsonResponse(
						array(
							'data' => $this->data,
							'message' => 'Your document has been successfully deleted',
							'status' => 200
						)
					);
				} else {
					pjAppController::jsonResponse(
						array(
							'message' => $upload_handler,
							'status' => 200
						)
					);
				}
				
			} else {
				pjAppController::jsonResponse(
					array(
						'message' => 'Something went to wrong!',
						'status' => 200
					)
				);
			}
			
			
		}
		pjAppController::jsonResponse(
			array(
				'message' => 'Invalid Request!',
				'status' => 200
			)
		);
		exit;
	}
	*/
}
?>