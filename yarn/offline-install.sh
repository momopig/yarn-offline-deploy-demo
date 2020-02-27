#!/bin/bash
STARTTIME=$(date +%s)
SH_FILE_PATH=$(cd `dirname $0`; pwd) # $REPO_PATH/yarn
cd $SH_FILE_PATH/../
rm -rf node_modules/
npm install $SH_FILE_PATH/yarn-v1.17.3.tar.gz --no-save
npx yarn config set yarn-offline-mirror $SH_FILE_PATH/yarn-offline-mirror
# It is advised not to mix package managers in order to avoid resolution inconsistencies caused by unsynchronized lock files. We should remove package-lock.json.
rm -rf package-lock.json
npx yarn cache clean
npx yarn install --offline
ENDTIME=$(date +%s)
echo "******It takes $(($ENDTIME - $STARTTIME)) seconds to complete offline install.******"
