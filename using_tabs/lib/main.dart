import 'package:flutter/material.dart';
import 'package:using_tabs/tabs/first.dart';
import 'package:using_tabs/tabs/second.dart';
import 'package:using_tabs/tabs/third.dart';

void main() => runApp(new MaterialApp(
  title: "Using Tabs",
  home: new MyHome(),
));

class MyHome extends StatefulWidget {
  MyHomeState createState() => new MyHomeState();
}

class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  TabController controller;

  void initState() {
    super.initState();

    controller = new TabController(length: 3, vsync: this);
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  TabBar getTabBar() {
    return new TabBar(
      tabs: <Widget>[
        new Tab(
          icon: new Icon(Icons.favorite),
        ),
        new Tab(
          icon: new Icon(Icons.adb),
        ),
        new Tab(
          icon: new Icon(Icons.airport_shuttle),
        )
      ],
      controller: controller,
    );
  }

  TabBarView getTabBarView(var tabs) {
    return new TabBarView(
      children: tabs,
      controller: controller,
    );
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.blue,
        bottom: getTabBar(),
      ),
      body: getTabBarView(<Widget>[new First(), new Second(), new Third()]),
    );
  }
}