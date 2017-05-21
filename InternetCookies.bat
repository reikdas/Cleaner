@echo off
title InternetCookies

cls
echo --------------------------------------------------------------------------------
echo Delete Internet Cookies
echo --------------------------------------------------------------------------------
echo.
echo Deleting Cookies...
ping localhost -n 3 >nul
if not exist "C:\Users\%USERNAME%\AppData\Roaming\Macromedia\Flash Player\*" goto skip1
set FlashCookies=C:\Users\%USERNAME%\AppData\Roaming\Macromedia\Flash Player
del /q /s /f "%FlashCookies%"
rd /s /q "%FlashCookies%"
:skip1
if not exist "C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles\*" goto skipz
set DataDir=C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles
del /q /s /f "%DataDir%"
rd /s /q "%DataDir%"
:skipz
if not exist "C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*" goto skippy
for /d %%x in (C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite
:skippy
taskkill /F /IM "chrome.exe">nul 2>&1
set ChromeDataDir=C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default
set ChromeCache=%ChromeDataDir%\Cache>nul 2>&1  
del /q /s /f "%ChromeCache%\*.*">nul 2>&1    
del /q /f "%ChromeDataDir%\*Cookies*.*">nul 2>&1  
cls
echo --------------------------------------------------------------------------------
echo Delete Internet Cookies
echo --------------------------------------------------------------------------------
echo.
echo Cookies deleted.
:exit