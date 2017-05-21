@echo off
title Clean

:menu
cls
echo --------------------------------------------------------------------------------
echo PC Cleaner
echo --------------------------------------------------------------------------------
echo.
echo Select a tool
echo =============
echo.
echo [1] Delete Internet Cookies
echo [2] Disk Cleanup
echo [3] Disk Defragment
echo [4] Exit
echo.
set /p op=Run:
if %op%==1 goto 1
if %op%==2 goto 2
if %op%==3 goto 3
if %op%==4 goto exit
goto error
:1
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
echo.
echo Press any key to return to the menu. . .
pause >nul
goto menu
:2
cls
echo --------------------------------------------------------------------------------
echo Disk Cleanup
echo --------------------------------------------------------------------------------
echo.
echo Running Disk Cleanup...
ping localhost -n 3 >nul
if exist "C:\WINDOWS\temp"del /f /q "C:WINDOWS\temp\*.*"
if exist "C:\temp" del /f /q "C:\temp\*.*"
if exist "%temp%" del /f /q "%temp%\*.*"
if exist "C:\WINDOWS\ff*.tmp" del C:\WINDOWS\ff*.tmp /f /q
cls
echo --------------------------------------------------------------------------------
echo Disk Cleanup
echo --------------------------------------------------------------------------------
echo.
echo Disk Cleanup successful!
echo.
pause
goto menu
:3
cls
echo --------------------------------------------------------------------------------
echo Disk Defragment
echo --------------------------------------------------------------------------------
echo.
echo Defragmenting hard disks...
ping localhost -n 3 >nul
defrag c: -f 
defrag d: -f
cls
echo --------------------------------------------------------------------------------
echo Disk Defragment
echo --------------------------------------------------------------------------------
echo.
echo Disk Defrag successful!
echo.
pause
goto menu
:error
cls
echo Command not recognized.
ping localhost -n 4 >nul
goto menu
:exit


echo Thanks for using PC Cleaner by Pratyush Das. 
ping 127.0.0.1 >nul
exit