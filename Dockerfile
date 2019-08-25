FROM pch18/baota:clear
MAINTAINER pch18.cn

RUN bash /www/server/panel/install/install_soft.sh 0 install apache 2.4
RUN bash /www/server/panel/install/install_soft.sh 0 install php 7.3 || echo 'Ignore Error'
RUN bash /www/server/panel/install/install_soft.sh 0 install mysql mariadb_10.3
RUN bash /www/server/panel/install/install_soft.sh 0 install phpmyadmin 4.9 || echo 'Ignore Error'
RUN echo '["linuxsys", "webssh", "apache", "php-7.3", "mysql", "phpmyadmin"]' > /www/server/panel/config/index.json

VOLUME ["/www","/www/wwwroot"]
