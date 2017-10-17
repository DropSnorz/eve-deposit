<?php
require_once DIR_CORE . "services/AuthentificationService.php";
require_once DIR_REFINERY . "services/ESIApiService.php";

class RefineryController extends BaseController{

	function getHome(){

		$em = getEntityManager();

		$primaryOres = $em->getRepository("Ore")->findAllPrimaryOreSecondaryRelated();
		$primaryOres_json =  json_encode($primaryOres);

		$minerals = $em->getRepository("Mineral")->findAllAsArray();
		$minerals_json = json_encode($minerals);

		$oreMineral = $em->getRepository("OreMineral")->findAllReprocessingStats();
		$oreMineral_json = json_encode($oreMineral);

		$data = ["primaryOresData" => $primaryOres_json,
				"mineralsData" => $minerals_json,
				"oreMineralData" => $oreMineral_json];
		$content = $this->render('home', $data);
		$this->response->setContent($content);
	}

	function fetchMarketPrices(){


		$em = getEntityManager();
		$ores = $em->getRepository("Ore")->findAll();

		foreach ($ores as $ore) {
			$unitPrice = ESIApiService::getLatestItemPrice($ore->getRef());
			$ore->setUnitPrice($unitPrice);
			$normalizedPrice = $unitPrice * (10 / $ore->getUnitVolume());
			$normalizedPrice = floor($normalizedPrice * 100) / 100;
			$ore->setNormalizedPrice($normalizedPrice);
		}

		$em->flush();

		$content="Success";
		$this->response->setContent($content);


	}
}