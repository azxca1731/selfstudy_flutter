import 'package:flutter/material.dart';

import './pages/product_list.dart';
import './pages/product_admin.dart';
import './pages/product_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, String>> _product = [];

  void _addProduct(String productName) {
    setState(() {
      _product.add({'title': productName, 'imageUrl': 'assets/food.jpg'});
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _product.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
      ),
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) =>
            ProductList(_product, _addProduct, _deleteProduct),
        '/admin': (BuildContext context) => ProductAdmin(),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          print(index);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => DetailPage(
                  title: _product[index]['title'],
                  imageUrl: _product[index]['imageUrl'],
                ),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              ProductList(_product, _addProduct, _deleteProduct),
        );
      },
    );
  }
}
