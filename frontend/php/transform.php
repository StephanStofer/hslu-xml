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

function generateFoFile($xmlPath, $xslPath, $personId)
{
    $data = file_get_contents($xmlPath);
    $xml = new DOMDocument();
    $xml->loadXML($data);

    $xsl = new DOMDocument();
    $xsl->load($xslPath);

    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);

    $processor->setParameter('', 'personId', $personId);

    $foFile = $processor->transformToDoc($xml);
    return $foFile->saveXML();
}

?>