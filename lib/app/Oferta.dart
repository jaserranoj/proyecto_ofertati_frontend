import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Oferta extends StatefulWidget {
  @override
  _OfertaState createState() => _OfertaState();
}

class _OfertaState extends State<Oferta> {
  Future<List> getPosts() async {
    http.Response response =
        await http.get(Uri.encodeFull("http://192.168.1.9:8000/ofertas/"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: const DecorationImage(
        image: AssetImage('assets/images/fondoperfil.JPG'),
        fit: BoxFit.fill,
      )),
      child: FutureBuilder(
        future: getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            final List<dynamic> data = snapshot.data;
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final item = data[index];
                return Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  margin: EdgeInsets.all(5),
                  elevation: 10,
                  child: ListTile(
                    leading: Icon(
                      Icons.business_center_sharp,
                      color: Colors.lightBlueAccent,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    title: Text(item["nombre"],
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600)),
                    subtitle: Text(
                      item["oferta_type"],
                      style: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
                    ),
                  ),
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
