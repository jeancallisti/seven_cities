@echo off 
cls

pushd %~dp0
if "%CD:~0,2%"=="C:" goto wrongdrive

mklink StandaloneClick1.1.asc ..\..\_COMMON\StandaloneClick.asc
mklink StandaloneClick1.1.ash ..\..\_COMMON\StandaloneClick.ash

mklink MoreGuiControls1.1.asc ..\..\_COMMON\MoreGuiControls.asc
mklink MoreGuiControls1.1.ash ..\..\_COMMON\MoreGuiControls.ash

mklink StringUtility1.1.asc ..\..\_COMMON\StringUtility.asc
mklink StringUtility1.1.ash ..\..\_COMMON\StringUtility.ash

goto ok

:wrongdrive
	echo === Wrong drive! ===
	timeout /t 20
	goto end

:ok
	timeout /t 20
	goto end

:end