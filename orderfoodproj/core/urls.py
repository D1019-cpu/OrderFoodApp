from django.urls import path 
from .views.index import * 
from .views.login import * 
from .views.register import *
from .views.menu import * 
from .views.restaurant import * 
from .views.review import * 
from .views.cart import * 
from .views.dish import *

urlpatterns = [
    # GET
    path('', index, name='index'),
    path('login/',get_login_view, name='get-login-view'),
    path('logout/', get_logout_view, name='logout-view'),
    path('register/', get_register_view, name='register-view'),
    path('register-provider/', get_register_provider_view, name='register-provider-view'),
    path('menu/<slug:slug>/', get_menu_detail_view, name='menu-detail-view'),

    # POST
    path('do-login/', post_login_view, name='post-login-view'),
    path('do-register/', post_register_view, name='post-register-view'),
    path('do-register-provider/', post_register_provider_view, name='post-register-provider-view'),
]
