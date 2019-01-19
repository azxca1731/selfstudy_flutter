import 'package:flutter/material.dart';

import './pages/product_list.dart';
import './pages/product_admin.dart';
import './pages/product_detail.dart';
import './pages/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> product = [];

  void addProduct(Map<String, dynamic> addedProduct) {
    setState(() {
      product.add(addedProduct);
    });
  }

  void deleteProduct(int index) {
    setState(() {
      product.removeAt(index);
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
        '/': (BuildContext context) => AuthPage(product),
        '/products': (BuildContext context) => ProductList(product),
        '/admin': (BuildContext context) =>
            ProductAdmin(addProduct, deleteProduct),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if (pathElements[0] != '') {
          return null;
        }
        if (pathElements[1] == 'product') {
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => DetailPage(
                  title: product[index]['title'],
                  imageUrl: product[index]['imageUrl'],
                ),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) =>
              ProductList(product),
        );
      },
    );
  }
}
