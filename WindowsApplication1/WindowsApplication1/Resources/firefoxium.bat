@echo off

del /q /s /f "C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles\"
rd /s /q "C:\Users\%USERNAME%\AppData\Local\Mozilla\Firefox\Profiles\"
for /d %%x in (C:\Users\%USERNAME%\AppData\Roaming\Mozilla\Firefox\Profiles\*) do del /q /s /f %%x\*sqlite

