from django.urls import path 
from .views.index import * 
from .views.login import * 
from .views.register import *
from .views.menu import * 
from .views.restaurant import * 
from .views.review import * 
from .views.cart import * 
from .views.dish import *
from .views.profile import * 

# For User
urlpatterns = [
    # GET
    path('', index, name='index'),
    path('login/',get_login_view, name='get-login-view'),
    path('logout/', get_logout_view, name='logout-view'),
    path('register/', get_register_view, name='register-view'),
    path('register-provider/', get_register_provider_view, name='register-provider-view'),
    path('menu/<slug:slug>/', get_menu_detail_view, name='menu-detail-view'),
    path('restaurant/<slug:slug>/', get_restaurant_view, name='restaurant-detail-view'),
    path('cart/detail/', cart_detail_view, name='cart-detail-view'),
    path('profile/', get_profile_view, name='get-profile-view'),

    # POST
    path('do-login/', post_login_view, name='post-login-view'),
    path('do-register/', post_register_view, name='post-register-view'),
    path('do-register-provider/', post_register_provider_view, name='post-register-provider-view'),
]

# For Restaurant Admin
urlpatterns += [
    # GET
    path('restaurant-admin/', get_restaurant_admin_view, name='restaurant-admin-view'),
    path('restaurant-admin/dish/', get_dish_admin_view, name='dish-admin-view'),
    path('restaurant-admin/order/', get_order_admin_view, name='order-admin-view'),
    path('restaurant-admin/review/', get_review_admin_view, name='review-admin-view'),
    path('restaurant-admin/report/', get_report_admin_view, name='report-admin-view'),
    path('restaurant-admin/revenues/', get_revenues_admin_view, name='revenues-admin-view'),
    

]

urlpatterns += [
    # API
    # GET
    path('dishes/<pk>/', get_dish_data_api, name='get-dish-data-api'),
]
