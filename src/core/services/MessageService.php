<?php

class MessageService{
	
	public static function setMessage($type, $message){

		$_SESSION['core_message_text'] = $message;
		$_SESSION['core_message_type'] = $type;
		$_SESSION['core_message_keeptoken'] = "01A";


	}

	public static function flush(){

		unset($_SESSION['core_message_text']);
		unset($_SESSION['core_message_type']);
		unset($_SESSION['core_message_keeptoken']);


	}

	public static function hasMessage(){
		return isset($_SESSION['core_message_text']);
	}

	public static function getMessage(){

		$message['text'] = NULL;
		if(isset($_SESSION['core_message_text'])){
			$message['text'] = $_SESSION['core_message_text'];
		}

		$message['type'] = NULL;
		if(isset($_SESSION['core_message_type'])){
			$message['type'] = $_SESSION['core_message_type'];
		}

		return $message;
	}

	public static function readMessage(){
		$message = self::getMessage();
		unset($_SESSION['core_message_keeptoken']);

		return $message;

	}

	public static function processRequest(){

		if(isset($_SESSION['core_message_keeptoken']) && $_SESSION['core_message_keeptoken'] == "01A"){
			unset($_SESSION['core_message_keeptoken']);
		}
		else{
			self::flush();
		}

	}


}

?>