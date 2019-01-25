import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

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
  List<String> addStr = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  List<String> str = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"];
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();

  @override
  Widget build(BuildContext context) {
    return new EasyRefresh(
      key: _easyRefreshKey,
      autoLoad: false,
      behavior: ScrollOverBehavior(),
      child: new ListView.builder(
          //ListView的Item
          itemCount: str.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
                height: 70.0,
                child: Card(
                  child: new Center(
                    child: new Text(
                      str[index],
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                ));
          }),
      onRefresh: () async {
        await new Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            str.clear();
            str.addAll(addStr);
          });
        });
      },
      loadMore: () async {
        await new Future.delayed(const Duration(seconds: 1), () {
          if (str.length < 20) {
            setState(() {
              str.addAll(addStr);
            });
          }
        });
      },
    );
  }
}
