@echo off
setlocal

REM Set console title
title Run TypeScript Project

REM Get the directory where the batch file is located
set "SCRIPT_DIR=%~dp0"
cd /d "%SCRIPT_DIR%"

echo Starting TypeScript project...

REM Install dependencies
echo Installing dependencies...
call npm install
if %ERRORLEVEL% NEQ 0 (
    echo Error: npm install failed!
    pause
    exit /b 1
)

REM Start the development server
echo Starting development server...
call npm run dev
if %ERRORLEVEL% NEQ 0 (
    echo Error: npm run dev failed!
    pause
    exit /b 1
)

echo TypeScript project is running!
pause
endlocal
