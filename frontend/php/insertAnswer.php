 <?php
 error_reporting(E_ALL);
if(isset($_POST['sendAnswer'])){
#minus submit, fname, lname, eventid

	$eventid = $_POST['eventid'];
	$questionid = $_POST['questionid'];

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
    foreach($dom->getElementsByTagName('question') as $question)
        $question->setIdAttribute('id',true);
    $question = $dom->getElementById($questionid);

    $answer = $dom->createElement("answer");

    $firstNameEl = $dom->createElement("firstName", $_POST['firstNameA']);
    $contentEl = $dom->createElement("content", $_POST['answer']);

    $answer->appendChild($firstNameEl);
    $answer->appendChild($contentEl);

    $question->appendChild($answer);

	$dom->save($xml);

	header("Location:../../forum.php?eventid={$eventid}");
	echo "saved in xml";
	
} else {
	echo "wrong form";
}
?>