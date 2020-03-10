<?php
require_once 'frontend/php/transform.php';

## singleevent should be called with an event ID in order to display the proper event.
if (isset($_GET['eventid'])){
	$parameters = ["eventid" => $_GET['eventid']];
	transformXml('database/events.xml', 'frontend/xslt/singleEvent.xsl', $parameters);
} else {
	
##text this event does not exist anymore
echo "no eventid was passed...";

}
?>