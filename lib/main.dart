import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'app/Miperfil.dart';
import 'app/Oferta.dart';
import 'app/Salir.dart';

void main() async {

  runApp(
      MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.red
        ),
        home: Scaffold(
          body: MyApp(),

        ),
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.article_sharp), text: "Ofertas",),
                Tab(icon: Icon(Icons.account_circle_rounded), text: "Mi Perfil"),
                Tab(icon: Icon(Icons.exit_to_app), text: "Salir")
              ],
            ),
            title: Text('Ofertas TI'),
          ),
          body: TabBarView(
            children: [
              Oferta(),
              Miperfil(),
              Salir(),
            ],
          ),
        ),
      ),
    );
  }
}

class Perfil extends StatelessWidget {

  Future<List> getRol(String query) async {
    http.Response response = await http.get(Uri.encodeFull("http://localhost:8000/ingenieros/?search=$query"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getRol("1"),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
          if(snapshot.hasData){
            final List<dynamic> data = snapshot.data;
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                final item = data[index];
                return Container(
                  padding: EdgeInsets.fromLTRB(18, 10, 0, 0),
                  // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    title: Text(item["nombres"], style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                    )),
                    subtitle: Text(item["user_type"], style: TextStyle(
                        fontSize: 16.0
                    ),),
                  ),
                );
              },

            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


class Ofertas extends StatelessWidget {

  Future<List> getPosts() async {
    http.Response response = await http.get(Uri.encodeFull("http://localhost:8000/ofertas/"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
          if(snapshot.hasData){
            final List<dynamic> data = snapshot.data;
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                final item = data[index];
                return Container(
                  padding: EdgeInsets.fromLTRB(18, 10, 0, 0),
                  // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    title: Text(item["nombre"], style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                    )),
                    subtitle: Text(item["oferta_type"], style: TextStyle(
                        fontSize: 16.0
                    ),),
                  ),
                );
              },

            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}


class Detalle extends StatelessWidget {

  Future<List> getDetalle(String query) async {
    http.Response response = await http.get(Uri.encodeFull("http://localhost:8000/ofertas/?search=$query"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getDetalle("1"),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){
          if(snapshot.hasData){
            final List<dynamic> data = snapshot.data;
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                final item = data[index];
                return Container(
                  padding: EdgeInsets.fromLTRB(18, 10, 0, 0),
                  // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: ListTile(
                    title: Text(item["nombre"], style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600
                    )),
                    subtitle: Text(item["descripcion"], style: TextStyle(
                        fontSize: 16.0
                    ),),
                  ),
                );
              },

            );
          }else{
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}