# 宝塔面板一键docker部署
镜像为绑定github的dockerfile文件在dockerHub上自动生成,所以不可能有植入后台的行为,请放心使用.  
镜像生成文件可以在github上查看.请大家监督.  
制作这个纯粹是为了赚点github的关注量,好用之余请不要忘了去github加个Star一下哦,链接在最下方

建议使用host网络模式启动,不需要设置映射端口,自动映射宝塔面板全端口到外网  
正常的bridge模式可能会造成网站后台不能获取用户真实ip地址.

### 通过host模式运行宝塔镜像  
`docker run -tid --name btpanel --net=host --restart always -v btpanel_www:/www -v /wwwroot:/www/wwwroot pch18/btpanel`

### 如果特殊情况不能使用host网络模式, 或者容器运行后不能打开面板页面请删除容器后,使用如下命令以bridge网络模式运行  
`docker run -tid --name btpanel -p 80:80 -p 443:443 -p 8888:8888 -p 888:888 -p 20:20 -p 21:21 --restart always -v btpanel_www:/www -v /wwwroot:/www/wwwroot pch18/btpanel`

### 删除容器命令如下  
`docker stop btpanel && docker rm btpanel`

### 镜像运行成功后,运行如下命令查看(二选一即可) 初始化后的面板登录地址和初始账号密码信息  
`docker logs -f -t --tail 10 btpanel`  
`docker exec btpanel bt default`

安装完成后以后可以随时使用内置升级,升级到最新版本, 由于面板数据都保存在持久化的卷中, 即使删除容器后重新运行, 原来的面板和网站数据都能得到保留.  

/www文件夹建议保存在volume卷中, /www/wwwroot建议映射到宿主机的目录下,方便上传网站代码等文件  
如果是非root或者mac的用户,可能会遇到无法映射/wwwroot的问题,请自行把上面的/wwwroot的改成~/wwwroot即可

如果还没有安装docker的请运行这个安装脚本(仅支持centos)  
https://github.com/pch18/docker-btpanel/wiki/centos%E4%B8%8B-%E5%AE%89%E8%A3%85%E6%9C%80%E6%96%B0%E7%89%88%E6%9C%ACdocker

好用请收藏加星支持一下,谢谢! 其他问题和建议请在github的issue里面交流.  
github issue传送门: https://github.com/pch18/docker-btpanel/issues  
dockerHub传送门: https://hub.docker.com/r/pch18/btpanel/
