import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Category Page',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new CategoryPage(),
    );
  }
}

class CategoryPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('分类'),
        centerTitle: true,
      ),
      body: new Center(
        child: new Text('Category'),
      ),
    );
  }
}
