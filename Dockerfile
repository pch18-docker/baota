FROM pch18/baota:clear

RUN cd /home \
    && bash /www/server/panel/install/install_soft.sh 1 install nginx 1.15 \
    && bash /www/server/panel/install/install_soft.sh 1 install mysql mariadb_10.3 \
    && bash /www/server/panel/install/install_soft.sh 1 install php 7.3
    

VOLUME ["/www","/www/wwwroot"]
