import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> product;
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
                  print(index);
                  Navigator.pushNamed<bool>(
                    context,
                    '/product/' + index.toString(),
                  ).then((bool data) {
                    if (data) deleteProduct(index);
                  });
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
    print(product);
    if (product.length > 0) {
      productList = ListView.builder(
        itemBuilder: _buildProductItem,
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
    return _buildProductList();
  }
}
