#!/bin/bash
curl --user $USER:$PASSWORD -X POST -F "jenkinsfile=<Jenkinsfile" http://192.168.15.245:8080/pipeline-model-converter/validate
