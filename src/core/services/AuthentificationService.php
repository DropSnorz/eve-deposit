<?php

class AuthentificationService{
	
	private static $_instance = null;



	public function isLogged(){

		return isset($_SESSION['user-id']) && !empty($_SESSION['user-id']);

	}

	public function getCurrentUser(){

		$id = $_SESSION['user-id'];
		if($this->isLogged()) {
    		return getEntityManager()->find('User', $id);
    	}

    	return null;

	}


	public function loginRequired(){

		if(!$this->isLogged()){
			http_response_code(403);
			header("Location: ". $this->getRedirect());
			die();
		}
	}


	public function getRedirect(){

		return "/login";
	}


	public function auth($login, $password){

		$user = getEntityManager()->getRepository('User')
                      ->findOneBy(array('username' => $login));


		if($user != null)
		{
			if ($this->checkHash($user->getPassword(), $password)){
				$_SESSION['user-id'] = $user->getId();

				return true;
			}
			return false;
		}
		else
		{
			return false;
		}
	}

	public function logout(){
		session_destroy();
	}


	public function generateHash($password){
		
		return password_hash($password, PASSWORD_DEFAULT);	
	}
	
	private function checkHash($hash, $password){
		
		return password_verify($password, $hash);
		
	}

	public static function getInstance() {
 
	    if(is_null(self::$_instance)) {
	       self::$_instance = new AuthentificationService();  
	    }
 
    	return self::$_instance;
   }

}