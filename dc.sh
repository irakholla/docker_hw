systemctl stop firewalld
setenforce 0
DIR=opt/mount{1,2}
if [ -d "$DIR" ]; then
  chmod -R 777 opt/
  docker-compose pull
else
  mkdir -p opt/mount{1,2}/datanode-dir
  mkdir -p opt/mount{1,2}/nodemanager-{local,log}-dir
  mkdir -p opt/mount{1,2}/namenode-dir
  chmod -R 777 opt/
  docker-compose pull
fi
docker-compose up
