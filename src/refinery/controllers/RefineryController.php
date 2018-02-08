<?php
require_once DIR_CORE . "services/AuthentificationService.php";
require_once DIR_REFINERY . "services/ESIApiService.php";
require_once DIR_REFINERY . "services/RefineryService.php";

class RefineryController extends BaseController{

	function getHome(){

		$primaryOres = RefineryService::getOreList();
		$minerals = RefineryService::getMinerals();
		$reprocessingStats = RefineryService::getReprocessingStats();

		$em = getEntityManager();

		$bestHSOre = $em->getRepository("Ore")->findBestHSOre();
		$bestLSOre = $em->getRepository("Ore")->findBestLSOre();


		$data = ["primaryOresData" => $primaryOres,
				"mineralsData" => $minerals,
				"oreMineralData" => $reprocessingStats,
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