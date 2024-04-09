from django.urls import path 
from .views.index import * 
from .views.login import * 
from .views.register import *

urlpatterns = [
    # GET
    path('', index, name='index'),
    path('login/',get_login_view, name='get-login-view'),
    path('logout/', get_logout_view, name='logout-view'),

    # POST
    path('do-login/', post_login_view, name='post-login-view'),
]
