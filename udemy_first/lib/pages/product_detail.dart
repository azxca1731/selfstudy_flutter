import 'dart:async';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String imageUrl;
  final String title;

  DetailPage({this.title, this.imageUrl});

  void _showWarningDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you Sure?'),
            content: Text('This action cannot be undone'),
            actions: <Widget>[
              FlatButton(
                child: Text('Discard'),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context, true);
                },
              ),
              FlatButton(
                child: Text('Continue'),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: <Widget>[
            Image.asset(imageUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(title),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Delete'),
                onPressed: () => _showWarningDialog(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
