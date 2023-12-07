import flet as ft
from flet import View, RouteChangeEvent, Text, ElevatedButton, Page

def mainMenuView(page: ft.Page):
    page.views.append(
        View(
            route='/main',
            controls=[
                ElevatedButton(text='Assemble Order', on_click=lambda _: page.go('/selectOrder')),
                ElevatedButton(text='Deliver Order', on_click=lambda _: page.go('/')),
                ElevatedButton(text='View Complete Orders', on_click=lambda _: page.go('/')),                    
                ElevatedButton(text='View Incomplete Orders', on_click=lambda _: page.go('/')),
                ElevatedButton(text='Logout', on_click=lambda _: page.go('/'))
            ]
        )  
    )