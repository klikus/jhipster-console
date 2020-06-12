FROM docker.elastic.co/logstash/logstash-oss:7.6.2
USER root
RUN yum update -y && yum install -y bind-utils && yum clean all
USER logstash
COPY logstash.yml /usr/share/logstash/config/
COPY logstash.conf /usr/share/logstash/pipeline/
ENV ELASTICSEARCH_HOST=jhipster-elasticsearch \
    ELASTICSEARCH_PORT=9200 \
    INPUT_TCP_PORT=5000 \
    INPUT_UDP_PORT=5000 \
    INPUT_HTTP_PORT=5001 \
    LOGSTASH_DEBUG=false

COPY resolve-srv-records-logstash.sh ./
CMD ./resolve-srv-records-logstash.sh
