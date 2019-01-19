import 'package:flutter/material.dart';

import './pages/product_detail.dart';

class Products extends StatelessWidget {
  final List<Map<String, String>> product;
  final Function deleteProduct;

  Products(this.product, {this.deleteProduct});

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(product[index]['imageUrl']),
          Text(product[index]['title']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Detail'),
                onPressed: () {
                  Navigator.push<bool>(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => DetailPage(
                            title: product[index]['title'],
                            imageUrl: product[index]['imageUrl'],
                          ),
                    ),
                  ).then((bool data) => deleteProduct(index));
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productList;
    if (product.length > 0) {
      productList = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: product.length < 4 ? product.length : 4,
      );
    } else {
      //빈 값을 빌딩 할때 이렇게 함 빌드 메소드는 널값을 리턴하면 안됨
      productList = Container();
    }
    return productList;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
