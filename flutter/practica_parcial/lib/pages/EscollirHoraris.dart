import 'package:flutter/material.dart';
import 'package:parcial/model/horari.dart';

class EscollirHorari extends StatefulWidget {
  final List<int> horaris;
  EscollirHorari(this.horaris);

  @override
  _EscollirHorariState createState() => _EscollirHorariState();
}

class _EscollirHorariState extends State<EscollirHorari> {
  bool changed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Escull un horari...'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.white,
            ),
            onPressed: () {
              if (changed)
                Navigator.of(context).pop(widget.horaris);
              else
                Navigator.of(context).pop(null);
            },
          )
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 1,
        ),
        itemCount: totsElsHoraris.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(totsElsHoraris[index].toString()),
          leading: Checkbox(
            value: widget.horaris.contains(index),
            onChanged: (changed) {
              _changeSelection(index);
            },
          ),
          onTap: () => _changeSelection(index),
        ),
      ),
    );
  }

  void _changeSelection(int index) {
    changed = true;
    setState(() {
      if (widget.horaris.contains(index))
        widget.horaris.remove(index);
      else
        widget.horaris.add(index);
    });
  }
}
