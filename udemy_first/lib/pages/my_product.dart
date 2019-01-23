import 'package:flutter/material.dart';

import './product_edit.dart';
import '../models/product.dart';

class MyProduct extends StatelessWidget {
  final Function updateProduct;
  final Function deleteProduct;
  final List<Product> product;

  MyProduct(this.product, this.updateProduct, this.deleteProduct);

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(product[index].title),
          background: Container(color: Colors.red),
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.endToStart) {
              deleteProduct(index);
            }
          },
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(product[index].image),
                ),
                title: Text(product[index].title),
                subtitle: Text('\$${product[index].price}'),
                trailing: _buildEditButton(context, index),
              ),
              Divider()
            ],
          ),
        );
      },
      itemCount: product.length,
    );
  }
}
