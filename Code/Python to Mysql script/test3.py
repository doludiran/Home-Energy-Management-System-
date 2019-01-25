import MySQLdb as sql
conn= MySQldb.connect(host='142.3.200.201',user='joshi26a',passwd='Aj292?',db='joshi26a',port=3306,charset='utf8')
cur=conn.cursor
cur.execute("select *from cms_user")
r= cur.fetchall()
conn.commit()