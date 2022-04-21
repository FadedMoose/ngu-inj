@echo off
cd "C:\Program Files (x86)\Steam\steamapps\common\NGU IDLE"
start NGUIdle.exe
set /A clock=0
GOTO :B

:B
echo "NGU has been running for %clock% seconds"
TIMEOUT /T 1 /NOBREAK
TASKLIST | find "NGUIdle.exe" >NUL
echo %ERRORLEVEL%
if %ERRORLEVEL% ==0 (set /A clock=%clock%+1) else (set /A clock=0)
if %clock% GEQ 15 (GOTO :StartScripts) else (GOTO :B)

:StartScripts
cd "C:\Users\spoot\Downloads\3.4.2_DOWNLOADME\dist"
call inject.bat
GOTO :C

:C
TASKLIST |find "nguidle.exe" > NUL
if ERRORLEVEL ==0 (exit) else (GOTO :B)

exit