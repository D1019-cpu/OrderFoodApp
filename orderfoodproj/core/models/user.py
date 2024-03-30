from django.db import db 

from django.contrib.auth.models import AbstractUser 
from django.db.models.signals import post_save 
from django.dispatch import receiver 


class CustomUser(AbstractUser):
    user_type_data = (
        (1, "customer"),
        (2, "provider"),
        (3, "staff"),
    )
    user_type = models.CharField(default=1, choices=user_type_data, max_length=15)


class Customer(models.Model):
    id = models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='id')
    admin = models.OneToOneField(CustomUser, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)


class Provider(models.Model):
    id = models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='id')
    admin = models.OneToOneField(Customer, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    # restaurant_id = None # liên kết đến bảng nhà hàng


class Staff(models.Model):
    '''Tài khoản nhân viên của nhà hàng'''
    id = models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='id')
    admin = models.OneToOneField(Customer, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    # liên kết đến bảng nhà hàng 




