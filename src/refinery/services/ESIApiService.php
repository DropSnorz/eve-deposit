<?php

class ESIApiService{

	public static function updateData(){

		$triggerApiUpdate = false;
		$em = getEntityManager();
		$lastPullDate = $em->getRepository("AppData")->find("last_api_pull_date");


		if($lastPullDate == null){

			$lastPullDate = new AppData();
			$lastPullDate->setId("last_api_pull_date");
			$lastPullDate->setValue(date('Y-m-d H:i:s'));
			$em->persist($lastPullDate);
			$em->flush();

			$triggerApiUpdate = true;

		}
		else{

			$lastDate = DateTime::createFromFormat('Y-m-d H:i:s', $lastPullDate->getValue());
			$diff = abs(($lastDate->getTimestamp() - (new DateTime())->getTimestamp()) / 60);
			

			if($diff > 1 && self::requestApiUpdateLock()){
				$triggerApiUpdate = true;
			}				

		}

		if($triggerApiUpdate){

			$ores = $em->getRepository("Ore")->findAll();

			foreach ($ores as $ore) {
				$unitPrice = ESIApiService::getLatestItemPrice($ore->getRef());

				if($unitPrice != null){
					$ore->setUnitPrice($unitPrice);
					$normalizedPrice = $unitPrice * (10 / $ore->getUnitVolume());
					$normalizedPrice = floor($normalizedPrice * 100) / 100;
					$ore->setNormalizedPrice($normalizedPrice);
				}
				else{
					$ore->setUnitPrice(0.0);
					$ore->setNormalizedPrice(0.0);
				}
				
			}

			$lastPullDate->setValue(date('Y-m-d H:i:s'));
			$em->flush();

			self::releaseApiUpdateLock();
			$content="Cache data successfully updated from ESI API";

		}
		else{
			$content="Warning: API Call bypassed (Permission denied or Already up to date)";
		}

		return $content;
	}

	public static function getLatestItemPrice($itemId){

		$data = self::CallAPI("GET", "https://esi.tech.ccp.is/latest/markets/10000002/history/", 
			["type_id" => $itemId,
			"datasource" => "tranquility"]);

		$data = json_decode($data);

		if(is_array($data) && sizeof($data) >= 7){

			$arr_size = sizeof($data);
			$globalAverage = 0;
			for($i = 0; $i < 7; $i++){
				$globalAverage = $globalAverage + $data[sizeof($data) - 1 - $i]->average;
			}

			return $globalAverage / 7;
		}
		else{
			return null;
		}
	}

	public static function requestApiUpdateLock(){

		$em = getEntityManager();
		$apiUpdateLock = $em->getRepository("AppData")->find("api_update_lock");

		if($apiUpdateLock == null){

			$apiUpdateLock = new AppData();
			$apiUpdateLock->setId("api_update_lock");
			$apiUpdateLock->setValue("locked");
			$em->persist($apiUpdateLock);
			$em->flush();

			return true;
		}
		else if($apiUpdateLock->getValue() == "free"){

			$apiUpdateLock->setValue("locked");
			$em->flush();

			return true;

		}
		else{
			return false;
		}


	}

	public static function releaseApiUpdateLock(){

		$em = getEntityManager();

		$apiUpdateLock = $em->getRepository("AppData")->find("api_update_lock");
		$apiUpdateLock->setValue("free");
		$em->flush();

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
	    curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
		curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, 0);

	    $result = curl_exec($curl);

	    curl_close($curl);

	    return $result;
	}
}