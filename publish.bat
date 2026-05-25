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

git add .
git commit -m "%MSG%"
git push

echo.
echo  ========================================
echo   Done! Site will update in ~60 seconds.
echo   https://riquejohnson.github.io/author-website
echo  ========================================
echo.
pause
