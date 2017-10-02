<?php
require_once DIR_CORE . "services/AuthentificationService.php";

class RefineryController extends BaseController{

	function getHome(){

		$data = [];
		$content = $this->render('home', $data);
		$this->response->setContent($content);
	}
}