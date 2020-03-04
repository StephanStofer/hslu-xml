<?php

$fileParam = $_GET['file'];
$fileName = urldecode($fileParam);
$type = 'application/pdf';
$download = new FileDownload($fileName, $type);
$download->send();

final class FileDownload {

    private $fileName;
    private $type;

    function __construct($fileName, $type) {
        $this->fileName = $fileName;
        $this->type = $type;
    }

    public function send() {

        // send header
        header('Content-Description: File Transfer');
        header('Content-Type: application/octet-stream');
        header('Content-Disposition: attachment; filename=' . $this->fileName);
        header('Content-Transfer-Encoding: binary');
        header('Expires: 0');
        header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
        header('Pragma: public');
        header('Content-Length: ' . filesize($this->fileName));

        // send file
        ob_clean();
        flush();
        readfile($this->fileName);
    }

}