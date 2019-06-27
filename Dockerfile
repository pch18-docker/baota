FROM pch18/baota:clear
MAINTAINER pch18.cn

RUN echo '["linuxsys", "apache", "php-7.3"]' > /www/server/panel/config/index.json

RUN bash /www/server/panel/install/install_soft.sh 0 install apache 2.4
RUN bash /www/server/panel/install/install_soft.sh 1 install php 7.3

VOLUME ["/www","/www/wwwroot"]
