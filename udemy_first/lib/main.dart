import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<String> _product = ["Food Paradise!!", "More Happier More Fat"];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('NewBie App'),
      ),
      body: Column(children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                _product.add('Advanced Food Paradise');
                print(_product);
              });
            },
            child: Text('Add Product'),
          ),
        ),
        Column(
          children: _product
              .map((product) => Card(
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/food.jpg'),
                        Text(product)
                      ],
                    ),
                  ))
              .toList(),
        )
      ]),
    ));
  }
}
