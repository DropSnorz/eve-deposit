<?php

class DataCacheService{

	public static function getData($id){
		return file_get_contents(DIR_BASE . "data-cache/" . $id . ".json");
	}

	public static function persistData($id, $data){
		file_put_contents(DIR_BASE . "data-cache/" . $id . ".json", $data);
	}


}