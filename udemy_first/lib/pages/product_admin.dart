import 'package:flutter/material.dart';

import './create_product.dart';
import './my_product.dart';

class ProductAdmin extends StatelessWidget {
  final Function addProduct;
  final Function deleteProduct;

  ProductAdmin(this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text('Admin'),
                ),
                ListTile(
                  leading: Icon(Icons.shop),
                  title: Text('Products List'),
                  onTap: () => Navigator.pushReplacementNamed(context, '/products'),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            title: Text('Admin'),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  icon: Icon(Icons.create),
                  text: 'Create Product',
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: 'My Product',
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              ProductCreate(addProduct),
              MyProduct(),
            ],
          )),
    );
  }
}
