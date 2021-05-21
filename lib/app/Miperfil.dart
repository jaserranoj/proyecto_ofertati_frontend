import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Miperfil extends StatelessWidget {
  Future<List> getRol(String query) async {
    http.Response response = await http.get(
        Uri.encodeFull("http://192.168.1.9:8000/ingenieros/?search=$query"));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: getRol("ingelkinmh@gmail.com"),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            final List<dynamic> data = snapshot.data;
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                final item = data[index];
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    border: Border.all(
                      color: Colors.blueGrey,
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/fondoperfil.JPG'),
                        fit: BoxFit.fill),
                  ),

                  padding: EdgeInsets.fromLTRB(18, 10, 0, 0),
                  // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Column(
                          children: [
                            Text(
                              item["user_type"],
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://www.trecebits.com/wp-content/uploads/2015/09/Imagen-aparece-Facebook-usuario-perfil_EDIIMA20140628_0051_13.jpg'),
                                  fit: BoxFit.fill,
                                ),
                                border: Border.all(
                                  color: Colors.black,
                                  width: 3,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: EdgeInsets.all(20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              item["nombres"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                              textAlign: TextAlign.start,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              item["apellidos"],
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              item["correo"],
                              style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              item["celular"],
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ),
                    ],
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