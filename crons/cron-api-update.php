<?php

/*
* CRON JOB (Web server self-requesting)
* This cron trigger a request on the web server to perform the cache update.
* Server can't directly handle Doctrine queries through cron executions.
* The request handler that process cache updates is protected to prevent server overload.
*/
echo "Starting CRON: cron-api-update...";

$curl = curl_init();

curl_setopt($curl, CURLOPT_URL, "http://evedeposit.dropsnorz.com/pullESIData");
curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);

$result = curl_exec($curl);

echo "Trigger WebServer Request...";

curl_close($curl);

echo($result);


