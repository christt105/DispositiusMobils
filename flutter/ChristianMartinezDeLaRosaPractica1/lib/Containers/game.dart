import 'package:flutter/material.dart';

class Console {
  String name;
  Color color;
  Console(this.name, this.color);
}

class Game {
  String name;
  List<String> consoles;
  String description;
  String mainImage;
  String backgroundImage;
  String infoImage;
  String card;
  String trailer;

  Game.fromJson(Map<String, dynamic> json)
      : name = json['title'],
        description = json['text'],
        mainImage = json['cover'],
        backgroundImage = json['back_cover'],
        card = json['card'],
        trailer = json['yt_video'],
        infoImage = json['bottom_image'] {
    consoles = List<String>();
    for (var console in json['console']) {
      consoles.add(console);
    }
  }

  Game(this.name, this.consoles, this.description, this.mainImage,
      this.backgroundImage, this.infoImage, this.card, this.trailer);
}
