import 'package:flutter/material.dart';
import 'package:practica2/Containers/game.dart';

class FavList extends StatefulWidget {
  final List<Game> _games;
  final Map<String, bool> _favourites;
  final List<Game> _favGames = List<Game>();

  @override
  _FavListState createState() => _FavListState();

  FavList(this._games, this._favourites) {
    for (var g in _games) {
      if (_favourites[g.name]) _favGames.add(g);
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
      body: (widget._favGames.length == 0)
          ? Center(child: Text('No Favourite Games'))
          : ListView.separated(
              separatorBuilder: (BuildContext contex, int index) => Divider(
                thickness: 1,
              ),
              padding: EdgeInsets.all(5),
              itemCount: widget._favGames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Image.asset(widget._favGames[index].card),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        widget._favourites[widget._favGames[index].name] =
                            false;
                        widget._favGames.removeAt(index);
                      });
                    },
                  ),
                  title: Text(widget._favGames[index].name),
                );
              },
            ),
    );
  }
}
