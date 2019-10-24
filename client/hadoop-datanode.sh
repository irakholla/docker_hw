#!/bin/bash
sed -i 's:\%HDFS\_NAMENODE\_HOSTNAME\%:vm1:' /opt/hadoop-3.1.2/etc/hadoop/core-site.xml
sed -i 's:\%YARN\_RESOURCE\_MANAGER\_HOSTNAME\%:vm1:' /opt/hadoop-3.1.2/etc/hadoop/yarn-site.xml
echo "172.16.0.2 vm1" >> /etc/hosts
echo "172.16.0.3 vm2" >> /etc/hosts
/opt/hadoop-3.1.2/bin/hdfs --daemon start datanode
/opt/hadoop-3.1.2/bin/yarn --daemon start nodemanager
tail -f /dev/null
