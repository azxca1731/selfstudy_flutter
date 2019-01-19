import 'package:flutter/material.dart';

import '../product_manager.dart';

class ProductList extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text('NewBie App'),
      ),
      body: ProductManager(),
    );
    }
}