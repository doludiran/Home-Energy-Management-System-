import MySQLdb
from sshtunnel import SSHTunnelForwarder

db = MySQLdb.connect(host="142.3.200.201", user="joshi26a", passwd="Aj292?", db="joshi26a",3306)

#create a cursor for the select
cur = db.cursor()

#execute an sql query
cur.execute("SELECT user_id,user_name FROM cms_user")

##Iterate 
for row in cur.fetchall() :
      #data from rows
        user_id = str(row[0])
        user_name = str(row[0])

      #print 
        print "row info " + user_id + " " + user_name

# close the cursor
cur.close()

# close the connection
db.close ()