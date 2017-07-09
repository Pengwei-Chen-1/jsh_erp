# 编译docker镜像，并run容器
docker build -t jdftomcat .
docker run -itd -p 8080:8080 --link mysqldb:mysql -v /c/Users/pengwei_chen/workspace/jsh_erp/:/opt/erp/ --name=myserver jdftomcat

#查询当前java进程
ps -ef | grep java
kill -9 进程id

#将war包导入tomcat，并启动tomcat，查看tomcat日志
rm -rf /opt/tomcat/webapps/simpleerp/
rm -f /opt/tomcat/webapps/simpleerp.war
cp /opt/erp/target/simpleerp.war /opt/tomcat/webapps/
cd /opt/tomcat/bin/ && . catalina.sh start
tail -f /opt/tomcat/logs/catalina.out

#配置端口映射，能通过局域网访问docker容器中的tomcat服务
Virtual box中添加端口映射，需配置本机局域网ip的端口映射和localhost端口映射

#修改mysql连接限制，让docker容器中的tomcat能够访问到容器外的MySQL
use mysql;
select user,host from user;
grant all privileges on *.* to 'root'@'192.168.99.100' identified by 'root';
flush privileges;

# docker镜像加速器，快速拉取常用公共镜像
docker-machine ssh default
sudo sed -i "s|EXTRA_ARGS='|EXTRA_ARGS='--registry-mirror=http://f7bca92b.m.daocloud.io |g" /var/lib/boot2docker/profile
exit
docker-machine restart default

#启动mysql
docker run --name mysqldb -v /c/Users/pengwei_chen/workspace/jsh_erp/:/opt/erp/  -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root -d mysql:5.6 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
#修改编码
cp /opt/erp/docker/mysqld.cnf /etc/mysql/mysql.conf.d/
#创建数据库
mysql -uroot -p
create database jsh_erp default character set utf8;
use jsh_erp;
#导入数据
source /opt/erp/sql/jsh_erp.sql;
#查看mysql中数据编码
SHOW VARIABLES LIKE 'character_set_%';
SHOW VARIABLES LIKE 'collation_%';