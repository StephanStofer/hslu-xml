<?php
require_once 'frontend/php/transform.php';
if (isset($_GET['eventId'])) {
    transformXml('database/events.xml', 'frontend/xslt/singleEvent.xsl', array('eventId' => $_GET['eventId'], 'pdfPath' => 'frontend/xhtml/confirmation.pdf'));
} else {

    header("Location:/errorPage.php");

}