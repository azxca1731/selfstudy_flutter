import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './product_card.dart';
import '../../models/product.dart';
import '../../scoped-models/products.dart';

class Products extends StatelessWidget {
  Widget _buildProductList(List<Product> products) {
    Widget productList;
    if (products.length > 0) {
      productList = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ProductCard(products[index], index),
        itemCount: products.length,
      );
    } else {
      //빈 값을 빌딩 할때 이렇게 함 빌드 메소드는 널값을 리턴하면 안됨
      productList = Container();
    }
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ProductModel>(
      builder: (BuildContext context, Widget child, ProductModel model) {
        return _buildProductList(model.products);
      },
    );
  }
}
