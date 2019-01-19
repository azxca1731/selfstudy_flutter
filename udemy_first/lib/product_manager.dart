import 'package:flutter/material.dart';
import './product.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final Map<String, String> initialValue;

  ProductManager({this.initialValue});

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _product = [];

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _product.add(widget.initialValue);
    }
  }

  void addProduct(String productName) {
    setState(() {
      _product.add({'title': productName, 'imageUrl': 'assets/food.jpg'});
    });
  }

  void deleteProduct(int index) {
    setState(() {
      _product.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          margin: EdgeInsets.all(10.0), child: ProductControl(addProduct)),
      Expanded(
        child: Products(
          _product,
          deleteProduct: deleteProduct,
        ),
      )
    ]);
  }
}
