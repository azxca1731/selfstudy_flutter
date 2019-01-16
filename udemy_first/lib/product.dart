import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  List<String> product;

  Products(this.product);

  @override
    Widget build(BuildContext context) {
      
      return Column(
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