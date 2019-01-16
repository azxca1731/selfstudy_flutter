import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './text_output.dart';

class TextControl extends StatefulWidget {
  final String initialWord;

  TextControl({this.initialWord = "Initail"});

  @override
  State<StatefulWidget> createState() {
    return _TextControlState();
  }
}

class _TextControlState extends State<TextControl> {
  String word;

  @override
  void initState() {
    super.initState();
    word = widget.initialWord;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: () {
            setState(() {
              word = generateWordPairs().take(1).first.asPascalCase.toString();
            });
          },
          child: Text('Random'),
        ),
        TextOutput(word: word)
      ],
    ));
  }
}
