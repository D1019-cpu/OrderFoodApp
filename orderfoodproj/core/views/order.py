from django.shortcuts import render, redirect 
from  django.contrib.auth.decorators import login_required 
from django.contrib import messages 
from django.http import HttpResponse, JsonResponse

from core.models.order import OrderDish, Order
from core.models.user import Customer 
from core.models.dish import Dish


@login_required(login_url='/login/')
def order_detail_view(request):
    # Danh sách order
    customer = Customer.objects.get(admin=request.user)
    order = Order.objects.filter(customer=customer)
    orders = OrderDish.objects.filter(order__in=order).order_by('created_at')
    return render(request, 'core/order.html', {
        'orders': orders
    }, status=200)


@login_required(login_url='/login/')
def checkout_view(request):
    if request.user.user_type == '1':
        if request.method == 'POST':
            try:
                customer = Customer.objects.get(admin=request.user)
            except Customer.DoesNotExist:
                messages.info(request, "Không tìm thấy user!")
                print("Không tìm thấy user!")
                return redirect('cart-detail-view')
            delivery_address = request.POST.get('delivery-address')
            phone_number = request.POST.get('phone-number')
            if delivery_address != '' and phone_number != '':
                order = Order(
                    customer=customer,
                    delivery_address=delivery_address,
                    phone_number=phone_number
                )
                order.save()
                total_price = 0 
                for key, item in request.session['cart'].items():
                    dish = Dish.objects.get(pk=int(key))
                    orderDish = OrderDish(
                        dish=dish,
                        price=item['total_price'],
                        quantity=item['quantity'],
                        note=item['note'],
                        restaurant=dish.restaurant
                    )
                    orderDish.order = order
                    orderDish.save()
                    total_price += int(item['total_price'])
                order.total_price = total_price
                order.save()
                request.session['cart'] = {}
                messages.info(request, "Đặt hàng thành công!")
                return redirect('order-detail-view')
            

        else:
            return redirect('cart-detail-view')
    else:
        return render(request, 'handle_error/403.html', {})


@login_required(login_url='/login/')
def cancel_order_view(request, pk):
    try:
        order_dish = OrderDish.objects.get(pk=pk) 
    except OrderDish.DoesNotExist:
        messages.info(request, "Đơn đặt món không tồn tại!")
        return redirect('order-detail-view')
    if order_dish.status == 'Đang chờ xử lý':
        order_dish.status = 'Đã hủy'
        order_dish.save()
        messages.info(request, "Hủy đơn đặt món thành công!")
    else:
        messages.info(request, "Hủy đơn đặt món không thành công!")
    return redirect('order-detail-view') 
    


# POST: /restaurant-admin/update-order/<pk>
@login_required(login_url='/login/')
def post_update_order_admin_view(request, pk):
    if request.user.user_type == '2':
        if request.user.provider.restaurant.is_active:
            if request.method == 'POST':
                try:
                    order_dish = OrderDish.objects.get(pk=pk)
                except OrderDish.DoesNotExist:
                    messages.info(request, "Đơn đặt món không tồn tại!")
                    return redirect('order-admin-view')
                order_dish.status = request.POST.get('order-status')
                order_dish.save()
                messages.info(request, "Cập nhật tình trạng đơn thành công!!")
                return redirect('order-admin-view')

            else:
                return redirect('order-admin-view')
        else:
            return HttpResponse("<h1>Sau khi được duyệt nhà hàng có thể truy cập vào trang quản lý</h1><h3>Quá trình chờ duyệt trong 24h</h3>")
    else:
        return render(request, 'handle_error/403.html') 

    
# GET: /restaurant-admin/order/5/
def get_detail_order_admin_api(request, pk):
    if request.user.user_type == '2':
        if request.user.provider.restaurant.is_active:
            try:
                order_dish = OrderDish.objects.get(pk=pk)
            except OrderDish.DoesNotExist:
                return JsonResponse({
                    'success': False,
                    'message': 'Không tìm thấy đơn đặt hàng!',
                    'bundle': {},
                    'status': 404,
                }, status=404)

            return JsonResponse({
                'success': True, 
                'message': "Lấy dữ liệu thành công!!",
                'bundle': {
                    "user_order": order_dish.order.customer.admin.username,
                    'address': order_dish.order.delivery_address,
                    'phone': order_dish.order.phone_number,
                    'dish': order_dish.dish.name,
                    'image_url': order_dish.dish.image.url,
                    'dish_description': order_dish.dish.description,
                    'price': order_dish.price,
                    'quantity': order_dish.quantity, 
                    'note': order_dish.note,
                    'time': order_dish.created_at,
                }, 
                'status': 200
            }, status=200)

        else:
            return JsonResponse({
                'success': False,
                'message': 'Vui lòng chờ duyệt trong 24h',
                'bundle': {},
                'status': 403,
            }, status=403)
    else:
        return JsonResponse({
            'success': False,
            'message': 'Permission Error',
            'bundle': {},
            'status': 403
        }, status=403)
