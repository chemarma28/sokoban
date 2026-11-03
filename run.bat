@echo off
setlocal

cd /d "%~dp0"

where java >nul 2>&1
if errorlevel 1 (
    echo [ERROR] java not found. Install JDK 8+ and add its bin directory to PATH.
    pause
    exit /b 1
)

call build.bat
if errorlevel 1 (
    echo.
    echo [ERROR] The game could not be built.
    pause
    exit /b 1
)

java -cp "build\classes;lib\jsfml.jar" Game
if errorlevel 1 (
    echo.
    echo [ERROR] The game exited with an error.
    pause
    exit /b 1
)

exit /b 0
