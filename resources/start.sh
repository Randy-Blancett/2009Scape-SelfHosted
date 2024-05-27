#!/bin/sh

DIR_DATA=/app/data

mkdir -p /app/worldprops
mkdir -p ${DIR_DATA}

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


for FOLDER in ${DEFAULT_DATA_DIR}/*
do
    echo "Checking ${FOLDER}."
    if [ -d "${FOLDER}" ]
    then
        DIR_NAME=$(basename ${FOLDER})
        OUTPUT_DIR=${DIR_DATA}/${DIR_NAME} 
        echo " Folder Name: ${DIR_NAME}"    
        if [ ! -d ${OUTPUT_DIR} ]
        then
            echo "${OUTPUT_DIR} does not exist copying the default data."
            cp -rf ${FOLDER} ${OUTPUT_DIR} 
        fi    

        if [ "${DIR_NAME}" == "configs" ]
        then
            echo " Special Handeling for configs"
            for CONFIG_ITEM in ${FOLDER}/*
            do
                echo "  Item Name: ${CONFIG_ITEM}" 
                ITEM_NAME=$(basename ${CONFIG_ITEM}) 
                CONFIG_OUTPUT_DIR=${OUTPUT_DIR}/${ITEM_NAME} 
                if [ ! -e ${CONFIG_OUTPUT_DIR} ]
                then
                    echo "${CONFIG_OUTPUT_DIR} does not exist copying the default data."
                    cp -rf ${CONFIG_ITEM} ${CONFIG_OUTPUT_DIR} 
                fi  
            done
        fi
    fi
done

if [ -z ${KEEP_ALIVE} ]
then
    java -Dnashorn.args=--no-deprecation-warning -jar /app/server.jar "${WORLD_PROP_FILE}"
else
    top
fi
