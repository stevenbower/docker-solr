FROM stevenbower/java
MAINTAINER Steven Bower <sbower@alcyon.net>

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y \
      curl \
      lsof \
      procps 

ENV SOLR_VERSION 5.1.0
ENV SOLR solr-${SOLR_VERSION}

RUN curl http://www.apache.org/dist/lucene/solr/${SOLR_VERSION}/${SOLR}.tgz | tar -C / -xzf -

RUN mkdir -p /solr_home
COPY ./solr.xml /solr_home/solr.xml

# For standalone cloud mode
COPY ./zoo.cfg /solr_home/zoo.cfg

VOLUME /solr_data

EXPOSE 8983

CMD /${SOLR}/bin/solr start -c -f -s /solr_home
