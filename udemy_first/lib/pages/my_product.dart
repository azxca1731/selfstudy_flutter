import 'package:flutter/material.dart';

import './product_edit.dart';

class MyProduct extends StatelessWidget {
  final Function updateProduct;
  final List<Map<String, dynamic>> product;

  MyProduct(this.product, this.updateProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          // leading: Image.asset(product[index]['imageUrl']),
          title: Text(product[index]['title']),
          trailing: IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (BuildContext context) {
                return ProductEditPage(
                  product: product[index],
                  updateProduct: updateProduct,
                  productIndex: index,
                );
              }));
            },
          ),
        );
      },
      itemCount: product.length,
    );
  }
}
