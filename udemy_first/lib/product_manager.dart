import 'package:flutter/material.dart';
import './product.dart';

class ProductManager extends StatefulWidget {
  final String initialValue;

  ProductManager(this.initialValue);

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

  @override
    Widget build(BuildContext context) {
      return Column(children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                _product.add('Advanced Food Paradise');
                print(_product);
              });
            },
            child: Text('Add Product'),
          ),
        ),
        Products(_product)
      ]);
    }
}