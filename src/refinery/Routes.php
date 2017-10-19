<?php
require_once DIR_REFINERY . "controllers/RefineryController.php";

return [

    ['GET', '/', "RefineryController/getHome"],
    ['GET', '/pullESIData', "RefineryController/pullESIData"]

];

