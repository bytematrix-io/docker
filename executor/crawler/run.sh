#!/bin/bash

# Set PATH_LOCAL_ROOT
if [ `expr substr $1 1 1` == "-" ]; then
	PATH_LOCAL_ROOT=$(pwd)
	JAVA_OPTION=$@
else
	PATH_LOCAL_ROOT=$1
	JAVA_OPTION="$2 $3 $4 $5"
fi

ENV_LOCAL_ROOT="-e BYTEMATRIX_LOCAL_ROOT=$PATH_LOCAL_ROOT"
MOUNT_CERT="--mount type=bind,source="$(pwd)/license.cert",target=/app/crawler/license.cert"
MOUNT_ROOT="--mount type=bind,source=$PATH_LOCAL_ROOT,target=/bytematrix/workspace"

# echo `expr substr $1 1 1`
# echo $@

if [ -e ./config.xml ]; then
	MOUNT_DB_CONF="--mount type=bind,source="$(pwd)/config.xml",target=/app/crawler/config/db/config.xml"
	CONF_NETWORK=
else
	MOUNT_DB_CONF=
	CONF_NETWORK="--network=bytematrix_local"
fi

command="docker run -i --rm $CONF_NETWORK $MOUNT_CERT $MOUNT_ROOT $MOUNT_DB_CONF $ENV_LOCAL_ROOT bytematrix/crawler java -jar ./ByteMatrixCrawler.jar $JAVA_OPTION"

echo $command
$command