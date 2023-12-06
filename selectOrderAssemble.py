import flet as ft
from flet import Page, DataTable, Text, TextButton, View, DataRow, DataCell, IconButton, icons
import mysql.connector
import login
#from login import password


def selectOrderAssembleView(page: ft.Page):
    
    def goToPick(p, x):
        global orderID
        orderID = x
        page.go('/pickItems')
    
    
    #Build DataTable to be displayed
    dataTable = ft.DataTable(
            columns=[
                ft.DataColumn(ft.Text("Order ID")),
                ft.DataColumn(ft.Text("Stage")),
                ft.DataColumn(ft.Text("Submission Time"), numeric=True),
                ft.DataColumn(ft.Text("Edit"))
                ],
                rows=[]
        )
    
    #Method to load data into datatable
    def addNewData(p, orderID, stage, submissionTime):
        button = IconButton(icon=icons.EDIT_ROUNDED, on_click=lambda _: goToPick(p, orderID))
        dataTable.rows.append(
            DataRow(
                cells=[
                    DataCell(Text(orderID)),
                    DataCell(Text(stage)),
                    DataCell(Text(submissionTime)),
                    DataCell(button)
                ]
            )       
        )
    
    #gets SQL data and loads it into datable using addNewData method
    cnx = mysql.connector.connect(user='root', password="", host='localhost', database='curbside')
    cursor = cnx.cursor()
    query = ("SELECT * FROM orderDetails WHERE (storeID = (%s) and state = 'Incomplete') order by timePlaced asc")
    tuple = [(login.storeID)]
    cursor.execute(query, tuple)
    records = cursor.fetchall()
        
    for x in records:
        addNewData(page, str(x[0]), str(x[7]), str(x[2]))
    
    
    #loads view
    page.views.append(
        View(
            route='/selectOrder',
            controls=[
                dataTable
            ]
            )  
     )
    
    
    
    
    
    cursor.close()
    cnx.close()