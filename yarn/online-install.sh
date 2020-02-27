#!/bin/bash

SH_FILE_PATH=$(cd `dirname $0`; pwd) # $REPO_PATH/yarn
cd $SH_FILE_PATH/../
rm -rf node_modules/* yarn.lock yarn-error.log
npm install $SH_FILE_PATH/yarn-v1.17.3.tar.gz --no-save
npx yarn config set registry https://registry.npm.taobao.org
npx yarn config set yarn-offline-mirror $SH_FILE_PATH/yarn-offline-mirror
npx yarn config set yarn-offline-mirror-pruning false
npx yarn cache clean
# It is advised not to mix package managers in order to avoid resolution inconsistencies caused by unsynchronized lock files. We should remove package-lock.json.
rm -rf package-lock.json
npx yarn install
npx yarn config list
