import sys,os
os.chdir("/www/server/panel/")
sys.path.append("/www/server/panel/class/")
import public,db

username = 'username'
password = 'password'

sql = db.Sql()
sql.table('users').where('id=?',(1,)).setField('password',public.md5(password))
sql.table('users').where('id=?',(1,)).setField('username',username)

public.writeFile('data/admin_path.pl', '/')
public.writeFile('default.pl', password)
