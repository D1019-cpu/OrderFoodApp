from django.db import models 
from .restaurant import Restaurant 


STATUS = (
    ("draft", "Draft"),
    ("disabled", "Disabled"),
    ("rejected", "Rejected"),
    ("in_review", "In Review"),
    ("published", "Published"),
)


class Dish(models.Model):
    '''Món ăn'''
    id = models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='id')
    name = models.CharField(max_length=255)
    image = models.ImageField(upload_to='items/')
    price = models.IntegerField(default=0)
    old_price = models.IntegerField(default=0)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE, null=True, blank=True)

    product_status = models.CharField(choices=STATUS, max_length=10, default='published')
    type = models.CharField(max_length=255, null=True, blank=True)
    description = models.TextField(null=True, blank=True)
    featured = models.BooleanField(default=False)
    distance = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    
    creted_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(null=True, blank=True)

    @staticmethod
    def get_all_dishes():
        return Dish.objects.all()

    class Meta:
        verbose_name = "Dish"
        verbose_name_plural = "Dish"

    def __str__(self):
        return f"ID: {self.id} - Name: {self.name} - Restaurant: {self.restaurant.name}"
