import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("HEY"),
      ),
      body: Center(
          child: Text(
        "DANTE PEDAZO DE HIJO DE PUTA DONDE COÑO TE HAS IDO",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
      )),
    ));
  }
}
