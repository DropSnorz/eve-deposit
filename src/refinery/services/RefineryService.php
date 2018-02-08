<?php
require_once "DataCacheService.php";

use Doctrine\Common\Collections;

class RefineryService{

	public static function getOreList(){

		if(USE_DATA_CACHE){
			return DataCacheService::getData("ore");
		}
		else{
			return fetchOreList();
		}
		
	}

	public static function getMinerals(){

		if(USE_DATA_CACHE){
			return DataCacheService::getData("minerals");
		}
		else{
			return fetchMinerals();
		}
		
	}


	public static function getReprocessingStats(){

		if(USE_DATA_CACHE){
			return DataCacheService::getData("reprocessingStats");
		}
		else{
			return fetchReprocessingStats();
		}
		
	}


	public static function fetchOreList(){

		$em = getEntityManager();
		$primaryOres = $em->getRepository("Ore")->findAllPrimaryOreSecondaryRelated();
		$primaryOreCollection = new Collections\ArrayCollection($primaryOres);
		
		return json_encode($primaryOres);
	}


	public static function fetchMinerals(){

		$em = getEntityManager();
		$minerals = $em->getRepository("Mineral")->findAllAsArray();
		return json_encode($minerals);
	}


	public static function fetchReprocessingStats(){

		$em = getEntityManager();
		$stats = $em->getRepository("OreMineral")->findAllReprocessingStats();
		return json_encode($stats);
	}

}