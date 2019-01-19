import 'package:flutter/material.dart';

import './pages/product_list.dart';
import './pages/product_admin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
        '/': (BuildContext context) => ProductList(),
        '/admin': (BuildContext context) => ProductAdmin(),
      },
    );
  }
}
