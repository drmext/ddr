@echo off

cd /d %~dp0

set SERVER_FOLDER=S:\BEMANI\xrpc-go
set SERVER_LAUNCH=xrpcd.exe
set SERVER_URL=http://localhost:5730
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

spice64.exe -nvprofile -smartea -url %SERVER_URL% -urlslash %URL_SLASH% -p %PCBID% -loglevel %LOG_LEVEL% %WINDOWED_MODE% -k ifs_hook.dll -richpresence -smxstage -icmphook -runas user
