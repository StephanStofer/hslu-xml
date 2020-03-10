 <?php
 error_reporting(E_ALL);
 include 'validateXml.php';
if(isset($_POST['sendQuestion'])){
#minus submit, fname, lname, eventId

	$eventId = $_POST['eventId'];

	$xml = '../../database/forum.xml';

	$dom = new DomDocument('1.0', 'UTF-8');
	$dom->load($xml);

    $root = $dom->getElementsByTagName('forum')->item(0);

    $root_event = null;
    if($dom->getElementsByTagName('event') != null ){
        // define id attributes - needed to actually add attributes
        foreach($dom->getElementsByTagName('event') as $event)
            $event->setIdAttribute('id',true);

        $old_root_event = $dom->getElementById($eventId);
        if ($old_root_event==null){
            $root_event = $dom->createElement('event');
            $root_event->setAttribute("id",$eventId);
        }else{
            $root_event = $old_root_event;
        }
    }else{
        $root_event = $dom->createElement('event');
        $root_event->setAttribute("id",$eventId);
    }
    $uniqueId = uniqid(rand(),true);
    $timestamp = date("Y-m-d");

    $question = $dom->createElement("question");
    $question->setAttribute("id",$uniqueId);

    $firstNameEl = $dom->createElement("firstName", $_POST['firstName']);
    $contentEl = $dom->createElement("content", $_POST['question']);
    $timestampEl = $dom->createElement("time", $timestamp);

    $question->appendChild($firstNameEl);
    $question->appendChild($contentEl);
    $question->appendChild($timestampEl);

    $root_event->appendChild($question);

    $root->appendChild($root_event);

    // Validation of new Dom Document
    $validator = new DomValidator;
    $validated = false;
    $schemaLocation='../../database/forum.xsd';

    try {
        $validated = $validator->validateDomDocument($dom, $schemaLocation);
    } catch (Exception $e) {
        echo 'Exception abgefangen: ',  $e->getMessage(), "\n";
    }

    if ($validated) {
        $dom->save($xml);
        header("Location:/forum.php?eventId={$eventId}");
    } else {
        header("Location:/errorPage.php");
    }



} else {
	echo "wrong form";
}
?>
