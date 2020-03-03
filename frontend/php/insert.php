 <?php
 
include 'validateXml.php';

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
	$schemaLocation='../../database/events.xsd';
	
	try {
		$validated = $validator->validateDomDocument($dom, $schemaLocation);
	} catch (Exception $e) {
		echo 'Exception abgefangen: ',  $e->getMessage(), "\n";
	}	
	
	if ($validated) {
		$dom->save($xml);
		//TODO instead of Echo -> confirmation page with FO Document download
		header('Location: ../../index.php');
	} else {
		//TODO instead of Print errors -> errorpage with a hint on what input to improve :)
		print_r($validator->displayErrors());
	}
	
} else {
	echo "wrong form";
}
?>