<?php
require_once "../../../config.php";
require_once DIR_REFINERY . "services/ESIApiService.php";


$content = ESIApiService::updateData();
echo($content);

