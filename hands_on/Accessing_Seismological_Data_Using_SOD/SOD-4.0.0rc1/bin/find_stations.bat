@rem
@rem Copyright 2015 the original author or authors.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem      https://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.
@rem
@rem SPDX-License-Identifier: Apache-2.0
@rem

@if "%DEBUG%"=="" @echo off
@rem ##########################################################################
@rem
@rem  find_stations startup script for Windows
@rem
@rem ##########################################################################

@rem Set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" setlocal

set DIRNAME=%~dp0
if "%DIRNAME%"=="" set DIRNAME=.
@rem This is normally unused
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%..

@rem Resolve any "." and ".." in APP_HOME to make it shorter.
for %%i in ("%APP_HOME%") do set APP_HOME=%%~fi

@rem Add default JVM options here. You can also use JAVA_OPTS and FIND_STATIONS_OPTS to pass JVM options to this script.
set DEFAULT_JVM_OPTS=

@rem Find java.exe
if defined JAVA_HOME goto findJavaFromJavaHome

set JAVA_EXE=java.exe
%JAVA_EXE% -version >NUL 2>&1
if %ERRORLEVEL% equ 0 goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH. 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:findJavaFromJavaHome
set JAVA_HOME=%JAVA_HOME:"=%
set JAVA_EXE=%JAVA_HOME%/bin/java.exe

if exist "%JAVA_EXE%" goto execute

echo. 1>&2
echo ERROR: JAVA_HOME is set to an invalid directory: %JAVA_HOME% 1>&2
echo. 1>&2
echo Please set the JAVA_HOME variable in your environment to match the 1>&2
echo location of your Java installation. 1>&2

goto fail

:execute
@rem Setup the command line

