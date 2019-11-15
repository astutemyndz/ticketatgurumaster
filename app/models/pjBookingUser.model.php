<?php
if (!defined("ROOT_PATH"))
{
	header("HTTP/1.1 403 Forbidden");
	exit;
}
class pjBookingUserModel extends pjAppModel
{
	protected $primaryKey = 'id';
	
	protected $table = 'bookings_users';
	
	protected $schema = array(
		array('name' => 'id', 'type' => 'int', 'default' => ':NULL'),
		array('name' => 'id_bookings', 'type' => 'int', 'default' => ':NULL'),
		array('name' => 'id_users', 'type' => 'int', 'default' => ':NULL')
	);
	
	

	public static function factory($attr=array())
	{
		return new pjBookingUserModel($attr);
	}
}
?>