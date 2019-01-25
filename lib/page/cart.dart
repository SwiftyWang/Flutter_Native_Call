import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void CartCreateCallBack(CartController controller);

class Cart extends StatelessWidget {
  final CartCreateCallBack onCartCreateCallBack;

  const Cart({Key key, this.onCartCreateCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cart Page',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new CartPage(onCartCreateCallBack),
    );
  }
}

class CartPage extends StatefulWidget {
  final CartCreateCallBack onCartCreateCallBack;

  CartPage(this.onCartCreateCallBack);

  @override
  State<StatefulWidget> createState() => new _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('购物车'),
        centerTitle: true,
      ),
      body: AndroidView(
        viewType: 'com.rhyme/cart',
        onPlatformViewCreated: _handleViewCreated,
        creationParamsCodec: StandardMessageCodec(),
      ),
    );
  }

  void _handleViewCreated(int id) {
    widget.onCartCreateCallBack(new CartController(id));
  }
}

class CartController {
  CartController(int id) : _channel = new MethodChannel('com.rhyme/cart_$id');
  final MethodChannel _channel;

  Future<void> add() async {
    return await _channel.invokeMethod('add');
  }
}

class ListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Cart Page',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new InternalCartPage(),
      debugShowCheckedModeBanner: false,
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

class InternalCartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _InternalCartPageState();
}

class _InternalCartPageState extends State<InternalCartPage> {
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text('flutter cart call from Android'),
    );
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('购物车'),
//        centerTitle: true,
//      ),
//      body: new Center(
//        child: new Text('flutter cart call from Android'),
//      ),
//    );
  }
}
