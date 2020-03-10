<?php

function transformXml($xml_path, $xsl_path, $parameters = null)
{
    $xml = new DOMDocument();
    $xml->load($xml_path);
    $xsl = new DOMDocument();
    $xsl->load($xsl_path);

    
    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);
    
    if(!is_null($parameters)) {
        foreach ($parameters as $key => $value) {
            $processor->setParameter('', $key, $value); 
        }
    }
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

function generateFoFile($xmlPath, $xslPath, $eventId, $personId)
{
    $data = file_get_contents($xmlPath);
    $xml = new DOMDocument();
    $xml->loadXML($data);

    $xsl = new DOMDocument();
    $xsl->load($xslPath);

    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);

    $processor->setParameter('', 'eventId', $eventId);
    $processor->setParameter('', 'personId', $personId);

    $foFile = $processor->transformToDoc($xml);
    return $foFile->save("../../database/order.fo");
}

?>