#!/bin/bash

SH_FILE_PATH=$(cd `dirname $0`; pwd) # $REPO_PATH/yarn
cd $SH_FILE_PATH/../
rm -rf node_modules/
npm install $SH_FILE_PATH/yarn-v1.17.3.tar.gz --no-save
npx yarn config set yarn-offline-mirror $SH_FILE_PATH/node-modules-mirror
npx yarn cache clean
npx yarn install --offline
