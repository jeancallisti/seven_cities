@echo off 
cls

pushd %~dp0
if "%CD:~0,2%"=="C:" goto wrongdrive

set mypath=..\_COMMON

for /f "usebackq delims=|" %%f in (`dir /b "%mypath%\*.ash"`) do mklink "%%f" "%mypath%\%%f"
for /f "usebackq delims=|" %%f in (`dir /b "%mypath%\*.asc"`) do mklink "%%f" "%mypath%\%%f"



goto ok

:wrongdrive
	echo === Wrong drive! ===
	timeout /t 20
	goto end

:ok
	timeout /t 20
	goto end

:end