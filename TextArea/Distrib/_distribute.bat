@echo off
cls

pushd %~dp0
if "%CD:~0,2%"=="C:" goto wrongdrive

REM delete folder and everything it contains
rd /s/q ..\Distrib

REM recreate it
mkdir ..\Distrib

REM copy contents (/s for subfolders)
xcopy *.* ..\Distrib /s

goto ok

:wrongdrive
	echo === Wrong drive! ===
	timeout /t 20
	goto end

:ok
	timeout /t 20
	goto end

:end



