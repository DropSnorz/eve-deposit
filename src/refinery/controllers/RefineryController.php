<?php
require_once DIR_CORE . "services/AuthentificationService.php";

class RefineryController extends BaseController{

	function getHome(){

		$em = getEntityManager();

		$primaryOres = $em->getRepository("Ore")->findAllPrimaryOreSecondaryRelated();
		$primaryOres_json =  json_encode($primaryOres);

		$minerals = $em->getRepository("Mineral")->findAllAsArray();
		$minerals_json = json_encode($minerals);

		$data = ["primaryOresData" => $primaryOres_json,
				"mineralsData" => $minerals_json];
		$content = $this->render('home', $data);
		$this->response->setContent($content);
	}
}