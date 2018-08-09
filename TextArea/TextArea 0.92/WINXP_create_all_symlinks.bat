
set mypath=..\..\_COMMON

for /f "usebackq delims=|" %%f in (`dir /b "%mypath%\*.ash"`) do fsutil hardlink create "%%f" "%mypath%\%%f"
for /f "usebackq delims=|" %%f in (`dir /b "%mypath%\*.asc"`) do fsutil hardlink create "%%f" "%mypath%\%%f"

pause