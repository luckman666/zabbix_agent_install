# zabbix_agent_install
windos_linux——zabbix一键部署脚本

windos只在server级别或者windos8以上有效

windos脚本我又改了一下。剔除了许多代码，windos执行完批处理文件后，会再C盘有个日志文件。这个你们可以自己调整位置。

windos执行完批处理后，在服务中手动开启zabbix_agent程序

linux则不用，已经开启并且激活了开机自启动！
