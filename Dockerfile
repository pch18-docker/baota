FROM centos:latest

#宝塔官方安装
RUN yum -y update \
    && yum -y install wget \
    && cd /home \
    && wget -O install.sh http://download.bt.cn/install/install_6.0.sh \
    && echo y | bash install.sh

#设置entrypoint和letsencrypt映射到www文件夹下持久化
COPY entrypoint.sh /entrypoint.sh

RUN mkdir /www/letsencrypt \
    && ln -s /www/letsencrypt /etc/letsencrypt \
    && chmod +x /entrypoint.sh

CMD /entrypoint
EXPOSE 80 443 8888
VOLUME ["/www","/www/wwwroot"]

HEALTHCHECK --interval=5s --timeout=3s CMD curl -fs http://localhost/ || exit 1 
