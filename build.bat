@echo off
setlocal

cd /d "%~dp0"

where javac >nul 2>&1
if errorlevel 1 (
    echo [ERROR] javac not found. Install JDK 8+ and add its bin directory to PATH.
    exit /b 1
)

if not exist "build" mkdir "build"
if not exist "build\classes" mkdir "build\classes"

set "RELEASE="
javac -help 2>&1 | findstr /C:"--release" >nul
if not errorlevel 1 set "RELEASE=--release 8"

javac %RELEASE% -Xlint:-options -encoding UTF-8 -d "build\classes" -cp "lib\jsfml.jar" src\*.java
if errorlevel 1 (
    echo [ERROR] Build failed.
    exit /b 1
)

echo Build OK: build\classes
exit /b 0
