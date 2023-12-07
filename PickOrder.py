import flet as ft
from flet import View, RouteChangeEvent, Text, ElevatedButton, Page, IconButton, icons, Appbar
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


        input_data = (str(quantitySupplied), str(selectOrderAssemble.orderID), str(upc))

        query = """UPDATE orderItems set quantitySupplied = (%s) where (orderID = (%s) and upc = (%s))"""
        cursor.execute(query, input_data)
        #cnx.commit()
  
        #Update order status
        
        query2 = "update orderDetails set prepperEmployeeID = (%s), timeAssembled = CURRENT_TIMESTAMp, state = 'Assembled' where (orderId = (%s))"
        input_data2 = ([str(login.employeeID), str(selectOrderAssemble.orderID)])
        cursor.execute(query2, input_data2)
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
        #print("in test" + str(numberOfRows))
        for x in range(numberOfRows):
            #print(str(dataTable.rows[x].cells[4].content.value))
            quantitySupplied = str(dataTable.rows[x].cells[4].content.value)
            upc = str(dataTable.rows[x].cells[0].content.value)
            updateDataBase(quantitySupplied, upc)
            
        
        

    #Actual Contents of the pickOrder Function
    cnx = mysql.connector.connect(user='root', password="", host='localhost', database='curbside')
    cursor = cnx.cursor()
    query = ("SELECT * FROM orderItems WHERE orderID = (%s)")
    tuple = [str(selectOrderAssemble.orderID)]
    cursor.execute(query, tuple)
    records = cursor.fetchall()
    
    for x in records:
        query2 = ("SELECT * From product where upc = (%s)")
        tuple2 = [str(x[3])]
        cursor.execute(query2, tuple2)
        records2 = cursor.fetchall()
        for y in records2:
            print("World")
            print(str(x[3]) + str(y[1]) + "Hello World")
            addNewData(page, str(y[1]), str(x[2]), str(x[3]))
            numberOfRows = numberOfRows + 1
                   
            
 page.views.append(
        View(
            route='/pickItems',
            controls=[
              dataTable,
              ElevatedButton(text="Submit",  onclick=lambda :test()),
              AppBar(title=Text('Update Order'), bgcolor= 'BLUE'),
              ElevatedButton(text='Cancel', onclick=lambda : page.go('/main'))
            ] 
        )
    
    cursor.close()
    cnx.close()
