#!/bin/bash
sed -i 's:\%HDFS\_NAMENODE\_HOSTNAME\%:vm1:' /opt/hadoop-3.1.2/etc/hadoop/core-site.xml
sed -i 's:\%YARN\_RESOURCE\_MANAGER\_HOSTNAME\%:vm1:' /opt/hadoop-3.1.2/etc/hadoop/yarn-site.xml
echo "172.16.0.2 vm1" >> /etc/hosts
echo "172.16.0.3 vm2" >> /etc/hosts
FILE=/opt/mount1/namenode-dir/current/VERSION
if [ -f "$FILE" ]; then
   /opt/hadoop-3.1.2/bin/hdfs --daemon start namenode
   /opt/hadoop-3.1.2/bin/yarn --daemon start resourcemanager 
else 
   /opt/hadoop-3.1.2/bin/hdfs namenode -format cluster1
   /opt/hadoop-3.1.2/bin/hdfs --daemon start namenode
   /opt/hadoop-3.1.2/bin/yarn --daemon start resourcemanager
fi
tail -f /dev/null
