FROM pch18/baota:clear

RUN cd /www/server/panel \
    && bash ./install/install_soft.sh 1 install nginx 1.15 \
    && bash ./install/install_soft.sh 1 install mysql mariadb_10.3 \
    && bash ./panel/install/install_soft.sh 1 install php 7.3
    

VOLUME ["/www","/www/wwwroot"]
