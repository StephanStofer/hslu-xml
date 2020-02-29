 <?php
 error_reporting(E_ALL);
if(isset($_POST['send'])){
#minus submit, fname, lname, eventid
	$numOptions = count($_POST);
	
	$eventid = $_POST['eventid'];
		
	## SOUT
	echo "number of params: ",$numOptions,"<br/><br/>";/*
	foreach($_POST AS $key => $value) { echo $key," : ", $value, "<br/>";}
		*/
	$xml = '../../database/events.xml';

	$dom = new DomDocument('1.0', 'UTF-8');
	$dom->load($xml);
	
	// define id attributes
	foreach($dom->getElementsByTagName('event') as $event)
		$event->setIdAttribute('id',true);
 
	$event_root = $dom->getElementById($eventid);
	$participants = $event_root->getElementsByTagName('participants')->item(0);
	
	$newPerson = $dom->createElement("person");
	
	foreach($_POST AS $key => $value) {
		if (!in_array($key, array("eventid", "send"))){
			echo $key," : ", $value, "<br/>";
		$newAttribute = $dom->createAttribute($key);
		$newAttribute->value=($value);
		$newPerson->appendChild($newAttribute);
		}
	}
	$participants->appendChild($newPerson);
	$dom->save($xml);
	
	echo "saved in xml";
	
} else {
	echo "wrong form";
}
?>