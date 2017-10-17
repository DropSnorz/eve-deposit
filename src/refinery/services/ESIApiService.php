<?php

class ESIApiService{


	public static function getLatestItemPrice($itemId){

		$data = self::CallAPI("GET", "https://esi.tech.ccp.is/latest/markets/10000002/history/", 
			["type_id" => $itemId,
			"datasource" => "tranquility"]);


		$data = json_decode($data);

		if(sizeof($data) >= 1){

			return $data[sizeof($data) - 1]->average;
		}
		else{
			return null;
		}
	}

	public static function getItemPrice($itemId){

		return self::CallAPI("GET", "https://esi.tech.ccp.is/latest/markets/10000002/history/", 
			["type_id" => $itemId,
			"datasource" => "tranquility"]);
	}


	private static function CallAPI($method, $url, $data = false)
	{
	    $curl = curl_init();

	    switch ($method)
	    {
	        case "POST":
	            curl_setopt($curl, CURLOPT_POST, 1);

	            if ($data)
	                curl_setopt($curl, CURLOPT_POSTFIELDS, $data);
	            break;
	        case "PUT":
	            curl_setopt($curl, CURLOPT_PUT, 1);
	            break;
	        default:
	            if ($data)
	                $url = sprintf("%s?%s", $url, http_build_query($data));
	    }


	    curl_setopt($curl, CURLOPT_URL, $url);
	    curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
	    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);

	    $result = curl_exec($curl);

	    curl_close($curl);

	    return $result;
	}
}