set CLASSPATH=%APP_HOME%\lib\main;%APP_HOME%\lib\main;%APP_HOME%\lib\TauP-3.1.0.jar;%APP_HOME%\lib\seisFile-2.3.4.jar;%APP_HOME%\lib\seedCodec-1.2.0.jar;%APP_HOME%\lib\picocli-4.7.6.jar;%APP_HOME%\lib\isti.util-20120201.jar;%APP_HOME%\lib\oregondsp-1.0.1-alpha.jar;%APP_HOME%\lib\velocity-tools-generic-3.1.jar;%APP_HOME%\lib\slf4j-reload4j-2.0.6.jar;%APP_HOME%\lib\hibernate-ehcache-5.6.15.Final.jar;%APP_HOME%\lib\ehcache-2.10.6.jar;%APP_HOME%\lib\velocity-engine-core-2.3.jar;%APP_HOME%\lib\slf4j-api-2.0.6.jar;%APP_HOME%\lib\hsqldb-2.7.4.jar;%APP_HOME%\lib\jline-0.9.94.jar;%APP_HOME%\lib\jsap-2.1.jar;%APP_HOME%\lib\jing-20091111.jar;%APP_HOME%\lib\rngconv-20030225.jar;%APP_HOME%\lib\woodstox-core-7.1.1.jar;%APP_HOME%\lib\jetty-servlet-9.4.58.v20250814.jar;%APP_HOME%\lib\msgpack-core-0.9.11.jar;%APP_HOME%\lib\json-20251224.jar;%APP_HOME%\lib\hibernate-c3p0-5.6.15.Final.jar;%APP_HOME%\lib\hibernate-core-5.6.15.Final.jar;%APP_HOME%\lib\dcwpo_browse-1.0.jar;%APP_HOME%\lib\javacsv-2.0.jar;%APP_HOME%\lib\httpclient-4.5.14.jar;%APP_HOME%\lib\gson-2.13.1.jar;%APP_HOME%\lib\undertow-core-2.3.18.Final.jar;%APP_HOME%\lib\isti.util.toplevel-1.0USC.jar;%APP_HOME%\lib\jdom-b9.jar;%APP_HOME%\lib\junit-3.8.1.jar;%APP_HOME%\lib\jetty-security-9.4.58.v20250814.jar;%APP_HOME%\lib\jetty-util-ajax-9.4.58.v20250814.jar;%APP_HOME%\lib\hibernate-commons-annotations-5.1.2.Final.jar;%APP_HOME%\lib\xnio-nio-3.8.16.Final.jar;%APP_HOME%\lib\xnio-api-3.8.16.Final.jar;%APP_HOME%\lib\wildfly-client-config-1.0.1.Final.jar;%APP_HOME%\lib\jboss-threads-3.5.0.Final.jar;%APP_HOME%\lib\jboss-logging-3.4.3.Final.jar;%APP_HOME%\lib\javax.persistence-api-2.2.jar;%APP_HOME%\lib\byte-buddy-1.12.18.jar;%APP_HOME%\lib\antlr-2.7.7.jar;%APP_HOME%\lib\jboss-transaction-api_1.2_spec-1.1.1.Final.jar;%APP_HOME%\lib\jandex-2.4.2.Final.jar;%APP_HOME%\lib\classmate-1.5.1.jar;%APP_HOME%\lib\jaxb-runtime-2.3.1.jar;%APP_HOME%\lib\jaxb-api-2.3.1.jar;%APP_HOME%\lib\javax.activation-api-1.2.0.jar;%APP_HOME%\lib\c3p0-0.9.5.5.jar;%APP_HOME%\lib\commons-digester3-3.2.jar;%APP_HOME%\lib\commons-beanutils-1.9.4.jar;%APP_HOME%\lib\commons-lang3-3.11.jar;%APP_HOME%\lib\json-simple-3.0.2.jar;%APP_HOME%\lib\stax2-api-4.2.2.jar;%APP_HOME%\lib\httpcore-4.4.16.jar;%APP_HOME%\lib\commons-logging-1.2.jar;%APP_HOME%\lib\commons-codec-1.11.jar;%APP_HOME%\lib\reload4j-1.2.22.jar;%APP_HOME%\lib\error_prone_annotations-2.38.0.jar;%APP_HOME%\lib\jetty-server-9.4.58.v20250814.jar;%APP_HOME%\lib\jetty-http-9.4.58.v20250814.jar;%APP_HOME%\lib\jetty-io-9.4.58.v20250814.jar;%APP_HOME%\lib\jetty-util-9.4.58.v20250814.jar;%APP_HOME%\lib\txw2-2.3.1.jar;%APP_HOME%\lib\istack-commons-runtime-3.0.7.jar;%APP_HOME%\lib\stax-ex-1.8.jar;%APP_HOME%\lib\FastInfoset-1.2.15.jar;%APP_HOME%\lib\mchange-commons-java-0.2.19.jar;%APP_HOME%\lib\commons-collections-3.2.2.jar;%APP_HOME%\lib\wildfly-common-1.5.4.Final.jar;%APP_HOME%\lib\javax.servlet-api-3.1.0.jar;%APP_HOME%\lib\sod-4.0.0rc1.jar


@rem Execute find_stations
"%JAVA_EXE%" %DEFAULT_JVM_OPTS% %JAVA_OPTS% %FIND_STATIONS_OPTS%  -classpath "%CLASSPATH%" edu.sc.seis.sod.tools.find_stations %*

:end
@rem End local scope for the variables with windows NT shell
if %ERRORLEVEL% equ 0 goto mainEnd

:fail
rem Set variable FIND_STATIONS_EXIT_CONSOLE if you need the _script_ return code instead of
rem the _cmd.exe /c_ return code!
set EXIT_CODE=%ERRORLEVEL%
if %EXIT_CODE% equ 0 set EXIT_CODE=1
if not ""=="%FIND_STATIONS_EXIT_CONSOLE%" exit %EXIT_CODE%
exit /b %EXIT_CODE%

:mainEnd
if "%OS%"=="Windows_NT" endlocal

:omega
