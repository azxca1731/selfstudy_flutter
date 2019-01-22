import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/product_list.dart';
import './pages/product_admin.dart';
import './pages/product_detail.dart';
import './pages/auth.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  List<Map<String, dynamic>> _product = [];

  void _addProduct(Map<String, dynamic> addedProduct) {
    setState(() {
      _product.add(addedProduct);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _product.removeAt(index);
    });
  }

  void _updateProduct(int index, Map<String, dynamic> product) {
    setState(() {
      _product[index] = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          fontFamily: 'Oswald',
          buttonColor: Colors.deepPurple),
      // home: AuthPage(),
      routes: {
        '/': (BuildContext context) => AuthPage(_product),
        '/products': (BuildContext context) => ProductList(_product),
        '/admin': (BuildContext context) =>
            ProductAdmin(_addProduct, _updateProduct, _deleteProduct, _product),
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
                title: _product[index]['title'],
                imageUrl: _product[index]['imageUrl'],
                description: _product[index]['description'],
                address: 'Hwaseong, Suwon',
                price: _product[index]['price']),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          builder: (BuildContext context) => ProductList(_product),
        );
      },
    );
  }
}
