@echo off
echo Cleaning up IIS site...

set SITE_NAME=SportsStore
set APP_POOL_NAME=SportsStorePool

REM Stop the site
%windir%\system32\inetsrv\appcmd.exe stop site %SITE_NAME%

REM Remove the site
%windir%\system32\inetsrv\appcmd.exe delete site %SITE_NAME%

REM Remove the app pool
%windir%\system32\inetsrv\appcmd.exe delete apppool %APP_POOL_NAME%

echo Cleanup complete!
pause
