import 'package:flutter/material.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'User Page',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new UserPage(),
    );
  }
}

class UserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('用户中心'),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text('User'),
      ),
    );
  }
}
