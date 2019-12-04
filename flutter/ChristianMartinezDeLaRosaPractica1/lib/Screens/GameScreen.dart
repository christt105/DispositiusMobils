import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:practica1/game.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class GamePage extends StatelessWidget {
  final Game game;
  final Map<String, Color> _platform;
  const GamePage(this.game, this._platform);

  @override
  Widget build(BuildContext context) {
    return Provider<Game>.value(
      value: game,
      child: Provider<Map<String, Color>>.value(
        value: _platform,
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                _Header(),
                _Body(),
                _Button(),
                _Bottom(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          FittedBox(
            child: Container(
              width: 500,
              height: 400,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Provider.of<Game>(context).backgroundImage),
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: BackdropFilter(
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
            fit: BoxFit.cover,
          ),
          Padding(
            //Watch Trailer
            padding: const EdgeInsets.symmetric(horizontal: 130),
            child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 70),
                child: RaisedButton(
                  onPressed: () => _launchURL(Provider.of<Game>(context).trailer),
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
                    image: AssetImage(Provider.of<Game>(context).mainImage),
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
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

  _launchURL(String trailer) async {
    {
      var url = trailer;
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}

class _Body extends StatelessWidget {
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
          SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              Provider.of<Game>(context).name,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: Wrap(
              direction: Axis.horizontal,
              runSpacing: 10,
              spacing: 15,
              children: <Widget>[
                for (var item in Provider.of<Game>(context).consoles)
                  _ConsoleContainer(item),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              Provider.of<Game>(context).description,
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

class _ConsoleContainer extends StatelessWidget {
  final String console;
  _ConsoleContainer(this.console);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: Provider.of<Map<String,Color>>(context)[console],
      ),
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text(
          console,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: ShaderMask(
        // ShaderMask crea una máscara a lo que le digas y como se lo digas
        shaderCallback: (rect) {
          return LinearGradient(
            // Degradado Lineal
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter, //Los limites se aplican a su child
            colors: [Colors.black, Colors.transparent],
          ).createShader(
            Rect.fromLTRB(0, 0, rect.width, rect.height),
          );
        },
        blendMode:
            BlendMode.dstIn, // Tipo de blend (como las capas de Photoshop)
        child: Image.asset(
          Provider.of<Game>(context).infoImage,
        ),
        // child: Container(
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(15),
        //     image: DecorationImage(
        //         image: AssetImage(game.infoImage),
        //         fit: BoxFit.fitWidth,
        //         alignment: Alignment.topCenter),
        //   ),
        // ),
      ),
    );
  }
}
