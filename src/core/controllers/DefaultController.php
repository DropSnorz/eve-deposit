<?php

require_once DIR_CORE . "services/AuthentificationService.php";

class DefaultController extends BaseController{



	function getHome(){

		$data = [];
		$content = $this->renderer->render('home', $data);
		$this->response->setContent($content);

	}

	function getLogin(){
		$data = [];
		$content = $this->renderer->render('login', $data);
		$this->response->setContent($content);
	}

	function postLogin(){

		//TODO handle missing parameters
		$login = $this->request->getParameter("username");
		$password = $this->request->getParameter("password");

		$data = [];


		if(AuthentificationService::getInstance()->auth($login, $password)){
			$this->response->setHeader("Location", "/admin/dashboard");

		}
		else{

			MessageService::setMessage("error", "Wrong username or password");
			$content = $this->renderer->render('login', $data);
			$this->response->setContent($content);

		}
	}


	function getLogout(){
		AuthentificationService::getInstance()->logout();
		$this->response->setHeader("Location", "/");
	}
}