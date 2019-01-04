import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightGreenAccent,
        backgroundColor: Colors.black12,
      ),
      home: new MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Using Theme"),
      ),
      body: new Container(
        decoration: new BoxDecoration(color: Colors.black87),
        child: new Center(
          child: new Container(
            color: Theme.of(context).accentColor,
            child: new Text(
              'Hello World!',
              style: Theme.of(context).textTheme.title,
            ),
          ),
        ),
      ),

      floatingActionButton: new Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.pinkAccent),
        child: new FloatingActionButton(
          onPressed: null,
          child: new Icon(Icons.add),
        ),
      ),
    );
  }
}