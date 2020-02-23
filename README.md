# HSLU_XML
Projektrepo für Blockwoche XML


## Lokaler Webserver mit Docker
Im Projektordner folgende Commands ausführen. Während dem Docker Build Prozess werden die nötigen Infos von der Datei 'DOCKERFILE' angezogen. 

```bash
docker build -t webserver .
docker run -dit --name webserver -p 8080:80 webserver
```

Sobald Webserver läuft im Webbrowser aufrufen
``` 
http://localhost:8080 
```

