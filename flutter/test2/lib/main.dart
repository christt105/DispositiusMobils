import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  myApp();
}

void myApp() {
  String msg = 'pringao';
  var txt = TextEditingController();
  txt.text = msg;
  runApp(
    MaterialApp(
      title: 'hello',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(title: Text('Hola pringao')),
        body: Column(
          children: <Widget>[
            TextField(controller: txt, textAlign: TextAlign.center),
            Text(msg),
            Image.asset('assets/hi.jpg'),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Container(
                  child: Ink(
                    decoration: ShapeDecoration(
                        color: Colors.purple, shape: CircleBorder()),
                    child: Center(
                        child: IconButton(
                      color: Colors.red,
                      icon: Icon(Icons.favorite),
                      iconSize: 50,
                      splashColor: Colors.purple,
                      onPressed: () {
                        Random r = Random();
                        int a = r.nextInt(6);
                        if (a == 0) {
                          msg = 'sabes';
                        } else if (a == 1) {
                          msg = 'que';
                        } else if (a == 2) {
                          msg = 'es';
                        } else if (a == 3) {
                          msg = 'dificil';
                        } else if (a == 4) {
                          msg = 'leer';
                        } else if (a == 5) {
                          msg = 'desordenadamente';
                        }
                        txt.text = msg;
                      },
                    )),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
