# Generated by Django 3.1.1 on 2020-09-24 00:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('API', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='categoria',
            name='urlBanner',
            field=models.TextField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='categoria',
            name='urlLogo',
            field=models.TextField(blank=True, null=True),
        ),
    ]
