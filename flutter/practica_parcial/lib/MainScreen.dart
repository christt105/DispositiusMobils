import 'package:flutter/material.dart';
import 'package:practica_parcial/AddScreen.dart';
import 'package:practica_parcial/CounterWidget.dart';

import 'Counter.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Counter> counters = List<Counter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Parcial'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Resetear contadores'),
                    actions: <Widget>[
                      FlatButton(
                        child: Text('Cancelar'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                      ),
                      FlatButton(
                        child: Text('Resetear'),
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                    ],
                  ),
                ).then((clear) {
                  if (clear) {
                    setState(() {
                      for (int i = 0; i < counters.length; i++) {
                        counters[i].numero = 0;
                      }
                    });
                  }
                });
              },
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddScreen()))
                .then((word) {
              if (word != null)
                setState(() {
                  counters.add(Counter(word: word));
                });
            });
          },
          child: Icon(
            Icons.add,
          ),
        ),
        body: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          padding: EdgeInsets.all(5),
          children: <Widget>[
            for (int i = 0; i < counters.length; i++)
              CounterWidget(counters[i]),
          ],
        ));
  }
}