import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget {
  final Function addProduct;

  ProductControl(this.addProduct);

  @override
    Widget build(BuildContext context) {
      return Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              addProduct('Sweets');
            },
            child: Text('Add Product'),
          ),
        );
    }
}