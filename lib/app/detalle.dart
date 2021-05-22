import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.red),
    home: Scaffold(
      appBar: AppBar(
        title: Text("Perfil"),
        centerTitle: true,
      ),
      body: Detalle(),
    ),
  ));
}

class Detalle extends StatelessWidget {
  var oferta;

  Detalle({this.oferta});
  Future<List> getDetalle(String query) async {
    http.Response response = await http
        .get(Uri.encodeFull("http://localhost:8000/ofertas/?search=$query"));
        //.get(Uri.encodeFull("http://192.168.1.9:8000/ofertas/?search=$query"));

    //se debe cambiar la ip de localhots por la ip del equipo donde esta corriendo el proyecto
    //De esto http://localhost:8000/ofertas/?search=$query a esto http://192.168.1.9:8000/ofertas/?search=$query
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getDetalle(this.oferta),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            final List<dynamic> data = snapshot.data;
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final item = data[index];
                return Container(
                  padding: EdgeInsets.fromLTRB(18, 10, 0, 0),
                  // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
