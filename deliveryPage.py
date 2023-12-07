import flet as ft
from flet import Page, DataTable, Text, TextButton, View, DataRow, DataCell, IconButton, icons
import mysql.connector
import login
#from login import password


def deliveryPage(page: ft.Page):
    page.title = "Delivery"
    # This function needs the employeeID to be passed to either the orderID tuple, or the execute parameters. I couldn't test it because the login broke
    def deliver(p, x):
        orderID = [(x)]
        cnx = mysql.connector.connect(user='root', password='', host='localhost', database='curbside')
        cursor = cnx.cursor()
        query = "UPDATE orderDetails SET state = 'Delivered', delivererEmployeeID = %s WHERE OrderID = %s"
        cursor.execute(query, orderID)
    
    
    #Build DataTable to be displayed
    dataTable = ft.DataTable(
            columns=[
                ft.DataColumn(ft.Text("Order ID")),
                ft.DataColumn(ft.Text("Time Placed"), numeric=True),
                ft.DataColumn(ft.Text("Lane #")),
                ft.DataColumn(ft.Text("Phone #")),
                ft.DataColumn(ft.Text("Deliver")),

                ],
                rows=[]
        )
    
    #Method to load data into datatable
    def addNewData(p, orderID, timePlaced, laneNum, phoneNum):
        button = IconButton(icon=icons.DELIVERY_DINING_ROUNDED, on_click=lambda _: deliver(p, orderID))
        dataTable.rows.append(
            DataRow(
                cells=[
                    DataCell(Text(orderID)),
                    DataCell(Text(timePlaced)),
                    DataCell(Text(laneNum)),
                    DataCell(Text(phoneNum)),
                    DataCell(button)
                ]
            )       
        )
    
    #gets SQL data and loads it into datable using addNewData method
    cnx = mysql.connector.connect(user='root', password='', host='localhost', database='curbside')
    cursor = cnx.cursor()
    query = ("SELECT OrderID, timePlaced, laneNum, phone FROM OrderDetails, Customer Where OrderDetails.CustID = Customer.CustID and orderDetails.storeID = %s and orderDetails.state = 'Prepared' order by orderDetails.timePlaced asc")
    # query = ("SELECT * FROM orderDetails WHERE (storeID = (%s) and state = 'Incomplete') order by timePlaced asc")
    tuple = [(login.storeID)]
    cursor.execute(query, tuple)
    records = cursor.fetchall()
        
    for x in records:
        addNewData(page, str(x[0]), str(x[1]), str(x[2]), str(x[3]))
    
    
    #loads view
    page.views.append(
        View(
            route='/delivery',
            controls=[
                dataTable
            ]
            )  
     )
        
    cursor.close()
    cnx.close()
