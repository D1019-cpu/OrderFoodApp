from django.shortcuts import render, redirect 


# GET: /restaurant/5/: có thể thêm slug sau khi hoàn thiện tất cả  
def get_restaurant_view(request, pk):
    # hiển thị ra sản phẩm chính và danh mục các món ăn của nhà hàng cho user
    pass 


# GET: /manage-restaurant/ 
def get_manage_restaurant_view(request):
    if request.user.user_type == '1':
        pass 
    # Quản lý nhà hàng gồm thêm các menu, hoặc chọn từ menu đã có 
    # Thêm các món ăn
    # Tiếp nhận các đơn hàng từ khách hàng 
    # Thống kế doanh thu 
    # Xuất báo cáo thống kê
