import 'package:flutter/material.dart';
import './product.dart';
import './product_control.dart';

class ProductManager extends StatefulWidget {
  final String initialValue;

  ProductManager({this.initialValue = 'no needs'});

  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<String> _product = [];

  @override
  void initState() {
    super.initState();
    _product.add(widget.initialValue);
  }

  void addProduct(String productName) {
    setState(() {
      _product.add(productName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
          margin: EdgeInsets.all(10.0), child: ProductControl(addProduct)),
      Expanded(child: Products(_product),)
    ]);
  }
}
