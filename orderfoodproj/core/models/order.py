from django.db import models 
from .user import Customer
from .restaurant import Restaurant
from .dish import Dish


ORDER_STATUS = (
    (1, 'Đang chờ xử lý'),
    (2, 'Đã tiếp nhận'),
    (3, 'Đang giao'),
    (4, 'Hoàn thành'),
    (5, 'Đã hủy')
)


class Order(models.Model):
    id = models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='id')
    customer = models.ForeignKey(Customer, on_delete=models.DO_NOTHING, null=True, blank=True)
    total_price = models.IntegerField(default=0)

    @staticmethod 
    def get_order_by_user(user):
        return Order.objects.filter(customer=user)

    class Meta:
        verbose_name = "Order"
        verbose_name_plural = "Order"

    def __str__(self):
        return f"ID: {self.id} - ITEM: {self.menu_item.name} - QTY: {self.quantity} TOTAL PRICE: {self.price}"


class OrderDish(models.Model):
    id = models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='id')
    restaurant = models.ForeignKey(Restaurant, on_delete=models.DO_NOTHING, null=True, blank=True)
    status = models.CharField(default=1, choices=ORDER_STATUS, max_length=31)
    
    order = models.ForeignKey(Order, on_delete=models.DO_NOTHING, null=True, blank=True)
    
    delivery_address = models.TextField()
    phone_number = models.CharField(max_length=20) # tham khảo các app đặt đồ nó lấy luôn số điện thoại của người dùng hay cho nhập
    
    dish = models.ForeignKey(Dish, on_delete=models.DO_NOTHING, null=True, blank=True)
    price = models.IntegerField(default=0)
    quantity = models.IntegerField(default=1)
    note = models.TextField(null=True, blank=True)

    created_at = models.DateTimeField(auto_now_add=True)

    @staticmethod
    def get_order_dish_by_order(order):
        return OrderDish.objects.filter(order=order)

    class Meta:
        verbose_name = "OrderDish"
        verbose_name_plural = "OrderDish"

    def __str__(self):
        return f"{self.id} - FROM {self.restaurant.name} TO {self.customer.username} STATUS {self.status} AT {self.created_at}"

