from django.shortcuts import render, redirect 
from core.models.restaurant import Restaurant 
from core.models.dish import Dish 
from core.models.menu import Menu 


# GET: /restaurant/burger-king/: có thể thêm slug sau khi hoàn thiện tất cả  
def get_restaurant_view(request, slug):
    try:
        restaurant = Restaurant.objects.get(slug=slug)
    except Restaurant.DoesNotExist:
        messages.info(request, f"Nhà hàng không tồn tại")
        return redirect('index')
    
    dishes = Dish.objects.filter(restaurant=restaurant)
    menu_dict = {}
    for dish in dishes:
        # Nếu dish.menu là null sẽ trả về None, NoneType
        if dish.menu:
            if dish.menu.name not in menu_dict:
                menu_dict[dish.menu.name] = [dish]
            else:
                menu_dict[dish.menu.name].append(dish)
    print(menu_dict)


    # hiển thị ra sản phẩm chính và danh mục các món ăn của nhà hàng cho user
    return render(request, 'core/restaurant-detail.html', {
        'restaurant': restaurant,
        'items': dishes,
        'menu_dict': menu_dict
    }, status=200)


# GET: /restaurant-admin/ 
def get_restaurant_admin_view(request):
    return render(request, 'restaurant_admin/index.html', {})
    # if request.user.user_type == '1':
    #     pass 
    # Quản lý nhà hàng gồm thêm các menu, hoặc chọn từ menu đã có 
    # Thêm các món ăn
    # Tiếp nhận các đơn hàng từ khách hàng 
    # Thống kế doanh thu 
    # Xuất báo cáo thống kê 
    

# GET: /restaurant-admin/dish/
def get_dish_admin_view(request):
    return render(request, 'restaurant_admin/dish.html', {})


# GET: /restaurant-admin/order/
def get_order_admin_view(request):
    return render(request, 'restaurant_admin/order.html', {})


# GET: /restaurant-admin/review/
def get_review_admin_view(request):
    return render(request, 'restaurant_admin/review.html', {})


# GET: /restaurant-admin/report/
def get_report_admin_view(request):
    return render(request, 'restaurant_admin/report.html', {})


# GET: /restaurant-admin/revenues/
def get_revenues_admin_view(request):
    return render(request, 'restaurant_admin/revenues.html', {})



