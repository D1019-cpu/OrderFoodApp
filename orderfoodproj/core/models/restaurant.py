from django.db import models 


class Restaurant(models.Model):
    id = None 
    name = None 
    address_id = None # liên kết đến bảng address 
    type_of_food # loại đồ ăn kinh doanh chủ yếu: hải sản, đồ nướng, bún, phở, ...
    created_at = None 
