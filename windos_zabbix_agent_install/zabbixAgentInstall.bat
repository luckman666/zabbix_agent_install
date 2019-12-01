@echo off

cd %~dp0bin\win64
zabbix_agentd.exe -c %~dp0conf\zabbix_agentd.win.conf -i
echo "install sccession!!"
ping -n 3 127.1>nul
exit