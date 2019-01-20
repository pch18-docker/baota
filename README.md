# 宝塔面板一键docker部署(php7.3版本)
镜像为绑定github的dockerfile文件在dockerHub上自动生成,所以不可能有植入后台的行为,请放心使用.  
镜像生成文件可以在github上查看.请大家监督.  
制作这个纯粹是为了赚点github的关注量,好用之余请不要忘了去github加个Star一下哦,链接在最下方

建议使用host网络模式启动,不需要设置映射端口,自动映射宝塔面板全端口到外网  
正常的bridge模式可能会造成网站后台不能获取用户真实ip地址.

### 通过host模式运行宝塔镜像  
`docker run -tid --name baota --net=host --privileged=true --restart always -v baota_www:/www -v ~/wwwroot:/www/wwwroot pch18/baota`

### 如果特殊情况不能使用host网络模式, 或者容器运行后不能打开面板页面请删除容器后,使用如下命令以bridge网络模式运行  
`docker run -tid --name baota -p 80:80 -p 443:443 -p 8888:8888 -p 888:888 -p 20:20 -p 21:21 --privileged=true --restart always -v baota_www:/www -v ~/wwwroot:/www/wwwroot pch18/baota`

### 删除容器命令如下  
`docker stop baota && docker rm baota`

### 镜像运行成功后,运行如下命令(二选一即可)查看初始化后的面板登录地址和初始账号密码信息  
`docker logs -f -t --tail 10 baota`  
`docker exec baota bt default`

### 版本命名说明  
`pch18/baota:latest` 或 `pch18/baota` 为最新版本的官方纯净安装的基础上安装nginx,mysql,php  
`pch18/baota:clear` 为官方版本纯净安装, 不默认安装nginx,mysql,php等程序  
`pch18/baota:lnmp` 为官方版本纯净安装的基础上安装nginx,mysql,php  
`pch18/baota:lnp` 为官方版本纯净安装的基础上安装nginx,php(不内置mysql,用于外置数据库的环境)  


安装完成后以后可以随时使用内置升级,升级到最新版本, 由于面板数据都保存在持久化的卷中, 即使删除容器后重新运行, 原来的面板和网站数据都能得到保留.  

/www文件夹建议保存在volume卷中, /www/wwwroot建议映射到宿主机的目录下,方便上传网站代码等文件  
每次启动容器后自动启动所有服务  

如果还没有安装docker的请运行这个安装脚本(仅支持centos)  
https://github.com/pch18/docker-baota/wiki/centos%E4%B8%8B-%E5%AE%89%E8%A3%85%E6%9C%80%E6%96%B0%E7%89%88%E6%9C%ACdocker

好用请收藏加星支持一下,谢谢! 其他问题和建议请在github的issue里面交流.  
github issue传送门: https://github.com/pch18/docker-baota/issues  
dockerHub传送门: https://hub.docker.com/r/pch18/baota/
