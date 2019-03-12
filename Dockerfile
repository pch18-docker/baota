FROM pch18/baota:lnp

RUN cd /www/server/panel \
    && bash ./install/install_soft.sh 1 install mysql mariadb_10.3 \
    && echo '["linuxsys", "nginx", "php-7.3", "mysql"]' > ./config/index.json

    

VOLUME ["/www","/www/wwwroot"]
