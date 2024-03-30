from django.db import models 
from .city import City


class Restaurant(models.Model):
    id = models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='id')
    name = models.CharField(max_length=255) 
    address = models.TextField()
    phone_number = models.CharField(max_length=20)
    city = models.ForeignKey(City, on_delete=models.DO_NOTHING, null=True, blank=True)
    # type_of_food # loại đồ ăn kinh doanh chủ yếu: hải sản, đồ nướng, bún, phở, ...
    image = models.ImageField(upload_to='uploads/brand/')
    created_at = models.DateTimeField(auto_now_add=True) 

    class Meta:
        verbose_name = 'Restaurant'
        verbose_name_plural = 'Restaurant'

    def __str__(self):
        return f"ID: {self.id} - Name: {self.name} - City:{self.city.name}"    
