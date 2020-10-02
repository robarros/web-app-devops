#!/bin/bash
#IFS for jobs with spaces.
curl '192.168.15.245:8080/jnlpJars/jenkins-cli.jar' > jenkins-cli.jar
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for i in $(java -jar jenkins-cli.jar -s http://192.168.15.245:8080  -auth admin:teste.1 list-jobs); 
do 
  java -jar jenkins-cli.jar -s http://192.168.15.245:8080  -auth admin:teste.1  get-job ${i} > ${i}.xml;
done
IFS=$SAVEIFS
# tar cvfj "jenkins-jobs.tar.bz2" ./*.xml