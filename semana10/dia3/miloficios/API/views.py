from django.shortcuts import render
from django.http import HttpResponse
from .models import *
from rest_framework import generics
from .serializers import *
from rest_framework.permissions import AllowAny
from rest_framework.decorators import permission_classes


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

@permission_classes((AllowAny,))
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

# indica que pueden tverse sin necesidad de mandar token
@permission_classes((AllowAny,))
class BannersPublicitariosGet(generics.ListAPIView):
    queryset = BannerPublicitario.objects.all()
    serializer_class = BannerPublicitarioSerializer

@permission_classes((AllowAny,))
class ClienteCreate(generics.CreateAPIView):
  queryset = Cliente.objects.all()
  serializer_class = ClienteSerializer
@permission_classes((AllowAny,))
class ClienteRetrieve(generics.RetrieveAPIView):
  queryset = Cliente.objects.all()
  serializer_class = ClienteSerializer
  # ? con esto traemos el objeto Cliente cuyo id sea igual al logeado
  def get_object(self):
    return self.request.user
    # return Cliente.objects.filter(id=self.request.user.id).first()
@permission_classes((AllowAny, ))
class SolicitudCreate(generics.ListCreateAPIView):
    queryset = Solicitud.objects.all()
    serializer_class = SolicitudSerializer

    def perform_create(self, serializer):
        serializer.save(cliente=Cliente.objects.get(pk=self.request.user.id))

    def get_queryset(self):
        return Solicitud.objects.filter(cliente__pk=self.request.user.pk).all()


@permission_classes((AllowAny, ))
class RespuestaSolicitudList(generics.ListAPIView):
    queryset = RespuestaSolicitud.objects.all()
    serializer_class = RespuestaSolicitudSerializer