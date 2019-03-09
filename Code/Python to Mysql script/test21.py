#import MySQLDB as sql
import MySQLdb as sql
import sshtunnel
import mysql.connector

sshtunnel.SSH_TIMEOUT = 10.0
sshtunnel.TUNNEL_TIMEOUT = 10.0

from sshtunnel import SSHTunnelForwarder
with SSHTunnelForwarder(
    ('hercules.cs.uregina.ca.', 3306),
    ssh_password="Aj292?",
    ssh_username="joshi26a",
    remote_bind_address=('joshi26a.mysql.hercules.cs.uregina.ca.',3306)
) as server:
    conn = mysql.connector.connect(
        host='127.0.0.1',
        port=server.local_bind_port,
        user='joshi26a',
        passwd='Geeta1',
        db='joshi26a'
    )
query = ("select * from cms_user")
cursor.execute(query)
#result = cursor.fetchall()

#for r in result:
#print r
db.close()

