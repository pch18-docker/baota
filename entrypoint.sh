for file in `ls /etc/init.d`
do if [ -x /etc/init.d/${file} ];  then 
    /etc/init.d/$file start
fi done
crond
bt default
tail -f /dev/null
