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
		    ->where(Criteria::expr()->eq("type", 1))
    		->andWhere(Criteria::expr()->gt("securityLevel", 0.4))
    		->setMaxResults(1)
		;

		$bestLSOreCriteria = Criteria::create()
		    ->where(Criteria::expr()->eq("type", 1))
    		->andWhere(Criteria::expr()->lt("securityLevel", 0.4))
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

		$content = ESIApiService::updateData();
		$this->response->setContent($content);

	}
}