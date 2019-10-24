FROM centos:7
WORKDIR /devops
COPY . .
RUN bash hadoop.sh
EXPOSE 9870 8088
RUN ["chmod", "+x", "/devops/hadoop-namenode.sh"]
ENTRYPOINT ["/devops/hadoop-namenode.sh"]
