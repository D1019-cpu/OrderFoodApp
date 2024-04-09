from django.db import models 


class Menu(models.Model):
    id = models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='id')
    name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = "Menu"
        verbose_name_plural = "Menu"

    @staticmethod 
    def get_all_menu():
        return Menu.objects.all()

    def __str__(self):
        return f"ID: {self.id} - Name: {self.name}"
