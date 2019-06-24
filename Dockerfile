FROM centos:7
MAINTAINER pch18.cn

#设置entrypoint和letsencrypt映射到www文件夹下持久化
COPY entrypoint.sh /entrypoint.sh
RUN mkdir -p /www/letsencrypt \
    && ln -s /www/letsencrypt /etc/letsencrypt \
    && rm -f /etc/init.d \
    && mkdir /www/init.d \
    && ln -s /www/init.d /etc/init.d \
    && chmod +x /entrypoint.sh \
    && mkdir /www/wwwroot
    
#更新系统 安装依赖 安装宝塔面板
RUN yum -y update \
    && yum -y install wget openssh-server \
    cd /home \
    && wget -O install.sh http://download.bt.cn/install/install_6.0.sh \
    && echo y | bash install.sh 

WORKDIR /www/wwwroot
CMD /entrypoint.sh
EXPOSE 8888 888 21 20 443 80

HEALTHCHECK --interval=5s --timeout=3s CMD curl -fs http://localhost/ || exit 1 
