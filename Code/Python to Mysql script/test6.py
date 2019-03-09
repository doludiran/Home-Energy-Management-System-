import pymysql
conn = pymysql.connect(
                    host="hercules.cs.uregina.ca",
                     user="joshi26a",
                      passwd="Aj292?",
                      db="joshi26a",
                      charset = "utf8",
                      use_unicode = True)
conn.autocommit(True) # this I 
cur = conn.cursor()
