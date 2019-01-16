import 'package:flutter/material.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          onPressed: () {},
          child: Text('Random'),
        ),
        TextOutput(word: word)
      ],
    );
  }
}
