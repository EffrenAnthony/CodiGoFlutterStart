import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListUsers extends StatefulWidget {
  ListUsers({Key key}) : super(key: key);

  @override
  _ListUsersState createState() => _ListUsersState();
}

class _ListUsersState extends State<ListUsers> {
  Future<List> obtenerUsuarios() async {
    var respuesta = await http.get('https://reqres.in/api/users?page=2');
    var resp = convert.jsonDecode(respuesta.body)['data'];
    print(resp.toString());
    return resp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Servicios'),
      ),
      body: Container(
        child: FutureBuilder(
          future: obtenerUsuarios(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List listaPersonas = snapshot.data;
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (c, i) {
                    Map persona = listaPersonas[i];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(persona['avatar']),
                      ),
                      title: Text(
                        persona["first_name"] + " " + persona["last_name"],
                      ),
                      subtitle: Text(persona['email']),
                    );
                  });
            }
            return Text('esperando');
          },
        ),
      ),
    );
  }
}
