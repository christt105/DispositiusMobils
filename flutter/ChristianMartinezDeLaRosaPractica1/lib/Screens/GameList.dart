import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:practica1/Screens/GameScreen.dart';
import 'package:practica1/game.dart';

class GameList extends StatefulWidget {
  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  List<Game> _games;

  @override
  void initState() {
    _loadGames();
    super.initState();
  }

  Future<void> _loadGames() async {
    _games = List<Game>();
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/Games.json');
    var json = jsonDecode(data);
    for (var i in json['games']) {
      _games.add(Game.fromJson(i));
    }
    super.setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Games'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.favorite),
        foregroundColor: Colors.red,
        backgroundColor: Colors.grey[600],
      ),
      body: (_games == null)
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4 / 5,
                mainAxisSpacing: 5,
                crossAxisSpacing: 2,
              ),
              itemCount: _games.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => GamePage(_games[index])));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      alignment: AlignmentDirectional.topCenter,
                      children: <Widget>[
                        Image.asset(_games[index].card),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(_games[index].name),
                            SizedBox(
                              height: 15,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
