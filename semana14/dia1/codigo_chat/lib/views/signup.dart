import 'package:codigo_chat/services/auth.dart';
import 'package:codigo_chat/services/database.dart';
import 'package:codigo_chat/utils/preferencias.dart';
import 'package:codigo_chat/views/chats.dart';
import 'package:codigo_chat/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUp extends StatefulWidget {
  Function cambiarVista;

  SignUp(this.cambiarVista);
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AuthService authService = AuthService();
  FirestoreHelper firestoreHelper = FirestoreHelper();

  signUpGoogle() async {
    await authService.singUpGoogle().then((value) {
      if (value != null) {
        Map<String, String> user = {
          "userName": value.displayName,
          "userEmail": value.email,
          "uid": value.uid
        };
        firestoreHelper.addUserInfo(user);
        Preferencias().saveEmail(value.email);
        Preferencias().saveUserName(value.displayName);
        Preferencias().saveLogInState(true);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Chats(),
            ));
      }
    });
  }

  signUpFacebook() async {
    await authService.singUpFacebook().then((value) {
      if (value != null) {
        Map<String, String> user = {
          "userName": value.displayName,
          "userEmail": value.email,
          "uid": value.uid
        };
        firestoreHelper.addUserInfo(user);
        Preferencias().saveEmail(value.email);
        Preferencias().saveUserName(value.displayName);
        Preferencias().saveLogInState(true);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Chats(),
            ));
      }
    });
  }

  signUp() async {
    if (formKey.currentState.validate()) {
      print("registrar");
      await authService
          .singUp(emailController.text, passwordController.text)
          .then((value) {
        if (value != null) {
          Map<String, String> user = {
            "userName": usernameController.text,
            "userEmail": emailController.text,
            "uid": value.uid
          };
          firestoreHelper.addUserInfo(user);
          Preferencias().saveEmail(emailController.text);
          Preferencias().saveUserName(usernameController.text);
          Preferencias().saveLogInState(true);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Chats(),
              ));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCodigo(context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Spacer(),
            Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    decoration: textFieldInputDecoration("email"),
                    validator: (value) {
                      if (!RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Ingrese un correo valido";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    style: TextStyle(color: Colors.white),
                    controller: usernameController,
                    decoration: textFieldInputDecoration("usuario"),
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return "Ingrese un nombre de usuario de 5+ caracteres";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    obscureText: true,
                    controller: passwordController,
                    decoration: textFieldInputDecoration("password"),
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return "Ingrese un password de 6+ caracteres";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 16,
            ),
            RaisedButton(
              onPressed: () {
                signUp();
              },
              child: Text("Registrarse"),
            ),
            RaisedButton(
              onPressed: () {
                signUpFacebook();
              },
              child: Text("Registrarse con Facebook"),
            ),
            RaisedButton(
              onPressed: () {
                signUpGoogle();
              },
              child: Text("Registrarse con Google"),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Text(
                  "Ya tienes una cuenta?",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                GestureDetector(
                  onTap: widget.cambiarVista,
                  child: Text(
                    "Inicia Sesión ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
