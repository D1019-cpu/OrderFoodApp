# Generated by Django 4.2.9 on 2024-04-19 09:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0018_remove_orderdish_delivery_address_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='orderdish',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
    ]
