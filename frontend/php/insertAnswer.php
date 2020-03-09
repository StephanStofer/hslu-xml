<?php
error_reporting(E_ALL);
include 'validateXml.php';
if (isset($_POST['sendAnswer'])) {
#minus submit, fname, lname, eventid

    $eventid = $_POST['eventid'];
    $questionid = $_POST['questionid'];

    $xml = '../../database/forum.xml';

    $dom = new DomDocument('1.0', 'UTF-8');
    $dom->load($xml);

    $root = $dom->getElementsByTagName('forum')->item(0);

    $root_event = null;
    if ($dom->getElementsByTagName('event') != null) {
        // define id attributes - needed to actually add attributes
        foreach ($dom->getElementsByTagName('event') as $event)
            $event->setIdAttribute('id', true);

        $old_root_event = $dom->getElementById($eventid);
        if ($old_root_event == null) {
            $root_event = $dom->createElement('event');
            $root_event->setAttribute("id", $eventid);
        } else {
            $root_event = $old_root_event;
        }
    } else {
        $root_event = $dom->createElement('event');
        $root_event->setAttribute("id", $eventid);
    }
    foreach ($dom->getElementsByTagName('question') as $question)
        $question->setIdAttribute('id', true);
    $question = $dom->getElementById($questionid);

    $answer = $dom->createElement("answer");

    $timestamp = date("Y-m-d");

    $firstNameEl = $dom->createElement("firstName", $_POST['firstNameA']);
    $contentEl = $dom->createElement("content", $_POST['answer']);
    $timestampEl = $dom->createElement("time",$timestamp);

    $answer->appendChild($firstNameEl);
    $answer->appendChild($contentEl);
    $answer->appendChild($timestampEl);

    $question->appendChild($answer);

    // Validation of new Dom Document
    $validator = new DomValidator;
    $validated = false;
    $schemaLocation = '../../database/forum.xsd';

    try {
        $validated = $validator->validateDomDocument($dom, $schemaLocation);
    } catch (Exception $e) {
        echo 'Exception abgefangen: ', $e->getMessage(), "\n";
    }

    if ($validated) {
        $dom->save($xml);
        header("Location:http://xml.joshuart.ch/forum.php?eventid={$eventid}");
    } else {
        echo print_r($validator->displayErrors());
    }


} else {
    echo "wrong form";
}
?>
