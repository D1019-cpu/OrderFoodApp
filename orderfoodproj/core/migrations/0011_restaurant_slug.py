# Generated by Django 4.2.9 on 2024-04-14 03:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0010_toping'),
    ]

    operations = [
        migrations.AddField(
            model_name='restaurant',
            name='slug',
            field=models.SlugField(blank=True, null=True),
        ),
    ]
