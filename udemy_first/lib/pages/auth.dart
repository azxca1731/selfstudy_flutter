import 'package:flutter/material.dart';

import './product_list.dart';

class AuthPage extends StatelessWidget {
  final List<Map<String, String>> product;
  final Function addProduct;
  final Function deleteProduct;

  AuthPage(this.product, this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('Login'),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => ProductList(product, addProduct, deleteProduct),
              ),
            );
          },
        ),
      ),
    );
  }
}
