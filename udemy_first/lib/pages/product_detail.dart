import 'dart:async';
import 'package:flutter/material.dart';

import '../widgets/ui_elements/title_default.dart';

class DetailPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String address;
  final double price;

  DetailPage(
      {this.title, this.image, this.address, this.description, this.price});

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
            Image.asset(image),
            Container(
              padding: EdgeInsets.all(10.0),
              child: TitleDefault(title),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  address,
                  style: TextStyle(color: Colors.grey),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    '|',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Text(
                  '\$${price.toString()}',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                description,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
