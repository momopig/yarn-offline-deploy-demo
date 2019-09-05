#!/bin/bash

SH_FILE_PATH=$(cd `dirname $0`; pwd) # $REPO_PATH/yarn
cd $SH_FILE_PATH/../
rm -rf node_modules/ yarn.lock yarn-error.log
cd $SH_FILE_PATH
npm install ./yarn-v1.17.3.tar.gz --no-save
npx yarn config set registry https://registry.npm.taobao.org
npx yarn config set yarn-offline-mirror $SH_FILE_PATH/offline-mirror
npx yarn config set yarn-offline-mirror-pruning true
npx yarn cache clean
npx yarn install
npx yarn config list
