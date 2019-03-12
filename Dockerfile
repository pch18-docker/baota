FROM pch18/baota:clear

RUN cd /www/server/panel \
    && bash ./install/install_soft.sh 1 install apache 2.4 \
    && bash ./install/install_soft.sh 1 install php 7.3 \
    && echo '["linuxsys", "apache", "php-7.3"]' > ./config/index.json
    
VOLUME ["/www","/www/wwwroot"]
