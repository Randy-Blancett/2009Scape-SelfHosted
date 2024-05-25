#!/bin/sh

ls -l -h
pwd
mkdir -p /app/worldprops

WORLD_PROP_FILE=worldprops/${WORLD_CONFIG_FILE}
if [ ! -f /app/${WORLD_PROP_FILE} ]
then
    echo "/app/${WORLD_PROP_FILE} does not exist copying the default config."
    cp /app/default.conf /app/${WORLD_PROP_FILE} 
fi

java -Dnashorn.args=--no-deprecation-warning -jar /app/server.jar "${WORLD_PROP_FILE} "