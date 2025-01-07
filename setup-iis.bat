@echo off
setlocal enabledelayedexpansion

REM Set console title
title IIS Website Setup

REM Get the directory where the batch file is located
set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

REM Load configuration from config.ini
if exist "config.ini" (
    for /f "tokens=1,2 delims==" %%a in (config.ini) do (
        set "%%a=%%b"
    )
) else (
    REM Default settings if config.ini doesn't exist
    set "SiteName=SportsStore"
    set "StartPort=8086"
    set "EndPort=8099"
    set "AppPoolName=SportsStorePool"
    set "EnableSSL=false"
    set "EnableCompression=true"
    set "DefaultDocument=index.html"
)

:menu
cls
echo ===================================
echo    IIS Website Setup Configuration
echo ===================================
echo.
echo Current Settings:
echo ---------------
echo 1. Site Name: %SiteName%
echo 2. Port Range: %StartPort% - %EndPort%
echo 3. App Pool: %AppPoolName%
echo 4. SSL Enabled: %EnableSSL%
echo 5. Compression: %EnableCompression%
echo 6. Default Document: %DefaultDocument%
echo.
echo Options:
echo --------
echo [1-6] Change settings
echo [S] Save settings
echo [I] Install website
echo [R] Remove website
echo [X] Exit
echo.
set /p "choice=Enter your choice: "

if "%choice%"=="1" (
    set /p "SiteName=Enter new site name: "
    goto menu
)
if "%choice%"=="2" (
    set /p "StartPort=Enter start port (default 8086): "
    set /p "EndPort=Enter end port (default 8099): "
    goto menu
)
if "%choice%"=="3" (
    set /p "AppPoolName=Enter new app pool name: "
    goto menu
)
if "%choice%"=="4" (
    if "%EnableSSL%"=="true" (
        set "EnableSSL=false"
    ) else (
        set "EnableSSL=true"
    )
    goto menu
)
if "%choice%"=="5" (
    if "%EnableCompression%"=="true" (
        set "EnableCompression=false"
    ) else (
        set "EnableCompression=true"
    )
    goto menu
)
if "%choice%"=="6" (
    set /p "DefaultDocument=Enter default document name: "
    goto menu
)
if /i "%choice%"=="s" (
    echo [Settings] > config.ini
    echo SiteName=%SiteName% >> config.ini
    echo StartPort=%StartPort% >> config.ini
    echo EndPort=%EndPort% >> config.ini
    echo AppPoolName=%AppPoolName% >> config.ini
    echo EnableSSL=%EnableSSL% >> config.ini
    echo EnableCompression=%EnableCompression% >> config.ini
    echo DefaultDocument=%DefaultDocument% >> config.ini
    echo Settings saved!
    timeout /t 2 >nul
    goto menu
)
if /i "%choice%"=="r" (
    call :remove_website
    goto menu
)
if /i "%choice%"=="x" (
    exit /b 0
)
if /i "%choice%"=="i" (
    goto install_website
)
goto menu

:install_website
cls
echo Installing website...

REM Check administrator privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Error: Administrator privileges required!
    echo Please run as administrator.
    pause
    goto menu
)

REM Build the project
echo Building project...
call npm install
if %errorlevel% neq 0 (
    echo Error: npm install failed!
    pause
    goto menu
)

call npm run build
if %errorlevel% neq 0 (
    echo Error: Build failed!
    pause
    goto menu
)

REM Find available port
set "PORT_FOUND=false"
for /l %%p in (%StartPort%,1,%EndPort%) do (
    if "!PORT_FOUND!"=="false" (
        netstat -an | find "%%p" >nul
        if errorlevel 1 (
            set "PORT=%StartPort%"
            set "PORT_FOUND=true"
        )
    )
)

if "%PORT_FOUND%"=="false" (
    echo Error: No available ports found!
    pause
    goto menu
)

REM Remove existing site and app pool
%windir%\system32\inetsrv\appcmd.exe delete site "%SiteName%" 2>nul
%windir%\system32\inetsrv\appcmd.exe delete apppool "%AppPoolName%" 2>nul

REM Create app pool
echo Creating application pool...
%windir%\system32\inetsrv\appcmd.exe add apppool /name:"%AppPoolName%" /managedRuntimeVersion:"" /managedPipelineMode:"Integrated"
%windir%\system32\inetsrv\appcmd.exe set apppool "%AppPoolName%" /processModel.identityType:ApplicationPoolIdentity
%windir%\system32\inetsrv\appcmd.exe set apppool "%AppPoolName%" /processModel.loadUserProfile:true

REM Create website
echo Creating website...
if "%EnableSSL%"=="true" (
    %windir%\system32\inetsrv\appcmd.exe add site /name:"%SiteName%" /physicalPath:"%SCRIPT_DIR%dist" /bindings:https/*:%PORT%:
) else (
    %windir%\system32\inetsrv\appcmd.exe add site /name:"%SiteName%" /physicalPath:"%SCRIPT_DIR%dist" /bindings:http/*:%PORT%:
)

REM Configure site settings
%windir%\system32\inetsrv\appcmd.exe set site /site.name:"%SiteName%" /[path='/'].applicationPool:"%AppPoolName%"

REM Set permissions
echo Setting permissions...
icacls "%SCRIPT_DIR%dist" /reset
icacls "%SCRIPT_DIR%dist" /grant:r "IIS AppPool\%AppPoolName%":(OI)(CI)R
icacls "%SCRIPT_DIR%dist" /grant:r "IUSR":(OI)(CI)R
icacls "%SCRIPT_DIR%dist" /grant:r "IIS_IUSRS":(OI)(CI)R

REM Configure compression if enabled
if "%EnableCompression%"=="true" (
    %windir%\system32\inetsrv\appcmd.exe set config -section:system.webServer/httpCompression /+"dynamicTypes.[mimeType='application/json',enabled='True']" /commit:apphost
    %windir%\system32\inetsrv\appcmd.exe set config -section:system.webServer/httpCompression /+"dynamicTypes.[mimeType='application/javascript',enabled='True']" /commit:apphost
)

REM Start the website
echo Starting website...
%windir%\system32\inetsrv\appcmd.exe start site "%SiteName%"

echo Website installed successfully!
if "%EnableSSL%"=="true" (
    echo Access the site at: https://localhost:%PORT%
) else (
    echo Access the site at: http://localhost:%PORT%
)
echo Port number saved to: site_port.txt
echo %PORT% > site_port.txt

pause
goto menu

:remove_website
cls
echo Removing website and app pool...
%windir%\system32\inetsrv\appcmd.exe stop site "%SiteName%" 2>nul
%windir%\system32\inetsrv\appcmd.exe delete site "%SiteName%" 2>nul
%windir%\system32\inetsrv\appcmd.exe delete apppool "%AppPoolName%" 2>nul
echo Website removed successfully!
pause
goto :eof
