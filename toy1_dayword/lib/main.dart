import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Day Word',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('Day Word')),
        body: new RandomWords()
      )
    );
  }
}

class RandomWords extends StatefulWidget {
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  String displayWord;

  void initState(){
    displayWord = generateNoun().take(1).first.toString();
  }

  Widget build(BuildContext context) {
    return Center(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(
            displayWord,
            style: TextStyle(fontSize: 25.0),
          ),
          new Padding(
            padding: EdgeInsets.all(20.0),
          ),
          new RaisedButton(
            child: new Text(
              'Next Word',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: () {
              setState((){
                displayWord = generateNoun().take(1).first.toString();
              });
            },
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(20.0)
            ),
            color: Colors.black26,
            elevation: 4.0,
            splashColor: Colors.black87,
          )
        ],
      ),
    );
  }
}
