from django.db import db 

from django.contrib.auth.models import AbstractUser 
from django.db.models.signals import post_save 
from django.dispatch import receiver 

from .city import City


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
    address = models.TextField()
    phone_number = models.CharField(max_length=20)
    city = models.ForeignKey(City, on_delete=models.CASCADE, null=True, blank=True)
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


@receiver(post_save, sender=CustomUser)
def create_user_profile(sender, instance, created, **kwargs):
    '''
    sender: class gọi đến hàm này
    instance: là dữ liệu đang chèn vào model
    created: là True/False, True khi data được chèn vào
    '''
    if created:
        if instance.user_type == 1:
            Customer.objects.create(admin=instance)
        if instance.user_type == 2:
            Provider.objects.create(admin=instance)
        if instance.user_type == 3:
            Staff.objects.create(admin=instance)


@receiver(post_save, sender=CustomUser)
def save_user_profile(sender, instance, **kwargs):
    '''Phương thức này sẽ được gọi sau khi create_user_profile được thực thi'''
    if instance.user_type == 1:
        instance.customer.save()
    if instance.user_type == 2:
        instance.provider.save()
    if instance.user_type == 3:
        instance.staff.save()
