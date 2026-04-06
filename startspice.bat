@echo off

cd /d %~dp0

set SERVER_FOLDER=S:\BEMANI\MonkeyBusiness
set SERVER_LAUNCH=start.bat
set SERVER_URL=http://localhost:8000/core
::set SERVER_FOLDER=S:\BEMANI\asphyxia
::set SERVER_LAUNCH=asphyxia-core-x64.exe
::set SERVER_URL=http://localhost:8083
set RECORD_SERVER_FOLDER=%SERVER_FOLDER%\record
set RECORD_SERVER_LAUNCH=010-record-api.exe
set URL_SLASH=0
set PCBID=0101020304050607086F

set WINDOWED_MODE=
set WINDOWED_MODE=-w
set LOG_LEVEL=fatal
::set LOG_LEVEL=all

if exist %SERVER_FOLDER%\%SERVER_LAUNCH% (
    pushd %SERVER_FOLDER%
    echo Running %SERVER_LAUNCH% in %SERVER_FOLDER% minimized...
    powershell -command "Start-Process %SERVER_LAUNCH% -WindowStyle Minimized"
    popd
) else (
    echo %SERVER_FOLDER%\%SERVER_LAUNCH% not found, ignore if you are using a remote server...
)

::powercfg /list
echo Setting powercfg to "AMD Ryzen High Performance"...
powercfg -s 9935e61f-1661-40c5-ae2f-8495027d5d5d

timeout 3

setlocal enabledelayedexpansion
set LOAD=
for %%A in (ifs_hook.dll 2dxcamhook.dll 2dx-gsm.dll playlister3.dll omnifix.dll) do (
    if exist %%A (set LOAD=!LOAD! -k %%A) else (set LOAD=!LOAD!)
)
::set LAUNCHER=spice.exe
set LAUNCHER=spice64.exe
if exist modules\bm2dx.dll (
    if exist omnifix.dll (set LOAD=!LOAD! --omnifix-enable-unlock-all --omnifix-enable-banner-hook) else (set LOAD=!LOAD!)
    if exist "C:\Program Files\FlexASIO\x64\FlexASIO.dll" (set LOAD=!LOAD! -iidxasio "FlexASIO") else (if exist "C:\Program Files (x86)\ASIO4ALL v2\asio4all64.dll" (set LOAD=!LOAD! -iidxasio "ASIO4ALL v2") else (set LOAD=!LOAD!))
    set LOAD=!LOAD! -iidxdisablecams -iidxtdj -graphics-force-refresh 120
    if exist %RECORD_SERVER_FOLDER%\%RECORD_SERVER_LAUNCH% (
        pushd %RECORD_SERVER_FOLDER%
        echo Running %RECORD_SERVER_LAUNCH% in %RECORD_SERVER_FOLDER% minimized...
        powershell -command "Start-Process %RECORD_SERVER_LAUNCH% -WindowStyle Minimized"
        popd
    ) else (
        echo %RECORD_SERVER_FOLDER%\%RECORD_SERVER_LAUNCH% not found, ignore if you are using a remote server or not recording...
    )
    set LAUNCHER=spice64.exe
)
if exist modules\soundvoltex.dll (
    set LOAD=!LOAD! -graphics-force-refresh 120 -windowsize 720,1280
    set LAUNCHER=spice64.exe
)

%LAUNCHER% -nvprofile -smartea -url %SERVER_URL% -urlslash %URL_SLASH% -p %PCBID% -loglevel %LOG_LEVEL% %WINDOWED_MODE% %LOAD% -richpresence
endlocal

pause

echo Attempting to terminate server processes...
taskkill /FI "WINDOWTITLE EQ MB" /f /t
taskkill /IM %SERVER_LAUNCH% /f /t
taskkill /IM %RECORD_SERVER_LAUNCH% /f /t

echo Setting powercfg to "AMD Ryzen Balanced"...
powercfg -s 9897998c-92de-4669-853f-b7cd3ecb2790
