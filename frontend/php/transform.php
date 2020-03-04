<?php

function transformXml($xml_path, $xsl_path)
{
    $xml = new DOMDocument();
    $xml->load($xml_path);
    $xsl = new DOMDocument();
    $xsl->load($xsl_path);

    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);

    print($processor->transformToXml($xml));
}

function transformXmlId($xml_path, $xsl_path, $eventid)
{
    $xml = new DOMDocument();
    $xml->load($xml_path);
    $xsl = new DOMDocument();
    $xsl->load($xsl_path);

    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);
	
	$processor->setParameter('', 'eventid', $eventid);
    print($processor->transformToXml($xml));
}

function generateFoFile($xmlPath, $xslPath, $personId) {
    echo "<script>console.log('Parameters: xmlPaht: " .$xmlPath . " xslPath: " . $xslPath . " personId: " .$personId."' );</script>";
    $data = file_get_contents($xmlPath);
    $xml = new DOMDocument();
    $xml->loadXML($data);
    echo "<script>console.log('Debug path " .$xmlPath . " and xml: " . $xml . "' );</script>";

    $xsl = new DOMDocument();
    $xsl->load($xslPath);
    echo "<script>console.log('Debug path " .$xslPath . " and xsl: " . $xsl . "' );</script>";

    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);
    echo "<script>console.log('Debug import " . $processor . "' );</script>";

    $processor->setParameter('', 'personId', $personId);

    $foFile = $processor->transformToDoc($xml);
    echo "<script>console.log('Debug foFile " . $foFile . "' );</script>";
    return $foFile->save();
}

?>