FROM openjdk:25-slim-bookworm
RUN apt update
RUN apt install -y ruby=1:3.1*
RUN apt install -y curl=7.88.1*
RUN mkdir /veld/
RUN mkdir -p /veld/storage/
WORKDIR /veld/
RUN curl -o fuseki.tar.gz https://dlcdn.apache.org/jena/binaries/apache-jena-fuseki-5.2.0.tar.gz
RUN tar -xzf fuseki.tar.gz
RUN rm fuseki.tar.gz
RUN mv apache* code
WORKDIR /veld/code/
#COPY ./scripts/ /veld/code/scripts/
ENV FUSEKI_BASE=/veld/storage/
HEALTHCHECK --interval=10s --timeout=10s --retries=3 \
  CMD curl --fail http://localhost:3030/ || exit 1

