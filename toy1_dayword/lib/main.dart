import 'package:flutter/material.dart';
import 'package:random_words/random_words.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

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
            appBar: AppBar(title: Text('Day Word')), body: new RandomWords()));
  }
}

class RandomWords extends StatefulWidget {
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  String displayWord;

  void initState() {
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
          new WordMeaning(word: displayWord),
          new RaisedButton(
            child: new Text(
              'Next Word',
              style: TextStyle(fontSize: 20.0, color: Colors.white),
            ),
            onPressed: () {
              setState(() {
                displayWord = generateNoun().take(1).first.toString();
              });
            },
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(20.0)),
            color: Colors.black26,
            elevation: 4.0,
            splashColor: Colors.black87,
          )
        ],
      ),
    );
  }
}

class WordDictionary {
  final String meaning;
  final String example;

  WordDictionary({this.meaning, this.example});

  factory WordDictionary.fromJson(Map<String, dynamic> json) {
    final String meaning = json['phrase']['text'];
    final String example = json['meanings'][0]['text'];
    return WordDictionary(meaning: meaning, example: example);
  }
}

class WordMeaning extends StatefulWidget {
  final String word;
  WordMeaning({Key key, this.word}) : super(key: key);

  WordMeaningState createState() => new WordMeaningState();
}

class WordMeaningState extends State<WordMeaning> {
  Future<WordDictionary> fetchData(String word) async {
    final String url =
        "https://glosbe.com/gapi/translate?from=eng&dest=kor&format=json&pretty=true&phrase=$word";
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      return WordDictionary.fromJson(jsonBody['tuc'][0]);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchData(widget.word),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final meaning = snapshot.data.meaning;
          final example = snapshot.data.example;
          return Column(children: <Widget>[
            new Text(meaning),
            new Padding(
              padding: EdgeInsets.only(
                top: 20.0,
                left: 40.0,
                right: 40.0,
                bottom: 30.0
              ),
              child: new Text(example)
            )
          ]);
        }
      },
    );
  }
}
