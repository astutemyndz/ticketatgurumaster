<?php
if (!defined("ROOT_PATH"))
{
	header("HTTP/1.1 403 Forbidden");
	exit;
}

class pjAdminEvents extends pjAdmin
{
	private $eventId;
	public $sessionShow = 'pjShow_session';
	private $currentDate = null;
	private $eventType = null;
	private $artist = array();
	public function setEventId($eventId) {
		$this->eventId = $eventId;
		return $this;
	}
	public function setEventType($eventType) {
		$this->eventType = $eventType;
		return $this;
	}
	public function setArtist($artist) {
		$this->artist = $artist;
		return $this;
	}
	public function pjActionCreate()
	{
		
		
		// echo "<pre>";
		// print_r($artists);
		// exit;
			$post_max_size = pjUtil::getPostMaxSize();
			if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_SERVER['CONTENT_LENGTH']) && (int) $_SERVER['CONTENT_LENGTH'] > $post_max_size)
			{
				pjUtil::redirect(PJ_INSTALL_URL . "admin.php?controller=pjAdminEvents&action=pjActionIndex&err=AE05");
			}
			if (isset($_POST['event_create']))
			{
				$pjEventModel = pjEventModel::factory();
				$date_time = $_POST['date_time'];
				if(count(explode(" ", $date_time)) == 3)
				{
					list($_date, $_time, $_period) = explode(" ", $date_time);
					$time = pjUtil::formatTime($_time . ' ' . $_period, $this->option_arr['o_time_format']);
				} else {
					list($_date, $_time) = explode(" ", $date_time);
					$time = pjUtil::formatTime($_time, $this->option_arr['o_time_format']);
				}
				
				
				$data['date_time'] 	= pjUtil::formatDate($_date, $this->option_arr['o_date_format']) . ' ' . $time;
				$data['date_time'] 	= pjUtil::formatDate($_date, $this->option_arr['o_date_format']) . ' ' . $time;
				
				$data['date_time'] = pjUtil::formatDate($_date, $this->option_arr['o_date_format']) . ' ' . $time;
				if(isset($_POST['slug']) && !empty($_POST['slug'])) {
					$this->setSlug($this->sanitize($_POST['slug']));
				} 
				/*
				else {
					$this->setSlug($this->sanitize($_POST['i18n'][$this->getLocaleId()]['title']));
				}
				*/

				
				$data['slug'] 		= $this->slug;

				if(isset($_POST['event_type']) && !empty($_POST['event_type'])) {
					$this->setEventType($_POST['event_type']);
				}
				$data['event_type'] = $this->eventType;

				$id = $pjEventModel->setAttributes(array_merge($_POST, $data))->insert()->getInsertId();
				if ($id !== false && (int) $id > 0)
				{
				/** Save show time */
				$this->beforeSaveEventDateTime();
				$STORE = $_SESSION[$this->sessionShow];
				
				// assign an artist to event tk_cbs_assign_artist_to_event
				if(isset($_POST['artist']) && !empty($_POST['artist'])) 
				{
					$this->setArtist($_POST['artist']);
				} 
				
				$pjAssignArtistToEventModel = pjAssignArtistToEventModel::factory();
				if($this->artist)
				{
					foreach($this->artist as $artistId) 
					{
						$pjAssignArtistToEventModel->setAttributes(array('id_events' => $id, 'id_artists' => $artistId))->insert()->getInsertId();
					}
				}
				// tk_cbs_assign_artist_to_event
				$duplidated = $this->pjActionCheckShow();
				if($duplidated == true)
				{
					$pjShowModel = pjShowModel::factory();
					$data = array();
					$date_time = $STORE['date_time'];
					if(count(explode(" ", $date_time)) == 3)
					{
						list($_date, $_time, $_period) = explode(" ", $date_time);
						$time = pjUtil::formatTime($_time . ' ' . $_period, $this->option_arr['o_time_format']);
					}else{
						list($_date, $_time) = explode(" ", $date_time);
						$time = pjUtil::formatTime($_time, $this->option_arr['o_time_format']);
					}
					$data[$pjShowModel->getTable()]['event_id'] = $id;
					$data[$pjShowModel->getTable()]['venue_id'] = 39;
					//$data[$pjShowModel->getTable()]['venue_id'] = $STORE['venue_id'][$key];
					//$data[$pjShowModel->getTable()]['price_id'] = $STORE['price_id'][$key];
					//$data[$pjShowModel->getTable()]['price'] 	= $STORE['price'][$key];
					$data[$pjShowModel->getTable()]['date_time'] = pjUtil::formatDate($_date, $this->option_arr['o_date_format']) . ' ' . $time;
				// 	echo "<pre>";
				// print_r($data[$pjShowModel->getTable()]);
				// exit;
					$pjShowModel->reset()->setAttributes($data[$pjShowModel->getTable()])->insert()->getInsertId();

					$_SESSION[$this->sessionShow] = NULL;
					unset($_SESSION[$this->sessionShow]);
				}
				/** Save show time */

					$pjMultiLangModel = pjMultiLangModel::factory();
					$pjPriceModel = pjPriceModel::factory();
					if (isset($_POST['i18n']))
					{
						

						$pjMultiLangModel->saveMultiLang($_POST['i18n'], $id, 'pjEvent', 'data');
					
						if(isset($_POST['index_arr']) && $_POST['index_arr'] != '')
						{
							$index_arr = explode("|", $_POST['index_arr']);
							foreach($index_arr as $k => $v)
							{
								if(strpos($v, 'fd') !== false)
								{
									$p_data = array();
									$p_data['event_id'] = $id;
									$price_id = $pjPriceModel->reset()->setAttributes($p_data)->insert()->getInsertId();
									if ($price_id !== false && (int) $price_id > 0)
									{
										foreach ($_POST['i18n'] as $locale => $locale_arr)
										{
											foreach ($locale_arr as $field => $content)
											{
												if(is_array($content))
												{
													$insert_id = $pjMultiLangModel->reset()->setAttributes(array(
															'foreign_id' => $price_id,
															'model' => 'pjPrice',
															'locale' => $locale,
															'field' => $field,
															'content' => $content[$v],
															'source' => 'data'
													))->insert()->getInsertId();
												}
											}
										}
									}
								}
							}
						}
					
					}
					
					if (isset($_FILES['event_img']))
					{
						if($_FILES['event_img']['error'] == 0)
						{
							if(getimagesize($_FILES['event_img']["tmp_name"]) != false)
							{
								if (is_writable('app/web/upload/events'))
								{
									$Image = new pjImage();
									if ($Image->getErrorCode() !== 200)
									{
										$Image->setAllowedTypes(array('image/png', 'image/gif', 'image/jpg', 'image/jpeg', 'image/pjpeg'));
										if ($Image->load($_FILES['event_img']))
										{
											$resp = $Image->isConvertPossible();
											if ($resp['status'] === true)
											{
												$hash = md5(uniqid(rand(), true));
												$image_path = PJ_UPLOAD_PATH . 'events/' . $id . '_' . $hash . '.' . $Image->getExtension();
												
												$Image->loadImage($_FILES['event_img']["tmp_name"]);
												$Image->resizeSmart(290, 170);
												$Image->saveImage($image_path);
												$data = array();
												$data['event_img'] = $image_path;
																			
												$pjEventModel->reset()->where('id', $id)->limit(1)->modifyAll($data);
											}
										}
									}
								}else{
									pjUtil::redirect($_SERVER['PHP_SELF'] . "?controller=pjAdminEvents&action=pjActionUpdate&id=$id&err=AE11");
								}
							}else{
								pjUtil::redirect($_SERVER['PHP_SELF'] . "?controller=pjAdminEvents&action=pjActionUpdate&id=$id&err=AE12");
							}
						}else if($_FILES['event_img']['error'] != 4){
							pjUtil::redirect($_SERVER['PHP_SELF'] . "?controller=pjAdminEvents&action=pjActionUpdate&id=$id&err=AE09");
						}
					}
					
					$err = 'AE03';
					
					pjUtil::redirect($_SERVER['PHP_SELF'] . "?controller=pjAdminEvents&action=pjActionUpdate&id=$id&err=$err");
				} else {
					$err = 'AE04';
					pjUtil::redirect($_SERVER['PHP_SELF'] . "?controller=pjAdminEvents&action=pjActionIndex&err=$err");
				}
				
			} else {
				/** Get List of Artist */
				$pjArtistsModel = pjArtistsModel::factory();
				$artists 		= $pjArtistsModel->join('pjMultiLang', "t2.model='pjArtist' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
									->where('t1.deleted_at', NULL)
									->select(" t1.id, t2.content as name")
									->orderBy("t1.id ASC")
									->findAll()
									->getData();
				if(!empty($artists) && isset($artists)) {
					$this->set('artists', $artists);
				} else {
					$this->set('artists', []);
				}

				/** Get List of Artist */

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
				
				$this->appendJs('jquery.validate.min.js', PJ_THIRD_PARTY_PATH . 'validate/');
				$this->appendJs('additional-methods.js', PJ_THIRD_PARTY_PATH . 'validate/');
				$this->appendJs('jquery.multilang.js', PJ_FRAMEWORK_LIBS_PATH . 'pj/js/');
				$this->appendJs('jquery.tipsy.js', PJ_THIRD_PARTY_PATH . 'tipsy/');
				$this->appendCss('jquery.tipsy.css', PJ_THIRD_PARTY_PATH . 'tipsy/');
				$this->appendJs('tinymce.min.js', PJ_THIRD_PARTY_PATH . 'tinymce/');
				$this->appendJs('jquery.validate.min.js', PJ_THIRD_PARTY_PATH . 'validate/');
				$this->appendJs('jquery-ui-sliderAccess.js', PJ_THIRD_PARTY_PATH . 'timepicker/');
				$this->appendJs('jquery-ui-timepicker-addon.js', PJ_THIRD_PARTY_PATH . 'timepicker/');
				$this->appendCss('jquery-ui-timepicker-addon.css', PJ_THIRD_PARTY_PATH . 'timepicker/');
				// $this->appendJs('jquery.multiselect.min.js', PJ_THIRD_PARTY_PATH . 'multiselect/');
				// $this->appendCss('jquery.multiselect.css', PJ_THIRD_PARTY_PATH . 'multiselect/');
				$this->appendCss('select2.min.css', PJ_THIRD_PARTY_PATH . 'select2/css/');
				$this->appendJs('select2.min.js', PJ_THIRD_PARTY_PATH . 'select2/js/');
				
				$this->appendJs('pjAdminEvents.js');
			}
		
	}
	############################# Delete Event Start fo Code ###############################
	public function pjActionDeleteEvent()
	{
		$this->setAjax(true);
	
		if ($this->isXHR())
		{
			$response = array();

			if (isset($_GET['id']) && !empty($_GET['id']))
			{
				$this->setEventId($_GET['id']);
			}
			// Set deleteGarbageRecord
			if (isset($_GET['deleteGarbageRecord']) && !empty($_GET['deleteGarbageRecord']) && $_GET['deleteGarbageRecord'] == 1)
			{
				$this->setDeleteGarbageRecord($_GET['deleteGarbageRecord']);
			}
			
			if($this->deleteGarbageRecord) {
				// Delete data for permanently
				$pjEventModel = pjEventModel::factory();
				$arr = $pjEventModel->find($this->eventId)->getData();
				
				if ($pjEventModel->setAttributes(array('id' => $this->eventId))->erase()->getAffectedRows() == 1)
				{
					if (file_exists(PJ_INSTALL_PATH . $arr['event_img'])) 
					{
						@unlink(PJ_INSTALL_PATH . $arr['event_img']);
					}
					
					pjMultiLangModel::factory()->where('model', 'pjEvent')->where('foreign_id', $this->eventId)->eraseAll();
					
					$response['code'] = 200;
				} else {
					$response['code'] = 100;
				}
			} else {
				// Delete event for trust 
				if($this->delete('pjEventModel', 'id', $this->eventId)) {

					$this->deleteMultiLang(array('model' => 'pjEvent', 'foreign_id' => $this->eventId));

					/// delete show for trust
				
					//$this->delete('pjShowModel', 'id', $this->eventId);
					//$this->delete('pjShowSeatModel', 'event_id', $this->eventId);


					//$this->delete('pjBookingModel', 'event_id', $this->eventId);
					//$this->delete('pjBookingTicketModel', 'event_id', $this->eventId);
					
					$response['code'] = 200;
				} else {
					$response['code'] = 100;
				}

				

			}
			
			
			
			pjAppController::jsonResponse($response);
		}
		exit;
	}
	############################# Delete Event End of Code ###############################
	
	############################# Bulk Events Delete ###############################
	
	public function pjActionDeleteEventBulk()
	{
		$this->setAjax(true);
		$bookedConfirmEvent = false;
		$confirmedId = false;
		if ($this->isXHR())
		{
			if (isset($_POST['record']) && count($_POST['record']) > 0)
			{
				// Set deleteGarbageRecord
				if (isset($_GET['deleteBulkGarbageRecord']) && !empty($_GET['deleteBulkGarbageRecord']) && $_GET['deleteBulkGarbageRecord'] == 1)
				{
					$this->setDeleteBulkGarbageRecord($_GET['deleteBulkGarbageRecord']);
				}

				if (isset($_GET['viewGarbageRecord']) && !empty($_GET['viewGarbageRecord']) && $_GET['viewGarbageRecord'] == 1)
				{
					$this->setViewGarbageRecord($_GET['viewGarbageRecord']);
				}

				if($this->deleteBulkGarbageRecord && $this->viewGarbageRecord) {

					// Delete data for permanently
				
					$pjEventModel = pjEventModel::factory();
					$bookedEventDataArr = pjBookingModel::factory()->whereIn('event_id', $_POST['record'])->findAll()->getDataPair("event_id", "event_id");
					if(is_array($bookedEventDataArr) && !empty($bookedEventDataArr)) {
						$bookedConfirmEvent = true;
					}
					
					if($bookedConfirmEvent) {
						$confirmed_id_arr = pjBookingModel::factory()->whereIn('event_id', $_POST['record'])->where('t1.status', 'confirmed')->findAll()->getDataPair("event_id", "event_id");
					} else {
						$confirmed_id_arr = [];
					}
					//print_r($confirmed_id_arr);
					//exit;
					if(is_array($confirmed_id_arr) && !empty($confirmed_id_arr)) {
						$confirmedId = true;
					} else {
						$confirmedId = false;
					} 
					
					if($confirmedId) {
						$arr = $pjEventModel->whereIn('id', $_POST['record'])->whereNotIn('id', $confirmed_id_arr)->findAll()->getData();
					} else {
						$arr = $pjEventModel->whereIn('id', $_POST['record'])->findAll()->getData();
					}
					// print_r($arr);
					// exit;
					foreach($arr as $v)
					{
						if (file_exists(PJ_INSTALL_PATH . $v['event_img']))
						{
							@unlink(PJ_INSTALL_PATH . $v['event_img']);
						}
					}
					if($confirmedId) {
						$pjEventModel->reset()->whereIn('id', $_POST['record'])->whereNotIn('id', $confirmed_id_arr)->eraseAll();
						pjMultiLangModel::factory()->where('model', 'pjEvent')->whereIn('foreign_id', $_POST['record'])->eraseAll();
					} else {
						$pjEventModel->reset()->whereIn('id', $_POST['record'])->eraseAll();
						pjMultiLangModel::factory()->where('model', 'pjEvent')->whereIn('foreign_id', $_POST['record'])->eraseAll();
					}
					
					
				} else {
					// Delete data for trust 
					$this->delete('pjEventModel', 'id', $_POST['record']);
					$this->deleteMultiLang(array('model' => 'pjEvent', 'foreign_id' => $_POST['record']));
				}
			}
		}
		exit;
	}
	############################# Bulk Events Delete ###############################
	public function pjActionExportEvent()
	{
		
		
		if (isset($_POST['record']) && is_array($_POST['record']))
		{
			$arr = pjEventModel::factory()
				->select('t1.id, t2.content as name')
				->join('pjMultiLang', "t2.model='pjEvent' AND t2.foreign_id=t1.id AND t2.field='name' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
				->whereIn('id', $_POST['record'])
				->findAll()
				->getData();
			$csv = new pjCSV();
			$csv
				->setHeader(true)
				->setName("Events-".time().".csv")
				->process($arr)
				->download();
		}
		exit;
	}
	
	public function pjActionGetEvent()
	{
		$this->setAjax(true);
	
		if ($this->isXHR())
		{
			if (isset($_GET['viewGarbageRecord']) && !empty($_GET['viewGarbageRecord']) && $_GET['viewGarbageRecord'] == 1)
			{
				$this->setViewGarbageRecord($_GET['viewGarbageRecord']);
			}
			$pjEventModel = pjEventModel::factory()
				->join('pjMultiLang', "t2.model='pjEvent' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer');
			
			if (isset($_GET['q']) && !empty($_GET['q']))
			{
				$q = pjObject::escapeString($_GET['q']);
				$pjEventModel->where('t2.content LIKE', "%$q%");
			}
			if (isset($_GET['status']) && !empty($_GET['status']) && in_array($_GET['status'], array('T', 'F')))
			{
				$pjEventModel->where('t1.status', $_GET['status']);
			}

			if($this->viewGarbageRecord) {
				$pjEventModel->where('t1.deleted_at != ""');
			} else {
				// Default
				$pjEventModel->where('t1.deleted_at', NULL);
			}
			

			$column = 'created';
			$direction = 'ASC';
			if (isset($_GET['direction']) && isset($_GET['column']) && in_array(strtoupper($_GET['direction']), array('ASC', 'DESC')))
			{
				$column = $_GET['column'];
				$direction = strtoupper($_GET['direction']);
			}

			$total = $pjEventModel->findCount()->getData();
			$rowCount = isset($_GET['rowCount']) && (int) $_GET['rowCount'] > 0 ? (int) $_GET['rowCount'] : 10;
			$pages = ceil($total / $rowCount);
			$page = isset($_GET['page']) && (int) $_GET['page'] > 0 ? intval($_GET['page']) : 1;
			$offset = ((int) $page - 1) * $rowCount;
			if ($page > $pages)
			{
				$page = $pages;
			}

			$data = array();
			
			$data = $pjEventModel
				->select(" t1.*, t2.content as title, (SELECT COUNT(TB.id) FROM `".pjBookingModel::factory()->getTable()."` AS TB WHERE TB.event_id=t1.id AND TB.status='confirmed' AND TB.created = DATE_ADD(CURDATE(), INTERVAL 7 DAY)) AS cnt_confirmed")
				->orderBy("$column $direction")
				->limit($rowCount, $offset)
				->findAll()
				->getData();
				
			pjAppController::jsonResponse(compact('data', 'total', 'pages', 'page', 'rowCount', 'column', 'direction'));
		}
		exit;
	}
	
	public function pjActionIndex()
	{
		
			$this->appendCss('select2.min.css', PJ_THIRD_PARTY_PATH . 'select2/css/');
			$this->appendJs('select2.min.js', PJ_THIRD_PARTY_PATH . 'select2/js/');
			$this->appendJs('jquery.datagrid.js', PJ_FRAMEWORK_LIBS_PATH . 'pj/js/');
			$this->appendJs('pjAdminEvents.js');
		
	}
	
	public function pjActionSaveEvent()
	{
		$this->setAjax(true);
	
		if ($this->isXHR())
		{
			$pjEventModel = pjEventModel::factory();
			if (isset($_GET['viewGarbageRecord']) && !empty($_GET['viewGarbageRecord']) && $_GET['viewGarbageRecord'] == 1)
			{
				$this->setViewGarbageRecord($_GET['viewGarbageRecord']);
			}
			if (!in_array($_POST['column'], $pjEventModel->i18n))
			{
				$this->setStatus($_POST['value']);
			} else {
				pjMultiLangModel::factory()->updateMultiLang(array($this->getLocaleId() => array($_POST['column'] => $_POST['value'])), $_GET['id'], 'pjEvent', 'data');
			}

			if($this->status === 'T') {
				$this->setData(array('deleted_at' => '', $_POST['column'] => $_POST['value']));
			} else {
				$this->setData(array('deleted_at' => pjAdmin::DefaultTimestamp(), $_POST['column'] => $_POST['value']));
			}

			
			if($this->viewGarbageRecord) {
				$this->restore('pjEventModel', 'id', $_GET['id']);
				$this->restoreMultiLang(array('foreign_id' => $_POST['id'], 'model' => 'pjEvent', 'locale' => $this->getLocaleId(), 'data' => $this->data));
			} else {
				$value = $_POST['value'];
				$pjEventModel->where('id', $_GET['id'])->limit(1)->modifyAll(array($_POST['column'] => $value));
			}
		}
		exit;
	}
	
	public function pjActionUpdate()
	{
		
			$post_max_size = pjUtil::getPostMaxSize();
			if ($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_SERVER['CONTENT_LENGTH']) && (int) $_SERVER['CONTENT_LENGTH'] > $post_max_size)
			{
				pjUtil::redirect(PJ_INSTALL_URL . "admin.php?controller=pjAdminEvents&action=pjActionIndex&err=AE06");
			}	
			if (isset($_POST['event_update']))
			{
				$pjEventModel = pjEventModel::factory();
				$pjSeatModel = pjSeatModel::factory();
				$this->setEventId($_POST['id']);
				$arr = $pjEventModel->find($_POST['id'])->getData();
				if (empty($arr))
				{
					pjUtil::redirect($_SERVER['PHP_SELF'] . "?controller=pjAdminEvents&action=pjActionIndex&err=AE08");
				}
				
				$data = array();
				
				if (isset($_FILES['event_img']))
				{
					if($_FILES['event_img']['error'] == 0)
					{
						if(getimagesize($_FILES['event_img']["tmp_name"]) != false)
						{
							if (is_writable('app/web/upload/events'))
							{
								if (file_exists(PJ_INSTALL_PATH . $arr['event_img']))
								{
									@unlink(PJ_INSTALL_PATH . $arr['event_img']);
								}
								
								$Image = new pjImage();
								if ($Image->getErrorCode() !== 200)
								{
									$Image->setAllowedTypes(array('image/png', 'image/gif', 'image/jpg', 'image/jpeg', 'image/pjpeg'));
									if ($Image->load($_FILES['event_img']))
									{
										$resp = $Image->isConvertPossible();
										if ($resp['status'] === true)
										{
											$hash = md5(uniqid(rand(), true));
											$image_path = PJ_UPLOAD_PATH . 'events/' . $_POST['id'] . '_' . $hash . '.' . $Image->getExtension();
											
											$Image->loadImage($_FILES['event_img']["tmp_name"]);
											//$Image->resizeSmart(289, 170);
											$Image->saveImage($image_path);
											$data['event_img'] = $image_path;
											
										}
									}
								}
							}else{
								pjUtil::redirect($_SERVER['PHP_SELF'] . "?controller=pjAdminEvents&action=pjActionUpdate&id=".$_POST['id']."&err=AE11");
							}
						}else{
							pjUtil::redirect($_SERVER['PHP_SELF'] . "?controller=pjAdminEvents&action=pjActionUpdate&id=".$_POST['id']."&err=AE12");
						}
					}else if($_FILES['event_img']['error'] != 4){
						pjUtil::redirect($_SERVER['PHP_SELF'] . "?controller=pjAdminEvents&action=pjActionUpdate&id=".$_POST['id']."&err=AE10");
					}
				}
				$date_time = $_POST['date_time'];
				if(count(explode(" ", $date_time)) == 3)
				{
					list($_date, $_time, $_period) = explode(" ", $date_time);
					$time = pjUtil::formatTime($_time . ' ' . $_period, $this->option_arr['o_time_format']);
				} else {
					list($_date, $_time) = explode(" ", $date_time);
					$time = pjUtil::formatTime($_time, $this->option_arr['o_time_format']);
				}
				
				$data['date_time'] = pjUtil::formatDate($_date, $this->option_arr['o_date_format']) . ' ' . $time;
				if(isset($_POST['slug']) && !empty($_POST['slug'])) {
					$this->setSlug($this->sanitize($_POST['slug']));
				} else {
					$this->setSlug($this->sanitize($_POST['i18n'][$this->getLocaleId()]['title']));
				}
				$data['slug'] 		= $this->slug;
				if(isset($_POST['event_type']) && !empty($_POST['event_type'])) {
					$this->setEventType($_POST['event_type']);
				}
				$data['event_type'] = $this->eventType;
				$pjEventModel->reset()->where('id', $_POST['id'])->limit(1)->modifyAll(array_merge($_POST, $data));

				/** Save show time */
				$this->beforeSaveEventDateTime();
				$STORE = $_SESSION[$this->sessionShow];
				
				/** ####################### Update artist assign table ######################################*/
				if(isset($_POST['artist']) && !empty($_POST['artist'])) 
				{
					$this->setArtist($_POST['artist']);
				} 
				
				$pjAssignArtistToEventModel = pjAssignArtistToEventModel::factory();
				if($this->artist)
				{
					pjAssignArtistToEventModel::factory()->where('id_events',$this->eventId)->eraseAll();
					foreach($this->artist as $artistId) 
					{
						$pjAssignArtistToEventModel->setAttributes(array('id_events' => $this->eventId, 'id_artists' => $artistId))->insert()->getInsertId();
					}
				}
				//exit;
				/** ####################### Update artist assign table  ######################################*/
				$duplidated = $this->pjActionCheckShow();
				if($duplidated == true)
				{
					$pjShowModel = pjShowModel::factory();
					$data = array();
					$date_time = $STORE['date_time'];
					if(count(explode(" ", $date_time)) == 3)
					{
						list($_date, $_time, $_period) = explode(" ", $date_time);
						$time = pjUtil::formatTime($_time . ' ' . $_period, $this->option_arr['o_time_format']);
					}else{
						list($_date, $_time) = explode(" ", $date_time);
						$time = pjUtil::formatTime($_time, $this->option_arr['o_time_format']);
					}
					$data[$pjShowModel->getTable()]['event_id'] = $STORE['id'];
					$data[$pjShowModel->getTable()]['venue_id'] = 39;
					//$data[$pjShowModel->getTable()]['venue_id'] = $STORE['venue_id'][$key];
					//$data[$pjShowModel->getTable()]['price_id'] = $STORE['price_id'][$key];
					//$data[$pjShowModel->getTable()]['price'] 	= $STORE['price'][$key];
					$data[$pjShowModel->getTable()]['date_time'] = pjUtil::formatDate($_date, $this->option_arr['o_date_format']) . ' ' . $time;

					$pjShowModel->reset()
								->where('id', $STORE['show_id'])
								->limit(1)
								->debug(true)
								->modifyAll($data[$pjShowModel->getTable()]);
					//exit;
					$_SESSION[$this->sessionShow] = NULL;
					unset($_SESSION[$this->sessionShow]);
				}
				/** Save show time */

				$pjMultiLangModel = pjMultiLangModel::factory();
				$pjPriceModel = pjPriceModel::factory();
				
					
				if (isset($_POST['i18n']))
				{
					
					
					$pjMultiLangModel->updateMultiLang($_POST['i18n'], $_POST['id'], 'pjEvent', 'data');
					
					if(isset($_POST['index_arr']) && $_POST['index_arr'] != '')
					{
						$index_arr = explode("|", $_POST['index_arr']);
						foreach($index_arr as $k => $v)
						{
							if(strpos($v, 'fd') !== false)
							{
								$p_data = array();
								$p_data['event_id'] = $_POST['id'];
								$price_id = $pjPriceModel->reset()->setAttributes($p_data)->insert()->getInsertId();
								if ($price_id !== false && (int) $price_id > 0)
								{
									foreach ($_POST['i18n'] as $locale => $locale_arr)
									{
										foreach ($locale_arr as $field => $content)
										{
											if(is_array($content))
											{
												$insert_id = $pjMultiLangModel->reset()->setAttributes(array(
														'foreign_id' => $price_id,
														'model' => 'pjPrice',
														'locale' => $locale,
														'field' => $field,
														'content' => $content[$v],
														'source' => 'data'
												))->insert()->getInsertId();
											}
										}
									}
								}
							}else{
								foreach ($_POST['i18n'] as $locale => $locale_arr)
								{
									foreach ($locale_arr as $field => $content)
									{
										if(is_array($content))
										{
											$sql = sprintf("INSERT INTO `%1\$s` (`id`, `foreign_id`, `model`, `locale`, `field`, `content`, `source`)
												VALUES (NULL, :foreign_id, :model, :locale, :field, :update_content, :source)
												ON DUPLICATE KEY UPDATE `content` = :update_content, `source` = :source;",
													$pjMultiLangModel->getTable()
											);
											$foreign_id = $v;
											$model = 'pjPrice';
											$source = 'data';
											$update_content = $content[$v];
											$modelObj = $pjMultiLangModel->reset()->prepare($sql)->exec(compact('foreign_id', 'model', 'locale', 'field', 'update_content', 'source'));
											if ($modelObj->getAffectedRows() > 0 || $modelObj->getInsertId() > 0)
											{
													
											}
										}
									}
								}
							}
						}
					}
				}
				if(isset($_POST['remove_arr']) && $_POST['remove_arr'] != '')
				{
					$remove_arr = explode("|", $_POST['remove_arr']);
					$pjMultiLangModel->reset()->where('model', 'pjPrice')->whereIn('foreign_id', $remove_arr)->eraseAll();
					$pjPriceModel->reset()->whereIn('id', $remove_arr)->eraseAll();
				}
				
				pjUtil::redirect($_SERVER['PHP_SELF'] . "?controller=pjAdminEvents&action=pjActionUpdate&id=".$_POST['id']."&err=AE01");
				
			} else {
				/** Get List of Artist */
				$pjArtistsModel = pjArtistsModel::factory();
				$artists 		= $pjArtistsModel->join('pjMultiLang', "t2.model='pjArtist' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
									->where('t1.deleted_at', NULL)
									->select(" t1.id, t2.content as name")
									->orderBy("t1.id ASC")
									->findAll()
									->getData();
				if(!empty($artists) && isset($artists)) {
					$this->set('artists', $artists);
				} else {
					$this->set('artists', []);
				}

				/** Get List of Artist */
				$this->setEventId($_GET['id']);
			

				$pjAssignArtistToEventModel = pjAssignArtistToEventModel::factory();
				$assignArtistToEventData 		= $pjAssignArtistToEventModel
									->select(" t1.id, t1.id_events, t1.id_artists")
									->where('t1.id_events', $this->eventId)
									->orderBy("t1.id ASC")
									->findAll()
									->getData();
				if(!empty($assignArtistToEventData) && isset($assignArtistToEventData)) {
					$this->set('assignArtistToEventData', $assignArtistToEventData);
				} else {
					$this->set('assignArtistToEventData', []);
				}

				// echo "<pre>";
				// print_r($assignArtistToEventData);
				// exit;
				
				$pjMultiLangModel = pjMultiLangModel::factory();
				
				$arr = pjEventModel::factory()->find($_GET['id'])->getData();
				$show_arr = pjShowModel::factory()
									->select("t1.*, (SELECT COUNT(TB.id) FROM `".pjBookingModel::factory()->getTable()."` AS TB WHERE TB.event_id=t1.event_id AND TB.date_time=t1.date_time AND TB.status='confirmed' AND TB.id IN (SELECT TBS.booking_id FROM `".pjBookingShowModel::factory()->getTable()."` AS TBS WHERE TBS.show_id=t1.id) ) AS cnt_confirmed")
									->where('t1.event_id', $_GET['id'])
									->orderBy("t1.date_time ASC")
									->limit(1)
									->findAll()
									->getData()[0];
									//echo "<pre>";
				//print_r($show_arr);
				//exit;
				if (count($arr) === 0)
				{
					pjUtil::redirect($_SERVER['PHP_SELF'] . "?controller=pjAdminEvents&action=pjActionIndex&err=AE08");
				}
				$arr['i18n'] = $pjMultiLangModel->getMultiLang($arr['id'], 'pjEvent');
				
				$locale_arr = pjLocaleModel::factory()->select('t1.*, t2.file')
					->join('pjLocaleLanguage', 't2.iso=t1.language_iso', 'left')
					->where('t2.file IS NOT NULL')
					->orderBy('t1.sort ASC')->findAll()->getData();
						
				$lp_arr = array();
				foreach ($locale_arr as $item)
				{
					$lp_arr[$item['id']."_"] = $item['file'];
				}
				
				$price_arr = pjPriceModel::factory()->where('event_id', $_GET['id'])->findAll()->getData();
				foreach($price_arr as $k => $v)
				{
					$price_arr[$k]['i18n'] = $pjMultiLangModel->reset()->getMultiLang($v['id'], 'pjPrice');
					
				}
				$this->set('price_arr', $price_arr);
				$this->set('show_arr', $show_arr);
				
				$this->set('lp_arr', $locale_arr);
				$this->set('locale_str', pjAppController::jsonEncode($lp_arr));
				$this->set('arr', $arr);
			
				$this->appendJs('jquery.validate.min.js', PJ_THIRD_PARTY_PATH . 'validate/');
				$this->appendJs('additional-methods.js', PJ_THIRD_PARTY_PATH . 'validate/');
				$this->appendJs('jquery.multilang.js', PJ_FRAMEWORK_LIBS_PATH . 'pj/js/');
				$this->appendJs('jquery.tipsy.js', PJ_THIRD_PARTY_PATH . 'tipsy/');
				$this->appendCss('jquery.tipsy.css', PJ_THIRD_PARTY_PATH . 'tipsy/');
				$this->appendJs('tinymce.min.js', PJ_THIRD_PARTY_PATH . 'tinymce/');

				$this->appendJs('jquery.validate.min.js', PJ_THIRD_PARTY_PATH . 'validate/');
				$this->appendJs('jquery-ui-sliderAccess.js', PJ_THIRD_PARTY_PATH . 'timepicker/');
				$this->appendJs('jquery-ui-timepicker-addon.js', PJ_THIRD_PARTY_PATH . 'timepicker/');
				$this->appendCss('jquery-ui-timepicker-addon.css', PJ_THIRD_PARTY_PATH . 'timepicker/');
				// $this->appendJs('jquery.multiselect.min.js', PJ_THIRD_PARTY_PATH . 'multiselect/');
				// $this->appendCss('jquery.multiselect.css', PJ_THIRD_PARTY_PATH . 'multiselect/');

				$this->appendCss('select2.min.css', PJ_THIRD_PARTY_PATH . 'select2/css/');
				$this->appendJs('select2.min.js', PJ_THIRD_PARTY_PATH . 'select2/js/');


				$this->appendJs('pjAdminEvents.js');
			}
		
	}
	
	public function pjActionShow()
	{
		
			if (isset($_POST['show_update']))
			{
				
			}else{
				if(isset($_SESSION[$this->sessionShow]))
				{
					$_SESSION[$this->sessionShow] = NULL;
					unset($_SESSION[$this->sessionShow]);
				}
				$arr = pjEventModel::factory()
					->join('pjMultiLang', "t2.model='pjEvent' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
					->select('t1.*, t2.content as title')
					->find($_GET['id'])
					->getData();
				
				$venue_arr = pjVenueModel::factory()
					->join('pjMultiLang', "t2.model='pjVenue' AND t2.foreign_id=t1.id AND t2.field='name' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
					->select('t1.*, t2.content as name')
					->where('t1.status', 'T')
					->orderBy("name ASC")
					->findAll()
					->getData();
				$price_arr = pjPriceModel::factory()
					->join('pjMultiLang', "t2.model='pjPrice' AND t2.foreign_id=t1.id AND t2.field='price_name' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
					->select('t1.*, t2.content as name')
					->where('t1.event_id', $_GET['id'])
					->orderBy("name ASC")
					->findAll()
					->getData();
				
				$show_arr = pjShowModel::factory()
					->select("t1.*, (SELECT COUNT(TB.id) FROM `".pjBookingModel::factory()->getTable()."` AS TB WHERE TB.event_id=t1.event_id AND TB.date_time=t1.date_time AND TB.status='confirmed' AND TB.id IN (SELECT TBS.booking_id FROM `".pjBookingShowModel::factory()->getTable()."` AS TBS WHERE TBS.show_id=t1.id) ) AS cnt_confirmed")
					->where('t1.event_id', $_GET['id'])
					->orderBy("t1.date_time ASC")
					->findAll()
					->getData();
				
				$show_id_arr = array();
				$venue_id_arr = array();
				
				$seat_arr = array();
				$seat_name_arr = array();
				$seat_count_arr = array();
				$seat_id_arr = array();
				$booked_id_arr = array();
				
				foreach($show_arr as $k => $v)
				{
					$show_id_arr[] = $v['id'];
					$venue_id_arr[] = $v['venue_id'];
				}
				if(!empty($show_id_arr))
				{
					$pjSeatModel = pjSeatModel::factory();
					$_seat_arr = $pjSeatModel
						->whereIn("t1.venue_id", $venue_id_arr)
						->findAll()
						->getData();
					
					foreach($_seat_arr as $k => $v)
					{
						$seat_arr[$v['venue_id']][] = $v['id'];
						$seat_name_arr[$v['venue_id']][] = $v['name'];
						$seat_count_arr[$v['venue_id']][] = $v['seats'];
					}
					
					$_seat_id_arr = pjShowSeatModel::factory()
						->whereIn("t1.show_id", $show_id_arr)
						->findAll()
						->getData();
					foreach($_seat_id_arr as $k => $v)
					{
						$seat_id_arr[$v['show_id']][] = $v['seat_id'];
					}
					
					$_booked_id_arr = pjBookingShowModel::factory()
						->join("pjBooking", "t2.id=t1.booking_id", "inner")
						->whereIn("t1.show_id", $show_id_arr)
						->where("t2.status", 'confirmed')
						->findAll()
						->getData();
					foreach($_booked_id_arr as $k => $v)
					{
						$booked_id_arr[$v['show_id']][] = $v['seat_id'];
					}
				}
			// 	$this->currentDate = strtotime(date($this->option_arr['o_date_format']));
			// 	// $showTime = strtotime('2019-08-30 23:00:00');
			// 	// if($currentDate > $showTime)
			// 	// {
			// 	// 	echo '<span class="status expired">Expired</span>';
			// 	// } else {
			// 	// 	echo '<span class="status expired">Not Expired</span>';
			// 	// }
			// 	// exit;
			// 	//App::dd($show_arr);
			// 	// $fullArray = array();


			// 	// function filterArray($value, $key){
			// 	// 	print_r($value);
			// 	// 	//return ($this->currentDate > $value);
			// 	// }

			// 	// $filteredArray = array_filter($fullArray, 'filterArray');

			// 	// foreach($filteredArray as $k => $v){
			// 	// 	echo "$k = $v";
			// 	// }
			// 	// $showArr = array();
			// 	// $expired = false;
			// 	// if(is_array($show_arr) && !empty($show_arr)) {
			// 	// 	foreach($show_arr as $show) {
			// 	// 		$fullArray = $show;
			// 	// 		//App::dd($fullArray);
			// 	// 		$filteredArray = array_filter($fullArray, 'filterArray');
			// 	// 	}
			// 	// }
			// 	if(is_array($show_arr) && !empty($show_arr)) {
			// 		foreach($show_arr as $show) {
						
			// 				if ($this->currentDate > strtotime($show['date_time']))  {
			// 					echo "expired";
			// 				} else {
			// 					echo "not expired";
			// 				}
						
			// 		}
			// 	}
				
			// //	print_r($show_arr);
			// 	exit;
			// 	
				//App::dd($show_arr);
				$this->set('arr', $arr);
				$this->set('venue_arr', $venue_arr);
				$this->set('price_arr', $price_arr);
				$this->set('show_arr', $show_arr);
				
				$this->set('seat_arr', $seat_arr);
				$this->set('seat_name_arr', $seat_name_arr);
				$this->set('seat_count_arr', $seat_count_arr);
				$this->set('seat_id_arr', $seat_id_arr);
				$this->set('booked_id_arr', $booked_id_arr);
				
				$this->appendJs('jquery.validate.min.js', PJ_THIRD_PARTY_PATH . 'validate/');
				$this->appendJs('jquery-ui-sliderAccess.js', PJ_THIRD_PARTY_PATH . 'timepicker/');
				$this->appendJs('jquery-ui-timepicker-addon.js', PJ_THIRD_PARTY_PATH . 'timepicker/');
				$this->appendCss('jquery-ui-timepicker-addon.css', PJ_THIRD_PARTY_PATH . 'timepicker/');
				$this->appendJs('jquery.multiselect.min.js', PJ_THIRD_PARTY_PATH . 'multiselect/');
				$this->appendCss('jquery.multiselect.css', PJ_THIRD_PARTY_PATH . 'multiselect/');
				$this->appendJs('pjAdminEvents.js');
			}
		
	}
	
	public function pjActionBooking()
	{
		
			$arr = pjEventModel::factory()
				->join('pjMultiLang', "t2.model='pjEvent' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
				->select('t1.*, t2.content as title')
				->find($_GET['id'])
				->getData();
			
			$pjBookingModel = pjBookingModel::factory();
			if(isset($_GET['date']) && !empty($_GET['date']))
			{
				if(isset($_GET['time']) && !empty($_GET['time']))
				{
					$pjBookingModel->where("DATE_FORMAT(t1.date_time,'%Y-%m-%d %H:%i:%s') = '".$_GET['date'] . ' ' . $_GET['time'] ."'");
				}else{
					$pjBookingModel->where("DATE_FORMAT(t1.date_time,'%Y-%m-%d') = '".$_GET['date']."'");
				}
			}
			
			$booking_arr = $pjBookingModel
				->select("t1.*, (SELECT SUM(TBS.cnt) FROM `".pjBookingShowModel::factory()->getTable()."` as TBS WHERE TBS.booking_id=t1.id) as cnt_seats")
				->where('event_id', $_GET['id'])
				->where('status <>', 'cancelled')
				->orderBy("created DESC")
				->findAll()
				->getData();
			$booking_id_arr = $pjBookingModel->findAll()->getDataPair('id', 'id');
			
			$ticket_info_arr = !empty($booking_id_arr) ? $this->getTicketInfo($booking_id_arr) : array('ticket_cnt_arr' => array(), 'ticket_name_arr' => array());
			$ticket_cnt_arr = $ticket_info_arr['ticket_cnt_arr'];
			$ticket_name_arr = $ticket_info_arr['ticket_name_arr'];
			$ticket_seat_arr = $ticket_info_arr['ticket_seat_arr'];
			
			$total_seats = 0;
			
			foreach($booking_arr as $k => $v)
			{
				$_arr = array();
				if(isset($ticket_cnt_arr[$v['id']]))
				{
					foreach($ticket_cnt_arr[$v['id']] as $price_id => $cnt)
					{
						$_arr[] = $ticket_name_arr[$v['id']][$price_id] . ' ' . join(', ', $ticket_seat_arr[$v['id']][$price_id]);
					}
				}
				$v['tickets'] = !empty($_arr) ? join('<br/>', $_arr) : '';
				$total_seats += $v['cnt_seats'];
				$booking_arr[$k] = $v;
			}
			
			$pjShowModel = pjShowModel::factory();
			
			$date_arr = $pjShowModel
				->select("DISTINCT DATE_FORMAT(t1.date_time,'%Y-%m-%d') AS date")
				->where('event_id', $_GET['id'])
				->where("t1.date_time IN(SELECT TB.date_time FROM `".$pjBookingModel->getTable()."` AS TB)")
				->findAll()
				->getData();
			
			$pjShowModel
				->reset()
				->select("DISTINCT DATE_FORMAT(t1.date_time,'%H:%i:%s') AS time")
				->where('event_id', $_GET['id'])
				->where("t1.date_time IN(SELECT TB.date_time FROM `".$pjBookingModel->getTable()."` AS TB)");
			if(isset($_GET['date']) && !empty($_GET['date']))
			{
				$pjShowModel->where("DATE_FORMAT(t1.date_time,'%Y-%m-%d') = '".$_GET['date']."'");
			}
			$time_arr =	$pjShowModel
				->findAll()
				->getData();
			
			$this->set('arr', $arr);
			$this->set('booking_arr', $booking_arr);
			$this->set('date_arr', $date_arr);
			$this->set('time_arr', $time_arr);
			$this->set('cnt_bookings', count($booking_id_arr));
			$this->set('total_seats', $total_seats);
			
			$this->appendJs('pjAdminEvents.js');
		
	}
	
	public function pjActionPrint()
	{
		$this->setLayout('pjActionEmpty');
		
		
			$arr = pjEventModel::factory()
				->join('pjMultiLang', "t2.model='pjEvent' AND t2.foreign_id=t1.id AND t2.field='title' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
				->select('t1.*, t2.content as title')
				->find($_GET['id'])
				->getData();
				
			$pjBookingModel = pjBookingModel::factory();
			if(isset($_GET['date']) && !empty($_GET['date']))
			{
				if(isset($_GET['time']) && !empty($_GET['time']))
				{
					$pjBookingModel->where("DATE_FORMAT(t1.date_time,'%Y-%m-%d %H:%i:%s') = '".$_GET['date'] . ' ' . $_GET['time'] ."'");
				}else{
					$pjBookingModel->where("DATE_FORMAT(t1.date_time,'%Y-%m-%d') = '".$_GET['date']."'");
				}
			}
				
			$booking_arr = $pjBookingModel	
				->select("t1.*, (SELECT SUM(TBS.cnt) FROM `".pjBookingShowModel::factory()->getTable()."` as TBS WHERE TBS.booking_id=t1.id) as cnt_seats")
				->where('event_id', $_GET['id'])
				->orderBy("created DESC")
				->findAll()
				->getData();
			$booking_id_arr = $pjBookingModel->findAll()->getDataPair('id', 'id');
				
			$ticket_info_arr = !empty($booking_id_arr) ? $this->getTicketInfo($booking_id_arr) : array('ticket_cnt_arr' => array(), 'ticket_name_arr' => array());
			$ticket_cnt_arr = $ticket_info_arr['ticket_cnt_arr'];
			$ticket_name_arr = $ticket_info_arr['ticket_name_arr'];
			$ticket_seat_arr = $ticket_info_arr['ticket_seat_arr'];
			
			$total_seats = 0;
			foreach($booking_arr as $k => $v)
			{
				$_arr = array();
				if(isset($ticket_cnt_arr[$v['id']]))
				{
					foreach($ticket_cnt_arr[$v['id']] as $price_id => $cnt)
					{
						$_arr[] = $ticket_name_arr[$v['id']][$price_id] . ' ' . join(', ', $ticket_seat_arr[$v['id']][$price_id]);
					}
				}
				$v['tickets'] = !empty($_arr) ? join('<br/>', $_arr) : '';
				$total_seats += $v['cnt_seats'];
				$booking_arr[$k] = $v;
			}
			
			$this->set('arr', $arr);
			$this->set('booking_arr', $booking_arr);
			$this->set('cnt_bookings', count($booking_id_arr));
			$this->set('total_seats', $total_seats);
				
		
	}
	
	public function pjActionDeleteMap()
	{
		$this->setAjax(true);
	
		if ($this->isXHR())
		{
			$pjEventModel = pjEventModel::factory();
			$arr = $pjEventModel->find($_POST['id'])->getData(); 
			
			if(!empty($arr))
			{
				$map_path = $arr['seats_map'];
				if (file_exists(PJ_INSTALL_PATH . $map_path)) {
					@unlink(PJ_INSTALL_PATH . $map_path);
				}
				$data = array();
				$data['seats_map'] = ':NULL';
				$pjEventModel->reset()->where(array('id' => $_POST['id']))->limit(1)->modifyAll($data);
				pjSeatModel::factory()->where('event_id', $_POST['id'])->eraseAll();
				
				$this->set('code', 200);
			}else{
				$this->set('code', 100);
			}
		}
	}
	
	public function pjActionDeleteImage()
	{
		$this->setAjax(true);
	
		if ($this->isXHR())
		{
			$response = array();
				
			$pjEventModel = pjEventModel::factory();
			$arr = $pjEventModel->find($_GET['id'])->getData();
				
			if(!empty($arr))
			{
				if(!empty($arr['event_img']))
				{
					@unlink(PJ_INSTALL_PATH . $arr['event_img']);
				}
	
				$data = array();
				$data['event_img'] = ':NULL';
				$pjEventModel->reset()->where(array('id' => $_GET['id']))->limit(1)->modifyAll($data);
	
				$response['code'] = 200;
			}else{
				$response['code'] = 100;
			}
				
			pjAppController::jsonResponse($response);
		}
	}
	
	public function pjActionGetSeats()
	{
		$this->setAjax(true);
	
		if ($this->isXHR())
		{
			if(isset($_GET['venue_id']) && (int) $_GET['venue_id'] > 0 && $_GET['date_time'] != '')
			{
				$date_time = $_GET['date_time'];
				if(count(explode(" ", $date_time)) == 3)
				{
					list($_date, $_time, $_period) = explode(" ", $date_time);
					$time = pjUtil::formatTime($_time . ' ' . $_period, $this->option_arr['o_time_format']);
				}else{
					list($_date, $_time) = explode(" ", $date_time);
					$time = pjUtil::formatTime($_time, $this->option_arr['o_time_format']);
				}
				$date_time = pjUtil::formatDate($_date, $this->option_arr['o_date_format']) . ' ' . $time;
				
				$show_arr = pjShowModel::factory()
					->where('event_id', $_GET['event_id'])
					->where('venue_id', $_GET['venue_id'])
					->where('date_time', $date_time)
					->limit(1)
					->findAll()
					->getData();
				$show_id = null;
				if(!empty($show_arr))
				{
					$show_id = $show_arr[0]['id'];
				}
				$arr = pjSeatModel::factory()->where('t1.venue_id', $_GET['venue_id'])->findAll()->getData();
				if($show_id != null)
				{
					$arr = pjSeatModel::factory()
						->select("t1.*, (SELECT COUNT(booking_id) FROM `".pjBookingShowModel::factory()->getTable()."` AS TBS WHERE TBS.show_id='".$show_id."' AND TBS.seat_id=t1.id) AS cnt_bookings")
						->where('t1.venue_id', $_GET['venue_id'])
						->findAll()
						->getData();
				}
				
				$this->set('arr', $arr);
			}
		}
	}
	
	public function pjActionAddShow()
	{
		$this->setAjax(true);
		
		if ($this->isXHR())
		{
			if(isset($_GET['event_id']) && (int) $_GET['event_id'] > 0 && $_POST['date_time'] != '')
			{
				$date_time = $_POST['date_time'];
				if(count(explode(" ", $date_time)) == 3)
				{
					list($_date, $_time, $_period) = explode(" ", $date_time);
					$time = pjUtil::formatTime($_time . ' ' . $_period, $this->option_arr['o_time_format']);
				}else{
					list($_date, $_time) = explode(" ", $date_time);
					$time = pjUtil::formatTime($_time, $this->option_arr['o_time_format']);
				}
				$date_time = pjUtil::formatDate($_date, $this->option_arr['o_date_format']) . ' ' . $time;
				
				switch ($_GET['period']) {
					case 'hour':
						$date_time = date('Y-m-d H:i:s', (strtotime($date_time) + 1*60*60));
						break;
					case 'day':
						$date_time = date('Y-m-d H:i:s', (strtotime($date_time) + 24*60*60));
						break;
					case 'week':
						$date_time = date('Y-m-d H:i:s', (strtotime($date_time) + 7*24*60*60));
						break;
				}
				
				$venue_arr = pjVenueModel::factory()
					->join('pjMultiLang', "t2.model='pjVenue' AND t2.foreign_id=t1.id AND t2.field='name' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
					->select('t1.*, t2.content as name')
					->where('t1.status', 'T')
					->orderBy("name ASC")
					->findAll()
					->getData();
				$price_arr = pjPriceModel::factory()
					->join('pjMultiLang', "t2.model='pjPrice' AND t2.foreign_id=t1.id AND t2.field='price_name' AND t2.locale='".$this->getLocaleId()."'", 'left outer')
					->select('t1.*, t2.content as name')
					->where('t1.event_id', $_GET['event_id'])
					->orderBy("name ASC")
					->findAll()
					->getData();
				$price_id = '';
				if(!empty($_POST['price_id']))
				{
					$price_id = $_POST['price_id'];
					foreach($price_arr as $k => $v)
					{
						if($_GET['period'] == 'ticket')
						{
							if($v['id'] == $price_id)
							{
								if(isset($price_arr[$k+1]))
								{
									$price_id = $price_arr[$k+1]['id'];
								}else{
									$price_id = $price_arr[0]['id'];
								}
								break;
							}
						}
					}
				}
				if(isset($_POST['venue_id']) && (int) $_POST['venue_id'] > 0)
				{
					$show_arr = pjShowModel::factory()
						->where('event_id', $_GET['event_id'])
						->where('venue_id', $_POST['venue_id'])
						->where('date_time', $date_time)
						->limit(1)
						->findAll()
						->getData();
					$show_id = null;
					if(!empty($show_arr))
					{
						$show_id = $show_arr[0]['id'];
					}
					$seat_arr = pjSeatModel::factory()->where('t1.venue_id', $_POST['venue_id'])->findAll()->getData();
					if($show_id != null)
					{
						$seat_arr = pjSeatModel::factory()
							->select("t1.*, (SELECT COUNT(booking_id) FROM `".pjBookingShowModel::factory()->getTable()."` AS TBS WHERE TBS.show_id='".$show_id."' AND TBS.seat_id=t1.id) AS cnt_bookings")
							->where('t1.venue_id', $_POST['venue_id'])
							->findAll()
							->getData();
						$this->set('seat_arr', $seat_arr);
					}
					$this->set('seat_arr', $seat_arr);
				}
				
				$this->set('venue_arr', $venue_arr);
				$this->set('price_arr', $price_arr);
				$this->set('date_time', $date_time);
				$this->set('price_id', $price_id);
			}
		}
	}
	
	public function pjActionDeleteShow()
	{
		$this->setAjax(true);
	
		if ($this->isXHR())
		{
			$response = array('code' => 100);
			if (isset($_POST['id']) && (int) $_POST['id'] > 0)
			{
				$response['code'] = 101;
				/*
				if (pjShowModel::factory()->setAttributes(array('id' => $_POST['id']))->erase()->getAffectedRows() == 1)
				{
					pjShowSeatModel::factory()->where('show_id', $_POST['id'])->eraseAll();
					$response['code'] = 200;
				}
				*/
				if($this->delete('pjShowModel', 'id', $_POST['id'])) {
					$this->delete('pjShowSeatModel', 'show_id', $_POST['id']);
					$response['code'] = 200;
				} else {
					$response['code'] = 100;
				}
			}
			pjAppController::jsonResponse($response);
		}
		exit;
	}
	
	public function pjActionBeforeSave()
	{
		$this->setAjax(true);
		
		if ($this->isXHR())
		{
			$response = array('status' => 'OK', 'code' => 200, 'text' => '');
			if (!isset($_SESSION[$this->sessionShow]) || !is_array($_SESSION[$this->sessionShow]))
			{
				$_SESSION[$this->sessionShow] = array();
			}
			
			$_SESSION[$this->sessionShow] = pjUtil::arrayMergeDistinct($_SESSION[$this->sessionShow], $_POST);
			pjAppController::jsonResponse($response);
		}
		exit;
	}
	
	public function pjActionSave()
	{
		$this->setAjax(true);
	
		if ($this->isXHR())
		{
			if (!isset($_SESSION[$this->sessionShow]) || empty($_SESSION[$this->sessionShow]))
			{
				pjAppController::jsonResponse(array('status' => 'ERR', 'code' => 100, 'text' => ''));
			}
			$STORE = $_SESSION[$this->sessionShow];
			
			$duplidated = $this->pjActionCheckShow();
			if($duplidated == true)
			{
				if(is_array($STORE['date_time']) && count($STORE['date_time']) > 0)
				{
					$pjShowModel = pjShowModel::factory();
					$pjShowSeatModel = pjShowSeatModel::factory();
						
					foreach($STORE['date_time'] as $key => $val)
					{
						$data = array();
						$date_time = $val;
						if(count(explode(" ", $date_time)) == 3)
						{
							list($_date, $_time, $_period) = explode(" ", $date_time);
							$time = pjUtil::formatTime($_time . ' ' . $_period, $this->option_arr['o_time_format']);
						}else{
							list($_date, $_time) = explode(" ", $date_time);
							$time = pjUtil::formatTime($_time, $this->option_arr['o_time_format']);
						}
						$data['event_id'] = $STORE['id'];
						$data['venue_id'] = $STORE['venue_id'][$key];
						$data['price_id'] = $STORE['price_id'][$key];
						$data['price'] = $STORE['price'][$key];
						$data['date_time'] = pjUtil::formatDate($_date, $this->option_arr['o_date_format']) . ' ' . $time;
							
						if (strpos($key,'new_') !== false)
						{
							$show_id = $pjShowModel->reset()->setAttributes($data)->insert()->getInsertId();
							if ($show_id !== false && (int) $show_id > 0)
							{
								$seat_arr = $STORE['seat_id'][$key];
								if(is_array($seat_arr) && count($seat_arr) > 0)
								{
									foreach($seat_arr as $v)
									{
										$sdata = array();
										$sdata['show_id'] = $show_id;
										$sdata['seat_id'] = $v;
				
										$pjShowSeatModel->reset()->setAttributes($sdata)->insert();
									}
								}
							}
						}else{
							$pjShowModel->reset()->where('id', $key)->limit(1)->modifyAll($data);
							$seat_arr = $STORE['seat_id'][$key];
							$pjShowSeatModel->reset()->where('show_id', $key)->where("seat_id NOT IN(SELECT TBS.seat_id FROM `".pjBookingShowModel::factory()->getTable()."` AS TBS WHERE TBS.show_id=$key)")->eraseAll();
							if(is_array($seat_arr) && count($seat_arr) > 0)
							{
								foreach($seat_arr as $v)
								{
									$sdata = array();
									$sdata['show_id'] = $key;
									$sdata['seat_id'] = $v;
									$pjShowSeatModel->reset()->setAttributes($sdata)->insert();
								}
							}
						}
					}
				}
				$_SESSION[$this->sessionShow] = NULL;
				unset($_SESSION[$this->sessionShow]);
				
				pjAppController::jsonResponse(array('status' => 'OK', 'code' => 200, 'text' => 'AE13', 'id' => $STORE['id']));
				
			}else{
				pjAppController::jsonResponse(array('status' => 'ERR', 'code' => 101, 'text' => ''));
			}
		}
		exit;
	}
	
	public function pjActionCheckShow()
	{
		$STORE = $_SESSION[$this->sessionShow];
			
		$indexes = array();
		$show_arr = array();
		if(is_array($STORE['date_time']) && count($STORE['date_time']) > 0)
		{
			foreach($STORE['date_time'] as $key => $val)
			{
				$_index = $val . '|' . $STORE['venue_id'][$key] . '|' . $STORE['price_id'][$key]; 
				if(isset($show_arr[$_index]))
				{
					$indexes[] = $key;
					if(!in_array($key, $indexes))
					{
						$indexes[] = $show_arr[$_index];
					}
					if(!in_array($show_arr[$_index], $indexes))
					{
						$indexes[] = $show_arr[$_index];
					}
				}else{
					$show_arr[$_index] = $key;
				}
				
			}
		}
		if(!empty($indexes))
		{
			return false;
		}
		return true;
	}
	
	public function pjActionExport()
	{
		
			if(isset($_POST['movie_export']))
			{
				$pjShowModel = pjShowModel::factory()
					->select("DISTINCT t1.event_id, t3.content as title, t4.content as hall, t5.content as description, UNIX_TIMESTAMP(t1.date_time) as uuid, t1.date_time as start_time, (t1.date_time + INTERVAL t2.duration MINUTE) as end_time")
					->join('pjEvent', 't2.id=t1.event_id', 'left')
					->join('pjMultiLang', "t3.model='pjEvent' AND t3.foreign_id=t1.event_id AND t3.field='title' AND t3.locale='".$this->getLocaleId()."'", 'left outer')
					->join('pjMultiLang', "t4.model='pjVenue' AND t4.foreign_id=t1.venue_id AND t4.field='name' AND t4.locale='".$this->getLocaleId()."'", 'left outer')
					->join('pjMultiLang', "t5.model='pjEvent' AND t5.foreign_id=t1.event_id AND t5.field='description' AND t5.locale='".$this->getLocaleId()."'", 'left outer');
				
				if(isset($_POST['event_id']) && !empty($_POST['event_id']))
				{
					$pjShowModel->where('t1.event_id', $_POST['event_id']);
				}	
				if($_POST['period'] == 'next')
				{
					$column = 'start_time';
					$direction = 'ASC';
	
					$where_str = pjUtil::getComingWhere($_POST['coming_period'], $this->option_arr['o_week_start']);
					if($where_str != '')
					{
						$pjShowModel->where($where_str);
					}
				}else{
					$column = 'start_time';
					$direction = 'DESC';
					$where_str = pjUtil::getMadeWhere($_POST['made_period'], $this->option_arr['o_week_start']);
					if($where_str != '')
					{
						$pjShowModel->where($where_str);
					}
				}
				$arr = $pjShowModel
					->orderBy("$column $direction")
					->findAll()
					->getData();
				
				if($_POST['type'] == 'file')
				{
					$this->setLayout('pjActionEmpty');
						
					if($_POST['format'] == 'csv')
					{
						$csv = new pjCSV();
						$csv
							->setHeader(true)
							->setName("Export-".time().".csv")
							->process($arr)
							->download();
					}
					if($_POST['format'] == 'xml')
					{
						$xml = new pjXML();
						$xml
							->setEncoding('UTF-8')
							->setName("Export-".time().".xml")
							->process($arr)
							->download();
					}
					if($_POST['format'] == 'ical')
					{
						$ical = new pjICal();
						$ical
						->setName("Export-".time().".ics")
						->setProdID('Cinema Booking Calendar')
						->setCreated('start_time')
						->setDateFrom('start_time')
						->setDateTo('end_time')
						->setSummary('title')
						->setLocation('hall')
						->setCName('description')
						->setTimezone(pjUtil::getTimezoneName($this->option_arr['o_timezone']))
						->process($arr)
						->download();
					}
					exit;
				}else{
					$pjPasswordModel = pjPasswordModel::factory();
					$password = md5($_POST['password'].PJ_SALT);
					$arr = $pjPasswordModel
						->where("t1.password", $password)
						->limit(1)
						->findAll()
						->getData();
					if (count($arr) != 1)
					{
						$pjPasswordModel->setAttributes(array('password' => $password))->insert();
					}
					$this->set('password', $password);
				}
			}
				
			$event_arr = pjEventModel::factory()
				->select('t1.*, t2.content AS title')
				->join('pjMultiLang', "t2.foreign_id = t1.id AND t2.model = 'pjEvent' AND t2.locale = '".$this->getLocaleId()."' AND t2.field = 'title'", 'left')
				->orderBy("`title` ASC")
				->findAll()
				->getData();
			$this->set('event_arr', $event_arr);
				
			$this->appendJs('jquery.validate.min.js', PJ_THIRD_PARTY_PATH . 'validate/');
			$this->appendJs('pjAdminEvents.js');
		
	}
	
	public function pjActionExportFeed()
	{
		$this->setLayout('pjActionEmpty');
		$access = true;
		if(isset($_GET['p']))
		{
			$pjPasswordModel = pjPasswordModel::factory();
			$arr = $pjPasswordModel
				->where('t1.password', $_GET['p'])
				->limit(1)
				->findAll()
				->getData();
			if (count($arr) != 1)
			{
				$access = false;
			}
		}else{
			$access = false;
		}
		if($access == true)
		{
			$arr = $this->pjGetFeedData($_GET);
			if(!empty($arr))
			{
				if($_GET['format'] == 'xml')
				{
					$xml = new pjXML();
					echo $xml
						->setEncoding('UTF-8')
						->process($arr)
						->getData();
	
				}
				if($_GET['format'] == 'csv')
				{
					$csv = new pjCSV();
					echo $csv
						->setHeader(true)
						->process($arr)
						->getData();
	
				}
				if($_GET['format'] == 'ical')
				{
					$ical = new pjICal();
					echo $ical
						->setName("Export-".time().".ics")
						->setProdID('Cinema Booking Calendar')
						->setCreated('start_time')
						->setDateFrom('start_time')
						->setDateTo('end_time')
						->setSummary('title')
						->setLocation('hall')
						->setCName('description')
						->setTimezone(pjUtil::getTimezoneName($this->option_arr['o_timezone']))
						->process($arr)
						->getData();
				}
			}
		}else{
			__('lblNoAccessToFeed');
		}
		exit;
	}
	public function pjGetFeedData($get)
	{
		$arr = array();
		$status = true;
		$type = '';
		$period = '';
		if(isset($get['period']))
		{
			if(!ctype_digit($get['period']))
			{
				$status = false;
			}else{
				$period = $get['period'];
			}
		}else{
			$status = false;
		}
		if(isset($get['type']))
		{
			if(!ctype_digit($get['type']))
			{
				$status = false;
			}else{
				$type = $get['type'];
			}
		}else{
			$status = false;
		}
		if($status == true && $type != '' && $period != '')
		{
			$pjShowModel = pjShowModel::factory()
				->select("DISTINCT t1.event_id, t3.content as title, t4.content as hall, t5.content as description, UNIX_TIMESTAMP(t1.date_time) as uuid, t1.date_time as start_time, (t1.date_time + INTERVAL t2.duration MINUTE) as end_time")
				->join('pjEvent', 't2.id=t1.event_id', 'left')
				->join('pjMultiLang', "t3.model='pjEvent' AND t3.foreign_id=t1.event_id AND t3.field='title' AND t3.locale='".$this->getLocaleId()."'", 'left outer')
				->join('pjMultiLang', "t4.model='pjVenue' AND t4.foreign_id=t1.venue_id AND t4.field='name' AND t4.locale='".$this->getLocaleId()."'", 'left outer')
				->join('pjMultiLang', "t5.model='pjEvent' AND t5.foreign_id=t1.event_id AND t5.field='description' AND t5.locale='".$this->getLocaleId()."'", 'left outer');
			
			if(isset($get['event_id']) && !empty($get['event_id']))
			{
				$pjShowModel->where('t1.event_id', $get['event_id']);
			}
			if($type == '1')
			{
				$column = 'start_time';
				$direction = 'ASC';
			
				$where_str = pjUtil::getComingWhere($period, $this->option_arr['o_week_start']);
				if($where_str != '')
				{
					$pjShowModel->where($where_str);
				}
			}else{
				$column = 'start_time';
				$direction = 'DESC';
				$where_str = pjUtil::getMadeWhere($period, $this->option_arr['o_week_start']);
				if($where_str != '')
				{
					$pjShowModel->where($where_str);
				}
			}
			$arr = $pjShowModel
				->orderBy("$column $direction")
				->findAll()
				->getData();
			
		}
		return $arr;
	}

	########################## Garbage Record ############################## 

	/**
	 * @desc List of deleted items view
	 */
	public function pjActionDeletedEventView()
	{
		$this->appendJs('jquery.datagrid.js', PJ_FRAMEWORK_LIBS_PATH . 'pj/js/');
		$this->appendJs('pjActionDeletedEventView.js');
		
	}

	public function deleteEventShowWithSeats() {

	}
	public function deleteBooking() {
		
	}

	public function beforeSaveEventDateTime() {
		if (!isset($_SESSION[$this->sessionShow]) || !is_array($_SESSION[$this->sessionShow]))
		{
			$_SESSION[$this->sessionShow] = array();
		}
			
		$_SESSION[$this->sessionShow] = pjUtil::arrayMergeDistinct($_SESSION[$this->sessionShow], $_POST);
	}
	
	
}
?>