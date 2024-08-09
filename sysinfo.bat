@echo off
setlocal

echo Windows System Information
echo =========================

:: Get Windows Version
echo.
echo Windows Version:
systeminfo | findstr /B /C:"OS Version"

:: Get Windows Architecture
echo.
echo System Architecture:
wmic os get OSArchitecture

:: Get System Information
echo.
echo System Information:
systeminfo

:: Get RAM Details
echo.
echo RAM Details:
wmic memorychip get Capacity, DeviceLocator, MemoryType, Speed

:: Get CPU Details
echo.
echo CPU Details:
wmic cpu get Name, NumberOfCores, NumberOfLogicalProcessors

:: End of script
endlocal
pause
