#!/bin/bash

function export {
  command="/veld/code/bin/s-query --service ${fuseki_server_url}:${fuseki_server_port}/${fuseki_dataset_name}/sparql --query ${1} --output ${out_format} > /veld/output/${out_file}"
  echo "$command"
  eval "$command"
}

export /veld/input/"$in_query_file"

