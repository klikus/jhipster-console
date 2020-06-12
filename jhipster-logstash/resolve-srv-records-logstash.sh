#!/usr/bin/env bash

echo "Resolving ELASTICSEARCH_HOST: ${ELASTICSEARCH_HOST}"
resolvedIp=$(nslookup -q=SRV ${ELASTICSEARCH_HOST} | grep ${ELASTICSEARCH_HOST})  \
&& if [[ $resolvedIp =~ "can't find" ]];
then echo "No SRV record" ;
 else export ELASTICSEARCH_HOST=$(echo  ${resolvedIp} | awk '{print $7}' | rev | cut -c 2- | rev ) && echo "SRV ELASTICSEARCH_HOST is ${ELASTICSEARCH_HOST}"; fi

logstash -f /usr/share/logstash/pipeline/logstash.conf
