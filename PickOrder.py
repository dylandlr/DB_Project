import flet as ft
from flet import View, RouteChangeEvent, Text, ElevatedButton, Page, IconButton, icons, AppBar
from flet import DataRow, DataCell, DataTable
import mysql.connector
import login
import selectOrderAssemble



def pickOrderView(page: ft.Page):
    
    numberOfRows = 0
    
    
    dataTable = ft.DataTable(
        
        columns=[
                ft.DataColumn(ft.Text("UPC")),
                ft.DataColumn(ft.Text("Item Description")),
                ft.DataColumn(ft.Text("Quantity Requested")),
                ft.DataColumn(ft.Text()),
                ft.DataColumn(ft.Text("Quantity Supplied"), numeric=True),
                ft.DataColumn(ft.Text()),
            
            ],
        rows=[]
    ) 
    
    def arrowRight(p, text):
        
        text.value = text.value + 1
        page.update()
    
    def arrowLeft(p, text):
        if text.value > 0:
            text.value = text.value - 1
            page.update()

    def updateDataBase(quantitySupplied, upc):
        cnx = mysql.connector.connect(user='root', password="", host='localhost', database='curbside')
        cursor = cnx.cursor()

        input_data = (quantitySupplied, str(selectOrderAssemble.orderID), upc)

        query = """UPDATE orderItems set quantityOrdered = (%s) where (orderID = (%s) and upc = (%s))"""
        cursor.execute(query, input_data)
        cnx.commit()
        cursor.close()
        cnx.close()
        page.go("/main")
    
    def addNewData(p, desc, requestedQuantity, upc):  
        text = Text(value=0)
        
        dataTable.rows.append(
            
            DataRow(
                cells=[
                    ft.DataCell(Text(upc)),
                    ft.DataCell(Text(desc)),
                    ft.DataCell(Text(requestedQuantity)),
                    ft.DataCell(IconButton(icon=icons.KEYBOARD_ARROW_LEFT_ROUNDED, on_click=lambda _: arrowLeft(p, text))), 
                    ft.DataCell(text), 
                    ft.DataCell(IconButton(icon=icons.KEYBOARD_ARROW_RIGHT_ROUNDED, on_click=lambda _: arrowRight(p, text)))
                ]
            )
        )
        
        
    def test():
        print(str(dataTable.rows[x].cells[0].content.value))  
        
    def testing():
        print("in test" + str(numberOfRows))
        for x in range(numberOfRows):
            print(str(dataTable.rows[x].cells[0].content.value))
            quantitySupplied = str(dataTable.rows[x].cells[4].content.value)
            upc = str(dataTable.rows[x].cells[0].content.value)
            updateDataBase(quantitySupplied, upc)
            
        
        

    #Actual Contents of the pickOrder Function
    cnx = mysql.connector.connect(user='root', password="Nuzzle04!", host='localhost', database='curbside')
    cursor = cnx.cursor()
    query = ("SELECT * FROM orderItems WHERE orderID = (%s)")
    tuple = [str(selectOrderAssemble.orderID)]
    cursor.execute(query, tuple)
    records = cursor.fetchall()
    
    for x in records:
        query2 = ("SELECT * From product where upc = (%s)")
        tuple2 = [str(x[2])]
        cursor.execute(query2, tuple2)
        records2 = cursor.fetchall()
        for y in records2:
            print("World")
            print(str(x[3]) + str(y[1]) + "Hello World")
            addNewData(page, str(y[1]), str(x[3]), str(x[2]))
            numberOfRows = numberOfRows + 1
                   
            
    page.views.append(
        View(
            route='/pickItems',
            controls=[
              dataTable,
              ElevatedButton(text="Submit",  on_click=lambda _:test()),
              AppBar(title=Text('Update Order'), bgcolor= 'BLUE'),
              ElevatedButton(text='Cancel', on_click=lambda _: page.go('/main'))
            ] 
        )  
    )
    cursor.close()
    cnx.close()
