import 'package:flutter/material.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Order Page',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new OrderPage(),
    );
  }
}

class OrderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('订单'),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text('Order'),
      ),
    );
  }
}
