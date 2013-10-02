FROM ubuntu
MAINTAINER Nathan Hopkins, natehop@gmail.com

ADD assets /opt/private-docker-registry
RUN /opt/private-docker-registry/install

