 <?php
 error_reporting(E_ALL);
if(isset($_POST['sendQuestion'])){
#minus submit, fname, lname, eventid

	$eventid = $_POST['eventid'];

	$xml = '../../database/forum.xml';

	$dom = new DomDocument('1.0', 'UTF-8');
	$dom->load($xml);

    $root = $dom->getElementsByTagName('forum')->item(0);

    $root_event = null;
    if($dom->getElementsByTagName('event') != null ){
        // define id attributes - needed to actually add attributes
        foreach($dom->getElementsByTagName('event') as $event)
            $event->setIdAttribute('id',true);

        $old_root_event = $dom->getElementById($eventid);
        if ($old_root_event==null){
            $root_event = $dom->createElement('event');
            $root_event->setAttribute("id",$eventid);
        }else{
            $root_event = $old_root_event;
        }
    }else{
        $root_event = $dom->createElement('event');
        $root_event->setAttribute("id",$eventid);
    }
    $uniqueId = uniqid(rand(),true);

    $question = $dom->createElement("question");
    $question->setAttribute("id",$uniqueId);

    $firstNameEl = $dom->createElement("firstName", $_POST['firstName']);
    $contentEl = $dom->createElement("content", $_POST['question']);

    $question->appendChild($firstNameEl);
    $question->appendChild($contentEl);

    $root_event->appendChild($question);

    $root->appendChild($root_event);

	$dom->save($xml);

	header("Location:../../forum.php?eventid={$eventid}");
	echo "saved in xml";
	
} else {
	echo "wrong form";
}
?>