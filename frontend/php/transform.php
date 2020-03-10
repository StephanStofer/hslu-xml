<?php
/** 
 * Function transform the XML to a XHTML document. 
 * @param resource $xmlPath contains the path to the XML and the XML document itself.
 * @param resource $xslPath contains the path to the XSL and the XSL document itself.
 * @param resource $parameters optional parameter. Holds parameter in a key-value array. 
 *  
*/
function transformXml($xmlPath, $xslPath, $parameters = null)
{
    $xml = new DOMDocument();
    $xml->load($xmlPath);
    $xsl = new DOMDocument();
    $xsl->load($xslPath);

    
    $processor = new XSLTProcessor();
    $processor->importStylesheet($xsl);
    
    if(!is_null($parameters)) {
        foreach ($parameters as $key => $value) {
            $processor->setParameter('', $key, $value); 
        }
    }
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
    return $foFile->save("../../database/confirmation.fo");
}

?>