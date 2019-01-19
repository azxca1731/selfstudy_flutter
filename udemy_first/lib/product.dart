import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<String> product;

  Products(this.product);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset('assets/food.jpg'),
          Text(product[index])
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return product.length > 0 ? ListView.builder(
      itemBuilder: _buildProductItem,
      itemCount: product.length < 4 ? product.length : 4,
    ) : Center(child: Text('Add Item to Push button!'),);
  }
}
