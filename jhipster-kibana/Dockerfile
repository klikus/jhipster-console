FROM docker.elastic.co/kibana/kibana-oss:7.6.2
USER root
RUN yum update -y && yum install -y bind-utils && yum clean all
USER kibana
ENV ELASTICSEARCH_HOST=jhipster-elasticsearch
ENV ELASTICSEARCH_PORT=9200
COPY kibana.yml /usr/share/kibana/config/kibana.yml
RUN ./bin/kibana-plugin install https://github.com/sivasamyk/logtrail/releases/download/v0.1.31/logtrail-7.6.2-0.1.31.zip
COPY logtrail.json /usr/share/kibana/plugins/logtrail/logtrail.json
RUN /usr/local/bin/kibana-docker --optimize
COPY resolve-srv-records-kibana-console.sh ./
CMD ./resolve-srv-records-kibana-console.sh


