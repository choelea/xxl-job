FROM harbor.digitalchina.com/public/openjdk:8-jdk-buster

MAINTAINER lichaoan@digitalchina.com
#拷贝文件并且重命名

ADD xxl-job-admin/target/xxl-job-admin-*.jar /app.jar
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone
#暴露容器端口，Docker镜像告知Docker宿主机应用监听了哪个端口
EXPOSE 8080
#容器启动时执行的命令
#ENTRYPOINT ["java","-jar","/app.jar"]
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -jar /app.jar"]
