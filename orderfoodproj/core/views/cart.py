from django.shortcuts import render, redirect 
from django.http import HttpResponse, JsonResponse 
from django.contrib.auth.decorators import login_required
from django.contrib import messages 
import json 

from core.models.dish import Dish 


# POST: /add-to-cart/ 
def add_to_cart_api(request):
    if request.method == 'POST': 
        data = json.loads(request.body)
        dish_id = data['dish_id']
        name = data['name']
        quantity = data['quantity']
        note = data['note']
        price = data['price']
        total_price = data['total_price']
        image_url = data['image_url']
        # print(data)
        print(dish_id)
        print(type(dish_id))
        
        cart = request.session.get('cart', {})
    
        if dish_id in cart:
            cart[dish_id]['quantity'] = quantity
            cart[dish_id]['total_price'] = total_price
            cart[dish_id]['note'] = note
        else:
            cart[dish_id] = {'name': name,'note': note, 'quantity': quantity, 'price': price, 'total_price': total_price, 'image_url': image_url}
        request.session['cart'] = cart 
        total_dishes = len(cart)
        return JsonResponse({   
            'success': True,
            'status': 200,
            'message': 'Thêm sản phẩm vào giỏ hàng thành công!',
            'total_dishes': total_dishes
        }, status=200)
    else:
        return JsonResponse({
            'success': False, 
            'status': 405,
            'message': 'Method not allowed',
            'total_dishes': 0
        }, status=405)


def clear_cart_api(request):
    request.session['cart'] = {}
    return redirect('index')

def view_cart_api(request):
    cart = request.session.get('cart', {})
    print(cart)
    return redirect('index')


@login_required(login_url='/login/')
def remove_from_cart_api(request, dish_id):
    cart = request.session.get('cart', {})
    if dish_id in cart:
        if cart[dish_id]['quantity'] > 1:
            cart[dish_id]['quantity'] -= 1
        else:
            del cart[dish_id]
    request.session['cart'] = cart
    return JsonResponse()


@login_required(login_url='/login/')
def cart_remove_dish_api(request, dish_id):
    cart = request.session.get('cart', {})
    if dish_id in cart:
        del cart[dish_id]
    request.session['cart'] = cart 
    return redirect('cart-detail-view')


@login_required(login_url='/login/')
def cart_detail_view(request):
    cart = request.session.get('cart', {})
    total_price = 0
    for key, item in cart.items():
        total_price += int(item['total_price'])
    return render(request, 'core/cart.html', {
        'total_price': total_price
    }, status=200)

