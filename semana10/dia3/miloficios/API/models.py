from django.db import models

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