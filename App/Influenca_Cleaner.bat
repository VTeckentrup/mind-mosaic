:: Batch script to clear Influenca user files when new development version with structure changes in files is released
:: Author: Vanessa Teckentrup
:: Date: 20.08.2018
@echo off
for /d %%a in ("C:\Users\%USERNAME%\AppData\Roaming\MyCompany\MyApplication\*") do rmdir /s /q "%%~fa"
echo All user settings and files cleaned!