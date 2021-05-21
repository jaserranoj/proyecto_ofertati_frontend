import 'package:flutter/material.dart';

import 'Miperfil.dart';
import 'Oferta.dart';
import 'Salir.dart';

class Inicio extends StatelessWidget {
  const Inicio({Key key, this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.article_sharp),
                  text: "Ofertas",
                ),
                Tab(
                    icon: Icon(Icons.account_circle_rounded),
                    text: "Mi Perfil"),
                Tab(icon: Icon(Icons.exit_to_app), text: "Salir")
              ],
            ),
            title: Text('Ofertas TI'),
          ),
          body: TabBarView(
            children: [
              Oferta(),
              Miperfil(usuario: "1"),
              Salir(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cuerpo2() {
  return Container(
    decoration: BoxDecoration(),
    child: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        imagen(),
      ],
    )),
  );
}

Widget imagen() {
  return Container(
    child: Icon(Icons.ac_unit),
  );
}
