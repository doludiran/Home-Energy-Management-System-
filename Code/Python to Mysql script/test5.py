import sys
import MySQLdb as sql
import pandas as pd
import paramiko 
import sshtunnel 
import mysql.connector

sshtunnel.SSH_TIMEOUT = 5.0
sshtunnel.TUNNEL_TIMEOUT = 5.0

with sshtunnel.SSHTunnelForwarder(
    ('hercules.cs.uregina.ca'),
    ssh_username='joshi26a', ssh_password='Aj292?',
    remote_bind_address=('joshi26a.mysql.hercules.cs.uregina.ca', 3306)

) as tunnel:
        con = mysql.connector.connect(
            user='joshi26a', password='Geeta1',
            host='127.0.0.1', port=tunnel.local_bind_port,
            database='joshi26a',)
        c= con.cursor()
        print(c.execute("SELECT *from cms_user"))
	
        con.close()
		