#! /bin/bash
BUILD_DIR=build

echo "Removing ${BUILD_DIR}"
rm -rf ${BUILD_DIR}

# ${SERVER_DIR}/build -qgcg   
./populateBuildDir.sh

echo "Building Docker"
cd ${BUILD_DIR}
sudo docker build -t local/2009scape:java-11-latest .
