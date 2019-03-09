import MySQLdb as sql
import sshtunnel
import mysql.connector

sshtunnel.SSH_TIMEOUT = 100.0
sshtunnel.TUNNEL_TIMEOUT = 100.0

from sshtunnel import SSHTunnelForwarder
with SSHTunnelForwarder(
    ('here i am using web server address', 3306),
    ssh_password="webserverpassword",
    ssh_username="serverusername",
    remote_bind_address=('username.mysql.webserveraddres',3306)
) as server:
    conn = mysql.connector.connect(
        host='127.0.0.1',
        port=server.local_bind_port,
        user='mysqlusername',
        passwd='mysqlpassword',
        db='databasename'
    )
query = ("select * from tablename")
cursor.execute(query)
result = cursor.fetchall()

#for r in result:
#print r
db.close()

