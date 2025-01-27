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

	$eventId = $_POST['eventId'];
 	$event_root = $dom->getElementById($eventId);
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
		if (!in_array($key, array("eventId", "send"))){
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
        $dom->save($xml);

        $xmlPath = '../../database/events.xml';
        $foXslPath = '../xslt/foConfirmation.xsl';
        $eventXslPath = '../xslt/events.xsl';
        $pdfPath = '../xhtml/confirmation-'.$regId.'.pdf';
        $foFile = '../../database/confirmation.fo';

        $foData = generateFoFile($xmlPath, $foXslPath, $eventId,$regId);

        // create an instance of the FOP client and perform service request.
        $serviceClient = new FOPServiceClient();
        $serviceClient->processFile($foFile, $pdfPath);

        header("Location:../../routing.php?personId={$regId}&eventId={$eventId}");

    } else {
        echo "<p>Die eingegebenen Daten können nicht verarbeitet werden. </br>Bitte füllen Sie Das Formular nochmals aus und kontrollieren Sie die Daten.</p>";
		echo "<a href='../../singleevent.php?eventId=$eventId'>Zurück zum Event</a>";
        header("Location:../../errorPage.php");
    }

} else {
    header("Location:../../errorPage.php");}
?>