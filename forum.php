<?php
require_once 'frontend/php/transform.php';
if (isset($_GET['eventid'])) {
    $parameters = ["eventid" => $_GET['eventid']];
    transformXml('database/forum.xml', 'frontend/xslt/forum.xsl', $parameters);
    } else {

##text this event does not exist anymore
    echo "no eventid was passed...";

}
?>