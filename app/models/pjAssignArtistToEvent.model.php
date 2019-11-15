<?php
if (!defined("ROOT_PATH"))
{
	header("HTTP/1.1 403 Forbidden");
	exit;
}
class pjAssignArtistToEventModel extends pjAppModel
{
	protected $primaryKey = 'id';
	
	protected $table = 'assign_artist_to_event';
	
	protected $schema = array(
		array('name' => 'id', 'type' => 'int', 'default' => ':NULL'),
        array('name' => 'id_events', 'type' => 'int', 'default' => ':NULL'),
        array('name' => 'id_artists', 'type' => 'int', 'default' => ':NULL')
	);
	
	//public $i18n = array('title','description');
	
	public static function factory($attr=array())
	{
		return new pjAssignArtistToEventModel($attr);
	}
}
?>