FROM pch18/baota:_base6.0
MAINTAINER pch18.cn

RUN cd /www/server/panel \
    && echo '["linuxsys", "apache", "mysql", "php-7.3"]' > ./config/index.json
    
RUN bash ./install/install_soft.sh 0 install apache 2.4
RUN bash ./install/install_soft.sh 0 install mysql mariadb_10.3
RUN bash ./install/install_soft.sh 0 install php 7.3

VOLUME ["/www","/www/wwwroot"]
