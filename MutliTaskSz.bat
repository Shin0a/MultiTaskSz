:: Created by Shinoa [ https://github.com/Shin0a ]
:: Created on March 27, 2019
:: Updated on October 31, 2024

@echo off
set version=V0.94a

:-------------------------------------
    IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
    title MultiTaskSz %version%
    echo Requesting administrative privileges...
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------  

::==================================Main Menu===================================
:begin
cls
color 7
title MultiTaskSz %version%
echo =================================
echo   Simple Multi Task Tool %version%
echo ==========Network Tools==========
echo 1.  Ping Test
echo 2.  Speed Test
echo 3.  DNS Settings
echo 4.  Flush DNS
echo 5.  Network Full Reset [ Restart is required ]
echo 6.  Connection List
echo =============System==============
echo 7.  System WI [WinSat,System Info,etc] 
echo 8.  Rebuild Icon Cache
echo 9.  Clear Event Viewer Logs
echo 10. *This PC* Folders [64Bit]
echo 11. Adjusts taskbar transparency level
echo =================================
::netstat -e
echo 12. Exit
echo.
set /p actionb="Choose action and press enter: "

IF NOT "%actionb%" == "1" ( IF NOT "%actionb%" == "2" ( IF NOT "%actionb%" == "3" ( IF NOT "%actionb%" == "4" ( IF NOT "%actionb%" == "5" ( IF NOT "%actionb%" == "6" ( IF NOT "%actionb%" == "7" ( IF NOT "%actionb%" == "8" ( IF NOT "%actionb%" == "9" ( IF NOT "%actionb%" == "10" ( IF NOT "%actionb%" == "11" ( IF NOT "%actionb%" == "12" (  goto begin ) ) ) ) ) ) ) ) ) ) ) )

IF "%actionb%" == "1" ( goto pinging )
IF "%actionb%" == "2" ( goto speedtestw )
IF "%actionb%" == "3" ( goto bedns )
IF "%actionb%" == "4" ( goto flushdns )
IF "%actionb%" == "5" ( goto fnetresetfull )
IF "%actionb%" == "6" ( goto netst )
IF "%actionb%" == "7" ( goto winsat )
IF "%actionb%" == "8" ( goto rebuildicon )
IF "%actionb%" == "9" ( goto clearevnlog )
IF "%actionb%" == "10" ( goto foldelres )
IF "%actionb%" == "11" ( goto taskbar)
IF "%actionb%" == "12" ( goto exit )

::=================================Sub Menus===================================

::DNS Menu

:bedns
cls
color 7
title DNS Changer - MultiTaskSz %version%
echo =================================
echo 1.  Google        8.8.8.8
echo 2.  Cloudflare    1.1.1.1
echo 3.  Electro       78.157.42.100
echo 4.  Shekan        178.22.122.100
echo 5.  Radar         10.202.10.10
echo 6.  Yandex        77.88.8.1
echo 7.  Shelter       91.92.251.5
echo 8.  403           10.202.10.202
echo 9.  NNT           129.250.35.250
echo 10. Safe DNS      195.46.39.39
echo 11. Quad9         9.9.9.9
echo 12. OpenDNS       208.67.222.222
echo 13. Norton        198.153.194.1
echo 14. Neustar       156.154.70.1
echo 15. Verisign      64.6.64.6
echo 16. NextDNS       45.90.28.190
echo 17. Comodo DNS    8.26.56.26
echo 18. Level3        209.244.0.3
echo 19. Alternate DNS 76.76.19.19
echo =======
echo 20. Show the current DNS
echo 21. Flush DNS
echo 22. Delete DNS
echo 23. Back to main menu
echo 24. Exit
echo =================================
echo.
set /p actiond="Choose action and press enter: "

IF NOT "%actiond%" == "1" ( IF NOT "%actiond%" == "2" ( IF NOT "%actiond%" == "3" ( IF NOT "%actiond%" == "4" ( IF NOT "%actiond%" == "5"  ( IF NOT "%actiond%" == "6" ( IF NOT "%actiond%" == "7" ( IF NOT "%actiond%" == "8" ( IF NOT "%actiond%" == "9" ( IF NOT "%actiond%" == "10" ( IF NOT "%actiond%" == "11" ( IF NOT "%actiond%" == "12" ( IF NOT "%actiond%" == "13" ( IF NOT "%actiond%" == "14" ( IF NOT "%actiond%" == "15" ( IF NOT "%actiond%" == "16" ( IF NOT "%actiond%" == "17"  ( IF NOT "%actiond%" == "18" ( IF NOT "%actiond%" == "19" ( IF NOT "%actiond%" == "20" ( IF NOT "%actiond%" == "21" ( IF NOT "%actiond%" == "22" ( IF NOT "%actiond%" == "23" ( IF NOT "%actiond%" == "24" (  goto bdns ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) ) )

IF "%actiond%" == "1" ( goto gdns )
IF "%actiond%" == "2" ( goto cdns )
IF "%actiond%" == "3" ( goto edns )
IF "%actiond%" == "4" ( goto sdns )
IF "%actiond%" == "5" ( goto rdns )
IF "%actiond%" == "6" ( goto ydns )
IF "%actiond%" == "7" ( goto sheldns )
IF "%actiond%" == "8" ( goto chadns )
IF "%actiond%" == "9" ( goto nntdns )
IF "%actiond%" == "10" ( goto safedns )
IF "%actiond%" == "11" ( goto qdns )
IF "%actiond%" == "12" ( goto odns )
IF "%actiond%" == "13" ( goto ndns )
IF "%actiond%" == "14" ( goto neudns )
IF "%actiond%" == "15" ( goto veidns )
IF "%actiond%" == "16" ( goto nedns )
IF "%actiond%" == "17" ( goto coidns )
IF "%actiond%" == "18" ( goto lvdns )
IF "%actiond%" == "19" ( goto aldns )
IF "%actiond%" == "20" ( goto showcdns )
IF "%actiond%" == "21" ( goto flushdns2 )
IF "%actiond%" == "22" ( goto deldns )
IF "%actiond%" == "23" ( goto begin )
IF "%actiond%" == "24" ( goto exit )

::Ping Menu

:pinging
color 7
title Ping Test - MultiTaskSz %version%
cls
echo ========================
echo        Ping Test 
echo ========================
echo 1. Ping Test [Google / CloudFlare]
echo 2. Ping Custom IP
echo 3. Path Pinging Custom IP
echo 4. Back to main menu
echo 5. Exit
echo =================================
echo =================================
echo.
set /p actionxq="Choose action and press enter: "

IF NOT "%actionxq%" == "1" ( IF NOT "%actionxq%" == "2" ( IF NOT "%actionxq%" == "3" ( IF NOT "%actionxq%" == "4" ( IF NOT "%actionxq%" == "5" (  goto begin ) ) ) ) )

IF "%actionxq%" == "1" ( goto pingingnormal )
IF "%actionxq%" == "2" ( goto pingingip )
IF "%actionxq%" == "3" ( goto pathpinging )
IF "%actionxq%" == "4" ( goto begin )
IF "%actionxq%" == "5" ( goto exit )

::Windows System Assessment Tool

:winsat
title System WI - MutliTaskSz %version%
cls
color 7
echo =======================================
echo     Windows System Assessment Tool
echo =======================================
powershell -c Get-CimInstance Win32_WinSAT 
wmic os get BuildNumber,Caption,version
echo =======================================
echo 1.Run Test [ WinSat Benchmark ]
echo 2.System Info
echo 3.Back to Main menu
echo 4.Exit 
echo =======================================
echo.
set /p actionwsat="Choose action and press enter: "

IF NOT "%actionwsat%" == "1" ( IF NOT "%actionwsat%" == "2" ( IF NOT "%actionwsat%" == "3" ( IF NOT "%actionwsat%" == "4" (  goto begin ) ) ) )

IF "%actionwsat%" == "1" ( goto winsattest )
IF "%actionwsat%" == "2" ( goto sysinfofull )
IF "%actionwsat%" == "3" ( goto begin )
IF "%actionwsat%" == "4" ( goto exit )

:foldelres
color 7
title Folders - MultiTaskSz %version%
cls
echo =======================================
echo           *This PC* Folders 
echo =======================================
echo 1. Delete All
echo 2. Restore All
echo =======================================
echo Choose to Delete or Restore one at time
echo =======================================
echo 3. Downloads
echo 4. Desktop
echo 5. Music
echo 6. Photos
echo 7. Videos
echo 8. Documents
echo 9. 3D Objects 
echo ========================================
echo 10.Back to Main menu
echo ========================================
echo.
set /p actionds="Choose action and press enter: "

IF NOT "%actionds%" == "1" ( IF NOT "%actionds%" == "2" ( IF NOT "%actionds%" == "3" ( IF NOT "%actionds%" == "4" ( IF NOT "%actionds%" == "5" ( IF NOT "%actionds%" == "6" ( IF NOT "%actionds%" == "7" ( IF NOT "%actionds%" == "8" ( IF NOT "%actionds%" == "9" ( IF NOT "%actionds%" == "10" (  goto begin ) ) ) ) ) ) ) ) ) ) 

IF "%actionds%" == "1" ( goto folderdelete64 )
IF "%actionds%" == "2" ( goto foldersrestore64 )
IF "%actionds%" == "3" ( goto folderDo64 )
IF "%actionds%" == "4" ( goto folderDe64 )
IF "%actionds%" == "5" ( goto folderMu64 )
IF "%actionds%" == "6" ( goto folderPh64 )
IF "%actionds%" == "7" ( goto folderVi64 )
IF "%actionds%" == "8" ( goto folderDoc64 )
IF "%actionds%" == "9" ( goto folder3D64 )
IF "%actionds%" == "10" ( goto begin )

:taskbar
title Taskbar Transparency - MutliTaskSz %version%
cls
color 7
echo =============================================
echo Adjusts Windows 10 taskbar transparency level
echo =============================================
echo      Note: this only works on DarkTheme
echo            and Transparency Set to ON
echo =============================================
echo 1.Turn On / Change Value
echo 2.Turn Off
echo 3.Auto [ DarkMode + Transparency On ]
echo 4.Back to Main menu
echo 5.Exit 
echo =======================================
echo.
set /p actiontaski="Choose action and press enter: "

IF NOT "%actiontaski%" == "1" ( IF NOT "%actiontaski%" == "2" ( IF NOT "%actiontaski%" == "3" ( IF NOT "%actiontaski%" == "4" ( IF NOT "%actiontaski%" == "5" (  goto begin ) ) ) ) )

IF "%actiontaski%" == "1" ( goto taskbton )
IF "%actiontaski%" == "2" ( goto taskbtof )
IF "%actiontaski%" == "3" ( goto taskbtos )
IF "%actiontaski%" == "4" ( goto begin )
IF "%actiontaski%" == "5" ( goto exit )

::==================================DNS Settings===================================

::=======================Set DNS===========================

::Google DNS
:gdns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Google.. Please wait
netsh interface ip set dns "Ethernet" static 8.8.8.8
netsh interface ip add dns "Ethernet" 8.8.4.4

netsh interface ip set dns "Local Area Connection" static 8.8.8.8
netsh interface ip add dns "Local Area Connection" 8.8.4.4

netsh interface ip set dns "Wi-Fi" static 8.8.8.8
netsh interface ip add dns "Wi-Fi" 8.8.4.4
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Cloud Flare
:cdns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Cloudflare.. Please wait
netsh interface ip set dns "Ethernet" static 1.1.1.1
netsh interface ip add dns "Ethernet" 1.0.0.1

netsh interface ip set dns "Local Area Connection" static 1.1.1.1
netsh interface ip add dns "Local Area Connection" 1.0.0.1

netsh interface ip set dns "Wi-Fi" static 1.1.1.1
netsh interface ip add dns "Wi-Fi" 1.0.0.1
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Electro
:edns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Electro.. Please wait
netsh interface ip set dns "Ethernet" static 78.157.42.100
netsh interface ip add dns "Ethernet" 78.157.42.101

netsh interface ip set dns "Local Area Connection" static 78.157.42.100
netsh interface ip add dns "Local Area Connection" 78.157.42.101

netsh interface ip set dns "Wi-Fi" static 78.157.42.100
netsh interface ip add dns "Wi-Fi" 78.157.42.101
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Shekan
:sdns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Shekan.. Please wait
netsh interface ip set dns "Ethernet" static 178.22.122.100
netsh interface ip add dns "Ethernet" 185.51.200.2

netsh interface ip set dns "Local Area Connection" static 178.22.122.100
netsh interface ip add dns "Local Area Connection" 185.51.200.2

netsh interface ip set dns "Wi-Fi" static 178.22.122.100
netsh interface ip add dns "Wi-Fi" 185.51.200.2
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Radar
:rdns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Radar.. Please wait
netsh interface ip set dns "Ethernet" static 10.202.10.10
netsh interface ip add dns "Ethernet" 10.202.10.11

netsh interface ip set dns "Local Area Connection" static 10.202.10.10
netsh interface ip add dns "Local Area Connection" 10.202.10.11

netsh interface ip set dns "Wi-Fi" static 10.202.10.10
netsh interface ip add dns "Wi-Fi" 10.202.10.11
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Yandex
:ydns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Yandex.. Please wait
netsh interface ip set dns "Ethernet" static 77.88.8.1
netsh interface ip add dns "Ethernet" 77.88.8.8

netsh interface ip set dns "Local Area Connection" static 77.88.8.1
netsh interface ip add dns "Local Area Connection" 77.88.8.8

netsh interface ip set dns "Wi-Fi" static 77.88.8.1
netsh interface ip add dns "Wi-Fi" 77.88.8.8
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Shelter
:sheldns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Shelter.. Please wait
netsh interface ip set dns "Ethernet" static 91.92.251.5
netsh interface ip add dns "Ethernet" 91.92.250.178

netsh interface ip set dns "Local Area Connection" static 91.92.251.5
netsh interface ip add dns "Local Area Connection" 91.92.250.178

netsh interface ip set dns "Wi-Fi" static 91.92.251.5
netsh interface ip add dns "Wi-Fi" 91.92.250.178
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Sprintlink
:spldns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Sprintlink.. Please wait
netsh interface ip set dns "Ethernet" static 204.117.214.10
netsh interface ip add dns "Ethernet" 84.200.70.40

netsh interface ip set dns "Local Area Connection" static 204.117.214.10
netsh interface ip add dns "Local Area Connection" 84.200.70.40

netsh interface ip set dns "Wi-Fi" static 204.117.214.10
netsh interface ip add dns "Wi-Fi" 84.200.70.40
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::403
:chadns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to 403.. Please wait
netsh interface ip set dns "Ethernet" static 10.202.10.202
netsh interface ip add dns "Ethernet" 10.202.10.202

netsh interface ip set dns "Local Area Connection" static 10.202.10.202
netsh interface ip add dns "Local Area Connection" 10.202.10.202

netsh interface ip set dns "Wi-Fi" static 10.202.10.202
netsh interface ip add dns "Wi-Fi" 10.202.10.202
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::NNT
:nntdns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to NNT.. Please wait
netsh interface ip set dns "Ethernet" static 129.250.35.250
netsh interface ip add dns "Ethernet" 129.250.35.251

netsh interface ip set dns "Local Area Connection" static 129.250.35.250
netsh interface ip add dns "Local Area Connection" 129.250.35.251

netsh interface ip set dns "Wi-Fi" static 129.250.35.250
netsh interface ip add dns "Wi-Fi" 129.250.35.251
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Begzar
:begdns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Begzar.. Please wait
netsh interface ip set dns "Ethernet" static 185.55.226.26
netsh interface ip add dns "Ethernet" 185.55.225.25

netsh interface ip set dns "Local Area Connection" static 185.55.226.26
netsh interface ip add dns "Local Area Connection" 185.55.225.25

netsh interface ip set dns "Wi-Fi" static 185.55.226.26
netsh interface ip add dns "Wi-Fi" 185.55.225.25
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Quad9
:qdns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Quad9.. Please wait
netsh interface ip set dns "Ethernet" static 9.9.9.9
netsh interface ip add dns "Ethernet" 149.112.112.112

netsh interface ip set dns "Local Area Connection" static 9.9.9.9
netsh interface ip add dns "Local Area Connection" 149.112.112.112

netsh interface ip set dns "Wi-Fi" static 9.9.9.9
netsh interface ip add dns "Wi-Fi" 149.112.112.112
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::OpenDNS
:odns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to OpenDNS.. Please wait
netsh interface ip set dns "Ethernet" static 208.67.222.222
netsh interface ip add dns "Ethernet" 208.67.220.220

netsh interface ip set dns "Local Area Connection" static 208.67.222.222
netsh interface ip add dns "Local Area Connection" 208.67.220.220

netsh interface ip set dns "Wi-Fi" static 208.67.222.222
netsh interface ip add dns "Wi-Fi" 208.67.220.220
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Norton
:ndns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Norton.. Please wait
netsh interface ip set dns "Ethernet" static 198.153.194.1
netsh interface ip add dns "Ethernet" 198.153.192.1

netsh interface ip set dns "Local Area Connection" static 198.153.194.1
netsh interface ip add dns "Local Area Connection" 198.153.192.1

netsh interface ip set dns "Wi-Fi" static 198.153.194.1
netsh interface ip add dns "Wi-Fi" 198.153.192.1
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Verisign
:veidns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Verisign.. Please wait
netsh interface ip set dns "Ethernet" static 64.6.64.6
netsh interface ip add dns "Ethernet" 64.6.65.6

netsh interface ip set dns "Local Area Connection" static 64.6.64.6
netsh interface ip add dns "Local Area Connection" 64.6.65.6

netsh interface ip set dns "Wi-Fi" static 64.6.64.6
netsh interface ip add dns "Wi-Fi" 64.6.65.6
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::NextDNS
:nedns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to NextDNS.. Please wait
netsh interface ip set dns "Ethernet" static 45.90.28.190
netsh interface ip add dns "Ethernet" 45.90.30.190

netsh interface ip set dns "Local Area Connection" static 45.90.28.190
netsh interface ip add dns "Local Area Connection" 45.90.30.190

netsh interface ip set dns "Wi-Fi" static 45.90.28.190
netsh interface ip add dns "Wi-Fi" 45.90.30.190
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::ComodoDNS
:coidns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to ComodoDNS.. Please wait
netsh interface ip set dns "Ethernet" static 8.26.56.26
netsh interface ip add dns "Ethernet" 8.20.247.20

netsh interface ip set dns "Local Area Connection" static 8.26.56.26
netsh interface ip add dns "Local Area Connection" 8.20.247.20

netsh interface ip set dns "Wi-Fi" static 8.26.56.26
netsh interface ip add dns "Wi-Fi" 8.20.247.20
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Level3
:lvdns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Level3.. Please wait
netsh interface ip set dns "Ethernet" static 209.244.0.3
netsh interface ip add dns "Ethernet" 209.244.0.4

netsh interface ip set dns "Local Area Connection" static 209.244.0.3
netsh interface ip add dns "Local Area Connection" 209.244.0.4

netsh interface ip set dns "Wi-Fi" static 209.244.0.3
netsh interface ip add dns "Wi-Fi" 209.244.0.4
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Alternate DNS
:aldns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Alternate DNS.. Please wait
netsh interface ip set dns "Ethernet" static 76.76.19.19
netsh interface ip add dns "Ethernet" 76.223.122.150

netsh interface ip set dns "Local Area Connection" static 76.76.19.19
netsh interface ip add dns "Local Area Connection" 76.223.122.150

netsh interface ip set dns "Wi-Fi" static 76.76.19.19
netsh interface ip add dns "Wi-Fi" 76.223.122.150
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Safe DNS
:safedns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Safe DNS.. Please wait
netsh interface ip set dns "Ethernet" static 195.46.39.39
netsh interface ip add dns "Ethernet" 195.46.39.40

netsh interface ip set dns "Local Area Connection" static 195.46.39.39
netsh interface ip add dns "Local Area Connection" 195.46.39.40

netsh interface ip set dns "Wi-Fi" static 195.46.39.39
netsh interface ip add dns "Wi-Fi" 195.46.39.40
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns


::Neustar
:neudns
cls
Title DNS Changer - MultiTaskSz %version%
echo  Changing DNS to Neustar.. Please wait
netsh interface ip set dns "Ethernet" static 156.154.70.1
netsh interface ip add dns "Ethernet" 156.154.71.1

netsh interface ip set dns "Local Area Connection" static 156.154.70.1
netsh interface ip add dns "Local Area Connection" 156.154.71.1

netsh interface ip set dns "Wi-Fi" static 156.154.70.1
netsh interface ip add dns "Wi-Fi" 156.154.71.1
ipconfig /flushdns
echo =================================
echo              DNS Set
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Show Current DNS
:showcdns
cls
Title Getting DNS configs - MultiTaskSz %version%
echo ========================================
echo    Getting DNS configs.. Please wait
echo ========================================
powershell -c Get-DnsClientServerAddress
::netsh interface ip show dnsservers
Title The Current DNS server - MultiTaskSz %version%
echo =================================
echo         Process completed
echo =================================
echo.
echo.
set /p actioni="Press ENTER to go back to DNS menu "

IF "%actioni%" == "" (  goto bedns )

::Delete DNS
:deldns
cls
Title Deleting DNS - MultiTaskSz %version%
echo =====================================================
echo    Deleting DNS server and DNS cache.. Please wait
echo =====================================================
netsh dnsclient delete dnsserver "Ethernet" all
netsh dnsclient delete dnsserver "Local Area Connection" all
netsh dnsclient delete dnsserver "Wi-Fi" all
ipconfig /flushdns
cls 
echo =================================
echo         Process completed
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::Flush DNS
:flushdns
cls
Title Flushing DNS - MultiTaskSz %version%
echo ==================================================================
echo   Flusing DNS and requesting data from DHCP server.. Please wait
echo ==================================================================
ipconfig /release
ipconfig /renew
ipconfig /flushdns
cls
echo =================================
echo         Process completed
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto begin

:flushdns2
cls
Title Flushing DNS - MultiTaskSz %version%
echo ==================================================================
echo   Flusing DNS and requesting data from DHCP server.. Please wait
echo ==================================================================
ipconfig /release
ipconfig /renew
ipconfig /flushdns
cls
echo =================================
echo         Process completed
echo =================================
timeout /t 1 /nobreak > NUL
cls
goto bedns

::==================================Ping Tools===================================

::Normal Ping
:pingingnormal
cls 
echo.
echo.
set /p pings= "How many tests should I run? "
cls 
Title Running %pings% Tests...
echo =================================
echo =================================
echo        LocalHost Modem
echo.
ping 127.0.1.1 -n 4
echo.
echo =================================
echo =================================
echo          Google DNS
echo.
ping 8.8.8.8 -n %pings%
echo.
echo =================================
echo =================================
echo         CloudFlare DNS
echo.
ping 1.1.1.1 -n %pings%
echo.
echo =================================
echo =================================
echo.
echo.
Title Test Complated
set /p choicep="Do you want to restart the progress? Press 'y' and enter for Yes or press 'n' to cancel: "
IF "%choicep%" == "n" ( cls & goto pinging )
IF "%choicep%" == "y" ( cls & goto pingingnormal )

::Pinging IP / Address
:pingingip
Title Ping Test  
cls 
echo.
echo.
set /p pingsw= "How many tests should I run? "
echo.
echo.
cls 
set /p ipad= "Type IP or Hostname address to begin the test "
Title Running %pingsw% Tests on %ipad%...
echo =================================
echo =================================
echo          %ipad%
echo.
ping %ipad% -n %pings%
echo =================================
echo =================================
Title Test Complated
set /p choicepw="Do you want to restart the progress? Press 'y' and enter for Yes or press 'n' to cancel: "
IF "%choicepw%" == "n" ( cls & goto pinging )
IF "%choicepw%" == "y" ( cls & goto pingingip )

::Path Pinging
:pathpinging
Title Ping Test
cls 
echo.
echo.
set /p pathpings= "Type IP or Hostname address to begin the test "
echo.
echo.
cls 
Title Running Pathping on %pathpings%
echo =================================
echo =================================
echo          %pathpings%
echo.
pathping %pathpings%
echo =================================
echo =================================
echo.
echo.
Title Test Complated
set /p choicepp="Do you want to restart the progress? Press 'y' and enter for Yes or press 'n' to cancel: "
IF NOT "%choicepp%" == "y" ( IF NOT "%choicepp%" == "n" (  goto begin ) )
IF "%choicepp%" == "n" ( cls & goto pinging )
IF "%choicepp%" == "y" ( cls & goto pathpinging )


::=======================Connection List===========================
:netst
cls
Title Checking Connections - MultiTaskSz %version%
echo ==============================================================================================
echo  Listing network connections and the programs that are making those connections.. Please wait
echo ==============================================================================================
netstat -nba
Title List of network connections and the programs that are making those connections - MultiTaskSz %version%
echo =================================
echo         Process completed
echo =================================
echo.
echo.
set /p actioni="Press ENTER to go back to menu "

IF "%actioni%" == "" (  goto begin )

::=======================Full Network Reset===========================
:fnetresetfull
cls 
Title Network Reset - MultiTaskSz %version%
echo ========================================================
echo   Resetting Network settings to default.. Please wait
echo ========================================================
netsh dnsclient delete dnsserver "Ethernet" all
netsh dnsclient delete dnsserver "Local Area Connection" all
netsh dnsclient delete dnsserver "Wi-Fi" all
netsh int ip reset
netsh interface ipv4 reset
netsh interface ipv6 reset
ipconfig /release 
ipconfig /renew
ipconfig /flushdns
winsock reset
cls
echo.
echo.
Title Reset Complated
echo A Restart is required to apply some settings
echo.
echo.
set /p choicefr="Press 'y' and enter to restart or press 'n' to cancel and restart later: "
IF NOT "%choicefr%" == "y" ( IF NOT "%choicefr%" == "n" (  goto begin ) )
IF "%choicefr%" == "n" ( cls & goto begin )
IF "%choicefr%" == "y" ( cls & goto restarting )

::=======================Speed Test===========================
:speedtestw
cls
Title Speed Test by Ookla - MultiTaskSz %version%
IF EXIST speedtest.exe (
echo =================================
echo.
speedtest.exe
echo.
echo =================================
set /p actionsti="Press ENTER to go back to Main menu "

IF "%actionsti%" == "" (  goto begin )
) ELSE (
echo ==========================================
echo Speedtest.exe doesn't exist downloading it
echo ==========================================
echo.
curl https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-win64.zip --output speedtest.zip
tar -xf speedtest.zip
del speedtest.zip speedtest.md
echo =================================
echo        Process Completed
echo =================================
cls
echo =================================
echo.
speedtest.exe
echo.
echo =================================
set /p actionsti="Press ENTER to go back to Main menu "

IF "%actionsti%" == "" (  goto begin )
)

::=====================================SYSTEM======================================
::=======================Windows Benchmark / System info===========================

::Windows benchmark
:winsattest
cls
title Running WinSat Please Wait
winsat formal 
echo Test completed
timeout /t 2 /nobreak > NUL
cls
goto winsat

::System Info
:sysinfofull
cls
systeminfo
ipconfig
netstat -e
echo.
set /p actionsyi="Press ENTER to go back to System WI  menu "

IF "%actionsyi%" == "" (  goto winsat )

::================================Rebuild Icon Cache================================

:rebuildicon
cls
title Rebuilding Icon Cache - MultiTaskSz %version%
color 7
set iconcache=%localappdata%\IconCache.db
set iconcache_x=%localappdata%\Microsoft\Windows\Explorer\iconcache*

echo.
echo The explorer process must be temporarily killed before deleting the IconCache.db file. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
echo.
If exist "%iconcache%" goto deleteico
echo.
echo The %localappdata%\IconCache.db file has already been deleted.
echo. 
If exist "%iconcache_x%" goto deleteico
echo.
echo The %localappdata%\Microsoft\Windows\Explorer\IconCache_*.db files have already been deleted.
echo.
exit /B

:deleteico
echo.
echo Attempting to delete IconCache.db files...
echo.
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
del /A /F /Q "%iconcache%"
del /A /F /Q "%iconcache_x%"
cls
start explorer.exe
cls
echo.
echo =================================
echo        Process Completed
echo =================================
set /p actionrebui="Press ENTER to go back to main menu "

IF "%actionrebui%" == "" (  goto begin )

::============================Clear Event Viewer Logs==============================

:clearevnlog
title Clearing Event Viewer Logs - MultiTaskSz %version%
color 7
cls
For /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
cls
echo =================================
echo        Process Completed
echo =================================
echo.
echo.
set /p actionrebui="Press ENTER to go back to main menu "
IF "%actionrebui%" == "" (  goto begin )

:do_clear
echo clearing %1
wevtutil.exe cl %1
goto :eof
::============================Removing folders==============================
::Resotring
:foldersrestore64
cls
echo.
echo The explorer process must be temporarily killed before Restoring the folders. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
cls
:: Restore Desktop To This PC
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641} /f
:: Restore Documents To This PC
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af} /f
:: Restore Downloads To This PC
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f} /f
:: Restore Music To This PC
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de} /f
:: Restore Pictures To This PC
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8} /f
:: Restore Videos To This PC
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a} /f
:: Restore 3D Objects To This PC
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
echo.
set /p actionrebui="Press ENTER to go back to menu "
IF "%actionrebui%" == "" (  goto foldelres )

::Deleting 
:foldersdelete64
cls
echo.
echo The explorer process must be temporarily killed before deleting the Folders. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
:: Restore Desktop To This PC
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641} /f
:: Restore Documents To This PC
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af} /f
:: Restore Downloads To This PC
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f} /f
:: Restore Music To This PC
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de} /f
:: Restore Pictures To This PC
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8} /f
:: Restore Videos To This PC
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a} /f
:: Restore 3D Objects To This PC
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
echo.
set /p actionrebui="Press ENTER to go back to menu "
IF "%actionrebui%" == "" (  goto foldelres )

:folderDo64
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B}
cls
IF %ERRORLEVEL% EQU 0 (
echo.
echo The explorer process must be temporarily killed before Deleting the folder. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actionrebui="Press ENTER to go back to menu "

IF "%actionrebui%" == "" (  goto foldelres )
) ELSE (
echo.
echo The explorer process must be temporarily killed before Restoring the folder. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{374DE290-123F-4565-9164-39C4925E467B} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{088e3905-0323-4b02-9826-5d99428e115f} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actionrebui="Press ENTER to go back to menu "

IF "%actionrebui%" == "" (  goto foldelres )
)

:folderDe64
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641}
cls
IF %ERRORLEVEL% EQU 0 (
echo.
echo The explorer process must be temporarily killed before Deleting the folder. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actionrebui="Press ENTER to go back to menu "

IF "%actionrebui%" == "" (  goto foldelres )
) ELSE (
echo.
echo The explorer process must be temporarily killed before Restoring the folder. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{B4BFCC3A-DB2C-424C-B029-7FE99A87C641} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actionrebui="Press ENTER to go back to menu "

IF "%actionrebui%" == "" (  goto foldelres )
)

:folderMu64
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE}
cls
IF %ERRORLEVEL% EQU 0 (
echo.
echo The explorer process must be temporarily killed before Deleting the folder. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actionrebui="Press ENTER to go back to menu "

IF "%actionrebui%" == "" (  goto foldelres )
) ELSE (
echo.
echo The explorer process must be temporarily killed before Restoring the folder. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{1CF1260C-4DD0-4ebb-811F-33C572699FDE} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3dfdf296-dbec-4fb4-81d1-6a3438bcf4de} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actionrebui="Press ENTER to go back to menu "

IF "%actionrebui%" == "" (  goto foldelres )
)

:folderPh64
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA}
cls
IF %ERRORLEVEL% EQU 0 (
echo.
echo The explorer process must be temporarily killed before Deleting the folder. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actionrebui="Press ENTER to go back to menu "

IF "%actionrebui%" == "" (  goto foldelres )
) ELSE (
echo.
echo The explorer process must be temporarily killed before Restoring the folder. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{3ADD1653-EB32-4cb0-BBD7-DFA0ABB5ACCA} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{24ad3ad4-a569-4530-98e1-ab02f9417aa8} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actionrebui="Press ENTER to go back to menu "

IF "%actionrebui%" == "" (  goto foldelres )
)

:folderVi64
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C}
cls
IF %ERRORLEVEL% EQU 0 (
echo.
echo The explorer process must be temporarily killed before Deleting the folder. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actionrebui="Press ENTER to go back to menu "

IF "%actionrebui%" == "" (  goto foldelres )
) ELSE (
echo.
echo The explorer process must be temporarily killed before Restoring the folder. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A0953C92-50DC-43bf-BE83-3742FED03C9C} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{f86fa3ab-70d2-4fc7-9c99-fcbf05467f3a} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actionrebui="Press ENTER to go back to menu "

IF "%actionrebui%" == "" (  goto foldelres )
)

:folderDoc64
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0}
cls
IF %ERRORLEVEL% EQU 0 (
echo.
echo The explorer process must be temporarily killed before Deleting the folder. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actionrebui="Press ENTER to go back to menu "

IF "%actionrebui%" == "" (  goto foldelres )
) ELSE (
echo.
echo The explorer process must be temporarily killed before Restoring the folder. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{A8CDFF1C-4878-43be-B5FD-F8091C1C60D0} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{d3162b92-9365-467a-956b-92703aca08af} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actionrebui="Press ENTER to go back to menu "

IF "%actionrebui%" == "" (  goto foldelres )
)

:folder3D64
reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}
cls
IF %ERRORLEVEL% EQU 0 (
echo.
echo The explorer process must be temporarily killed before Deleting the folder. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A} /f
REG DELETE HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actionrebui="Press ENTER to go back to menu "

IF "%actionrebui%" == "" (  goto foldelres )
) ELSE (
echo.
echo The explorer process must be temporarily killed before Restoring the folder. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A} /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A} /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actionrebui="Press ENTER to go back to menu "

