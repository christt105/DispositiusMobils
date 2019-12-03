import 'package:flutter/material.dart';
import 'package:parcial/model/horari.dart';
import 'package:parcial/pages/EscollirHoraris.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<int> _escollitsIndex = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultes'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.blue[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Horari escollit',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  EscollirHorari(List<int>.generate(
                                    _escollitsIndex.length,
                                    (index) => _escollitsIndex[index],
                                  ))))
                          .then((save) {
                        if (save != null) {
                          setState(() {
                            _escollitsIndex = save;
                          });
                        }
                      });
                    },
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.edit,
                          size: 17,
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Text('Canviar'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: (_escollitsIndex.isNotEmpty
                ? ListView(
                    shrinkWrap: true,
                    children: <Widget>[
                      for (int i = 0; i < _escollitsIndex.length; i++)
                        ListTile(
                          title: Text(
                            totsElsHoraris[_escollitsIndex[i]].toString(),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.close,
                            ),
                            onPressed: () {
                              setState(() {
                                _escollitsIndex.removeAt(i);
                              });
                            },
                          ),
                        ),
                    ],
                  )
                : Center(
                    child: Text(
                      'No has escollit horaris',
                      style: TextStyle(fontSize: 28, color: Colors.grey[700]),
                    ),
                  )),
          ),
        ],
      ),
    );
  }
}
