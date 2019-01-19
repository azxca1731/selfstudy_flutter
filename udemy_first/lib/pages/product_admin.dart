import 'package:flutter/material.dart';

import './product_list.dart';

class ProductAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              title: Text('Products Management'),
              onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => ProductList(),
                    ),
                  ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Admin'),
      ),
      body: Center(
        child: Text('Put on Item on it'),
      ),
    );
  }
}
