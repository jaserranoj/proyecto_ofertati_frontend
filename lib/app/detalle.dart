import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Detalle extends StatefulWidget {
  var oferta;

  Detalle({this.oferta});

  @override
  _DetalleState createState() => _DetalleState();
}

class _DetalleState extends State<Detalle> {
  Future<List> getDetalle(String query) async {
    http.Response response = await http
        //.get(Uri.encodeFull("http://localhost:8000/ofertas/?search=$query"));
        .get(Uri.encodeFull("http://192.168.1.9:8000/ofertas/?search=$query"));

    //se debe cambiar la ip de localhots por la ip del equipo donde esta corriendo el proyecto
    //De esto http://localhost:8000/ofertas/?search=$query a esto http://192.168.1.9:8000/ofertas/?search=$query
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: FutureBuilder(
        future: getDetalle(this.widget.oferta),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            final List<dynamic> data = snapshot.data;
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 40),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final item = data[index];
                return Column(children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.fromLTRB(18, 10, 0, 0),
                    child: Card(
                        elevation: 20,
                        margin: EdgeInsets.all(20),
                        color: Colors.lightBlueAccent,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(item["nombre"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 35.0,
                                    fontWeight: FontWeight.w600)),
                            Text(
                              item["oferta_type"],
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.blueGrey),
                            ),
                            Text(item["descripcion"],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.w600)),
                            Text(item["honorarios"],
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600)),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Regresar!'),
                            ),
                          ],
                        )),
                  )
                ]);
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    ));
  }
}
