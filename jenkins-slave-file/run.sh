#!/bin/bash


set -x 
shopt -s nocasematch
#set rancher config
# {"accessKey":"ACCESSKEY","secretKey":"SECRETKEY","url":"URL/v2-beta/schemas","environment":"ENVIRONMENT"}
sed -i 's/ACCESSKEY/'"${ACCESSKEY}"'/' /root/.rancher/cli.json
sed -i 's/SECRETKEY/'"${SECRETKEY}"'/' /root/.rancher/cli.json

REG_WINGARDEN_URL=`echo ${WINGARDEN_URL} |sed 's/\\//\\\\\//g'`

sed -i 's/SERVER/'"${REG_WINGARDEN_URL}"'/' /root/.rancher/cli.json

sed -i 's/ENVIRONMENT/'"${ENVIRONMENT}"'/' /root/.rancher/cli.json
#set docker config

sed -i 's/IP/'"${REGISTRY_IP}"'/' /root/.docker/config.json

sed -i 's/AUTH/'"${REGISTRY_AUTH}"'/' /root/.docker/config.json

sed -i 's/IP/'"${REGISTRY_IP}"'/' /etc/docker/daemon.json



if [ ${REGISTRY_PORT} = "80"  ]; then
	sed -i 's/:PORT//' /etc/docker/daemon.json
	sed -i 's/:PORT//' /root/.docker/config.json
else
	echo ${REGISTRY_PORT}
	sed -i 's/PORT/'"${REGISTRY_PORT}"'/' /etc/docker/daemon.json
	sed -i 's/PORT/'"${REGISTRY_PORT}"'/' /root/.docker/config.json
fi

if [ ${REGISTRY_INSCURE} = true   ]; then
	sed -i 's/HTTP/http/' /etc/docker/daemon.json
else 
	sed -i 's/HTTP/https/' /etc/docker/daemon.json
	sed -i '/insecure-registries/d' /etc/docker/daemon.json
fi

if [ -e /var/run/docker.pid ]; then
 	#statements
 	rm -rf /var/run/docker.pid
fi
cron
dockerd -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock 2>&1 &

#!/bin/sh

# jenkins swarm slave
 
JENKINS_PARAMS=""
JENKINS_PASSWORD="w12sedwiokd"
JENKINS_USERNAME="jenkins"

if [ ! -z "$JENKINS_USERNAME" ]; then
  JENKINS_PARAMS="$JENKINS_PARAMS -username $JENKINS_USERNAME"
fi
if [ ! -z "$JENKINS_PASSWORD" ]; then
  JENKINS_PARAMS="$JENKINS_PARAMS -password $JENKINS_PASSWORD"
fi
if [ ! -z "$SLAVE_EXECUTORS" ]; then
  JENKINS_PARAMS="$JENKINS_PARAMS -executors $SLAVE_EXECUTORS"
fi
if [ ! -z "$JENKINS_MASTER" ]; then
    JENKINS_PARAMS="$JENKINS_PARAMS -master $JENKINS_MASTER"
fi


/bin/bash ./configServer
/jdk1.8.0_45/bin/java -jar /home/jenkins/swarm-client.jar ${JENKINS_PARAMS}
