# Generated by Django 4.2.9 on 2024-04-15 08:28

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0012_alter_orderdish_status'),
    ]

    operations = [
        migrations.AlterField(
            model_name='toping',
            name='dish',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='core.dish'),
        ),
    ]