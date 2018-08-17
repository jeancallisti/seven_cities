@echo off
cls

pushd %~dp0
if "%CD:~0,2%"=="C:" goto wrongdrive

del /AL /P *.*

goto ok

:wrongdrive
	echo === Wrong drive! ===
	timeout /t 20
	goto end

:ok
	timeout /t 20
	goto end

:end



