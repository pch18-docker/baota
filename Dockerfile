FROM pch18/baota:lap

RUN cd /www/server/panel \
    && bash ./install/install_soft.sh 1 install mysql mariadb_10.3 \
    && echo '["linuxsys", "nginx", "apache", "mysql"]' > ./config/index.json
    

VOLUME ["/www","/www/wwwroot"]
