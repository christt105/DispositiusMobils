import 'package:flutter/material.dart';

class Console {
  String name;
  Color color;
  Console(this.name, this.color);
}

class Game {
  String name;
  List<Console> consoles;
  String description;
  String mainImage;
  String backgroundImage;
  String infoImage;
  String card;

  Game.fromJson(Map<String, dynamic> json)
      : name = json['title'],
        description = json['text'],
        mainImage = json['cover'],
        backgroundImage = json['back_cover'],
        card = json['card'],
        infoImage = json['bottom_image'] {
          consoles = List<Console>();
    for (var console in json['console']) {
      consoles.add(
        Console(
          console['text'],
          Color.fromARGB(1, console['color']['r'], console['color']['g'], console['color']['b']),
        ),
      );
    }
  }

  Game(this.name, this.consoles, this.description, this.mainImage,
      this.backgroundImage, this.infoImage, this.card);
}
