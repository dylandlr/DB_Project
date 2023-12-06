import flet as ft 
from flet import TextField, Checkbox, ElevatedButton, Text, Row, Column
from flet_core.control_event import ControlEvent
import mysql.connector

def main(page:ft.Page)->None:
    page.title = 'Login'
    page.vertical_alignment = ft.MainAxisAlignment.CENTER
    page.horizontal_alignment = ft.MainAxisAlignment.CENTER
    page.theme_mode = ft.ThemeMode.DARK
    page.window_width = 800
    page.window_height = 800
    page.window_resizable = True
    
    text_username: TextField = TextField(label='Employee ID', text_align=ft.TextAlign.LEFT, width = 200)
    text_password: TextField = TextField(label='Password', text_align=ft.TextAlign.LEFT, width = 200, password=True)
    checkbox_signup: Checkbox = Checkbox(label='I agree', value=False)
    button_submit: ElevatedButton = ElevatedButton(text='Sign in', width = 200, disabled= True)
    
    def validate(e: ControlEvent) -> None:
        if all([text_username.value, text_password.value]):
            button_submit.disabled = False
        else:
            button_submit.disabled = True
        
        page.update()
    
    def submit(e:ControlEvent)-> None:
        cnx = mysql.connector.connect(user='root', password="", host='localhost', database='curbside')
        cursor = cnx.cursor()
        query = ("Select employeeId, storeID from Employee")
        cursor.execute(query)    
        records = cursor.fetchall()    
        for row in records:
            if(str(text_username.value) == str(row[0])):
                global employeeID
                employeeID = str(row[0])
                global storeID
                storeID = str(row[1])
                page.go('/main')
        
        
    checkbox_signup.on_change = validate
    text_username.on_change = validate
    text_password.on_change = validate
    button_submit.on_click = submit
    
    page.add(
        Row(
            controls=[
                Column(
                [text_username,
                 text_password,
                 #checkbox_signup,
                 button_submit]
                )

            ],
            alignment=ft.MainAxisAlignment.CENTER
        )
    )
    
if __name__ == '__main__':
    ft.app(target=main)