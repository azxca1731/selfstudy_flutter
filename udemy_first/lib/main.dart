import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

import './pages/product_list.dart';
import './pages/product_admin.dart';
import './pages/product_detail.dart';
import './pages/auth.dart';
import './models/product.dart';

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
  List<Product> _product = [];

  void _addProduct(Product addedProduct) {
    setState(() {
      _product.add(addedProduct);
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      _product.removeAt(index);
    });
  }

  void _updateProduct(int index, Product product) {
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
        '/': (BuildContext context) => AuthPage(),
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
                title: _product[index].title,
                image: _product[index].image,
                description: _product[index].description,
                address: 'Hwaseong, Suwon',
                price: _product[index].price),
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
