#! /bin/bash
curl '192.168.15.245:8080/jnlpJars/jenkins-cli.jar' > jenkins-cli.jar
SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for i in *.xml;
do
java -jar jenkins-cli.jar -s http://192.168.15.245:8080 -auth admin:teste.1  create-job ${i%.*}  < $i
done
IFS=$SAVEIFS