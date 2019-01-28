import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/phoenix_header.dart';
import 'package:flutter_easyrefresh/phoenix_footer.dart';

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

class _InternalCartPageState extends State<InternalCartPage> {
  List<int> datas = List();
  int page = 0;

  GlobalKey<RefreshHeaderState> _headerKey =
      new GlobalKey<RefreshHeaderState>();
  GlobalKey<RefreshFooterState> _footerKey =
      new GlobalKey<RefreshFooterState>();
  GlobalKey<EasyRefreshState> _easyRefreshKey =
      new GlobalKey<EasyRefreshState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _easyRefreshKey.currentState.callRefresh();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return new EasyRefresh(
      key: _easyRefreshKey,
      autoLoad: true,
      refreshHeader: new PhoenixHeader(key: _headerKey),
      refreshFooter: new PhoenixFooter(key: _footerKey),
      behavior: ScrollOverBehavior(),
      child: new ListView.builder(
          //ListView的Item
          itemCount: datas.length,
          itemBuilder: (BuildContext context, int index) {
            return new Container(
                height: 70.0,
                child: Card(
                  child: new Center(
                    child: new Text(
                      datas[index].toString(),
                      style: new TextStyle(fontSize: 18.0),
                    ),
                  ),
                ));
          }),
      onRefresh: () async {
        await new Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            datas.clear();
            datas.addAll(genData(page = 0));
          });
        });
      },
      loadMore: () async {
        await new Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            datas.addAll(genData(++page));
          });
        });
      },
    );
  }

  List<int> genData(int i) {
    return [
      0 + i * 10,
      1 + i * 10,
      2 + i * 10,
      3 + i * 10,
      4 + i * 10,
      5 + i * 10,
      6 + i * 10,
      7 + i * 10,
      8 + i * 10,
      9 + i * 10,
    ];
  }
}

class InternalCartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _InternalCartPageState();
}
