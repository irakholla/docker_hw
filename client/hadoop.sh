#!/bin/bash
yum install -y wget
yum install -y java-1.8.0-openjdk.x86_64
tar -zxvf /devops/hadoop-3.1.2.tar.gz -C /opt
mkdir -p /opt/mount{1,2}/datanode-dir
mkdir -p /opt/mount{1,2}/nodemanager-{local,log}-dir
mkdir -p /opt/mount{1,2}/namenode-dir
rm -f /opt/hadoop-3.1.2/etc/hadoop/hadoop-env.sh
rm -f /opt/hadoop-3.1.2/etc/hadoop/core-site.xml
rm -f /opt/hadoop-3.1.2/etc/hadoop/hdfs-site.xml
rm -f /opt/hadoop-3.1.2/etc/hadoop/yarn-site.xml
wget -P /opt/hadoop-3.1.2/etc/hadoop/ https://gist.githubusercontent.com/rdaadr/2f42f248f02aeda18105805493bb0e9b/raw/6303e424373b3459bcf3720b253c01373666fe7c/hadoop-env.sh
wget -P /opt/hadoop-3.1.2/etc/hadoop/ https://gist.githubusercontent.com/Stupnikov-NA/ba87c0072cd51aa85c9ee6334cc99158/raw/bda0f760878d97213196d634be9b53a089e796ea/yarn-site.xml
wget -P /opt/hadoop-3.1.2/etc/hadoop/ https://gist.githubusercontent.com/rdaadr/2bedf24fd2721bad276e416b57d63e38/raw/640ee95adafa31a70869b54767104b826964af48/hdfs-site.xml
wget -P /opt/hadoop-3.1.2/etc/hadoop/ https://gist.githubusercontent.com/rdaadr/64b9abd1700e15f04147ea48bc72b3c7/raw/2d416bf137cba81b107508153621ee548e2c877d/core-site.xml
sed -i 's:\"\%PATH_TO_OPENJDK8_INSTALLATION\%\":\"\/usr\/lib\/jvm\/java\-1\.8\.0\-openjdk\-1\.8\.0\.222\.b10\-1\.el7\_7\.x86\_64\/jre\":' /opt/hadoop-3.1.2/etc/hadoop/hadoop-env.sh
sed -i 's:\"\%PATH_TO_HADOOP_INSTALLATION\":\"\/opt\/hadoop\-3\.1\.2\":' /opt/hadoop-3.1.2/etc/hadoop/hadoop-env.sh
sed -i 's:\"\%HADOOP\_HEAP\_SIZE\%\":512M:' /opt/hadoop-3.1.2/etc/hadoop/hadoop-env.sh
sed -i 's:\%NAMENODE\_DIRS\%:\/opt\/mount1\/namenode\-dir\,\/opt\/mount2\/namenode\-dir:' /opt/hadoop-3.1.2/etc/hadoop/hdfs-site.xml
sed -i 's:\%DATANODE\_DIRS\%:\/opt\/mount1\/datanode\-dir\,\/opt\/mount2\/datanode\-dir:' /opt/hadoop-3.1.2/etc/hadoop/hdfs-site.xml
sed -i 's:\%NODE\_MANAGER\_LOCAL\_DIR\%:\/opt\/mount1\/nodemanager\-local\-dir\,\/opt\/mount2\/nodemanager\-local\-dir:' /opt/hadoop-3.1.2/etc/hadoop/yarn-site.xml
sed -i 's:\%NODE\_MANAGER\_LOG\_DIR\%:\/opt\/mount1\/nodemanager\-log\-dir\,\/opt\/mount2\/nodemanager\-log\-dir:' /opt/hadoop-3.1.2/etc/hadoop/yarn-site.xml


