@echo off
title Publish Website
cd /d "%~dp0"

echo.
echo  ========================================
echo    Rique Johnson Author Website Publisher
echo  ========================================
echo.

set /p MSG=Describe your change (or press Enter to skip):

if "%MSG%"=="" set MSG=Update website

echo.
echo  [1/2] Pushing to GitHub...
git add .
git commit -m "%MSG%"
git push

echo.
echo  [2/2] Copying to NAS (192.168.1.14)...
xcopy /E /Y /I "%~dp0*" "\\192.168.1.14\Public\www\author-website\" >nul 2>&1

if %ERRORLEVEL%==0 (
  echo       NAS updated successfully!
) else (
  echo       NAS copy failed - check that the NAS is on and the path exists.
  echo       Manual path: \\192.168.1.14\Public\www\author-website\
)

echo.
echo  ========================================
echo   Done!
echo   Local NAS:  http://192.168.1.14:8080
echo   GitHub:     https://riquejohnson.github.io/author-website
echo  ========================================
echo.
pause
