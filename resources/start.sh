#!/bin/sh

mkdir -p /app/worldprops
mkdir -p /app/data


DIR_BOT_DATA=/app/data/botdata
DIR_CACHE=/app/data/cache
DIR_CONFIGS=/app/data/configs
DIR_ECO=/app/data/eco
FILE_OBJECT_PARSER=/app/data/ObjectParser.xml

WORLD_PROP_FILE=worldprops/${WORLD_CONFIG_FILE}
if [ ! -f /app/${WORLD_PROP_FILE} ]
then
    echo "/app/${WORLD_PROP_FILE} does not exist copying the default config."
    cp /app/default.conf /app/${WORLD_PROP_FILE} 
fi

if [ ! -f ${FILE_OBJECT_PARSER} ]
then
    echo "${FILE_OBJECT_PARSER} does not exist copying the default data."
    cp ${DEFAULT_DATA_DIR}/ObjectParser.xml ${FILE_OBJECT_PARSER}
fi

if [ ! -d ${DIR_BOT_DATA} ]
then
    echo "${DIR_BOT_DATA} does not exist copying the default data."
    cp -rf ${DEFAULT_DATA_DIR}/botdata ${DIR_BOT_DATA}
fi

if [ ! -d ${DIR_CACHE} ]
then
    echo "${DIR_CACHE} does not exist copying the default data."
    cp -rf ${DEFAULT_DATA_DIR}/cache ${DIR_CACHE}
fi

if [ ! -d ${DIR_CONFIGS} ]
then
    echo "${DIR_CONFIGS} does not exist copying the default data."
    cp -rf ${DEFAULT_DATA_DIR}/configs ${DIR_CONFIGS}
fi

if [ ! -d ${DIR_ECO} ]
then
    echo "${DIR_ECO} does not exist copying the default data."
    cp -rf ${DEFAULT_DATA_DIR}/eco ${DIR_ECO}
fi


if [ -z ${KEEP_ALIVE} ]
then
    top
else
    java -Dnashorn.args=--no-deprecation-warning -jar /app/server.jar "${WORLD_PROP_FILE}"
fi
