
import pymysql
import sshtunnel

db_host = '<address reachable only by ssh_tunnel_host>'
from sshtunnel import SSHTunnelForwarder
with SSHTunnelForwarder(
    ('hercules.cs.uregina.ca', 22),
    ssh_username="joshi26a",
    ssh_password="Aj292?",
    remote_bind_address=(db_host, 3306)
) as tunnel:
    port = tunnel.local_bind_port
    db_connection = pymysql.connect(
        host='127.0.0.1', port=port, db='joshi26a', user='joshi26a',
        password='Geeta1', charset='utf8mb4')