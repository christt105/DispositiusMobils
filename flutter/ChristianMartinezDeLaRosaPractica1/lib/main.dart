import 'package:flutter/material.dart';
import 'package:practica1/Screens/GameList.dart';

void main() => runApp(GameInfoApp());

class GameInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: GameList(),
    );
  }
}
