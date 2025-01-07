@echo off
echo Verifying IIS setup...

REM Check if IIS is installed
%windir%\system32\inetsrv\appcmd.exe list site >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Error: IIS is not installed or not accessible
    exit /b 1
)

REM Check site status
set SITE_NAME=SportsStore
%windir%\system32\inetsrv\appcmd.exe list site %SITE_NAME% /text:state
if %ERRORLEVEL% NEQ 0 (
    echo Error: Site %SITE_NAME% not found
    exit /b 1
)

REM Display site information
echo.
echo Site Information:
%windir%\system32\inetsrv\appcmd.exe list site %SITE_NAME% /text:*

echo.
echo Application Pool Information:
%windir%\system32\inetsrv\appcmd.exe list apppool %SITE_NAME% /text:*

pause
