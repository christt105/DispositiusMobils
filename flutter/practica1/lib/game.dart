import 'package:flutter/material.dart';

class Console{
  String name;
  Color color;
  Console(this.name,this.color);
}

class Game {
  String name;
  List<Console> consoles;
  String description;
  String mainImage;
  String backgroundImage;
  String infoImage;

  Game(
    this.name,
    this.consoles,
    this.description,
    this.mainImage,
    this.backgroundImage,
    this.infoImage
    );
}

final hk = Game(
  'Hollow Knight',
  [new Console('PC', Colors.grey), new Console('PS4', Colors.blue), new Console('NINTENDO SWITCH', Colors.red), new Console('XBOX ONE',Colors.green)],

  'Hollow Knight is a Metroidvania video game developed and published by Team Cherry. '
  'The game was released for Microsoft Windows, macOS, and Linux in 2017, and for the '
  'Nintendo Switch, PlayStation 4, Xbox One in 2018. Development was partially funded '
  'through a Kickstarter crowdfunding campaign, raising over 35,000€ by the end of 2014.',
  'assets/cover.png',
  'assets/backCover.png',
  'assets/info.png'
  );