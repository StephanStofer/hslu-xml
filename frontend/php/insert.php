<?php

include 'validateXml.php';
require_once 'transform.php';
require_once 'fopServiceClient.php';



//TODO kill error reporting for final version
error_reporting(E_ALL);

if(isset($_POST['send'])){
	$xml = '../../database/events.xml';
	$dom = new DomDocument('1.0', 'UTF-8');
	$dom->load($xml);

	// define id attributes - needed to actually add attributes
	foreach($dom->getElementsByTagName('event') as $event)
		$event->setIdAttribute('id',true);

	$eventid = $_POST['eventid'];
 	$event_root = $dom->getElementById($eventid);
	$participants = $event_root->getElementsByTagName('participants')->item(0);

	//TODO Count participants and check wether maximum reached...

	$newPerson = $dom->createElement("person");

	//Create unique registration ID
	$regId = uniqid();
	$newAttribute = $dom->createAttribute("id");
	$newAttribute->value=($regId);
	$newPerson->appendChild($newAttribute);

	//Add every post item as attribute exept those in the array
	foreach($_POST AS $key => $value) {
		if (!in_array($key, array("eventid", "send"))){
		$newAttribute = $dom->createAttribute($key);
		$newAttribute->value=($value);
		$newPerson->appendChild($newAttribute);
		}
	}

	$participants->appendChild($newPerson);

    // Validation of new Dom Document
    $validator = new DomValidator;
    $validated = false;
    $schemaLocation = '../../database/events.xsd';

    try {
        $validated = $validator->validateDomDocument($dom, $schemaLocation);
    } catch (Exception $e) {
        echo 'Exception abgefangen: ', $e->getMessage(), "\n";
    }

    if ($validated) {
        echo "<script>console.log('validated' );</script>";

        $dom->save($xml);

        $xmlPath = '../../database/events.xml';
        $xslPath = '../xslt/pdf.xsl';
        $pdfPath = '../xhtml/order.pdf';

        $foData = generateFoFile($xmlPath, $xslPath, $eventid,$regId);
        echo "<script>console.log('generate fo: " . print_r($foData) . "');</script>";

        // create an instance of the FOP client and perform service request.
        $serviceClient = new FOPServiceClient();
        $serviceClient->processFile('../../database/order.fo', $pdfPath);

        echo '<h1>Herzlichen Dank für Ihre Anmeldung</h1>';
        echo sprintf('<p>Ihre Bestellung ist bei uns eingegangen.<br></p>');
        echo sprintf('<p>Bestellbestätigung:<br><strong><a href="%s" target="_blank">download PDF</a></strong></p>', $pdfPath);
    } else {
        echo "<p>Die eingegebenen Daten können nicht verarbeitet werden. </br>Bitte füllen Sie Das Formular nochmals aus und kontrollieren Sie die Daten.</p>";
		echo "<a href='../../singleevent.php?eventid=$eventid'>Zurück zum Event</a>";
    }

} else {
	echo "wrong form";
}
?>