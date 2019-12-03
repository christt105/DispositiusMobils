import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
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
        onPressed: (){},
        child: Icon(Icons.favorite),
        foregroundColor: Colors.red,
        backgroundColor: Colors.grey[600],
      ),
      /*floatingActionButton: IconButton(
        icon: Icon(Icons.favorite),
        onPressed: (){},
        color: Colors.red,
        focusColor: Colors.white,
        disabledColor: Colors.white,
        highlightColor: Colors.white,
        hoverColor: Colors.white,
        splashColor: Colors.white,
      ),*/
      body: (_games == null)
          ? Center(child: CircularProgressIndicator())
          // : ListView.builder(
          //     itemCount: _games.length,
          //     itemBuilder: (context, index) {
          //       return InkWell(
          //         child: ListTile(
          //           title: Text(_games[index].name),
          //         ),
          //       );
          //     },
          //   ),
          : GridView.builder(
            padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 4/5,
                mainAxisSpacing: 5,
                crossAxisSpacing: 2,
              ),
              itemCount: _games.length,
              itemBuilder: (context, index) {
                return Card(
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
                );
              },
            ),
      // : GridView.count(
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //     padding: EdgeInsets.all(20),
      //     childAspectRatio: 4 / 5,
      //     children: <Widget>[
      //       for (int i = 0; i < _games.length; i++)
      //         Card(
      //           clipBehavior: Clip.antiAliasWithSaveLayer,
      //           child: Stack(
      //             alignment: AlignmentDirectional.topCenter,
      //             children: <Widget>[
      //               Image.asset(_games[i].card),
      //               Column(
      //                 mainAxisAlignment: MainAxisAlignment.end,
      //                 children: <Widget>[
      //                   Text(_games[i].name),
      //                   SizedBox(
      //                     height: 15,
      //                   )
      //                 ],
      //               ),
      //             ],
      //           ),
      //         )
      //     ],
      //   ),
    );
  }
}
