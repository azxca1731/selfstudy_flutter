import 'package:flutter/material.dart';

import './product_edit.dart';
import './my_product.dart';

class ProductAdmin extends StatelessWidget {
  final Function addProduct;
  final Function updateProduct;
  final Function deleteProduct;
  final List<Map<String, dynamic>> products;

  ProductAdmin(
      this.addProduct, this.updateProduct, this.deleteProduct, this.products);

  Widget _buildSideDrawer(BuildContext context) {
    return Drawer(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: _buildSideDrawer(context),
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
              ProductEditPage(addProduct: addProduct),
              MyProduct(products, updateProduct),
            ],
          )),
    );
  }
}
