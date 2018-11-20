@ECHO OFF

rem REM If first parameter is directory, set it as PATH_LOCAL_ROOT
SET PARAM_1=%1
SET PARAM_1=%PARAM_1:"=\"%
SET FIRST_TOKEN=%PARAM_1:~0,1%
IF "%FIRST_TOKEN%" == "-" (
	SET PATH_LOCAL_ROOT="%cd%"
	SET JAVA_OPTION=%*
) ELSE (
	SET PATH_LOCAL_ROOT=%1
	SET JAVA_OPTION=%2 %3 %4 %5
)

SET ENV_LOCAL_ROOT=-e BYTEMATRIX_LOCAL_ROOT=%PATH_LOCAL_ROOT%
SET MOUNT_CERT=--mount type=bind,source="%cd%/license.cert",target=/app/crawler/license.cert
SET MOUNT_ROOT=--mount type=bind,source=%PATH_LOCAL_ROOT%,target=/bytematrix/workspace

IF EXIST .\config.xml (
	SET MOUNT_DB_CONF=--mount type=bind,source="%cd%/config.xml",target=/app/crawler/config/db/config.xml
	SET CONF_NETWORK=
) ELSE (
	SET MOUNT_DB_CONF=
	SET CONF_NETWORK=--network=bytematrix_local
)

@ECHO ON

docker run -i --rm %CONF_NETWORK% %MOUNT_CERT% %MOUNT_ROOT% %MOUNT_DB_CONF% %ENV_LOCAL_ROOT% bytematrix/crawler java -jar ./ByteMatrixCrawler.jar %JAVA_OPTION%