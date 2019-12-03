import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practica1/game.dart';

class GamePage extends StatelessWidget {
  final Game game;
  const GamePage(this.game);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Expanded(
            flex: 1,
            child: _Button(),
          ),
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
        // Para tener varios elementos posicionados uno encima del otro
        children: <Widget>[
          Container(
            //Background Image
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(game
                    .backgroundImage), // Imagen dentro de una BoxDecoration para que se pueda manipular
                fit: BoxFit
                    .fitWidth, // La imagen se ajustará a todo el ancho de la pantalla
              ),
            ),
            child: BackdropFilter(
              // Filtro para hacer blur
              filter: ImageFilter.blur(
                  sigmaX: 3.0,
                  sigmaY:
                      3.0), // Intensidad en X y en Y del filtro | necesario el import: 'dart:ui';
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(
                      0.0), // Se crea una caja blanca que cubra todo y se le baja la opacidad. Se le aplica el filtro sobre esta caja y no sobre la imagen
                ),
              ),
            ),
          ),
          Padding(
            //Watch Trailer
            padding: const EdgeInsets.symmetric(horizontal: 130),
            child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 70),
                child: RaisedButton(
                  onPressed: () {},
                  textTheme: ButtonTextTheme.primary, // Centra el botón
                  color: Colors.transparent,
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
            // Main Image
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
                    // Sombra debajo del container
                    BoxShadow(
                      // La sombra se aplicará sobre el container entero, no sobre la foto
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
            padding: const EdgeInsets.only(top: 50), // Botón atrás
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
      padding: const EdgeInsets.only(
          left: 15.0, top: 15.0, bottom: 15.0), // Margen general
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "ACTION",
              style: TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              game.name,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              for (var item in game.consoles) _ConsoleContainer(item),
            ],
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
      width: MediaQuery.of(context)
          .size
          .width, // Esto devuelve el ancho del telefono
      child: FlatButton(
        onPressed: () {},
        child: Text("+ ADD GAME"),
        color: Colors.pink,
        shape: ContinuousRectangleBorder(), // Bordes duros
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
              // ShaderMask crea una máscara a lo que le digas y como se lo digas
              shaderCallback: (rect) {
                return LinearGradient(
                  // Degradado Lineal
                  begin: Alignment.topCenter,
                  end: Alignment
                      .bottomCenter, //Los limites se aplican a su child
                  colors: [Colors.black, Colors.transparent],
                ).createShader(
                  Rect.fromLTRB(0, 0, rect.width, rect.height),
                );
              },
              blendMode: BlendMode
                  .dstIn, // Tipo de blend (como las capas de Photoshop)
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
