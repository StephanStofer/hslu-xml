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
//    echo "<script>console.log('Debug path " .$data."');</script>";
    $xml = new DOMDocument();
    $xml->loadXML($xmlPath);
    echo "<script>console.log('xml loaded' );</script>";

    $xsl = new DOMDocument();
    $xsl->load($xslPath);
    echo "<script>console.log('xsl loaded' );</script>";

    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);
    echo "<script>console.log('xslt imported' );</script>";

    //$processor->setParameter('', 'personId', 'test');

    $dom = $processor->transformToDoc($xml);
    echo "<script>console.log('foFile transformed' );</script>";
    return $dom->save('../../database/order.fo');
//    return $foFile->saveXML();
}

?>