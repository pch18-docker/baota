# 宝塔面板一键docker部署
建议使用host网络模式启动,不需要设置映射端口,自动映射宝塔面板全端口到外网  
正常的bridge模式可能会造成网站后台不能获取用户真实ip地址.

通过host模式运行宝塔镜像  
`docker run -tid --name btpanel --net=host --restart always -v btpanel_www:/www -v /wwwroot:/www/wwwroot pch18/btpanel`

如果特殊情况不能使用host网络模式, 或者容器运行后不能打开面板页面请删除容器后,使用如下命令以bridge网络模式运行  
`docker run -tid --name btpanel -p 80:80 -p 443:443 -p 8888:8888 -p 888:888 --restart always -v btpanel_www:/www -v /wwwroot:/www/wwwroot pch18/btpanel`

镜像运行成功后,需要查看docker日志获取初始化后的面板登录地址和初始账号密码信息  
运行如下命令获取
`docker logs -f -t --tail 10 btpanel`

安装完成后以后可以随时使用内置升级,升级到最新版本, 由于面板数据都保存在持久化的卷中, 即使删除容器后重新运行, 原来的面板和网站数据都能得到保留.

删除容器命令如下  
`docker stop btpanel && docker rm btpanel`

/www文件夹建议保存在volume卷中, /www/wwwroot建议映射到宿主机的目录下,方便上传网站代码等文件  
如果是非root用户,可能会遇到无法映射/wwwroot的问题,请自行把上面的/wwwroot的改成~/wwwroot即可

好用请收藏加星支持一下,谢谢! 其他问题和建议请在github的issue里面交流.
传送门: https://github.com/pch18/docker-btpanel/issues
