<?php
require_once 'frontend/php/transform.php';

## singleevent should be called with an event ID in order to display the proper event.
if (isset($_GET['eventId'])){
	transformXml('database/events.xml', 'frontend/xslt/singleEvent.xsl', array('eventId' => $_GET['eventId']));
} else {
	
    header("Location:/errorPage.php");

}
?>