import 'package:flutter/material.dart';

import './product_edit.dart';

class MyProduct extends StatelessWidget {
  final Function updateProduct;
  final Function deleteProduct;
  final List<Map<String, dynamic>> product;

  MyProduct(this.product, this.updateProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(product[index]['title']),
          background: Container(color: Colors.red),
          onDismissed: (DismissDirection direction) {
            if(direction == DismissDirection.endToStart) {
              deleteProduct(index);
            }
          },
          child: Column(
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(product[index]['imageUrl']),
                ),
                title: Text(product[index]['title']),
                subtitle: Text('\$${product[index]["price"]}'),
                trailing: IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return ProductEditPage(
                        product: product[index],
                        updateProduct: updateProduct,
                        productIndex: index,
                      );
                    }));
                  },
                ),
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
