<?php

require_once __DIR__ . "/../config.php";
require_once DIR_BASE . "vendor/autoload.php";
require_once DIR_CORE . "services/MessageService.php";
require_once "TwigRenderer.php";

class Bootstrap{

	public function start(){


		$dispatcher = FastRoute\simpleDispatcher(function(FastRoute\RouteCollector $r) {

				$routes = array();
				foreach(APP_MODULES as $module){
			    	$routes = array_merge($routes, include(DIR_MODULES . $module . '/Routes.php'));
				}

    			foreach ($routes as $route) {
        			$r->addRoute($route[0], $route[1], $route[2]);
   		 		}
		});

		$injector = include('Dependencies.php');

		$request = $injector->make('Http\HttpRequest');
		$response = $injector->make('Http\HttpResponse');

		// Fetch method and URI from somewhere
		$httpMethod = $_SERVER['REQUEST_METHOD'];
		$uri = $_SERVER['REQUEST_URI'];

		// Strip query string (?foo=bar) and decode URI
		if (false !== $pos = strpos($uri, '?')) {
		    $uri = substr($uri, 0, $pos);
		}
		$uri = rawurldecode($uri);


		$routeInfo = $dispatcher->dispatch($httpMethod, $uri);
		switch ($routeInfo[0]) {
		    case FastRoute\Dispatcher::NOT_FOUND:

		    	http_response_code(404);

		        return false;
		        break;
		    case FastRoute\Dispatcher::METHOD_NOT_ALLOWED:
		        $allowedMethods = $routeInfo[1];
		        // ... 405 Method Not Allowed
		        break;
		    case FastRoute\Dispatcher::FOUND:
		        $handler = $routeInfo[1];
		        $vars = $routeInfo[2];

		        $negotiator = new \Negotiation\Negotiator();

                if(isset($_SERVER['HTTP_ACCEPT'])){

                    $acceptHeader = $_SERVER['HTTP_ACCEPT'];
                    $priorities   = array('text/html', 'application/json', 'application/xml');
                    $mediaType = $negotiator->getBest($acceptHeader, $priorities);
                    $retainedType = $mediaType->getValue();

                }
                else{
                    $retainedType = 'text/html';
                }

                MessageService::processRequest();

				list($className, $method) = explode("/", $handler, 2);


				if($retainedType == "application/json" && method_exists($className, $method . "_json" )){
					call_user_func_array(array($injector->make($className), $method . "_json"), $vars);

				}
				elseif($retainedType == "application/xml" && method_exists($className, $method . "_xml" )){

    				call_user_func_array(array($injector->make($className), $method . "_xml"), $vars);
				}
				else{

    				call_user_func_array(array($injector->make($className), $method), $vars);
				}


    			foreach ($response->getHeaders() as $header) {
    				header($header, false);
    			}

    			echo $response->getContent();

		        break;
		}
	}
}


?>
