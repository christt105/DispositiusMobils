import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  myApp();
}

void myApp() {
  String msg = 'Te quiero';
  var txt = TextEditingController();
  txt.text = msg;
  runApp(
    MaterialApp(
      title: 'hello',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: Scaffold(
        appBar: AppBar(title: Text('Hola guapisisisima')),
        body: Column(
          children: <Widget>[
            TextField(controller: txt, textAlign: TextAlign.center),
            Image.asset('assets/amor.jpg'),
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
                        int a = r.nextInt(5);
                        if (a == 0) {
                          msg = 'Te amo muchisimo';
                        } else if (a == 1) {
                          msg = 'Preciosa';
                        } else if (a == 2) {
                          msg = 'Mi bebé';
                        } else if (a == 3) {
                          msg = 'Eres la mejor del universo';
                        } else if (a == 4) {
                          msg = 'Te adoro';
                        } else if (a == 5) {
                          msg = 'Te quiero';
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
