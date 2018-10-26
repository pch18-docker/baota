FROM pch18/baota:init

RUN cd /home \
    && wget -O install.sh http://download.bt.cn/install/install_6.0.sh \
    && echo y | bash install.sh

VOLUME ["/www","/www/wwwroot"]
