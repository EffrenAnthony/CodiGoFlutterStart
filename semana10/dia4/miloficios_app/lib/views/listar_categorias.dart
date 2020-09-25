import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:miloficios_app/models/banner.dart';
import 'package:miloficios_app/models/categoria.dart';
import 'package:miloficios_app/utils/http_helper.dart';
import 'package:miloficios_app/views/listar_subcategoria.dart';

class Categorias extends StatefulWidget {
  @override
  _CategoriasState createState() => _CategoriasState();
}

class _CategoriasState extends State<Categorias> {
  int bannerActual = 0;
  // List<String> banners = [
  //   'https://image.freepik.com/vector-gratis/plantilla-anuncios-alimentos-hamburguesas_23-2148449854.jpg',
  //   'https://cdn.goconqr.com/uploads/media/image/22604585/desktop_57e212ea-ddac-40fa-96cb-1dea745fcaa4.jpg',
  //   'https://image.freepik.com/vector-gratis/anuncio-deliciosa-hamburguesa_52683-4293.jpg'
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            FutureBuilder(
              future: HttpHelper().fetchBannersPublicitarios(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<BannerPublicitario> banners = snapshot.data;
                  return Column(
                    children: [
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          onPageChanged: (index, reason) {
                            setState(() {
                              bannerActual = index;
                            });
                          },
                        ),
                        itemCount: banners.length,
                        itemBuilder: (BuildContext context, int itemIndex) =>
                            Container(
                          width: 500,
                          child: Image.network(
                            banners[itemIndex].urlBanner,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: banners.map((img) {
                          int indTemp = banners.indexOf(img);
                          return Container(
                            margin: EdgeInsets.all(8),
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: bannerActual == indTemp
                                    ? Colors.amber.shade800
                                    : Colors.amber.shade200),
                          );
                        }).toList(),
                      )
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error);
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: HttpHelper().fetchCategorias(),
                builder: (context, snapshot) {
                  List<Categoria> categorias = snapshot.data;
                  if (snapshot.hasData) {
                    return GridView.builder(
                      itemCount: categorias.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ListarDetalleSubcategoria(categorias[index]),
                            )),
                        child: Card(
                          child: Column(
                            children: [
                              Expanded(
                                  child: Image.network(
                                      categorias[index].urlBanner)),
                              Text(categorias[index].nombre),
                            ],
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
