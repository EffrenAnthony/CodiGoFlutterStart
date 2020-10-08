from django.db import models
from django.contrib.auth.models import AbstractUser

# Create your models here.
class Categoria(models.Model):
    nombre = models.CharField(max_length=200)
    # null true y blanck true permite que los campos puedan estar vacios y no noso bote errores
    urlBanner = models.TextField(null=True, blank=True)
    urlLogo = models.TextField(null=True, blank=True)

    def __str__(self):
        return self.nombre
    
class SubCategoria(models.Model):
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE, related_name='subcategorias')
    nombre = models.CharField(max_length=200)
    urlBanner = models.TextField(null=True, blank=True)
    urlLogo = models.TextField(null=True, blank=True)
    def __str__(self):
        return self.nombre

class BannerPublicitario(models.Model):
    urlBanner = models.TextField(null=True, blank=True)

class Cliente(AbstractUser):
    dni = models.CharField(max_length=10)

class Solicitud(models.Model):
    subcategoria = models.ForeignKey(SubCategoria, on_delete=models.CASCADE, related_name="solicitudes")
    descripcion = models.TextField(null=True, blank=True)
    precio = models.FloatField(null=True, blank=True)
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE, blank=True, null=True)

class RespuestaSolicitud(models.Model):
    solicitud = models.ForeignKey(Solicitud, on_delete=models.CASCADE, related_name="respuestas")
    descripcion = models.TextField(null=True, blank=True)
    precio = models.FloatField(null=True, blank=True)
    numero_contacto= models.CharField(null=True, blank=True, max_length=12)