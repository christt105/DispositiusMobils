import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practica2/Containers/game.dart';
import 'package:practica2/Screens/FavouriteList.dart';
import 'package:practica2/Screens/GameScreen.dart';

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
    var _jsonGames = jsonDecode(data);

    for (var p in _jsonGames['platforms']) {
      _platform.putIfAbsent(
        p['text'],
        () => Color.fromARGB(
            255, p['color']['r'], p['color']['g'], p['color']['b']),
      );
    }
    for (var i in _jsonGames['games']) {
      _games.add(Game.fromJson(i));
    }

    _favourites = Map<String, bool>();
    try {
      Directory dir = await getApplicationDocumentsDirectory();
      File file = File('${dir.path}/fav.json');
      String fileContents = await file.readAsString();
      dynamic jsonFav = jsonDecode(fileContents);
      for(var i in jsonFav){
        _favourites[i['name']] = i['fav'];
      }
    } catch (e) {
      print(e.toString());
      for (var g in _games) {
        _favourites[g.name] = false;
      }
    }

    super.setState(() {});
  }

  Future<void> _saveFavourites() async {
    Directory dir = await getApplicationDocumentsDirectory();
    File file = File('${dir.path}/fav.json');
    List<Map<String, dynamic>> toJson = List<Map<String, dynamic>>();
    for(var i in _games){
      Map<String,dynamic> obj = Map<String,dynamic>();
      obj['name'] = i.name;
      obj['fav'] = _favourites[i.name];
      toJson.add(obj);
    }
    var json = jsonEncode(toJson);
    await file.writeAsString(json);
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
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (_) => FavList(_games, _favourites)))
              .then((var a) => setState(() {}));
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
                                  _saveFavourites,
                                )))
                        .then((var a) => setState(() {
                          SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
                        }));
                  },
                  onLongPress: () {
                    setState(() {
                      _favourites[_games[index].name] =
                          !_favourites[_games[index].name];
                      _saveFavourites();
                    });
                  },
                  child: Card(
                    color: (_favourites[_games[index].name])
                        ? Colors.red
                        : Colors.grey[750],
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
