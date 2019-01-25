import 'dart:ui';

import 'package:flutter/material.dart';
import 'page/home.dart';
import 'page/category.dart';
import 'page/cart.dart';
import 'page/order.dart';
import 'page/user.dart';

void main() => runApp(_widgetForRoute(window.defaultRouteName));

Widget _widgetForRoute(String route) {
  switch (route) {
    case "route1":
      return ListWidget();
    default :
      return MyApp();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Mall Flutter',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _navCurrentIndex = 0; //当前选中的页面下标

  @override
  void initState() {
    super.initState();
  }

  Widget _buildPage(int pageIndex, Widget page) {
    return new TickerMode(
      enabled: _navCurrentIndex == pageIndex,
      child: page,
    );
  }

  CartController _cartController;

  @override
  Widget build(BuildContext context) {
    Widget body = new Center(
      child: new IndexedStack(
        children: <Widget>[
          _buildPage(0, new Home(
            onPressed: () async {
              await _cartController.add();
            },
          )),
          _buildPage(1, new Category()),
          _buildPage(2, new Cart(onCartCreateCallBack: (controller) {
            this._cartController = controller;
          },)),
          _buildPage(3, new Order()),
          _buildPage(4, new User()),
        ],
        index: _navCurrentIndex,),
    );

    BottomNavigationBar botNavBar = new BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _navCurrentIndex,
      items: [
        new BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text('首页'),
          backgroundColor: Colors.blue[500],
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.apps),
          title: new Text('分类'),
          backgroundColor: Colors.blue[500],
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.shopping_cart),
          title: new Text('购物车'),
          backgroundColor: Colors.blue[500],
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.reorder),
          title: new Text('订单'),
          backgroundColor: Colors.blue[500],
        ),
        new BottomNavigationBarItem(
          icon: new Icon(Icons.people),
          title: new Text('个人中心'),
          backgroundColor: Colors.blue[500],
        ),
      ],
      onTap: (int index) {
        setState(() {
          _navCurrentIndex = index;
        });
      },
    );
    return new Scaffold(
      body: body,
      bottomNavigationBar:
      botNavBar, // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
