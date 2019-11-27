@echo off 
::SC QUERY zabbixAgent > NUL 
::IF ERRORLEVEL 1060 GOTO NOTEXIST 
::GOTO EXIST 

:NOTEXIST 
if /i "%PROCESSOR_IDENTIFIER:~0,3%" == "X86" goto x86
if /i "%PROCESSOR_IDENTIFIER:~0,3%" NEQ "X86" goto x64

:x86
echo "----------------------------------"
echo "you computer is X32" 
echo "----------------------------------"
echo "install 32 agent"
cd %~dp0bin\win32
zabbix_agentd.exe -i -c %~dp0conf\zabbix_agentd.win.conf
echo "install  sccession!!" 
cd %~dp0bin\win32
zabbix_agentd.exe -s -c %~dp0conf\zabbix_agentd.win.conf
ping -n 3 127.1>nul
echo "start sccession!!"
exit
GOTO END 

:x64
echo "----------------------------------"
echo "you computer is X64" 
echo "----------------------------------"
echo "install 64 agent"
cd %~dp0bin\win64
zabbix_agentd.exe -i -c %~dp0conf\zabbix_agentd.win.conf
echo "install  sccession!!" 
cd %~dp0bin\win64
zabbix_agentd.exe -s -c %~dp0conf\zabbix_agentd.win.conf 
ping -n 3 127.1>nul
echo "start sccession!!" 
exit 

GOTO END 

:EXIST 
echo "start zabbix_agentd Agent"
echo "----------------------------------"
echo "----------------------------------"

GOTO END 
exit

:END 
exit