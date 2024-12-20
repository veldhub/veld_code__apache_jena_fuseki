FROM openjdk:25-slim-bookworm
RUN apt update
RUN apt install -y ruby=1:3.1*
RUN apt install -y curl=7.88.1*
RUN mkdir /veld/
WORKDIR /veld/
RUN curl -o fuseki.tar.gz https://dlcdn.apache.org/jena/binaries/apache-jena-fuseki-5.2.0.tar.gz
RUN tar -xzf fuseki.tar.gz
RUN rm fuseki.tar.gz
RUN mv apache* code
WORKDIR /veld/code/

