import 'package:flutter/material.dart';
import 'package:practica_parcial/Counter.dart';

class CounterWidget extends StatefulWidget {
  final Counter _counter;
  CounterWidget(this._counter);

  @override
  _CounterWidgetState createState() => _CounterWidgetState(this._counter);
}

class _CounterWidgetState extends State<CounterWidget> {
  final Counter data;

  _CounterWidgetState(this.data);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        onTap: () {
          setState(() {
            data.numero++;
          });
        },
        onLongPress: () {
          setState(() {
            if (data.numero > 0) data.numero--;
          });
        },
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  data.numero.toString(),
                  style: TextStyle(
                    fontSize: 42,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                constraints: BoxConstraints.expand(),
                color: Colors.lightBlue[100].withOpacity(0.5),
                child: Center(
                  child: Text(data.word),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}