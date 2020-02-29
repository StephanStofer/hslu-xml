 <?php
 error_reporting(E_ALL);
if(isset($_POST['submit'])){
#minus submit, fname, lname, eventid
	$numOptions = count($_POST)-9;
	
	$eventid = $_POST['eventid'];
	
	$f_name = $_POST['f_name'];
	$l_name = $_POST['l_name'];
	$address = $_POST['address'];
	$postCode = $_POST['postCode'];
	$city = $_POST['city'];
	$email = $_POST['email'];
	$phone = $_POST['phone'];
	
	
	## SOUT
	echo "number of params: ",$numOptions,"<br/><br/>";
	foreach($_POST AS $key => $value) { echo $key," : ", $value, "<br/>";}
	
	
	
	$xml = '../../database/events.xml';

	$dom = new DomDocument('1.0', 'UTF-8');
	$dom->load($xml);
	
	// define id attributes
	foreach($dom->getElementsByTagName('event') as $event)
		$event->setIdAttribute('id',true);
 
	$event_root = $dom->getElementById('3926c5a3-ffa1-4d90-8498-12fb65e86637');
	$participants = $event_root->getElementsByTagName('participants')->item(0);
	
	
	$newPerson = $dom->createElement("person");
	
	$firstName = $dom->createAttribute("firstName");
	$firstName->value=($f_name);
	$newPerson->appendChild($firstName);
		
	$lastName = $dom->createAttribute("lastName");
	$lastName->value=($l_name);
	$newPerson->appendChild($lastName);	
	
	$address = $dom->createAttribute("address");
	$address->value=($address);
	$newPerson->appendChild($address);
	
	
		
	

	$lastName = $dom->createAttribute("lastName");
	$address = $dom->createAttribute("address");
	$postCode = $dom->createAttribute("postCode");
	$city = $dom->createAttribute("city");
	$email = $dom->createAttribute("email");
	$phone= $dom->createAttribute("phone");

	
	

	$postCode = $_POST['postCode'];
	$city = $_POST['city'];
	$email = $_POST['email'];
	$phone = $_POST['phone'];
	
	
	
	
	
} else {


	
	

	
	
	
	
	
	
	
	

	
	



}

?>