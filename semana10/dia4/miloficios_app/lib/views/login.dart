import 'package:flutter/material.dart';
import 'package:miloficios_app/main.dart';
import 'package:miloficios_app/providers/user_provider.dart';
import 'package:miloficios_app/utils/http_helper.dart';
import 'package:miloficios_app/utils/sesion_helper.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController controllerUsuario = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  String error = '';
  bool inAsyncCall = false;

  void iniciarSesion() async {
    setState(() {
      inAsyncCall = true;
    });

    String token = await HttpHelper()
        .iniciarSesion(controllerUsuario.text, controllerPassword.text);

    setState(() {
      inAsyncCall = false;
    });

    if (token.length > 0) {
      Provider.of<UserProvider>(context, listen: false).saveUserData(token);
    } else {
      setState(() {
        error = "Credenciales incorrectas";
      });
      controllerPassword.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: inAsyncCall,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://img.pixers.pics/pho_wat(s3:700/FO/10/13/36/05/9/700_FO101336059_5449b2e3b28e700b8fc58dbd937e6177.jpg,700,700,cms:2018/10/5bd1b6b8d04b8_220x50-watermark.png,over,480,650,jpg)/vinilos-patrones-sin-fisuras-con-diferentes-productos-de-papeleria-y-oficina-fondo-plano-repetido-para-diseno-web-y-materiales-imprimibles.jpg.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Mil Oficios',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: controllerUsuario,
                          decoration: InputDecoration(
                            hintText: 'Usuario',
                            prefixIcon: Icon(Icons.account_circle),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.blueGrey, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.blueGrey, width: 2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: controllerPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Contraseña',
                            prefixIcon: Icon(Icons.lock),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.blueGrey, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.blueGrey, width: 2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            error,
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        RaisedButton(
                          color: Colors.blueGrey.shade700,
                          onPressed: () {
                            iniciarSesion();
                          },
                          child: Text(
                            'Inisiar Sesion',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
