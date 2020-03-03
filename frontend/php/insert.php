 <?php
 
include 'validateXml.php';

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
	
	$newPerson = $dom->createElement("person");
	
	//Unique registration ID
	$regId = uniqid();
	$newAttribute = $dom->createAttribute("id");
	$newAttribute->value=($regId);
	$newPerson->appendChild($newAttribute);
	
	//Add every Post item as attribute exept those in the array :-)
	foreach($_POST AS $key => $value) {
		if (!in_array($key, array("eventid", "send"))){
			echo $key," : ", $value, "<br/>";
		$newAttribute = $dom->createAttribute($key);
		$newAttribute->value=($value);
		$newPerson->appendChild($newAttribute);
		}
	}
	
	//validateXml
	$validator = new DomValidator;
	$validated = false;
	
	$schema='../../database/events.xsd';
	
	$participants->appendChild($newPerson);
	
	try {
		$validated = $validator->validateDomDocument($dom, $schema);
		$dom->save($xml);
		echo "saved in xml";
	} catch (Exception $e) {
		echo 'Exception abgefangen: ',  $e->getMessage(), "\n";
	}	
	
} else {
	echo "wrong form";
}
?>