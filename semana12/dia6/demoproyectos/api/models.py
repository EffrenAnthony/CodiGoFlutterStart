from django.contrib.auth.models import AbstractUser, User
from django.db import models


# Create your models here.
class Cliente(AbstractUser):
    # si dejamos en blank true los campos no son obligatorios
    altura = models.FloatField(blank=True, null=True)
    peso = models.FloatField(blank=True, null=True)
    fnaciamiento = models.DateTimeField(blank=True, null=True)
    actividadfisica = models.IntegerField(blank=True, null=True)
