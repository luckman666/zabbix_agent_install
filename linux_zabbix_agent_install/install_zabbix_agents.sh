#!/bin/bash
bash_path=$(cd "$(dirname "$0")";pwd)
source $bash_path/base.config

install_zabbix(){
ls /etc/yum.repos.d/zabbix.repo

if [[ $? -eq 0 ]];then
echo "数据源已经下载完毕"
else
rpm -ivh  http://repo.zabbix.com/zabbix/3.2/rhel/7/x86_64/zabbix-release-3.2-1.el7.noarch.rpm
fi

num=0
while true ; do
let num+=1
yum -y install zabbix-agent
if [[ $? -eq 0 ]] ; then

echo "zabbix-agent安装环境配置完成！！！"
systemctl enable zabbix-agent
cat >> /etc/zabbix/zabbix_agentd.conf << EOF
Server=$Server
ServerActive=$ServerActive
Hostname=$Hostname
EOF
systemctl start zabbix-agent

break;
else
if [[ num -gt 5 ]];then
echo "尝试安装zabbix-agent 5次依然无法安装请检查网络问题"
break
fi
echo "FK!~zabbix-agent没成功？哥再来一次！！"
fi
done

}
install_zabbix
