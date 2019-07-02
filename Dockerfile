FROM pch18/baota:clear
MAINTAINER pch18.cn

RUN bash /www/server/panel/install/install_soft.sh 0 install apache 2.4
RUN mkdir -p /www/server/apache/conf/extra \
    && touch /www/server/apache/conf/extra/httpd-vhosts.conf \
    && bash /www/server/panel/install/install_soft.sh 0 install php 7.3
RUN bash /www/server/panel/install/install_soft.sh 0 install mysql mariadb_10.3
RUN echo '["linuxsys", "apache", "php-7.3", "mysql"]' > /www/server/panel/config/index.json

VOLUME ["/www","/www/wwwroot"]
