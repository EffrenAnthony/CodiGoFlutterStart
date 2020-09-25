from rest_framework import serializers
from .models import *

class SubCategoriaSerializer(serializers.ModelSerializer):
    class Meta:
        model = SubCategoria
        fields = ['categoria','nombre', 'urlBanner', 'urlLogo']
class CategoriaSerializer(serializers.ModelSerializer):
    subcategorias = SubCategoriaSerializer(many=True)
    class Meta:
        model = Categoria
        fields = ['nombre', 'urlBanner', 'urlLogo','subcategorias']

class BannerPublicitarioSerializer(serializers.ModelSerializer):
    class Meta:
        model = BannerPublicitario
        fields = ['urlBanner']





