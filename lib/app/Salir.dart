import 'package:flutter/material.dart';
import 'dart:io';

class Salir extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: const DecorationImage(
          image: AssetImage('assets/images/fondoperfil.JPG'),
          fit: BoxFit.fill,
        )),
        padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                  color: Colors.lightBlueAccent,
                  textColor: Colors.black,
                  padding: EdgeInsets.all(20),
                  onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Salir de la aplicacion'),
                          content: const Text(
                              'Esta seguro que quiere salir de la aplicacion?'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () => exit(0),
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.exit_to_app, size: 35, color: Colors.red),
                        Text(
                          ' Salir de la aplicacion',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ])),
            ],
          ),
        ));
  }
}
