#!/usr/bin/env bash

echo "Resolving ELASTICSEARCH_URL: ${ELASTICSEARCH_URL}"
resolvedIp=$(nslookup -q=SRV ${ELASTICSEARCH_URL} | grep ${ELASTICSEARCH_URL})
if [[ $resolvedIp =~ "can't find" ]];
then export ELASTICSEARCH_HOSTS="http://${ELASTICSEARCH_URL}:${ELASTICSEARCH_PORT}"
 echo "No SRV record, ELASTICSEARCH_HOSTS is:" ;
else export ELASTICSEARCH_HOSTS="http://$(echo  ${resolvedIp} | awk '{print $7}' | rev | cut -c 2- | rev ):${ELASTICSEARCH_PORT}"
echo "SRV ELASTICSEARCH_HOSTS is :"; fi
printenv ELASTICSEARCH_HOSTS

/usr/local/bin/kibana-docker


