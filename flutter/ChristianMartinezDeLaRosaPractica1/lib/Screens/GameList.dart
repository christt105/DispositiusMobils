import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:practica1/Containers/game.dart';
import 'package:practica1/Screens/FavouriteList.dart';
import 'package:practica1/Screens/GameScreen.dart';

import 'package:path_provider/path_provider.dart';

class GameList extends StatefulWidget {
  @override
  _GameListState createState() => _GameListState();
}

class _GameListState extends State<GameList> {
  List<Game> _games;
  Map<String, Color> _platform;
  Map<String, bool> _favourites;

  @override
  void initState() {
    _loadGames();
    super.initState();
  }

  Future<void> _loadGames() async {
    _games = List<Game>();
    _platform = Map<String, Color>();
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/Games.json');
    var _json_games = jsonDecode(data);

    for (var p in _json_games['platforms']) {
      _platform.putIfAbsent(
        p['text'],
        () => Color.fromARGB(
            255, p['color']['r'], p['color']['g'], p['color']['b']),
      );
    }
    for (var i in _json_games['games']) {
      _games.add(Game.fromJson(i));
    }

    _favourites = Map<String, bool>();
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/fav.json');
      String fileContents = await file.readAsString();
      List jsonFav = jsonDecode(fileContents);
      for (var f in jsonFav) {
        _favourites[f['game']] = f['fav'];
      }
    } catch (e) {
      for (var g in _games) {
        _favourites[g.name] = false;
      }
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
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => FavList(_games, _favourites)));
        },
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
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (_) => GamePage(
                                  _games[index],
                                  _platform,
                                  _favourites,
                                )));
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
