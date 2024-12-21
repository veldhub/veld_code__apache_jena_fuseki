#!/bin/bash

echo "creating dataset ${fuseki_dataset_name}, should it not yet exist. Executing:"
command="curl -X POST  ${fuseki_server_url}:${fuseki_server_port}/$/datasets --data \"dbName=${fuseki_dataset_name}\" --data \"dbType=${fuseki_dataset_type}\""
echo "$command"
eval "$command"

function import {
  command="/veld/code/bin/s-post ${fuseki_server_url}:${fuseki_server_port}/${fuseki_dataset_name}/ ${fuseki_graph_uri} ${1}"
  echo "$command"
  eval "$command"
}

function import_folder_recursive {
  if [ -f "$1" ]; then
    import "$1"
  else
    for file_or_folder in "$1"/*; do
      import_folder_recursive "$file_or_folder"
    done
  fi
}

if [ -n "$in_rdf_file" ]; then
  import_folder_recursive /veld/input/"$in_rdf_file"
else
  import_folder_recursive /veld/input
fi

