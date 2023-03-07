FROM pch18/baota:clear
MAINTAINER pch18.cn

RUN bash /www/server/panel/install/install_soft.sh 0 install nginx 1.17 \
    && bash /www/server/panel/install/install_soft.sh 0 install php 7.3 || echo 'Ignore Error' \
    && bash /www/server/panel/install/install_soft.sh 0 install mysql mariadb_10.3 \
    && bash /www/server/panel/install/install_soft.sh 0 install phpmyadmin 4.9 || echo 'Ignore Error' \
    && echo '["linuxsys", "webssh", "nginx", "php-7.3", "mysql", "phpmyadmin"]' > /www/server/panel/config/index.json \
    && yum clean all \
    && rm -rf /www/server/php/73/src \
    && rm -rf /www/server/nginx/src \
    && rm -rf /www/server/mysql/mysql-test

VOLUME ["/www","/www/wwwroot"]
