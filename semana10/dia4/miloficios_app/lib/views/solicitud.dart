import 'package:flutter/material.dart';
import 'package:miloficios_app/models/categoria.dart';

class CrearSolicitud extends StatefulWidget {
  Categoria categoria;

  CrearSolicitud(this.categoria);

  @override
  _CrearSolicitudState createState() => _CrearSolicitudState(categoria);
}

class _CrearSolicitudState extends State<CrearSolicitud> {
  Categoria categoria;
  _CrearSolicitudState(this.categoria);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Text('Descripción:'),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: 10,
                decoration: InputDecoration(
                    hintText: 'Indicanos que servicio necesitas'),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Texto Referencial:'),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(prefix: Text('s/.'), hintText: '000'),
              ),
              SizedBox(
                height: 15,
              ),
              Text('Foto Referencial:'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.photo_camera,
                    size: 100,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Enviar'),
              )
            ],
          ),
        ));
  }
}
