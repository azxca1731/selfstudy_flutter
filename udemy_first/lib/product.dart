import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> product;

  Products(this.product);

  @override
    Widget build(BuildContext context) {
      
      return ListView(
          children: product
              .map((product) => Card(
                    child: Column(
                      children: <Widget>[
                        Image.asset('assets/food.jpg'),
                        Text(product)
                      ],
                    ),
                  ))
              .toList(),
        );
    }
}