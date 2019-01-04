import 'package:flutter/material.dart';

void main() => runApp(new MaterialApp(
  home: new MyButton(),
));

class MyButton extends StatefulWidget {
  _MyButtonState createState() =>  _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  int _count = 0;
  List<String> strings = ['Flutter', 'is', 'cool', 'and', 'awesome!'];
  String displayedString = "Hello World!";

  void onPressOfButton() {
    setState(() {
          displayedString = strings[_count];
          _count = _count < 4 ? _count + 1 : 0;
        });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Stateful Widget"),
        backgroundColor: Colors.green,
      ),
      body: new Container(
        child: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(displayedString, style: new TextStyle(fontSize: 40.0)),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new RaisedButton(
                child: new Text(
                  "Press Me!",
                  style: new TextStyle(color: Colors.white),
                ),
                color: Colors.red,
                onPressed: onPressOfButton,
              )
            ],
          ),
        ),
      ),
    );
  }
}