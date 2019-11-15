<?php
if (!defined("ROOT_PATH"))
{
	header("HTTP/1.1 403 Forbidden");
	exit;
}
class pjEventModel extends pjAppModel
{
	protected $primaryKey = 'id';
	
	protected $table = 'events';
	
	protected $schema = array(
		array('name' => 'id', 'type' => 'int', 'default' => ':NULL'),
		array('name' => 'duration', 'type' => 'varchar', 'default' => ':NULL'),
		array('name' => 'slug', 'type' => 'varchar', 'default' => ':NULL'),
		array('name' => 'released_date', 'type' => 'date', 'default' => ':NULL'),
		array('name' => 'event_img', 'type' => 'varchar', 'default' => ':NULL'),
		array('name' => 'event_thumb_img', 'type' => 'varchar', 'default' => ':NULL'),
		array('name' => 'created', 'type' => 'datetime', 'default' => ':NOW()'),
		array('name' => 'date_time', 'type' => 'datetime', 'default' => ':NULL'),
		array('name' => 'status', 'type' => 'enum', 'default' => 'T'),
		array('name' => 'event_type', 'type' => 'enum', 'default' => '1'),
		array('name' => 'deleted_at', 'type' => 'timestamp', 'default' => ':NULL')
	);
	
	public $i18n = array('title','small_description', 'description');
	
	public static function factory($attr=array())
	{
		return new pjEventModel($attr);
	}

	
}
?>