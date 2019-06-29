FROM pch18/baota:clear
MAINTAINER pch18.cn
    
RUN bash /www/server/panel/install/install_soft.sh 0 install nginx 1.17
RUN bash /www/server/panel/install/install_soft.sh 1 install php 7.3
RUN echo '["linuxsys", "nginx", "php-7.3"]' > /www/server/panel/config/index.json

VOLUME ["/www","/www/wwwroot"]
