import 'package:flutter/material.dart';
import 'game.dart';
import 'dart:ui'; // para el ImageFilter para crear un efecto de Blur

void main() {
  runApp(CarInfoApp());
}

class CarInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: GamePage(hk),
    );
  }
}

class GamePage extends StatelessWidget {
  final Game game;
  const GamePage(this.game);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: _Header(game: game),
          ),
          Expanded(
            flex: 5,
            child: _Body(game: game),
          ),
          _Button(), // No Expanded because it will have the same height
          Expanded(
            flex: 3,
            child: _Bottom(game: game),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key key,
    @required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(game.backgroundImage),
                  fit: BoxFit.fitWidth),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 130),
            child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 70),
                child: RaisedButton(
                  onPressed: () {},
                  textTheme: ButtonTextTheme.primary,
                  color: Color(0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.keyboard_arrow_up,
                        color: Colors.grey,
                      ),
                      Text(
                        "Watch Trailer",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                )),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 12, top: 75),
              child: Container(
                height: 220,
                width: 145,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  image: DecorationImage(
                    image: AssetImage(game.mainImage),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 10.0,
                      spreadRadius: 0.15,
                      offset: Offset(
                        5.0,
                        10.0,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              width: 50,
              height: 50,
              color: Colors.blue,
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios,
                ),
                iconSize: 20,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({
    Key key,
    @required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 10.0, bottom: 15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "ACTION",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              game.name,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              for(var item in game.consoles) _ConsoleContainer(item),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              game.description,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

class _ConsoleContainer extends StatelessWidget {
  final Console console;
  _ConsoleContainer(this.console);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Container(
        height: 20,
        child: Padding(
          padding: const EdgeInsets.only(left: 4, right: 4),
          child: Text(
            console.name,
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
          ),
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          color: console.color,
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        onPressed: () {},
        child: Text("+ ADD GAME"),
        color: Colors.pink,
        shape: ContinuousRectangleBorder(),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({
    Key key,
    @required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.transparent],
                ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
              },
              blendMode: BlendMode.dstIn,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: AssetImage(game.infoImage),
                      fit: BoxFit.fitWidth,
                      alignment: Alignment.topCenter),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 50, right: 190),
            child: Text(
              "Information",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Opacity(
              opacity: 0.7,
              child: Container(
                width: 85,
                height: 10,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
