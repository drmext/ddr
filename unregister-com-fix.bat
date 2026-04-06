@echo off
setlocal

echo === Removing orphaned DDR/IIDX COM registrations ===
echo.

REM === xactengine2_10.dll ===
set CLSID1={65d822a4-4799-42c6-9b18-d26cf66dd320}

REM === k-clvsd.dll ===
set CLSID2={37991D68-42A3-40E3-8C05-037170E1A42A}
set CLSID3={5593CF36-190B-4A47-A4DD-9680093DBA1D}

REM === CLVSD.ax ===
set CLSID4={8ACD52ED-9C2D-4008-9129-DCE955D86065}
set CLSID5={D35CD90E-88E2-46A2-9B58-61F4C0520030}

for %%C in (%CLSID1% %CLSID2% %CLSID3% %CLSID4% %CLSID5%) do (
    echo Removing %%C ...

    REM 64-bit
    reg delete "HKCR\CLSID\%%C" /f >nul 2>&1
    reg delete "HKLM\SOFTWARE\Classes\CLSID\%%C" /f >nul 2>&1

    REM 32-bit (WOW6432Node)
    reg delete "HKCR\Wow6432Node\CLSID\%%C" /f >nul 2>&1
    reg delete "HKLM\SOFTWARE\Classes\WOW6432Node\CLSID\%%C" /f >nul 2>&1
    reg delete "HKLM\SOFTWARE\WOW6432Node\Classes\CLSID\%%C" /f >nul 2>&1

    echo.
)

echo === Cleanup complete ===
pause