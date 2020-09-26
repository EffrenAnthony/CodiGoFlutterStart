from django.shortcuts import render
from django.http import HttpResponse
from .models import *
from rest_framework import generics
from .serializers import *

# Create your views here.
def index(request):
  return HttpResponse('<h1>Hola Codigo</h1>')

def retornarCategorias(request):
  categorias = Categoria.objects.all()
  jsonCategorias = '{'
  for categorias in categorias:
    jsonCategorias += '"nombre":"'+str(categorias)+'",'
  jsonCategorias += '}'
  return HttpResponse(jsonCategorias)

class CategoriasList(generics.ListCreateAPIView):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer

# con retrieve, update ahcemos el put push  y destroy borrar
class CategoriasGet(generics.RetrieveUpdateDestroyAPIView):
    queryset = Categoria.objects.all()
    serializer_class = CategoriaSerializer

class SubCategoriasList(generics.ListCreateAPIView):
    queryset = SubCategoria.objects.all()
    serializer_class = SubCategoriaSerializer

# con retrieve, update ahcemos el put push  y destroy borrar
class SubCategoriasGet(generics.RetrieveUpdateDestroyAPIView):
    queryset = SubCategoria.objects.all()
    serializer_class = SubCategoriaSerializer

class BannersPublicitariosGet(generics.ListAPIView):
    queryset = BannerPublicitario.objects.all()
    serializer_class = BannerPublicitarioSerializer

class ClienteCreate(generics.CreateAPIView):
  queryset = Cliente.objects.all()
  serializer_class = ClienteSerializer