@echo off

cd /d %~dp0

set SERVER_FOLDER=S:\BEMANI\xrpc-go
set SERVER_LAUNCH=xrpcd.exe


pause

echo Attempting to terminate server processes...
taskkill /FI "WINDOWTITLE EQ MB" /f /t
taskkill /IM %SERVER_LAUNCH% /f /t

echo Setting powercfg to "AMD Ryzen Balanced"...
powercfg -s 9897998c-92de-4669-853f-b7cd3ecb2790
