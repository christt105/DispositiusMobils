import 'package:flutter/material.dart';
import 'package:practica1/Containers/game.dart';

class FavList extends StatefulWidget {
  List<Game> _games;
  Map<String, bool> _favourites;
  List<Game> _fav_games;

  @override
  _FavListState createState() => _FavListState();

  FavList(this._games, this._favourites) {
    _fav_games = List<Game>();
    for (var g in _games) {
      if (_favourites[g.name]) _fav_games.add(g);
    }
  }
}

class _FavListState extends State<FavList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Favourite List'),
      ),
      body: (widget._fav_games.length == 0)
          ? Center(child: Text('No Favourite Games'))
          : ListView.builder(
              itemCount: widget._fav_games.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(widget._fav_games[index].name),
                );
              },
            ),
    );
  }
}
