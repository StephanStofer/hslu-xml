<?php
require_once 'frontend/php/transform.php';

## singleevent should be called with an event ID in order to display the proper event.
if (isset($_GET['eventid'])){
	transformXmlId('database/events.xml', 'frontend/xslt/singleevent.xsl', $_GET['eventid']);
} else {
	
##text this event does not exist anymore
echo "no eventid was passed...";

}
?>