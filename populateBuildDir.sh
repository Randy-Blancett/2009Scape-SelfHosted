#! /bin/bash
BUILD_DIR=build
SERVER_DIR=server
RESOURCE_DIR=resources
WORLD_PROP_SRC_DIR=${RESOURCE_DIR}/worldprops
WORLD_PROP_DEST_DIR=${BUILD_DIR}
DATA_SRC_DIR=${SERVER_DIR}/Server/data/
DATA_DEST_DIR=${BUILD_DIR}/default_data
START_SCRIPT_SRC=${RESOURCE_DIR}/start.sh
START_SCRIPT_DEST_DIR=${BUILD_DIR}

echo "Making Directories"
mkdir -p ${BUILD_DIR}
mkdir -p ${WORLD_PROP_DEST_DIR}
mkdir -p ${DATA_DEST_DIR}

echo "Copying Files"
cp ${SERVER_DIR}/builddir/server.jar ${BUILD_DIR}
cp Dockerfile ${BUILD_DIR}
cp -r ${WORLD_PROP_SRC_DIR}/* ${WORLD_PROP_DEST_DIR}
cp -r ${DATA_SRC_DIR}/* $DATA_DEST_DIR
cp ${START_SCRIPT_SRC} ${START_SCRIPT_DEST_DIR}
cp ${RESOURCE_DIR}/docker-compose.yml ${BUILD_DIR}
