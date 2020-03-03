 <?php
 
 /*

USAGE like in the example below

$xml='db.xml';
$schema='db.xsd';

$validator = new DomValidator;
$validated = false;

try {
	$validated = $validator->validateXml($xml, $schema);
} catch (Exception $e) {
    echo 'Exception abgefangen: ',  $e->getMessage(), "\n";
}


if ($validated) {
  echo "xml successfully validated";
} else {
	echo "something went wrong";
	//display error
  print_r($validator->displayErrors());
}
  
 */
  
 
 /**
  * Validator Source https://www.codementor.io/@sirolad/validating-xml-against-xsd-in-php-6f56rwcds
  * Code changed by mau in order to provide xml and schema without hardcoded paths
  */
 
class DOMValidator
{
    public $feedErrors = 0;
    public $errorDetails;
	
    /**
     * Validation Class constructor Instantiating DOMDocument
     *
     * @param \DOMDocument $handler [description]
     */
    public function __construct()
    {
        $this->handler = new \DOMDocument('1.0', 'utf-8');
    }
	
    /**
     * @param \libXMLError object $error
     *
     * @return string
     */
    private function libxmlDisplayError($error)
    {
        $errorString = "Error $error->code in $error->file (Line:{$error->line}):";
        $errorString .= trim($error->message);
        return $errorString;
    }
	
    /**
     * @return array
     */
    private function libxmlDisplayErrors()
    {
        $errors = libxml_get_errors();
        $result    = [];
        foreach ($errors as $error) {
            $result[] = $this->libxmlDisplayError($error);
        }
        libxml_clear_errors();
        return $result;
    }
	
    /**
     * Validate Incoming Feeds against Listing Schema
     *
     * @param resource $xmlDomDocument
     * @param resource $schemaFilePath
     * @return bool
     *
     * @throws \Exception
     */
    public function validateDomDocument($xmlDomDocument, $schemaFilePath)
	{		
		if (!class_exists('DOMDocument')) {
            throw new \DOMException("'DOMDocument' class not found!");
            return false;
        }
        if (!file_exists($schemaFilePath)) {
            throw new \Exception('Schema is Missing, Please pint to proper file');
            return false;
        }
        libxml_use_internal_errors(true);
		
        if (!$xmlDomDocument->schemaValidate($schemaFilePath)) {
           $this->errorDetails = $this->libxmlDisplayErrors();
           $this->feedErrors   = 1;
        } else {
          //The file is valid
           return true;
        }
    }
	    /**
     * Validate Incoming Feeds against Listing Schema
     *
     * @param resource $xmlFilePath
     * @param resource $schemaFilePath
     * @return bool
     *
     * @throws \Exception
     */
    public function validateXmlFile($xmlFilePath, $schemaFilePath)
    {
		if (!class_exists('DOMDocument')) {
            throw new \DOMException("'DOMDocument' class not found!");
            return false;
        }
        if (!file_exists($schemaFilePath)) {
            throw new \Exception('Schema is Missing, Please pint to proper file');
            return false;
        }
        libxml_use_internal_errors(true);
        if (!($fp = fopen(xmlFilePath, "r"))) {
           die("could not open XML input");
        }
        
        $contents = fread($fp, filesize(xmlFilePath));
        fclose($fp);
       
        $this->handler->loadXML($contents, LIBXML_NOBLANKS);
        if (!$this->handler->schemaValidate($schemaFilePath)) {
           $this->errorDetails = $this->libxmlDisplayErrors();
           $this->feedErrors   = 1;
        } else {
          //The file is valid
           return true;
        }
    }
	
    /**
     * Display Error if Resource is not validated
     *
     * @return array
     */
    public function displayErrors()
    {
        return $this->errorDetails;
    }
}

?>