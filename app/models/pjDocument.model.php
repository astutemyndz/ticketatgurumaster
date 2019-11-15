<?php
if (!defined("ROOT_PATH"))
{
	header("HTTP/1.1 403 Forbidden");
	exit;
}
class pjDocumentModel extends pjAppModel
{
	protected $primaryKey = 'id';
	
	protected $table = 'documents';
	
	protected $schema = array(
		array('name' => 'id', 'type' => 'int', 'default' => ':NULL'),
		array('name' => 'name', 'type' => 'varchar', 'default' => ':NULL'),
		array('name' => 'size', 'type' => 'double', 'default' => ':NULL'),
		array('name' => 'url', 'type' => 'varchar', 'default' => ':NULL'),
		array('name' => 'deleteUrl', 'type' => 'varchar', 'default' => ':NULL'),
		array('name' => 'deleteType', 'type' => 'varchar', 'default' => ':NULL'),
		array('name' => 'created_at', 'type' => 'datetime', 'default' => ':NOW()'),
		array('name' => 'updated_at', 'type' => 'datetime', 'default' => ':NULL')
		
	);
	
	
	public static function factory($attr=array())
	{
		return new pjDocumentModel($attr);
	}

	
}
?>