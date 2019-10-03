import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width2 = 100;
    double height2 = 100;
                return MaterialApp(
                  home: Scaffold(
                    appBar: AppBar(
                      title: Text("HEY"),
                    ),
                    //body: ex1(),
                    body: Center(
                      child: Container(
                        width: 150,
                        height: 350,
                        color: Colors.black,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,  
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(color:Colors.red,shape:BoxShape.circle),
                              width: width2,
                          height: height2,
                        ),
                        Container(
                          decoration: BoxDecoration(color:Colors.orange,shape: BoxShape.circle),          
                          width: width2,
                          height: height2,
                ),
                Container(
                  decoration: BoxDecoration(color:Colors.green,shape:BoxShape.circle),
                  width: width2,
                  height: height2,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column ex1() {
    return Column(
      children: <Widget>[
        Banda(20, "20%", Colors.redAccent),
        Banda(30, "30%", Colors.purple),
        Banda(50, "50%", Colors.blue)
      ],
    );
  }
}

class Banda extends StatelessWidget {
  int flex;
  String txt;
  Color color;
  Banda(this.flex, this.txt, this.color, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: this.flex,
      child: Container(
        child: Center(
          child: Text(
            this.txt,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        color: this.color,
      ),
    );
  }
}
