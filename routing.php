<?php
require_once 'frontend/php/transform.php';
if (isset($_GET['eventId'], $_GET['personId'])) {
    transformXml('database/events.xml', 'frontend/xslt/singleEvent.xsl', array('eventId' => $_GET['eventId'], 'pdfPath' => 'frontend/xhtml/confirmation-'.$_GET['personId'].'.pdf'));
} else {

    header("Location:/errorPage.php");

}