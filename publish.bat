@echo off
title Publish Website

:: Use pushd so UNC paths don't cause issues
pushd "%~dp0"

set GIT="C:\Program Files\Git\cmd\git.exe"

echo.
echo  ========================================
echo    Rique Johnson Author Website Publisher
echo  ========================================
echo.

set /p MSG=Describe your change (or press Enter to skip):
if "%MSG%"=="" set MSG=Update website

echo.
echo  [1/2] Pushing to GitHub...
%GIT% add .
%GIT% commit -m "%MSG%"
%GIT% push

echo.
echo  [2/2] Copying to NAS (192.168.1.14)...
xcopy /E /Y /I "%~dp0*" "\\192.168.1.14\www\author-website\" >nul 2>&1

if %ERRORLEVEL%==0 (
  echo       NAS updated successfully!
) else (
  echo       NAS copy failed - check NAS is on and path is correct.
)

popd

echo.
echo  ========================================
echo   Done!
echo   Local NAS:  http://192.168.1.14:8080
echo   GitHub:     https://riquejohnson.github.io/author-website
echo  ========================================
echo.
pause
