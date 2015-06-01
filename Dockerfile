FROM ubuntu

MAINTAINER Steven Bower <sbower@alcyon.net>

ENV SOLR_VERSION 5.1.0
ENV SOLR solr-${SOLR_VERSION}

RUN apt-get update && apt-get install -y curl
RUN curl http://www.apache.org/dist/lucene/solr/${SOLR_VERSION}/${SOLR}.tgz | tar -C / -xzf -
