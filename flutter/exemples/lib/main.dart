import 'package:exemples/movie.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MovieInfoApp());
}

class MovieInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: MoviePage(lotr),
    );
  }
}

class MoviePage extends StatelessWidget {
  final Movie movie;
  MoviePage(this.movie);

  @override
  Widget build(BuildContext context) {
    final divider = Divider(
      color: Color.fromARGB(100, 0, 0, 0),
      thickness: 1,
      height: 1,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Info'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(flex: 2, child: _Header(movie: movie)),
          divider,
          Expanded(flex: 3, child: _Middle(movie: movie)),
          divider,
          Expanded(flex: 5, child: _Cast(movie)),
        ],
      ),
    );
  }
}

class _Cast extends StatelessWidget {
  final Movie movie;
  _Cast(this.movie);

  _castRow(String label, String content) => TableRow(
        children: [
          Text(label),
          SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(content),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Table(
              columnWidths: {
                0: IntrinsicColumnWidth(),
                1: IntrinsicColumnWidth(),
              },
              children: [
                _castRow('Directors', movie.directors.join(', ')),
                _castRow('Writers', movie.writers.join(', ')),
                _castRow('Actors', movie.actors.join('\n')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Middle extends StatelessWidget {
  const _Middle({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 2 / 3,
            child: Image.asset(
              movie.posterURL,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                movie.overview,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  Widget _text(String text) {
    final TextStyle infoStyle = TextStyle(
      fontSize: 12,
      color: Colors.grey,
    );
    return Text(text, style: infoStyle);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            movie.title,
            style: TextStyle(
              fontSize: 30,
              color: Colors.yellow,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: <Widget>[
              _text(movie.year.toString()),
              SizedBox(width: 12),
              _text(movie.pg),
              SizedBox(width: 12),
              _text('${movie.minutes} min'),
              Spacer(),
              _text(movie.genres.join(', ')),
            ],
          )
        ],
      ),
    );
  }
}
