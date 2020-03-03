 <?php
 error_reporting(E_ALL);
if(isset($_POST['sendQuestion'])){
#minus submit, fname, lname, eventid

	$eventid = $_POST['eventid'];
    $firstName = $_POST['firstName'];

	$xml = '../../database/forum.xml';

	$dom = new DomDocument('1.0', 'UTF-8');
	$dom->load($xml);
	
    $root = $dom->getElementsByTagName('forum')->item(0);

    $event = null;
    if(empty($dom->getElementById('$eventid'))){
        $event = $dom->createElement("event");
        $event->setAttribute("id",$eventid);
    }else{
        $event = $root->getElementById($eventid);
    }
    $uniqueId = uniqid(rand(),true);

    $question = $dom->createElement("question");
    $question->setAttribute("id",$uniqueId);

    $firstNameEl = $dom->createElement("firstName", $firstName);
    $contentEl = $dom->createElement("content", $_POST['question']);

    $question->appendChild($firstNameEl);
    $question->appendChild($contentEl);

    $event->appendChild($question);

    $root->appendChild($event);

	$dom->save($xml);

	header("Location:../../forum.php?$eventid");
	echo "saved in xml";
	
} else {
	echo "wrong form";
}
?>