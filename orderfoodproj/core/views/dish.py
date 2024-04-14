from django.shortcuts import render, redirect 
from django.contrib.auth.decorators import login_required 
from django.http import JsonResponse

from core.models.dish import Dish
from core.models.toping import Toping 


# GET: /dishes/5/
def get_dish_data_api(request, pk):
    try:
        dish = Dish.objects.get(pk=pk)
    except Dish.DoesNotExist:
        return JsonResponse({
            'message': 'Món ăn không tồn tại',
            'success': False,
            'bundle': {},
            'status': 404
        }, status=404)
    topings = Toping.objects.filter(dish=dish)
    data = []
    for t in topings:
        obj = {
            'name': obj.name,
            'price': obj.price
        }
        data.append(obj)
    return JsonResponse({
        'message': 'Lấy dữ liệu món ăn thành công!',
        'success': True,
        'bundle': {
            'dish': {
                'name': dish.name,
                'price': dish.price,
                'url': dish.image.url
            },
            'topings': data
        },
        'status': 200
    }, status=200)


# GET: /dishes/
@login_required(login_url='/login/')
def get_dish_view(request):
    pass 
    # bảng danh sách các món ăn của nhà hàng 


# POST: /add-dish/
@login_required(login_url='/login/')
def add_new_dish_view(request):
    pass 


@login_required(login_url='/login/')
def edit_dish_view(request):
    pass 


@login_required(login_url='/login/')
def delete_dish_view(request):
    # xử lý user_type (user_type 2)
    # xử lý món ăn thuộc về nhà hàng mới được delete 
    pass 
