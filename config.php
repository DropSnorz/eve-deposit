<?php

require_once __DIR__  . "/vendor/autoload.php";

use Doctrine\ORM\Tools\Setup;
use Doctrine\ORM\EntityManager;



// Server parameters

define('DIR_BASE',      __DIR__  . '/');
define('DIR_MODULES',  DIR_BASE . "src/");
define('DIR_CORE',    DIR_MODULES . 'core/');


// Run mode

$isDevMode = true;
$appModules = array("core", "refinery");


// Database configuration

$db_user = "root";
$db_pass = "";
$db_name = "eve_deposit";
$db_host = "localhost";


$proxyDir = DIR_BASE . "proxies";;



// Override current configuration with local properties
if(file_exists("config.local.php")){
  include __DIR__ ."/config.local.php";
}

define('APP_MODULES', $appModules);

foreach (APP_MODULES as $module){
    if(file_exists(DIR_MODULES . $module .'/Defaults.php')){
        include DIR_MODULES . $module .'/Defaults.php';
    }
}

//Doctrine ORM Configuration


$useSimpleAnnotationReader = true;
$cache = null;

if(!$isDevMode){

  $cache = new \Doctrine\Common\Cache\FilesystemCache("cache");

}

// Create a simple "default" Doctrine ORM configuration for Annotations
$config = Setup::createAnnotationMetadataConfiguration(getModulesFolders("models"), $isDevMode, $proxyDir, $cache, $useSimpleAnnotationReader);


$connectionParams = array(
    'dbname' => $db_name,
    'user' => $db_user,
    'password' => $db_pass,
    'host' => $db_host,
    'driver' => 'pdo_mysql',
    'charset'  => 'utf8',
    'driverOptions' => array(
        1002 => 'SET NAMES utf8'
    )
);

$conn = \Doctrine\DBAL\DriverManager::getConnection($connectionParams, $config);


// obtaining the entity manager
$entityManager = EntityManager::create($conn, $config);



function getModuleFolder($module, $folder){
    return DIR_MODULES . $module . "/" . $folder;
}

function getModulesFolders($folder){
    $arr = array();
    foreach (APP_MODULES as $module) {
        $arr[] = getModuleFolder($module, $folder);
    }

    return $arr;
}

class PersistenseService{

	private static $em;
	
	public static function getEntityManager(){

		return self::$em;
	}

	public static function setEntityManager($em){
		self::$em = $em;
	}


}

PersistenseService::setEntityManager($entityManager);

function getEntityManager(){
	return PersistenseService::getEntityManager();
}

