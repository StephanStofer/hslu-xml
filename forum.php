<?php
require_once 'frontend/php/transform.php';
if (isset($_GET['eventid'])) {
    transformXmlId('database/forum.xml', 'frontend/xslt/forum.xsl', $_GET['eventid']);
    } else {

##text this event does not exist anymore
    echo "no eventid was passed...";

}
?>