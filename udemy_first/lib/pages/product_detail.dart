import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Detail Page'),
            RaisedButton(child: Text('Back'), onPressed: () {
              Navigator.pop(context);
            },)
          ],
        ),
      ),
    );
  }
}
