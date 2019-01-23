import 'package:flutter/material.dart';

import './product_card.dart';
import '../../models/product.dart';

class Products extends StatelessWidget {
  final List<Product> product;
  final Function deleteProduct;

  Products(this.product, {this.deleteProduct});

  Widget _buildProductList() {
    Widget productList;
    if (product.length > 0) {
      productList = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(product[index], index),
        itemCount: product.length,
      );
    } else {
      //빈 값을 빌딩 할때 이렇게 함 빌드 메소드는 널값을 리턴하면 안됨
      productList = Container();
    }
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: _buildProductList(),
      )
    ]);
  }
}
