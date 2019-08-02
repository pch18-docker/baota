FROM pch18/baota:clear
MAINTAINER pch18.cn

RUN bash /www/server/panel/install/install_soft.sh 0 install apache 2.4
RUN bash /www/server/panel/install/install_soft.sh 0 install php 7.3 || echo 'Ignore Error'
RUN echo '["linuxsys", "webssh", "apache", "php-7.3"]' > /www/server/panel/config/index.json

VOLUME ["/www","/www/wwwroot"]
