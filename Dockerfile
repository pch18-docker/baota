FROM pch18/baota:clear
MAINTAINER pch18.cn

RUN cd /www/server/panel \
    && echo '["linuxsys", "nginx", "php-7.3", "mysql"]' > ./config/index.json
    
RUN bash ./install/install_soft.sh 0 install nginx 1.15
RUN bash ./install/install_soft.sh 0 install php 7.3
RUN bash ./install/install_soft.sh 0 install mysql mariadb_10.3

VOLUME ["/www","/www/wwwroot"]
