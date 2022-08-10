REM
REM This script is a non-Maven way of building and testing the unit tests.
REM
REM Copyright (c) 2022 Open Technologies for Integration
REM Licensed under the MIT license (see LICENSE for details)
REM 

REM Create the work directory
set WORKDIR=%TEMP%\ace-demo-ut-work-dir7
call mqsicreateworkdir %WORKDIR%

REM ibmint for v12
ibmint deploy --input-path . --output-work-directory %WORKDIR% --project TeaAvailabilityChecker --project TeaAvailabilityChecker_Working_Test

REM optimize server
ibmint optimize server --work-directory %WORKDIR%

:: mqsisetdbparms -w %WORKDIR% -n TEADB -u hzp00167 -p eNDKMg9sr7H4ZSnt
REM Run the server to run the tests
IntegrationServer -w %WORKDIR% --start-msgflows false --no-nodejs --admin-rest-api -1 --test-project TeaAvailabilityChecker_Working_Test