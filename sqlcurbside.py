# sqlcurbside.py 
# is a class that will select the input table from the database curbside and return the data from the table

import mysql.connector
password = input("Enter password: ")
db = mysql.connector.connect(user='root', password=password, 
                              host='localhost',
                              port='3306', 
                              database='curbside')

cursor = db.cursor()

# array with string names of the tables in the database so we can check if the table exists in the database
tables = ['customer', 'employee', 'inventory', 'orderdetails', 'orderitems', 'product', 'store']

# input table name from user to select from the database curbside so we cab grab the data from the table and build the order table for the app
table = str(input("Enter table name: "))
# select * from input table if it exists in the database curbside

# class to select the table from the database curbside
class SelectTable:
    def __init__(self, table):
        self.table = table
    def select(self):
        if self.table in tables:
            q = ("select * from {table}").format(table=self.table)
            cursor.execute(q)
            for row in cursor:
                print(row)
        else:
            print("Table not found")


SelectTable(table).select()
cursor.close()
db.close()
