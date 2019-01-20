import 'package:flutter/material.dart';

class TitleDefault extends StatelessWidget {
  final String _titleString;

  TitleDefault(this._titleString);

  @override
  Widget build(BuildContext context) {
    return Text(
      _titleString,
      style: TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        fontFamily: 'Oswald',
      ),
    );
  }
}
