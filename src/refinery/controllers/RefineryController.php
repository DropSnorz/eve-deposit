<?php
require_once DIR_CORE . "services/AuthentificationService.php";
require_once DIR_REFINERY . "services/ESIApiService.php";

use Doctrine\Common\Collections;
use Doctrine\Common\Collections\Criteria;

class RefineryController extends BaseController{

	function getHome(){

		$em = getEntityManager();

		$primaryOres = $em->getRepository("Ore")->findAllPrimaryOreSecondaryRelated();
		$primaryOreCollection = new Collections\ArrayCollection($primaryOres);
		
		$primaryOres_json =  json_encode($primaryOres);


		$minerals = $em->getRepository("Mineral")->findAllAsArray();
		$minerals_json = json_encode($minerals);

		$oreMineral = $em->getRepository("OreMineral")->findAllReprocessingStats();
		$oreMineral_json = json_encode($oreMineral);


		$bestHSOreCriteria = Criteria::create()
    		->where(Criteria::expr()->gt("securityLevel", 0.4))
    		->setMaxResults(1)
		;

		$bestLSOreCriteria = Criteria::create()
    		->where(Criteria::expr()->lt("securityLevel", 0.4))
    		->setMaxResults(1)
		;


		$bestHSOre = $primaryOreCollection->matching($bestHSOreCriteria)[0];
		$bestLSOre = $primaryOreCollection->matching($bestLSOreCriteria)[0];


		$data = ["primaryOresData" => $primaryOres_json,
				"mineralsData" => $minerals_json,
				"oreMineralData" => $oreMineral_json,
				"bestHSOre" => $bestHSOre,
				"bestLSOre" => $bestLSOre];
		$content = $this->render('home', $data);
		$this->response->setContent($content);
	}

	function pullESIData(){

		$triggerApiUpdate = false;
		$em = getEntityManager();
		$appData = $em->getRepository("AppData")->find("last_api_pull_date");

		if($appData == null){

			$appData = new AppData();
			$appData->setId("last_api_pull_date");
			$appData->setValue(date('Y-m-d H:i:s'));
			$em->persist($appData);
			$em->flush();

			$triggerApiUpdate = true;

		}
		else{

			$lastDate = DateTime::createFromFormat('Y-m-d H:i:s', $appData->getValue());
			$diff = abs(($lastDate->getTimestamp() - (new DateTime())->getTimestamp()) / 60);
			
			if($diff > 180){
				$triggerApiUpdate = true;
			}				

		}

		if($triggerApiUpdate){

			$ores = $em->getRepository("Ore")->findAll();

			foreach ($ores as $ore) {
				$unitPrice = ESIApiService::getLatestItemPrice($ore->getRef());
				$ore->setUnitPrice($unitPrice);
				$normalizedPrice = $unitPrice * (10 / $ore->getUnitVolume());
				$normalizedPrice = floor($normalizedPrice * 100) / 100;
				$ore->setNormalizedPrice($normalizedPrice);
			}

			$appData->setValue(date('Y-m-d H:i:s'));

			$em->flush();

			$content="Cache data successfully updated from ESI API";

		}

		else{

			$content="Warning: API Call bypassed (Permission denied or Already up to date)";
		}

		$this->response->setContent($content);

	}
}