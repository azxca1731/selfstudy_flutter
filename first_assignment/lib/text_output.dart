import 'package:flutter/material.dart';

class TextOutput extends StatelessWidget {
  final String word;

  TextOutput({this.word});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Text(word),
    );
  }
}
