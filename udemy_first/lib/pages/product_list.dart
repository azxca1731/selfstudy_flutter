import 'package:flutter/material.dart';

import '../product_manager.dart';

class ProductList extends StatelessWidget {
  final List<Map<String, String>> product;
  final Function addProduct;
  final Function deleteProduct;

  ProductList(this.product, this.addProduct, this.deleteProduct);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              title: Text('Products Management'),
              onTap: () => Navigator.pushReplacementNamed(context, '/admin'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('NewBie App'),
      ),
      body: ProductManager(product,addProduct,deleteProduct),
    );
  }
}
