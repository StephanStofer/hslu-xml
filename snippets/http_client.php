<?php

/**
 * A simple client to perform HTTP requests.
 * @author Roland Christen <roland.christen@hslu.ch>
 */
class HTTPClient {

    const STATUS_OK = 200;
    private $host;

    /**
     *
     * @param type $host The hostname or address to connect to.
     */
    public function __construct($host) {
        $this->host = $host;
    }

    /**
     * Performs a HTTP post request with a given query (server script) and a given payload.
     * @param string $query The path on the server (server script)
     * @param string $data The payload for the request.
     * @return array The response from the server {statusCode:int, data:string).
     */
    public function postRequest($query, $data) {

        // execute POST request
        $ch = curl_init();
        $url= sprintf("%s/%s", $this->host, $query);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POST, 1);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $data);

        // get response and extract status code
		$response = curl_exec($ch);
		$info = curl_getinfo($ch);
		$code = $info['http_code'];

        // combine results and return.
        return array($code, $response);

    }

}