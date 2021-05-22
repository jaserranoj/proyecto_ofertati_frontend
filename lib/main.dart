import 'package:flutter/material.dart';

import 'app/inicio.dart';
import 'app/detalle.dart';
void main() async {
  runApp(
    MaterialApp(
        theme: ThemeData(primaryColor: Colors.red),
        home: MyApp(),
        routes: <String, WidgetBuilder>{
          "/Perfil": (BuildContext context) => new Inicio()
        }),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: cuerpo(context),
    );
  }
}

Widget cuerpo(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          'assets/images/fondoperfil.JPG',
        ),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        login(),
        //imagenLogin(),
        SizedBox(
          height: 10,
        ),
        nombre(),
        SizedBox(
          height: 10,
        ),
        campoUsuario(),
        SizedBox(
          height: 10,
        ),
        campoPassword(),
        SizedBox(
          height: 10,
        ),
        botonLogin(context),
      ],
    )),
  );
}

Widget nombre() {
  return Text(
    'Sign in',
    style: TextStyle(
        color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
  );
}

Widget campoUsuario() {
  TextEditingController _usuario = TextEditingController(text: "");
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    child: TextField(
      controller: _usuario,
      decoration: InputDecoration(
        icon: Icon(Icons.account_circle),
        hintText: 'user',
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget campoPassword() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock),
        hintText: 'Password',
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}

Widget imagenLogin() {
  return Container(
      width: 150,
      height: 150,
      child: SizedBox(
        width: 150,
        height: 150,
        child: Icon(Icons.person),
      ));
}

Widget botonLogin(BuildContext context) {
  final ButtonStyle style =
      ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 50));
  return ElevatedButton(
    style: style,
    child: Text('Login'),
    onPressed: () {
      Navigator.of(context).pushNamed("/Perfil");
    },
  );
}

Widget login() {
  return Container(
    height: 150,
    width: 150,
    decoration: BoxDecoration(
      image: const DecorationImage(
          image: AssetImage('assets/images/login1.png'), fit: BoxFit.fill),
      border: Border.all(
        color: Colors.black,
        width: 8,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    padding: EdgeInsets.all(20),
  );
}
