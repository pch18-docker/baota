FROM pch18/baota:lnp

RUN cd /www/server/panel \
    && bash ./install/install_soft.sh 1 install mysql mariadb_10.3 \
    && cat /dev/null

VOLUME ["/www","/www/wwwroot"]
