@echo off
echo Stopping and removing IIS website...

REM Run as administrator check
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo This script needs to be run as Administrator.
    echo Please right-click and select "Run as administrator"
    pause
    exit
)

set SITE_NAME=SportsStore
set APP_POOL_NAME=SportsStorePool

REM Stop the website
echo Stopping website...
%windir%\system32\inetsrv\appcmd.exe stop site %SITE_NAME%

REM Remove the website
echo Removing website...
%windir%\system32\inetsrv\appcmd.exe delete site %SITE_NAME%

REM Remove the application pool
echo Removing application pool...
%windir%\system32\inetsrv\appcmd.exe delete apppool %APP_POOL_NAME%

echo Cleanup complete!
pause
