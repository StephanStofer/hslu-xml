 <?php
 
if(isset($_POST['submit'])){
	
	$f_name = $_POST['f_name'];
	$l_name = $_POST['l_name'];
	
	$xml = 'data.xml';

	$dom = new DomDocument('1.0', 'UTF-8');
	$dom->load($xml);

	$root = $dom->getElementsByTagName("Group")->item(0);

	$participant = $dom->createElement("Participant");
	$firstName = $dom->createElement("FirstName", $f_name);
	$lastName = $dom->createElement("LastName", $l_name);

	$participant->appendChild($firstName);
	$participant->appendChild($lastName);

	$root->appendChild($participant);
	$dom->save($xml);
	
	echo "success <br><br>";

	$root = $dom->documentElement;
	foreach ($root->childNodes AS $item) {
	print $item->nodeName . " = " . $item->nodeValue . "<br>";
	}

} else {
	echo "error";
}

?>