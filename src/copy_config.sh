#!/bin/bash

in_shiro_path=/veld/input/config/shiro.ini

if [ -e "$in_shiro_path" ]; then
  echo "found ${in_shiro_path}, copying to fuseki folder" 
  cp "$in_shiro_path" /veld/storage/shiro.ini
else
  echo "did not find ${in_shiro_path}, using default" 
fi

exec "$@"

