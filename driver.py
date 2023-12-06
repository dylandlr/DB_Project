import flet as ft
from flet import View, Page, RouteChangeEvent, ViewPopEvent, Text, ElevatedButton
from flet import TextField
from mainMenu import mainMenuView
from selectOrderAssemble import selectOrderAssembleView
from PickOrder import pickOrderView
import login


def main(page: ft.Page):
    page.title = 'Curbside'
    def route_change(e: RouteChangeEvent):
        
        if page.route == '/':
            login.main(page)

#This is the Routing For the Main Function
        if page.route == '/main':
            mainMenuView(page)    

        if page.route == '/selectOrder':
            selectOrderAssembleView(page)            
                   
#This is the page for assembling the items for the order
        if page.route == '/pickItems':
            pickOrderView(page)
            
    def view_pop(e: ViewPopEvent)-> None:
        page.views.pop()
        top_view: View = page.views[-1]
        page.go(top_view.route)        
    
    
    page.on_route_change = route_change
    page.on_view_pop = view_pop
    page.go(page.route)
    
    
ft.app(target=main) 

