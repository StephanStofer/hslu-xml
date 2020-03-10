<?php
require_once 'frontend/php/transform.php';
if (isset($_GET['eventId'])) {
    transformXml('database/forum.xml', 'frontend/xslt/forum.xsl', array('eventId' => $_GET['eventId']));
    } else {

    header("Location:/errorPage.php");


}
?>