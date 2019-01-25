import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final VoidCallback onPressed;

  const Home({Key key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Home Page',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new HomePage(onPressed: onPressed),
    );
  }
}

class HomePage extends StatefulWidget {
  final VoidCallback onPressed;

  const HomePage({Key key, this.onPressed}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('首页'),
        centerTitle: true,
      ),
      body: new Center(
        child: RaisedButton(
          onPressed: widget.onPressed,
          child: new Text('click me'),
        ),
      ),
    );
  }
}
