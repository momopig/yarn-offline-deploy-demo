# how to install node modules in local network?

## 1. solution: yarn offline and 'Offline Mirro'
One of the main advantages of Yarn is that it can install node_modules from files located in file system. We call it “Offline Mirror” because it mirrors the files downloaded from registry during the first build and stores them locally for future builds.

## 2. new problem:how to use yarn in local network?
download [yarn.tar.gz](https://github.com/yarnpkg/yarn/releases) into the local repository, and install it in local node_modules directory.
`npm install yarn.tar.gz --no-save`

## 3. usage

\# run `yarn install`, and download the node modules (.tar.gz) into the offline mirror directory '$REPOSITORY/yarn/yarn-offline-mirror'.

`npm run online-install`

\# with yarn.lock file, install node_modules from offline mirror directory '$REPOSITORY/yarn/yarn-offline-mirror'

`npm run offline-install`

## 4. problems
### 4.1. problem 1
#### 4.1.1. description
 error can`t make a request in offline mode("http://....")
#### 4.1.2. reason
the indirect dependencies could not be downloaded into offline mirror directory

#### 4.1.3. resolution
`yarn config set yarn-offline-mirror-pruning false`

## 5. github demo
[yarn-offline-deploy-demo](https://github.com/momopig/yarn-offline-deploy-demo)

## 6. reference
[1. Running Yarn offline](https://yarnpkg.com/blog/2016/11/24/offline-mirror/)
