@ECHO OFF

set executable=.\modules\openapi-generator-cli\target\openapi-generator-cli.jar

If Not Exist %executable% (
  mvn clean package
)

REM set JAVA_OPTS=%JAVA_OPTS% -Xmx1024M
set ags=generate -i modules\openapi-generator\src\test\resources\2_0\petstore-with-operations-without-required-params.yaml -g typescript-axios -o samples\client\petstore\typescript-axios\builds\with-single-request-parameters --additional-properties useSingleRequestParameter=true

java %JAVA_OPTS% -jar %executable% %ags%