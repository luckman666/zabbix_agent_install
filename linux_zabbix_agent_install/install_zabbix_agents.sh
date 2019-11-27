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

yum -y install zabbix-agent
systemctl enable zabbix-agent

cat >> /etc/zabbix/zabbix_agentd.conf << EOF
Server=$Server
ServerActive=$ServerActive
Hostname=$Hostname
EOF
systemctl start zabbix-agent
}
install_zabbix