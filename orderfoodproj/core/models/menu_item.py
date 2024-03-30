from django.db import models 
from .restaurant import Restaurant 


class MenuItem(models.Model):
    id = models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='id')
    name = models.CharField(max_length=255)
    image = models.ImageField(upload_to='uploads/items/')
    price = models.IntegerField(default=0)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE, null=True, blank=True)

    class Meta:
        verbose_name = "MenuItem"
        verbose_name_plural = "MenuItem"

    def __str__(self):
        return f"ID: {self.id} - Name: {self.name} - Restaurant: {self.restaurant.name}"
