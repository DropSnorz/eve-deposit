<?php
    require_once "config.php";
    require_once "src/Bootstrap.php";

    session_start();

    $boot = new Bootstrap();
    $boot->start();

?>