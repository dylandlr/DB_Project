import mysql.connector

class Connection():
    def __init__(self):
        self.cnx = mysql.connector.connect(user='root', password="", host='localhost', database='curbside')
        self.cursor = self.cnx.cursor()