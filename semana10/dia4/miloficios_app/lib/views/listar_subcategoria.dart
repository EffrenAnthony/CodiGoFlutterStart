import 'package:flutter/material.dart';
import 'package:miloficios_app/models/categoria.dart';

class ListarDetalleSubcategoria extends StatelessWidget {
  Categoria categoria;
  ListarDetalleSubcategoria(this.categoria);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.network(categoria.urlBanner),
          Expanded(
            child: ListView.builder(
              itemCount: categoria.subcategorias.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(categoria.subcategorias[index].nombre),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
