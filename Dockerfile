FROM pch18/baota:init

RUN cd /home \
    && wget -O install.sh http://download.bt.cn/install/install_6.0.sh \
    && echo y | bash install.sh \
    && /www/server/panel/install/install_soft.sh 1 install nginx 1.15 \
    && /www/server/panel/install/install_soft.sh 1 install mysql mariadb_10.1 \
    && /www/server/panel/install/install_soft.sh 1 install php 7.1
    

VOLUME ["/www","/www/wwwroot"]
