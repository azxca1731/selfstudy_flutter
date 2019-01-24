import 'dart:async';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped-models/main.dart';
import '../models/product.dart';
import '../widgets/ui_elements/title_default.dart';

class DetailPage extends StatelessWidget {
  final int productIndex;

  DetailPage(this.productIndex);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      Navigator.pop(context, false);
      return Future.value(false);
    }, child: ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        final Product product = model.products[productIndex];
        return Scaffold(
          appBar: AppBar(
            title: Text(model.products[productIndex].title),
          ),
          body: Column(
            children: <Widget>[
              Image.asset(model.products[productIndex].image),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TitleDefault(model.products[productIndex].title),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Maetan, Suwon',
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
                    '\$${product.price.toString()}',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  model.products[productIndex].description,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    ));
  }
}