IF "%actionrebui%" == "" (  goto foldelres )
)
::============================TaskBar==============================
:taskbton
cls
echo.
echo ====================================================================
echo You can set Transparency value from 0 to 255 [set 0 to hide taskbar]
echo ====================================================================
echo.
echo Note:This only works on [DARK Theme] with [Transparency Effect] Set to ON
echo.
echo.
set /P opacity="Set Value: "
reg add HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarAcrylicOpacity /t REG_DWORD /d %opacity% /f
cls
echo.
echo The explorer process must be temporarily killed. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actiontaskbh="Press ENTER to go back to menu "

IF "%actiontaskbh%" == "" (  goto taskbar )

:taskbtof
cls
echo.
echo The explorer process must be temporarily killed. 
echo.
echo Please SAVE ALL OPEN WORK before continuing.
echo.
pause
cls
ie4uinit.exe -show
taskkill /IM explorer.exe /F 
timeout /t 2 >nul
reg DELETE HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarAcrylicOpacity /f
start explorer.exe
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actiontaskbn="Press ENTER to go back to menu "

IF "%actiontaskbn%" == "" (  goto taskbar )

:taskbtos
cls
echo Setting the required settings
timeout /t 2 >nul
cls
echo Enabled Transparency
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v EnableTransparency /t REG_DWORD /d 1 /f
timeout /t 2 >nul
echo Changing the Theme to DarkMode
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v ColorPrevalence /t REG_DWORD /d 0 /f
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize /v SystemUsesLightTheme /t REG_DWORD /d 0 /f
echo.
timeout /t 2 >nul
cls
echo =================================
echo        Process Completed
echo =================================
echo.
set /p actiontaskbn="Press ENTER to go back to menu "

IF "%actiontaskbn%" == "" (  goto taskbar )

::============================End==============================

:restarting
color c
echo.
echo.
echo Close all programs and wait for restart to prevent data loss
echo.
echo.
echo Restarting in progress...
timeout /t 40 /nobreak
shutdown -r

:exit
exit
