# 宝塔面板一键docker部署
建议使用host网络模式启动,不需要设置映射端口,自动映射宝塔面板全端口到外网,正常的bridge模式可能会造成网站后台不能获取用户真实ip地址,通过如下命令运行面板镜像

`docker run -tid –net=host --name btpanel --restart always -v btpanel_www:/www -v /wwwroot:/www/wwwroot`

镜像运行成功后,需要查看docker日志获取初始化后的面板登录地址和初始账号密码信息, 运行如下命令获取

`docker logs -f -t --tail 10 btpanel`

安装完成后以后可以随时升级到最新版本, 由于面板数据都保存在持久化的卷中, 即使删除容器后重新运行, 原来的面板和网站数据都能得到保留.

/www文件夹建议保存在volume卷中, /www/wwwroot建议映射到宿主机的目录下,方便上传网站代码等文件

好用请收藏加星支持一下,谢谢! 其他问题和建议请在github的issue里面交流.
传送门: https://github.com/pch18/docker-btpanel/issues
