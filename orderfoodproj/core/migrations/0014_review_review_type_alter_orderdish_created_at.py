# Generated by Django 4.2.9 on 2024-04-15 13:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0013_alter_toping_dish'),
    ]

    operations = [
        migrations.AddField(
            model_name='review',
            name='review_type',
            field=models.CharField(choices=[('Nhà hàng', 'Nhà hàng'), ('Món ăn', 'Món ăn')], default='Món ăn', max_length=20),
        ),
        migrations.AlterField(
            model_name='orderdish',
            name='created_at',
            field=models.DateTimeField(blank=True, null=True),
        ),
    ]
