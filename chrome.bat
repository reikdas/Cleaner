@echo off

taskkill /F /IM "chrome.exe">nul 2>&1
del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\Cache\*.*">nul 2>&1
del /q /f "C:\Users\%USERNAME%\AppData\Local\Google\Chrome\User Data\Default\*Cookies*.*">nul 2>&1  