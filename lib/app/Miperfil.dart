import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Miperfil extends StatelessWidget {
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
                    title: Text(item["nombres"] , style: TextStyle(
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