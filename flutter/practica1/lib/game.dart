class Game {
  String name;
  List<String> consoles;
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
  ['PC', 'PS4', 'NINTENDO SWITCH', 'XBOX ONE'],
  /*'Forge your own path in Hollow Knight! An epic action adventure through a vast ruined '
  'kingdom of insects and heroes. Explore twisting caverns, battle tainted creatures and '
  'befriend bizarre bugs, all in a classic, hand-drawn 2D style.'*/

  'Hollow Knight is a Metroidvania video game developed and published by Team Cherry. '
  'The game was released for Microsoft Windows, macOS, and Linux in 2017, and for the '
  'Nintendo Switch, PlayStation 4, Xbox One in 2018. Development was partially funded '
  'through a Kickstarter crowdfunding campaign, raising over 35,000€ by the end of 2014.',
  'assets/cover.png',
  'assets/backCover.png',
  'assets/info.png'
  );