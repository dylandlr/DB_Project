# app-template.py
# is a template for the app.py file that will be used to build the app

import flet as ft

# our app will have 4 pages: Main_Page, RetrievalPage, LoadPage, and DeliverPage

# Main_Page will be the home page of the app
# RetrievalPage will be the page where employees will retrieve the items from the inventory
# LoadPage will be the page where employees will load the items into the customer's cart
# DeliverPage will be the page where employees will deliver the items to the customer's car

def Main_Page(page: ft.Page):
    # Define UI elements for MainPage
    page.title = "CQC Main Menu"
    return page

def RetrievalPage(page: ft.Page):
    # Define UI elements for RetrievalPage
    page.title = "Retrieval Page"
    #retrieve(order)
    return page

def LoadPage(page: ft.Page):
    # Define UI elements for LoadPage
    page.title = "Load Page"
    #load(order)
    return page

def DeliverPage(page: ft.Page):
    # Define UI elements for DeliverPage
    #deliver(order)
    page.title = "Deliver Page"
    return page

#def order_queue():
    ##return order_queue

#def retrieve(order):
    #sql logic to retrieve the orders from the database
    #return order

#def load(order):
    # next step in the app confirms that the order has been loaded and ready to be delivered
    
#def deliver(order):
    # next step in the app confirms that the order has been delivered to the customer's car and the order is complete
    
    
    
# main function uses routing to switch between the pages of the app aswell as
# the UI elements for each page
# the methods for route chaning and view pop are used to switch between the pages
# page title is used to set the title of the page

def main(page: ft.Page):
    page.title = "Curbside Query App"
    #page.bgcolor = ft.colors.DARK_BLUE
    def route_change(route):
        page.views.clear()
        page.views.append(
            ft.View(
                "/",
                [
                    ft.AppBar(title=ft.Text("Main Page")),
                    ft.ElevatedButton("to retrieval", on_click=lambda _: page.go("/retrieval")),
                    ft.ElevatedButton("to load", on_click=lambda _: page.go("/load")),
                    ft.ElevatedButton("to deliver", on_click=lambda _: page.go("/deliver")),
                ],
            )
        )
        if page.route == "/retrieval":
            page.views.append(
                ft.View(
                    "/retrieve",
                    [
                        ft.AppBar(title=ft.Text("Retrieval Page"), bgcolor=ft.colors.SURFACE_VARIANT),
                        ft.ElevatedButton("Back Home", on_click=lambda _: page.go("/")),
                    ],
                )
            )
        if page.route == "/load":
            page.views.append(
                ft.View(
                    "/load",
                    [
                        ft.AppBar(title=ft.Text("Loading Page"), bgcolor=ft.colors.SURFACE_VARIANT),
                        ft.ElevatedButton("Back Home", on_click=lambda _: page.go("/")),
                    ],
                )
            )
        if page.route == "/deliver":
            page.views.append(
                ft.View(
                    "/deliver",
                    [
                        ft.AppBar(title=ft.Text("Delivery Page"), bgcolor=ft.colors.SURFACE_VARIANT),
                        ft.ElevatedButton("Back Home", on_click=lambda _: page.go("/")),
                    ],
                )
            )
        page.update()
        
    def view_pop(view):
        page.views.pop()
        top_view = page.views[-1]
        page.go(top_view.route)
        
    #btn_retrieval = ft.ElevatedButton("Go to RetrievalPage", on_click=go_retrieve)
    #btn_load = ft.ElevatedButton("Go to LoadPage", on_click=go_load)
    #btn_deliver = ft.ElevatedButton("Go to DeliverPage", on_click=go_deliver)

    page.on_route_change = route_change
    page.on_view_pop = view_pop
    #page.add(btn_retrieval, btn_load, btn_deliver)
    page.go(page.route)
    

ft.app(target=main, view=ft.AppView.WEB_BROWSER)

