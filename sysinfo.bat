@echo off
setlocal

echo Windows System Information
echo =========================

:: Get Windows Version and System Type
echo.
echo Windows Version and System Type:
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Type"

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

:: Get Installed Hotfixes
echo.
echo Installed Hotfixes:
wmic qfe get Caption,Description,HotFixID,InstalledOn

:: Get Logical Disk Information
echo.
echo Logical Disk Information:
wmic logicaldisk get caption,description,providername

:: Get User Privileges
echo.
echo User Privileges:
whoami /priv

:: Get User Accounts
echo.
echo User Accounts:
net user

:: Get User Group Memberships
echo.
echo User Group Memberships:
whoami /groups

:: Network Information
echo.
echo Network Information:
ipconfig /all
arp -a
route print
netstat -ano

:: Firewall Configuration
echo.
echo Firewall Configuration:
netsh firewall show state
netsh firewall show config

:: Search for Passwords in Files
echo.
echo Searching for Passwords in Files:
findstr /si password *.txt
findstr /si password *.xml
findstr /si password *.ini
findstr /si password *.xml *.ini *.txt *.config 2>nul >> results.txt

:: Search for Specific Files
echo.
echo Searching for Specific Files:
dir /s *pass* == *cred* == *vnc* == *.config*
findstr /spin "password" *.*

:: Search for VNC Configuration Files
echo.
echo Searching for VNC Configuration Files:
dir c:\*vnc.ini /s /b
dir c:\*ultravnc.ini /s /b 
dir c:\ /s /b | findstr /si *vnc.ini

:: Query Windows Defender Service
echo.
echo Querying Windows Defender Service:
sc query windefend

:: Query Services
echo.
echo Querying Services:
sc queryex type= service

:: Display Advanced Firewall Configuration
echo.
echo Displaying Advanced Firewall Configuration:
netsh advfirewall firewall dump
netsh firewall show state
firewall show config

:: End of script
endlocal
pause
