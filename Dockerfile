FROM pch18/baota:clear
MAINTAINER pch18.cn

RUN echo '["linuxsys", "nginx", "php-7.3"]' > /www/server/panel/config/index.json
    
RUN bash /www/server/panel/install/install_soft.sh 0 install nginx 1.17
RUN bash /www/server/panel/install/install_soft.sh 0 install php 7.3

VOLUME ["/www","/www/wwwroot"]
